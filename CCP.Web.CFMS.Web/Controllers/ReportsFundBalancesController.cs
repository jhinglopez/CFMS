using System.Web.Mvc;

namespace CCP.Web.CFMS.Web.Controllers
{
    [Authorize]
    public class ReportsFundBalancesController : Controller
    {
        [Route("Reports/Fund-Balances")]
        public ActionResult Index()
        {
            return View();
        }
    }
}