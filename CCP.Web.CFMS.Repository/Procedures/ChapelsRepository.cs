using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Repository.DbContext;
using System.Collections.Generic;
using System.Linq;

namespace CCP.Web.CFMS.Repository.Procedures
{
    public class ChapelsRepository
    {
        private static readonly int commandTimeOut = 300;

        public static List<tblChapelsModel> GetChapels()
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                return db.Database.SqlQuery<tblChapelsModel>("dbo.usp_GetChapels").ToList();
            }
        }

        public static List<tblChapelsModel> GetChapelsById(string id)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                return db.Database.SqlQuery<tblChapelsModel>("dbo.usp_GetChapelsById {0}", id).ToList();
            }
        }

        public static string SaveChapels(string id, string name, string auditUser)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                ScalarModel item = db.Database.SqlQuery<ScalarModel>("dbo.usp_SaveChapels {0},{1},{2}", id, name, auditUser).ToList().First();
                return item.Result;
            }
        }

        public static void DeleteChapels(string id)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                db.Database.ExecuteSqlCommand("dbo.usp_DeleteChapels {0}", id);
            }
        }
    }
}
