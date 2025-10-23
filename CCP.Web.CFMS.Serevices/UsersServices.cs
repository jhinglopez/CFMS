using CCP.Web.CFMS.Domain;
using CCP.Web.CFMS.Repository.Procedures;
using System.Collections.Generic;

namespace CCP.Web.CFMS.Serevices
{
    public class UsersServices
    {
        public static List<AspNetUsersModel> GetUsers()
        {
            return UsersRepository.GetUsers();
        }

        public static List<AspNetUsersModel> GetUsersById(string chapelId, string id)
        {
            return UsersRepository.GetUsersById(chapelId, id);
        }

        public static void SaveUsers(string chapelId, string username, string fullname, string roleId, string auditUser)
        {
            UsersRepository.SaveUsers(chapelId, username, fullname, roleId, auditUser);
        }

        public static string UpdateUsers(string chapelId,string id, string username, string fullname, string email, string roleId, string auditUser)
        {
            return UsersRepository.UpdateUsers(chapelId,id, username, fullname, email, roleId, auditUser);
        }

        public static void DeleteUsers(string chapelId, string id)
        {
            UsersRepository.DeleteUsers(chapelId,id);
        }
    }
}
