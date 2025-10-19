using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Repository.DbContext;
using System.Collections.Generic;
using System.Linq;

namespace CCP.Web.CFMS.Repository.Procedures
{
    public class PagesRepository
    {
        private static readonly int commandTimeOut = 300;

        public static List<PagesByRoleModel> GetPagesByRoleId(string roleId)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                return db.Database.SqlQuery<PagesByRoleModel>("dbo.usp_GetPagesByRoleId {0}", roleId).ToList();
            }
        }
    }
}
