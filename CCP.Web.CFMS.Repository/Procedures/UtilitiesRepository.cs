using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Repository.DbContext;
using System.Collections.Generic;
using System.Linq;

namespace CCP.Web.CFMS.Repository.Procedures
{
    public class UtilitiesRepository
    {
        private static readonly int commandTimeOut = 300;

        public static List<tblUtilitiesModel> GetUtilities()
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                return db.Database.SqlQuery<tblUtilitiesModel>("dbo.usp_GetUtilities").ToList();
            }
        }

        public static List<tblUtilitiesModel> GetUtilitiesById(string id)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                return db.Database.SqlQuery<tblUtilitiesModel>("dbo.usp_GetUtilitiesById {0}", id).ToList();
            }
        }

        public static string SaveUtilities(string id, string name, string utilityTypeId, string auditUser)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                ScalarModel item = db.Database.SqlQuery<ScalarModel>("dbo.usp_SaveUtilities {0},{1},{2},{3}", id, name, utilityTypeId, auditUser).ToList().First();
                return item.Result;
            }
        }

        public static void DeleteUtilities(string id)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                db.Database.ExecuteSqlCommand("dbo.usp_DeleteUtilities {0}", id);
            }
        }
    }
}
