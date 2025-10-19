using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CCP.Web.CFMS.Web.Startup))]
namespace CCP.Web.CFMS.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
