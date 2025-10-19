using System.Web.Mvc;

namespace CCP.Web.CFMS.Web.Controllers
{
    public class ReportsCustomReportsController : Controller
    {
        [Route("Reports/Custom-Reports")]
        public ActionResult Index()
        {
            return View();
        }
    }
}