﻿using System;
using System.Web.Mvc;
using ScrumTime.Helpers;
using ScrumTime.Models;
using ScrumTime.Services;
using ScrumTime.ViewModels;

namespace ScrumTime.Controllers
{
    public partial class ReleaseController : Controller
    {
        ScrumTimeEntities _ScrumTimeEntities;
        ReleaseService _ReleaseService;
        ProductService _ProductService;

        public ReleaseController()
        {
            _ScrumTimeEntities = new ScrumTimeEntities();
            _ReleaseService = new ReleaseService(_ScrumTimeEntities);
            _ProductService = new ProductService(_ScrumTimeEntities);
        }

        //
        // GET: /Release/
        [Authorize]
        public virtual ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public virtual ActionResult ListContainerByTargetDateDesc()
        {
            ReleaseCollectionViewModel releaseCollectionViewModel = ReleaseCollectionViewModel.BuildByTargetDateDesc(
                SessionHelper.GetCurrentProductId(User.Identity.Name, Session));
            return PartialView(Views.ListContainer, releaseCollectionViewModel);
        }

        // An AJAX driven result that returns just the simple list of releases
        [Authorize]
        public virtual ActionResult ListByTargetDateDesc(int productId)
        {
            ReleaseCollectionViewModel releaseCollectionViewModel = ReleaseCollectionViewModel.BuildByTargetDateDesc(productId);
            return PartialView(Views.List, releaseCollectionViewModel);
        }

        // An AJAX driven result that returns just the td's of the read only release...replaces any other
        [Authorize]
        public virtual ActionResult ReadOnly(int id)
        {
            Release release = _ReleaseService.GetReleaseById(id);
            return PartialView(release);
        }

        // An AJAX driven result that returns just the td's of the editable release...replaces read only
        [Authorize]
        public virtual ActionResult Edit(int id)
        {
            Release release = _ReleaseService.GetReleaseById(id);
            return PartialView(release);
        }

        // An AJAX driven result that returns just the td's of the editable "new" release...appends to list
        [Authorize]
        public virtual ActionResult New(int productId)
        {
            // TODO: May want to lookup the product id to ensure that it is valid
            Release release = new Release()
            {
                ProductId = productId,
                Name = "---",
                Target = DateTime.Today
            };
            return PartialView(Views.Edit, release);
        }

        // POST: /Release/Save
        [Authorize]
        [HttpPost]
        public virtual ActionResult Save(FormCollection collection)
        {
            try
            {
                string id = collection.Get("releaseId");
                string productId = collection.Get("productId");                
                bool newRelease = false;
                if (id == null || id == "0")
                {
                    id = "0";
                    newRelease = true;
                }
                string name = collection.Get("name");
                string description = collection.Get("description");
                string target = collection.Get("target");
                // TODO:  Validate the release data before saving
                // TODO:  Set the correct product id
                Release release = new Release()
                {
                    ReleaseId = Int32.Parse(id),
                    ProductId = Int32.Parse(productId),
                    Name = name,
                    Description = description,
                    Target = DateTime.Parse(target)
                };
                _ReleaseService.SaveRelease(release);

                if (newRelease)
                    return RedirectToAction(Actions.ListByTargetDateDesc(Int32.Parse(productId)));
                else
                    return RedirectToAction(Actions.ReadOnly(Int32.Parse(id)));
            }
            catch (Exception ex)
            {
                return View();  // TODO:  Handle displaying the exception condition
            }
        }

        [Authorize]
        [HttpPost]
        public virtual ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                string productId = collection.Get("productId");
                string idAsString = collection.Get("releaseId");
                _ReleaseService.DeleteRelease(Int32.Parse(idAsString));
                return RedirectToAction(Actions.ListByTargetDateDesc(Int32.Parse(productId)));
            }
            catch
            {
                return View();
            }
        }
    }
    
}
