using System.Web.Mvc;

namespace CCP.Web.CFMS.Web.Controllers
{
    public class ReportsIncomeStatementsController : Controller
    {
        [Route("Reports/Income-Statements")]
        public ActionResult Index()
        {
            return View();
        }
    }
}