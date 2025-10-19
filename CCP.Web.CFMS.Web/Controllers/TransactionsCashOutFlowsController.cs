using System.Web.Mvc;

namespace CCP.Web.CFMS.Web.Controllers
{
    public class TransactionsCashOutFlowsController : Controller
    {
        [Route("Transactions/Cash-Out-Flows")]
        public ActionResult Index()
        {
            return View();
        }
    }
}