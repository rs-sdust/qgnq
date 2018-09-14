/****************************************************************
 * 
 * File name: DocController
 * 
 * Version: 1.0
 * 
 * Author: RickerYan
 * 
 * Company: SunGolden
 * 
 * Created: 2018/9/14 13:38:18
 * 
 * Summary: 接口文档
 * 
 ****************************************************************/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace qgnq.Controllers
{
    public class DocController : ApiController
    {
        /// <summary>
        /// 获取接口文档
        /// </summary>
        /// <returns>HttpResponseMessage/html</returns>
        [Route("docs")]
        public HttpResponseMessage Get()
        {
            try
            {
                //需要加载的html页面的路径
                var path = System.Web.HttpContext.Current.Server.MapPath("~/Views/doc_v2.html");
                var result = new HttpResponseMessage(HttpStatusCode.OK)
                {
                    Content = new StringContent(System.IO.File.ReadAllText(path), System.Text.Encoding.UTF8, "text/html")
                };
                return result;

            }
            catch (Exception ex)
            {
                return new HttpResponseMessage(statusCode: HttpStatusCode.NotFound);
            }
        }
    }
}
