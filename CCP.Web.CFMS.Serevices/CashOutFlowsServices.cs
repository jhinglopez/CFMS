using CCP.Web.CFMS.Repository.Procedures;

namespace CCP.Web.CFMS.Serevices
{
    public class CashOutFlowsServices
    {
        public static void SaveCashOutflows(string chapelId, string tranType, string category, string tranDate, string name, string referenceTitle, decimal amount, string itemName, string approvalUserId, string auditUser)
        {
            CashOutFlowsRepository.SaveCashOutflows(chapelId, tranType, category, tranDate, name, referenceTitle, amount, itemName, approvalUserId, auditUser);
        }
    }
}
