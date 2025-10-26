using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Serevices;
using CCP.Web.CFMS.Web.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace CCP.Web.CFMS.Web.Controllers
{
    [Authorize]
    public class SecurityUsersController : Controller
    {
        private ApplicationUserManager _userManager;

        [Route("Security/Users")]
        public ActionResult Index()
        {
            return View();
        }

        [Route("Security/Users/New")]
        public ActionResult New()
        {
            ViewBag.Items = GetListItemsRoles();
            return View();
        }

        [Route("Security/Users/Detail/{name}/{id}")]
        public ActionResult Detail(string name, string id)
        {
            ViewBag.Id = id;
            ViewBag.Items = GetListItemsRoles();
            return View();
        }

        [HttpPost]
        public JsonResult GetUsers()
        {
            List<AspNetUsersModel> model = new List<AspNetUsersModel>();
            try
            {
                model = UsersServices.GetUsers();
            }
            catch
            {
            }
            return Libraries.Core.Extensions.Json(model, "application/json", Encoding.UTF8, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetUsersById(string id)
        {
            List<AspNetUsersModel> model = new List<AspNetUsersModel>();
            try
            {
                model = UsersServices.GetUsersById(id);
            }
            catch
            {
            }
            return Libraries.Core.Extensions.Json(model, "application/json", Encoding.UTF8, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public string SaveUsers(string username, string password, string fullname, string email, string roleId, string approver)
        {
            string result = "";
            try
            {
                var user = new ApplicationUser { UserName = username, Email = email };
                var result1 = UserManager.Create(user, password);
                if (result1.Succeeded)
                {
                    UsersServices.SaveUsers(username, fullname, roleId, approver, System.Web.HttpContext.Current.User.Identity.Name);
                }
                else
                {
                    string errorDesc = "";
                    foreach (var error in result1.Errors)
                    {
                        errorDesc += error + ". ";
                    }
                    result = errorDesc;
                }
 
            }
            catch (Exception e)
            {
                result = "Save failed. " + e.Message;
            }
            return result;
        }

        [HttpPost]
        public string UpdateUsers(string id, string username, string fullname, string email, string roleId, string approver)
        {
            string result = "";
            try
            {
                result = UsersServices.UpdateUsers(id, username, fullname, email, roleId, approver, System.Web.HttpContext.Current.User.Identity.Name);
            }
            catch (Exception e)
            {
                result = "Save failed. " + e.Message;
            }
            return result;
        }

        [HttpPost]
        public string DeleteUsers(string id)
        {
            string result = "";
            try
            {
                UsersServices.DeleteUsers(id);
            }
            catch (Exception e)
            {
                result = "Delete failed. " + e.Message;
            }
            return result;
        }

        private string GetListItemsRoles()
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                List<AspNetRolesModel> model = RolesServices.GetRoles();
                if (model.Count > 0)
                {
                    foreach (AspNetRolesModel item in model)
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

        private ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            set
            {
                _userManager = value;
            }
        }
    }
}