using System.Web.Mvc;

namespace CCP.Web.CFMS.Web.Controllers
{
    public class TransactionsForwardingsController : Controller
    {
        [Route("Transactions/Forwardings")]
        public ActionResult Index()
        {
            return View();
        }
    }
}