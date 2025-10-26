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

        public static List<AspNetUsersModel> GetUsersById(string id)
        {
            return UsersRepository.GetUsersById(id);
        }

        public static void SaveUsers(string username, string fullname, string roleId, string auditUser)
        {
            UsersRepository.SaveUsers(username, fullname, roleId, auditUser);
        }

        public static string UpdateUsers(string id, string username, string fullname, string email, string roleId, string auditUser)
        {
            return UsersRepository.UpdateUsers(id, username, fullname, email, roleId, auditUser);
        }

        public static void DeleteUsers(string id)
        {
            UsersRepository.DeleteUsers(id);
        }
    }
}
