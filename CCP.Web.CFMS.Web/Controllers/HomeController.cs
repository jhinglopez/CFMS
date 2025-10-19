using System.Web.Mvc;

namespace CCP.Web.CFMS.Web.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}