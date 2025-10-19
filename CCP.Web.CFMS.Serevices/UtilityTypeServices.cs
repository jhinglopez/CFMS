using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Repository.Procedures;
using System.Collections.Generic;

namespace CCP.Web.CFMS.Serevices
{
    public class UtilityTypeServices
    {
        public static List<tblUtilityTypeModel> GetUtilityType()
        {
            return UtilityTypeRepository.GetUtilityType();
        }

        public static List<tblUtilityTypeModel> GetUtilityTypeById(string id)
        {
            return UtilityTypeRepository.GetUtilityTypeById(id);
        }

        public static string SaveUtilityType(string id, string name, string auditUser)
        {
            return UtilityTypeRepository.SaveUtilityType(id, name, auditUser);
        }

        public static void DeleteUtilityType(string id)
        {
            UtilityTypeRepository.DeleteUtilityType(id);
        }
    }
}
