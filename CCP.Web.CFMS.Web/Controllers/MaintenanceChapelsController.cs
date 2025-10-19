using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Serevices;
using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Mvc;

namespace CCP.Web.CFMS.Web.Controllers
{
    [Authorize]
    public class MaintenanceChapelsController : Controller
    {
        [Route("Maintenance/Chapels")]
        public ActionResult Index()
        {
            return View();
        }

        [Route("Maintenance/Chapels/New")]
        public ActionResult New()
        {
            return View();
        }

        [Route("Maintenance/Chapels/Detail/{name}/{id}")]
        public ActionResult Detail(string name, string id)
        {
            ViewBag.Id = id;
            return View();
        }

        [HttpPost]
        public JsonResult GetChapels()
        {
            List<tblChapelsModel> model = new List<tblChapelsModel>();
            try
            {
                model = ChapelsServices.GetChapels();
            }
            catch
            {
            }
            return Libraries.Core.Extensions.Json(model, "application/json", Encoding.UTF8, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetChapelsById(string id)
        {
            List<tblChapelsModel> model = new List<tblChapelsModel>();
            try
            {
                model = ChapelsServices.GetChapelsById(id);
            }
            catch
            {
            }
            return Libraries.Core.Extensions.Json(model, "application/json", Encoding.UTF8, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public string SaveChapels(string id, string name)
        {
            string result = "";
            try
            {
                result = ChapelsServices.SaveChapels(id, name, System.Web.HttpContext.Current.User.Identity.Name);
            }
            catch (Exception e)
            {
                result = "Save failed. " + e.Message;
            }
            return result;
        }

        [HttpPost]
        public string DeleteChapels(string id)
        {
            string result = "";
            try
            {
                ChapelsServices.DeleteChapels(id);
            }
            catch (Exception e)
            {
                result = "Delete failed. " + e.Message;
            }
            return result;
        }
    }
}