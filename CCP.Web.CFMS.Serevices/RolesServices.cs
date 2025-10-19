using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Repository.Procedures;
using System.Collections.Generic;

namespace CCP.Web.CFMS.Serevices
{
    public class RolesServices
    {
        public static List<AspNetRolesModel> GetRoles()
        {
            return RolesRepository.GetRoles();
        }

        public static List<AspNetRolesModel> GetRolesById(string id)
        {
            return RolesRepository.GetRolesById(id);
        }

        public static string SaveRoles(string id, string name, string description, string pages, string auditUser)
        {
            return RolesRepository.SaveRoles(id, name, description, pages, auditUser);
        }

        public static string DeleteRoles(string id)
        {
            return RolesRepository.DeleteRoles(id);
        }
    }
}
