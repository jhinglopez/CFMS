using System.Web.Mvc;

namespace CCP.Web.CFMS.Web.Controllers
{
    [Authorize]
    public class ReportsCustomReportsController : Controller
    {
        [Route("Reports/Custom-Reports")]
        public ActionResult Index()
        {
            return View();
        }
    }
}