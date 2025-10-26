using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Serevices;
using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Mvc;

namespace CCP.Web.CFMS.Web.Controllers
{
    [Authorize]
    public class TransactionsCashInFlowsController : Controller
    {
        [Route("Transactions/Cash-In-Flows")]
        public ActionResult Index()
        {
            ViewBag.Chapels = GetListItemsChapels();
            return View();
        }

        [HttpPost]
        public string SaveCashInFlows(string chapelId, string tranType, string tranDate, string name, string referenceTitle, decimal amount, string acknowledgementReceipt)
        {
            string result = "";
            try
            {
                CashInFlowsServices.SaveCashInFlows(chapelId, tranType, tranDate, name, referenceTitle, amount, acknowledgementReceipt, System.Web.HttpContext.Current.User.Identity.Name);
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
    }
}