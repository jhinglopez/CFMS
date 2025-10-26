using System;

namespace CCP.Web.CFMS.Domain
{
    public class tblCashInflowsModel
    {
        public string Id { get; set; }
        public string ChapelId { get; set; }
        public string TranType { get; set; }
        public DateTime TranDate { get; set; }
        public string Name { get; set; }
        public string ReferenceTitle { get; set; }
        public decimal Amount { get; set; }
        public string AcknowledgementReceipt { get; set; }
        public DateTime AuditCreateDate { get; set; }
        public string AuditCreateUser { get; set; }
        public DateTime AuditUpdateDate { get; set; }
        public string AuditUpdateUser { get; set; }
    }
}
