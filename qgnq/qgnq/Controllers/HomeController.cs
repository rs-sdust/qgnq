/****************************************************************
 * 
 * File name: HomeController
 * 
 * Version: 1.0
 * 
 * Author: RickerYan
 * 
 * Company: SunGolden
 * 
 * Created: 2018/9/14 13:38:18
 * 
 * Summary: home
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

        /// <summary>
        /// 主目录请求，返回字符串，以避免直接提示IIS错误
        /// </summary>
        public class HomeController : ApiController
        {
            [Route("")]
            public IHttpActionResult Get()
            {
                return Json<string>("qgnq");
            }

        }
}
