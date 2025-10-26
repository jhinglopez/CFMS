using CCP.Web.CFMS.Repository.Procedures;

namespace CCP.Web.CFMS.Serevices
{
    public class ForwardingsServices
    {
        public static void SaveForwardings(string chapelId, string tranType, string tranDate, string name, decimal amount, string ventureTitle, string beneficiary, string approvalUserId, string auditUser)
        {
            ForwardingsRepository.SaveForwardings(chapelId, tranType, tranDate, name, amount, ventureTitle, beneficiary, approvalUserId, auditUser);
        }
    }
}
