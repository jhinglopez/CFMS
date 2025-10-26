using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Serevices;
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
            return View();
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