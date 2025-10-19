using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Repository.DbContext;
using System.Collections.Generic;
using System.Linq;

namespace CCP.Web.CFMS.Repository.Procedures
{
    public class UtilityTypeRepository
    {
        private static readonly int commandTimeOut = 300;

        public static List<tblUtilityTypeModel> GetUtilityType()
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                return db.Database.SqlQuery<tblUtilityTypeModel>("dbo.usp_GetUtilityType").ToList();
            }
        }

        public static List<tblUtilityTypeModel> GetUtilityTypeById(string id)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                return db.Database.SqlQuery<tblUtilityTypeModel>("dbo.usp_GetUtilityTypeById {0}", id).ToList();
            }
        }

        public static string SaveUtilityType(string id, string name, string auditUser)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                ScalarModel item = db.Database.SqlQuery<ScalarModel>("dbo.usp_SaveUtilityType {0},{1},{2}", id, name, auditUser).ToList().First();
                return item.Result;
            }
        }

        public static void DeleteUtilityType(string id)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                db.Database.ExecuteSqlCommand("dbo.usp_DeleteUtilityType {0}", id);
            }
        }
    }
}
