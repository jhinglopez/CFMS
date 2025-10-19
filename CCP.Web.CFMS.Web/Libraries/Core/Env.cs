using System;

namespace CCP.Web.CFMS.Web.Libraries.Core
{
    public class Env
    {
        public static string EnvironmentServerVersion()
        {
            string version = "v." + typeof(MvcApplication).Assembly.GetName().Version.ToString();
            return version;
        }

        public static string Versioning()
        {
            return Guid.NewGuid().ToString().Replace("-", "");
        }
    }
}