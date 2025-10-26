using CCP.Web.CFMS.Repository.DbContext;

namespace CCP.Web.CFMS.Repository.Procedures
{
    public class CashOutFlowsRepository
    {
        private static readonly int commandTimeOut = 300;

        public static void SaveCashOutflows(string chapelId, string tranType, string category, string tranDate, string name, string referenceTitle, decimal amount, string itemName, string approvalUserId, string auditUser)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                db.Database.ExecuteSqlCommand("dbo.usp_SaveCashOutflows {0},{1},{2},{3},{4},{5},{6},{7},{8},{9}", chapelId, tranType, category, tranDate, name, referenceTitle, amount, itemName, approvalUserId, auditUser);
            }
        }
    }
}
