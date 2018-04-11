using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Cors;

namespace WebApi
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API 配置和服务
           var cors = new EnableCorsAttribute("*", "*", "*");

            config.EnableCors(cors);
            // Web API 路由
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "{controller}/{action}",
                defaults: new { controller = "Dic", action = "GetCatalog" }
            );
            #region 跨域访问"Cors"配置及启用
            var allowOrigins = ConfigurationManager.AppSettings["cors_allowOrigins"];
            var allowHeaders = ConfigurationManager.AppSettings["cors_allowHeaders"];
            var allowMethods = ConfigurationManager.AppSettings["cors_allowMethods"];
            var globalCors = new EnableCorsAttribute(allowOrigins, allowHeaders, allowMethods);
            config.EnableCors(globalCors);
            #endregion
        }
    }
}
