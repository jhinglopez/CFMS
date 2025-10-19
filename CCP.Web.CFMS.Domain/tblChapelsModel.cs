using System;

namespace CCP.Web.CFMS.Domain
{
    public class tblChapelsModel
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public DateTime AuditCreateDate { get; set; }
        public string AuditCreateUser { get; set; }
        public DateTime AuditUpdateDate { get; set; }
        public string AuditUpdateUser { get; set; }
    }
}
