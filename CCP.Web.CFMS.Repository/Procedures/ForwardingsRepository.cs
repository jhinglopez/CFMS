using CCP.Web.CFMS.Repository.DbContext;

namespace CCP.Web.CFMS.Repository.Procedures
{
    public class ForwardingsRepository
    {
        private static readonly int commandTimeOut = 300;

        public static void SaveForwardings(string chapelId, string tranType, string tranDate, string name, decimal amount, string ventureTitle, string beneficiary, string approvalUserId, string auditUser)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                db.Database.ExecuteSqlCommand("dbo.usp_SaveForwardings {0},{1},{2},{3},{4},{5},{6},{7},{8}", chapelId, tranType, tranDate, name, amount, ventureTitle, beneficiary, approvalUserId, auditUser);
            }
        }
    }
}
