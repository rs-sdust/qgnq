using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Mvc;

namespace WebApi
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.Routes.MapHttpRoute(
                name: "Default",
                routeTemplate: "{controller}/{action}/{client}",
                defaults: new { controller = "Dic", action = "GetCatalog", client = UrlParameter.Optional }
            );
          
        }
    }
}
