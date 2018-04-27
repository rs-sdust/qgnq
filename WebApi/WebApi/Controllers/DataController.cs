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
    /// 数据控制器
    /// </summary>
    /// <seealso cref="System.Web.Http.ApiController" />
    public class DataController : ApiController
    {
        /// <summary>
        /// 获取指定产品类型的所有数据时间列表.
        /// </summary>
        /// <param name="prodType">产品类型编号.</param>
        /// <param name="cropType">作物类型编号.</param>
        /// <param name="diseaseType">病害类型编号.</param>
        /// <returns>IHttpActionResult.</returns>
        [HttpGet]
        public IHttpActionResult GetAllDate( int prodType, int cropType, int diseaseType)
        {
            string strSQL = "SELECT * FROM f_get_all_prod_time(@prodType,@cropType,@diseaseType);";
            SunGolden.DBUtils.PostgreSQL.OpenCon();
            DbParameter[] para = new DbParameter[3];
            para[0] = SunGolden.DBUtils.PostgreSQL.NewParameter("@prodType", prodType);
            para[1] = SunGolden.DBUtils.PostgreSQL.NewParameter("@cropType", cropType);
            para[2] = SunGolden.DBUtils.PostgreSQL.NewParameter("@diseaseType", diseaseType);
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
        /// <summary>
        /// 获取数据，包括（全国分布数据，省、市、县级统计数据）
        /// </summary>
        /// <param name="date">数据日期.</param>
        /// <param name="level">数据级别（0、1、2、3）.</param>
        /// <param name="regionId">区划编号.</param>
        /// <param name="prodType">产品类型编号.</param>
        /// <param name="cropType">作物类型编号.</param>
        /// <param name="diseaseType">病害类型编号.</param>
        /// <returns>IHttpActionResult.</returns>
        [HttpGet]
        public IHttpActionResult GetProd(DateTime date,int level, int regionId,int prodType,int cropType, int diseaseType)
        {
            string strSQL = "SELECT * FROM f_get_prod(@date,@level,@regionId,@prodType,@cropType,@diseaseType);";
            SunGolden.DBUtils.PostgreSQL.OpenCon();
            DbParameter[] para = new DbParameter[6];
            para[0] = SunGolden.DBUtils.PostgreSQL.NewParameter("@date", date);
            para[1] = SunGolden.DBUtils.PostgreSQL.NewParameter("@level", level);
            para[2] = SunGolden.DBUtils.PostgreSQL.NewParameter("@regionId", regionId);
            para[3] = SunGolden.DBUtils.PostgreSQL.NewParameter("@prodType", prodType);
            para[4] = SunGolden.DBUtils.PostgreSQL.NewParameter("@cropType", cropType);
            para[5] = SunGolden.DBUtils.PostgreSQL.NewParameter("@diseaseType", diseaseType);
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

        /// <summary>
        /// 获取趋势数据，包括（省、市、县级）
        /// </summary>
        /// <param name="start">开始日期.</param>
        /// <param name="days">数据天数.</param>
        /// <param name="level">数据级别（0、1、2、3）.</param>
        /// <param name="regionId">区划编号r.</param>
        /// <param name="prodType">产品类型编号.</param>
        /// <param name="cropType">作物类型编号.</param>
        /// <param name="diseaseType">病害类型编号.</param>
        /// <returns>IHttpActionResult.</returns>
        [HttpGet]
        public IHttpActionResult GetTrend(DateTime start,int days, int level, int regionId, int prodType, int cropType, int diseaseType)
        {
            string strSQL = "SELECT * FROM f_get_trend(@start,@end,@level,@regionId,@prodType,@cropType,@diseaseType);";
            DateTime end = start.AddDays(days - 1);
            SunGolden.DBUtils.PostgreSQL.OpenCon();
            DbParameter[] para = new DbParameter[7];
            para[0] = SunGolden.DBUtils.PostgreSQL.NewParameter("@start", start);
            para[1] = SunGolden.DBUtils.PostgreSQL.NewParameter("@end", end);
            para[2] = SunGolden.DBUtils.PostgreSQL.NewParameter("@level", level);
            para[3] = SunGolden.DBUtils.PostgreSQL.NewParameter("@regionId", regionId);
            para[4] = SunGolden.DBUtils.PostgreSQL.NewParameter("@prodType", prodType);
            para[5] = SunGolden.DBUtils.PostgreSQL.NewParameter("@cropType", cropType);
            para[6] = SunGolden.DBUtils.PostgreSQL.NewParameter("@diseaseType", diseaseType);
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
