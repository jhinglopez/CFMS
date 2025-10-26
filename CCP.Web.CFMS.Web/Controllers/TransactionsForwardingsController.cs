using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Serevices;
using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Mvc;
using System.Xml.Linq;

namespace CCP.Web.CFMS.Web.Controllers
{
    [Authorize]
    public class TransactionsForwardingsController : Controller
    {
        [Route("Transactions/Forwardings")]
        public ActionResult Index()
        {
            ViewBag.Chapels = GetListItemsChapels();
            ViewBag.Approvers = GetListItemsApprovers();
            return View();
        }

        [HttpPost]
        public string SaveForwardings(string chapelId, string tranType, string tranDate, string name, decimal amount, string ventureTitle, string beneficiary, string approvalUserId)
        {
            string result = "";
            try
            {
                ForwardingsServices.SaveForwardings(chapelId, tranType, tranDate, name, amount, ventureTitle, beneficiary, approvalUserId, System.Web.HttpContext.Current.User.Identity.Name);
            }
            catch (Exception e)
            {
                result = "Save failed. " + e.Message;
            }
            return result;
        }

        private string GetListItemsChapels()
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                List<tblChapelsModel> model = ChapelsServices.GetChapels();
                if (model.Count > 0)
                {
                    foreach (tblChapelsModel item in model)
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

        private string GetListItemsApprovers()
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                List<AspNetUsersModel> model = UsersServices.GetUsers();
                if (model.Count > 0)
                {
                    foreach (AspNetUsersModel item in model)
                    {
                        if (item.SecuritySignum == "1")
                        {
                            sb.Append("<div class=\"item\" data-value=\"" + item.Id + "\">" + item.FullName + "</div>");
                        }
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