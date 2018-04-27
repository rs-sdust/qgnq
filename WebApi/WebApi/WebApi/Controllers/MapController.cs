using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApi.Controllers
{

    /// <summary>
    /// 空间数据控制器.
    /// </summary>
    /// <seealso cref="System.Web.Http.ApiController" />
    public class MapController : ApiController
    {
        /// <summary>
        /// 获取省级空间信息的geojson
        /// </summary>
        /// <returns>IHttpActionResult.</returns>
        [HttpGet]
        public IHttpActionResult GetMapData()
        {
            string strSQL = "SELECT * FROM f_init_map();";
            SunGolden.DBUtils.PostgreSQL.OpenCon();
            DbParameter[] para = new DbParameter[0];
            DataTable dt = SunGolden.DBUtils.PostgreSQL.ExecuteObjectQuery(strSQL, null, para).Tables[0];
            SunGolden.DBUtils.PostgreSQL.CloseCon();
            if (dt == null || dt.Rows.Count == 0)
            {
                return NotFound();
            }
            else
            {
                string jsonResult = dt.Rows[0][0].ToString();
                return Ok<string>(jsonResult);
            }
        }
    }
}
