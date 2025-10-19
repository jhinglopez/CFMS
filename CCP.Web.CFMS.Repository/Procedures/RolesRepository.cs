using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Repository.DbContext;
using System.Collections.Generic;
using System.Linq;

namespace CCP.Web.CFMS.Repository.Procedures
{
    public class RolesRepository
    {
        private static readonly int commandTimeOut = 300;

        public static List<AspNetRolesModel> GetRoles()
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                return db.Database.SqlQuery<AspNetRolesModel>("dbo.usp_GetRoles").ToList();
            }
        }

        public static List<AspNetRolesModel> GetRolesById(string id)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                return db.Database.SqlQuery<AspNetRolesModel>("dbo.usp_GetRolesById {0}", id).ToList();
            }
        }

        public static string SaveRoles(string id, string name, string description, string pages, string auditUser)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                ScalarModel item = db.Database.SqlQuery<ScalarModel>("dbo.usp_SaveRoles {0},{1},{2},{3},{4}", id, name, description, pages, auditUser).ToList().First();
                return item.Result;
            }
        }

        public static string DeleteRoles(string id)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                ScalarModel item = db.Database.SqlQuery<ScalarModel>("dbo.usp_DeleteRoles {0}", id).ToList().First();
                return item.Result;
            }
        }
    }
}
