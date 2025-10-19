using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Repository.Procedures;
using System.Collections.Generic;

namespace CCP.Web.CFMS.Serevices
{
    public class ChapelsServices
    {
        public static List<tblChapelsModel> GetChapels()
        {
            return ChapelsRepository.GetChapels();
        }

        public static List<tblChapelsModel> GetChapelsById(string id)
        {
            return ChapelsRepository.GetChapelsById(id);
        }

        public static string SaveChapels(string id, string name, string auditUser)
        {
            return ChapelsRepository.SaveChapels(id, name, auditUser);
        }

        public static void DeleteChapels(string id)
        {
            ChapelsRepository.DeleteChapels(id);
        }
    }
}
