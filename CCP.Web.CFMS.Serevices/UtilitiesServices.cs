using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Repository.Procedures;
using System.Collections.Generic;

namespace CCP.Web.CFMS.Serevices
{
    public class UtilitiesServices
    {
        public static List<tblUtilitiesModel> GetUtilities()
        {
            return UtilitiesRepository.GetUtilities();
        }

        public static List<tblUtilitiesModel> GetUtilitiesById(string id)
        {
            return UtilitiesRepository.GetUtilitiesById(id);
        }

        public static string SaveUtilities(string id, string name, string utilityTypeId, string auditUser)
        {
            return UtilitiesRepository.SaveUtilities(id, name, utilityTypeId, auditUser);
        }

        public static void DeleteUtilities(string id)
        {
            UtilitiesRepository.DeleteUtilities(id);
        }
    }
}
