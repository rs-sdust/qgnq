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
            name: "Dic",
            routeTemplate: "{controller}/{action}/",
            defaults: new { controller = "Dic", action = "GetProductType"}
        );

            config.Routes.MapHttpRoute(
                name: "Product",
                routeTemplate: "{controller}/{action}/{date}/{productType}/{cropType}/{diseaseType}/{provId}",
                defaults: new { controller = "Product", action = "GetProvRealTimeProduct", date = DateTime.Now, productType = 0, cropType = 0, diseaseType = UrlParameter.Optional, provId = UrlParameter .Optional}
            );
        }
    }
}
