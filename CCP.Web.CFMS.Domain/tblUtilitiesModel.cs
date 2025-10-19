using System;

namespace CCP.Web.CFMS.Domain
{
    public class tblUtilitiesModel
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string UtilityTypeId { get; set; }
        public string UtilityType { get; set; }
        public DateTime AuditCreateDate { get; set; }
        public string AuditCreateUser { get; set; }
        public DateTime AuditUpdateDate { get; set; }
        public string AuditUpdateUser { get; set; }
    }
}
