using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Serevices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CCP.Web.CFMS.Web.Libraries.Core
{
    public class Config
    {
        public static string SelectedChapelName()
        {
            List<tblChapelsModel> model = ChapelsServices.GetChapelsById(HttpContext.Current.Request.Cookies["__cid"].Value);
            if (model.Count > 0)
            {
                tblChapelsModel item = model.First();
                return item.Name;
            }
            else
            {
                return "--";
            }
        }
    }
}