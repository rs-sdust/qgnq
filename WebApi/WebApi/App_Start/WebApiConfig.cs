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
            //Dic
            config.Routes.MapHttpRoute(
            name: "Dic",
            routeTemplate: "{controller}/{action}/",
            defaults: new { controller = "Dic", action = "GetProductType"}
            );
            //Product
            config.Routes.MapHttpRoute(
                name: "Product",
                routeTemplate: "{controller}/{action}/{date}/{productType}/{cropType}/{diseaseType}/{provId}",
                defaults: new { controller = "Product", action = "GetProvRealTimeProduct", date = DateTime.Now, productType = 0, cropType = 0, diseaseType =UrlParameter.Optional, provId = UrlParameter.Optional }
            );
            //config.MapHttpAttributeRoutes();
            config.Routes.MapHttpRoute(
               name: "Trend",
               routeTemplate: "{controller}/{action}/{start}/{days}/{productType}/{RegionId}/{cropType}/{diseaseType}",
               defaults: new { controller = "Trend", action = "GetProvTrend", start = DateTime.Now, days = 1, productType = 0, RegionId = 0, cropType = UrlParameter.Optional, diseaseType = UrlParameter.Optional }
            );
          
        }
    }
}
