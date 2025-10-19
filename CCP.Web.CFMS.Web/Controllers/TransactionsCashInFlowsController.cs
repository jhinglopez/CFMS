using System.Web.Mvc;

namespace CCP.Web.CFMS.Web.Controllers
{
    public class TransactionsCashInFlowsController : Controller
    {
        [Route("Transactions/Cash-In-Flows")]
        public ActionResult Index()
        {
            return View();
        }
    }
}