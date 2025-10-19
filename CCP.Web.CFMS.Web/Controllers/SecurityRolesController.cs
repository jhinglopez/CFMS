using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Serevices;
using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Mvc;

namespace CCP.Web.CFMS.Web.Controllers
{
    [Authorize]
    public class SecurityRolesController : Controller
    {
        [Route("Security/Roles")]
        public ActionResult Index()
        {
            return View();
        }

        [Route("Security/Roles/New")]
        public ActionResult New()
        {
            ViewBag.ModuleAccessContent = GetPagesByRoleId("0");
            return View();
        }

        [Route("Security/Roles/Detail/{name}/{id}")]
        public ActionResult Detail(string name, string id)
        {
            ViewBag.Id = id;
            ViewBag.ModuleAccessContent = GetPagesByRoleId(id);
            return View();
        }

        [HttpPost]
        public JsonResult GetRoles()
        {
            List<AspNetRolesModel> model = new List<AspNetRolesModel>();
            try
            {
                model = RolesServices.GetRoles();
            }
            catch
            {
            }
            return Libraries.Core.Extensions.Json(model, "application/json", Encoding.UTF8, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetRolesById(string id)
        {
            List<AspNetRolesModel> model = new List<AspNetRolesModel>();
            try
            {
                model = RolesServices.GetRolesById(id);
            }
            catch
            {
            }
            return Libraries.Core.Extensions.Json(model, "application/json", Encoding.UTF8, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public string SaveRoles(string id, string name, string description, string pages)
        {
            string result;
            try
            {
                result = RolesServices.SaveRoles(id, name, description, pages, System.Web.HttpContext.Current.User.Identity.Name);
            }
            catch (Exception e)
            {
                result = "Save failed. " + e.Message;
            }
            return result;
        }

        [HttpPost]
        public string DeleteRoles(string id)
        {
            string result = "";
            try
            {
                result = RolesServices.DeleteRoles(id);
            }
            catch (Exception e)
            {
                result = "Delete failed. " + e.Message;
            }
            return result;
        }

        private string GetPagesByRoleId(string roleId)
        {
            StringBuilder sb = new StringBuilder();
            List<PagesByRoleModel> model = PagesServices.GetPagesByRoleId(roleId);
            sb.Append("<table class='ui basic blue celled striped table' style='width:100%; max-width:800px;'>");
            sb.Append("<thead>");
            sb.Append("<tr>");
            sb.Append("<th>Module</th>");
            sb.Append("<th>With Access</th");
            sb.Append("</tr>");
            sb.Append("</thead>");
            sb.Append("<tbody>");
            if (model.Count > 0)
            {
                foreach (PagesByRoleModel item in model)
                {
                    sb.Append("<tr>");
                    sb.Append("<td>" + item.PageDescription + "</td>");
                    if (item.IsWithAccess)
                    {
                        sb.Append("<td><div class='ui checkbox'><input type='checkbox' id='" + item.Id + "' name=\"modules\" checked><label></label></div></td");
                    }
                    else
                    {
                        sb.Append("<td><div class='ui checkbox'><input type='checkbox' id='" + item.Id + "' name=\"modules\"><label></label></div></td");
                    }
                    sb.Append("</tr>");
                }
            }
            sb.Append("</tbody>");
            sb.Append("</table>");
            return sb.ToString();
        }
    }
}