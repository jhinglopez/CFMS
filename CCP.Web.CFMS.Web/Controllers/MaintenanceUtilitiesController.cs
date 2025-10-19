using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Serevices;
using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Mvc;

namespace CCP.Web.CFMS.Web.Controllers
{
    [Authorize]
    public class MaintenanceUtilitiesController : Controller
    {
        [Route("Maintenance/Utilities")]
        public ActionResult Index()
        {
            return View();
        }

        [Route("Maintenance/Utilities/New")]
        public ActionResult New()
        {
            ViewBag.Items = GetListItemsUtilityType();
            return View();
        }

        [Route("Maintenance/Utilities/Detail/{name}/{id}")]
        public ActionResult Detail(string name, string id)
        {
            ViewBag.Id = id;
            ViewBag.Items = GetListItemsUtilityType();
            return View();
        }

        [HttpPost]
        public JsonResult GetUtilities()
        {
            List<tblUtilitiesModel> model = new List<tblUtilitiesModel>();
            try
            {
                model = UtilitiesServices.GetUtilities();
            }
            catch
            {
            }
            return Libraries.Core.Extensions.Json(model, "application/json", Encoding.UTF8, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetUtilitiesById(string id)
        {
            List<tblUtilitiesModel> model = new List<tblUtilitiesModel>();
            try
            {
                model = UtilitiesServices.GetUtilitiesById(id);
            }
            catch
            {
            }
            return Libraries.Core.Extensions.Json(model, "application/json", Encoding.UTF8, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public string SaveUtilities(string id, string name, string utilityTypeId)
        {
            string result = "";
            try
            {
                result = UtilitiesServices.SaveUtilities(id, name, utilityTypeId, System.Web.HttpContext.Current.User.Identity.Name);
            }
            catch (Exception e)
            {
                result = "Save failed. " + e.Message;
            }
            return result;
        }

        [HttpPost]
        public string DeleteUtilities(string id)
        {
            string result = "";
            try
            {
                UtilitiesServices.DeleteUtilities(id);
            }
            catch (Exception e)
            {
                result = "Delete failed. " + e.Message;
            }
            return result;
        }

        private string GetListItemsUtilityType()
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                List<tblUtilityTypeModel> model = UtilityTypeServices.GetUtilityType();
                if (model.Count > 0)
                {
                    foreach (tblUtilityTypeModel item in model)
                    {
                        sb.Append("<div class=\"item\" data-value=\"" + item.Id + "\">" + item.Name + "</div>");
                    }
                }
                return sb.ToString();
            }
            catch
            {
                return "";
            }
        }
    }
}