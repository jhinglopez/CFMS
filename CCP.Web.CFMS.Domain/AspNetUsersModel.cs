using System;

namespace CCP.Web.CFMS.Domain
{
    public class AspNetUsersModel
    {
        public string Id { get; set; }
        public string Email { get; set; }
        public bool EmailConfirmed { get; set; }
        public string PasswordHash { get; set; }
        public string SecurityStamp { get; set; }
        public string PhoneNumber { get; set; }
        public bool PhoneNumberConfirmed { get; set; }
        public bool TwoFactorEnabled { get; set; }
        public DateTime LockoutEndDateUtc { get; set; }
        public bool LockoutEnabled { get; set; }
        public int AccessFailedCount { get; set; }
        public string UserName { get; set; }
        public string FullName { get; set; }
        public string SecuritySignum { get; set; }
        public bool IsActive { get; set; }
        public string Company { get; set; }
        public string CountryCode { get; set; }
        public DateTime AuditCreateDate { get; set; }
        public string AuditCreateUser { get; set; }
        public DateTime AuditUpdateDate { get; set; }
        public string AuditUpdateUser { get; set; }
        public string RoleId { get; set; }
        public string RoleName { get; set; }
    }
}
