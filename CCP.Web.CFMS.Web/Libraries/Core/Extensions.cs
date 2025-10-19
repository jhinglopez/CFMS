using System.Text;
using System.Web.Mvc;

namespace CCP.Web.CFMS.Web.Libraries.Core
{
    public class Extensions
    {
        public static JsonResult Json(object data, string contentType, Encoding contentEncoding, JsonRequestBehavior behavior)
        {
            return new JsonResult()
            {
                Data = data,
                ContentType = contentType,          // "application/json"
                ContentEncoding = contentEncoding,  // Encoding.UTF8
                JsonRequestBehavior = behavior,     // JsonRequestBehavior.AllowGet
                MaxJsonLength = int.MaxValue
            };
        }
    }
}