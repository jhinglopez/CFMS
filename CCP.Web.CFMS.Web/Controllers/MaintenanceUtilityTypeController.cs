using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Serevices;
using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Mvc;

namespace CCP.Web.CFMS.Web.Controllers
{
    [Authorize]
    public class MaintenanceUtilityTypeController : Controller
    {
        [Route("Maintenance/Utility-Type")]
        public ActionResult Index()
        {
            return View();
        }

        [Route("Maintenance/Utility-Type/New")]
        public ActionResult New()
        {
            return View();
        }

        [Route("Maintenance/Utility-Type/Detail/{name}/{id}")]
        public ActionResult Detail(string name, string id)
        {
            ViewBag.Id = id;
            return View();
        }

        [HttpPost]
        public JsonResult GetUtilityType()
        {
            List<tblUtilityTypeModel> model = new List<tblUtilityTypeModel>();
            try
            {
                model = UtilityTypeServices.GetUtilityType();
            }
            catch
            {
            }
            return Libraries.Core.Extensions.Json(model, "application/json", Encoding.UTF8, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetUtilityTypeById(string id)
        {
            List<tblUtilityTypeModel> model = new List<tblUtilityTypeModel>();
            try
            {
                model = UtilityTypeServices.GetUtilityTypeById(id);
            }
            catch
            {
            }
            return Libraries.Core.Extensions.Json(model, "application/json", Encoding.UTF8, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public string SaveUtilityType(string id, string name)
        {
            string result = "";
            try
            {
                result = UtilityTypeServices.SaveUtilityType(id, name, System.Web.HttpContext.Current.User.Identity.Name);
            }
            catch (Exception e)
            {
                result = "Save failed. " + e.Message;
            }
            return result;
        }

        [HttpPost]
        public string DeleteUtilityType(string id)
        {
            string result = "";
            try
            {
                UtilityTypeServices.DeleteUtilityType(id);
            }
            catch (Exception e)
            {
                result = "Delete failed. " + e.Message;
            }
            return result;
        }
    }
}