using CCP.Web.CFMS.Repository.Procedures;

namespace CCP.Web.CFMS.Serevices
{
    public class CashInFlowsServices
    {
        public static void SaveCashInFlows(string chapelId, string tranType, string tranDate, string name, string referenceTitle, decimal amount, string acknowledgementReceipt, string auditUser)
        {
            CashInFlowsRepository.SaveCashInFlows(chapelId, tranType, tranDate, name, referenceTitle, amount, acknowledgementReceipt, auditUser);
        }
    }
}
