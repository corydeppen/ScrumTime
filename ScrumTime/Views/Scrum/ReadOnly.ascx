﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ScrumTime.ViewModels.ScrumViewModel>" %>
    <%
        string scrumDate = Model.ScrumModel.DateOfScrum.ToString("MM/dd/yyyy");
        decimal hoursCompleted = Model.ScrumModel.ScrumDetails.Sum(s => s.HoursCompleted);
        decimal hoursRemaining = Model.ScrumModel.ScrumDetails.Sum(s => s.HoursRemaining);
        
     %>

    <tr id="scrumRow_<%: Model.ScrumModel.ScrumId %>" class="scrumRow">
        <td style="vertical-align:middle;text-align:center;width:100px;border:0px;font-size:11px;"><a class="simpleLink scrum_<%: Model.ScrumModel.ScrumId %>" href="#"><%: Model.Index %></a></td>
        <td style="vertical-align:middle;text-align:center;width:210px;border:0px;font-size:11px;"><a class="simpleLink scrum_<%: Model.ScrumModel.ScrumId %>" href="#"><%: scrumDate %></a></td>
        <td style="vertical-align:middle;text-align:center;width:180px;border:0px;font-size:11px;"><a class="simpleLink scrum_<%: Model.ScrumModel.ScrumId %>" style="color:#79a52c;" href="#"><%: hoursCompleted %></a></td>
        <td style="vertical-align:middle;text-align:center;width:180px;border:0px;font-size:11px;"><a class="simpleLink scrum_<%: Model.ScrumModel.ScrumId %>" style="color:Red;" href="#"><%: hoursRemaining %></a></td>
        <td style="vertical-align:middle;text-align:center;border:0px;font-size:11px;">
            <a href="#" class="simpleLink" onclick="deleteScrum(<%: Model.ScrumModel.ScrumId %>, '<%: Url.Action(MVC.Scrum.Delete()) %>', '<%: Url.Action(MVC.Scrum.List()) %>');"><img alt="Delete" style="" src="<%: Links.Content.Images.Menu.trash_png %>" /></a>
        </td>
        <script type="text/javascript">           
            setupReadOnlyScrumRow(<%: Model.ScrumModel.ScrumId %>, '<%: Url.Action(MVC.Scrum.Edit()) %>', '<%: Url.Action(MVC.Scrum.Save()) %>', '<%: Url.Action(MVC.Scrum.List()) %>');
        </script>
    </tr>
