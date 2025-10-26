using CCP.Web.CFMS.Repository.DbContext;

namespace CCP.Web.CFMS.Repository.Procedures
{
    public class CashInFlowsRepository
    {
        private static readonly int commandTimeOut = 300;

        public static void SaveCashInFlows(string chapelId, string tranType, string tranDate, string name, string referenceTitle, decimal amount, string acknowledgementReceipt, string auditUser)
        {
            using (CFMSEntities db = new CFMSEntities())
            {
                db.Database.CommandTimeout = commandTimeOut;
                db.Database.ExecuteSqlCommand("dbo.usp_SaveCashInFlows {0},{1},{2},{3},{4},{5},{6},{7}", chapelId, tranType, tranDate, name, referenceTitle, amount, acknowledgementReceipt, auditUser);
            }
        }
    }
}
