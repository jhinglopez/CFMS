namespace CCP.Web.CFMS.Domain
{
    public class AspNetPagesModel
    {
        public string Id { get; set; }
        public string PagePath { get; set; }
        public string Folder { get; set; }
        public string PageDescription { get; set; }
        public int SortId { get; set; }
        public bool IsActive { get; set; }
    }

    public class PagesByRoleModel
    {
        public string Id { get; set; }
        public string PagePath { get; set; }
        public string PageDescription { get; set; }
        public bool IsWithAccess { get; set; }
    }
}
