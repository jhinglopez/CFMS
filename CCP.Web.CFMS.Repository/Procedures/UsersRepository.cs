using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Repository.DbContext;
using System.Collections.Generic;
using System.Linq;

namespace CCP.Web.CFMS.Repository.Procedures
{
    public class UsersRepository
    {
        private static readonly int commandTimeOut = 300;

        public static List<AspNetUsersModel> GetUsers(string chapelId)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                return db.Database.SqlQuery<AspNetUsersModel>("dbo.usp_GetUsers {0}", chapelId).ToList();
            }
        }

        public static List<AspNetUsersModel> GetUsersById(string chapelId, string id)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                return db.Database.SqlQuery<AspNetUsersModel>("dbo.usp_GetUsersById {0},{1}", chapelId, id).ToList();
            }
        }

        public static void SaveUsers(string chapelId, string username, string fullname, string roleId, string auditUser)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                db.Database.ExecuteSqlCommand("dbo.usp_SaveUsers {0},{1},{2},{3},{4}", chapelId, username, fullname, roleId, auditUser);
            }
        }

        public static string UpdateUsers(string chapelId, string id, string username, string fullname, string email, string roleId, string auditUser)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                ScalarModel item = db.Database.SqlQuery<ScalarModel>("dbo.usp_UpdateUsers {0},{1},{2},{3},{4},{5},{6}", chapelId, id, username, fullname, email, roleId, auditUser).ToList().First();
                return item.Result;
            }
        }

        public static void DeleteUsers(string chapelId, string id)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                db.Database.ExecuteSqlCommand("dbo.usp_DeleteUsers {0},{1}", id, chapelId);
            }
        }
    }
}
