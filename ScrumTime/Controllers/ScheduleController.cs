﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ScrumTime.Controllers
{
    public class ScheduleController : Controller
    {
        //
        // GET: /Schedule/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ReleaseList()
        {
            return PartialView();
        }

        public ActionResult SprintList()
        {
            return PartialView();
        }

    }
}