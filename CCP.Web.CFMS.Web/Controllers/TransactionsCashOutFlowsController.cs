using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Serevices;
using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Mvc;

namespace CCP.Web.CFMS.Web.Controllers
{
    [Authorize]
    public class TransactionsCashOutFlowsController : Controller
    {
        [Route("Transactions/Cash-Out-Flows")]
        public ActionResult Index()
        {
            ViewBag.Chapels = GetListItemsChapels();
            ViewBag.Approvers = GetListItemsApprovers();
            return View();
        }

        [HttpPost]
        public string SaveCashOutflows(string chapelId, string tranType, string category, string tranDate, string name, string referenceTitle, decimal amount, string itemName, string approvalUserId)
        {
            string result = "";
            try
            {
                CashOutFlowsServices.SaveCashOutflows(chapelId, tranType, category, tranDate, name, referenceTitle, amount, itemName, approvalUserId, System.Web.HttpContext.Current.User.Identity.Name);
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