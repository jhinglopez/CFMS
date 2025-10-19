using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Repository.Procedures;
using System.Collections.Generic;

namespace CCP.Web.CFMS.Serevices
{
    public class PagesServices
    {
        public static List<PagesByRoleModel> GetPagesByRoleId(string roleId)
        {
            return PagesRepository.GetPagesByRoleId(roleId);
        }
    }
}
