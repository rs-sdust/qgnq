using System;
using System.Data;
using System.Data.Common;
using System.Web.Http;

namespace WebApi.Controllers
{
    /// <summary>
    /// 趋势产品控制器.
    /// </summary>
    public class TrendController : ApiController
    {

        /// <summary>
        /// 获取指定省份的时间序列数据，用户点击后的折线图绘制
        /// </summary>
        /// <param name="start">起始日期</param>
        /// <param name="days">获取的数据天数</param>
        /// <param name="regionId">省份编号</param>
        /// <param name="prodType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <returns></returns>
        [HttpGet]
        public DataTable GetProvTrend(DateTime start, int days, int regionId, int prodType, int cropType = -1, int diseaseType = -1)
        {  
            DateTime endday = start.AddDays(days-1);
            //string str = string.Format("SELECT * FROM f_trend_getprovtrend('{0}',{1},{2},{3},{4},'{5}');", start, regionId, prodType, cropType, diseaseType, endday);
            //return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
            string str = "SELECT * FROM f_trend_getprovtrend(@start,@regionId,@prodType,@cropType,@diseaseType,@endday);";
            SunGolden.DBUtils.PostgreSQL.OpenCon();
            DbParameter[] para = new DbParameter[6];
            para[0] = SunGolden.DBUtils.PostgreSQL.NewParameter("@start", start);
            para[1] = SunGolden.DBUtils.PostgreSQL.NewParameter("@regionId", regionId);
            para[2] = SunGolden.DBUtils.PostgreSQL.NewParameter("@prodType", prodType);
            para[3] = SunGolden.DBUtils.PostgreSQL.NewParameter("@cropType", cropType);
            para[4] = SunGolden.DBUtils.PostgreSQL.NewParameter("@diseaseType", diseaseType);
            para[5] = SunGolden.DBUtils.PostgreSQL.NewParameter("@endday", endday);
            DataTable dt = SunGolden.DBUtils.PostgreSQL.ExecuteObjectQuery(str, null, para).Tables[0];
            SunGolden.DBUtils.PostgreSQL.CloseCon();
            return dt;
        }
        /// <summary>
        /// 获取指定地市的时间序列数据，用户点击后的折线图绘制
        /// </summary>
        /// <param name="start">起始日期</param>
        /// <param name="days">获取的数据天数</param>
        /// <param name="regionId">地市编号</param>
        /// <param name="prodType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <returns></returns>
        [HttpGet]
        public DataTable GetCityTrend(DateTime start, int days, int regionId, int prodType, int cropType = -1, int diseaseType = -1)
        {
            DateTime endday = start.AddDays(days);
            //string str = string.Format("SELECT * FROM f_trend_getcitytrend('{0}',{1},{2},{3},{4},'{5}');", start, regionId, prodType, cropType, diseaseType, endday);
            //return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
            string str = "SELECT * FROM f_trend_getcitytrend(@start,@regionId,@prodType,@cropType,@diseaseType,@endday);";
            SunGolden.DBUtils.PostgreSQL.OpenCon();
            DbParameter[] para = new DbParameter[6];
            para[0] = SunGolden.DBUtils.PostgreSQL.NewParameter("@start", start);
            para[1] = SunGolden.DBUtils.PostgreSQL.NewParameter("@regionId", regionId);
            para[2] = SunGolden.DBUtils.PostgreSQL.NewParameter("@prodType", prodType);
            para[3] = SunGolden.DBUtils.PostgreSQL.NewParameter("@cropType", cropType);
            para[4] = SunGolden.DBUtils.PostgreSQL.NewParameter("@diseaseType", diseaseType);
            para[5] = SunGolden.DBUtils.PostgreSQL.NewParameter("@endday", endday);
            DataTable dt = SunGolden.DBUtils.PostgreSQL.ExecuteObjectQuery(str, null, para).Tables[0];
            SunGolden.DBUtils.PostgreSQL.CloseCon();
            return dt;
        }
        /// <summary>
        /// 获取指定区县的时间序列数据，用户点击后的折线图绘制
        /// </summary>
        /// <param name="start">起始日期</param>
        /// <param name="days">获取的数据天数</param>
        /// <param name="regionId">区县编号</param>
        /// <param name="prodType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <returns></returns>
        [HttpGet]
        public DataTable GetCountyTrend(DateTime start, int days, int regionId, int prodType, int cropType = -1, int diseaseType = -1)
        {
            DateTime endday = start.AddDays(days);
            //string str = string.Format("SELECT * FROM f_trend_getcountytrend('{0}',{1},{2},{3},{4},'{5}');", start, regionId, prodType, cropType, diseaseType, endday);
            //return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
            string str = "SELECT * FROM f_trend_getcountytrend(@start,@regionId,@prodType,@cropType,@diseaseType,@endday);";
            SunGolden.DBUtils.PostgreSQL.OpenCon();
            DbParameter[] para = new DbParameter[6];
            para[0] = SunGolden.DBUtils.PostgreSQL.NewParameter("@start", start);
            para[1] = SunGolden.DBUtils.PostgreSQL.NewParameter("@regionId", regionId);
            para[2] = SunGolden.DBUtils.PostgreSQL.NewParameter("@prodType", prodType);
            para[3] = SunGolden.DBUtils.PostgreSQL.NewParameter("@cropType", cropType);
            para[4] = SunGolden.DBUtils.PostgreSQL.NewParameter("@diseaseType", diseaseType);
            para[5] = SunGolden.DBUtils.PostgreSQL.NewParameter("@endday", endday);
            DataTable dt = SunGolden.DBUtils.PostgreSQL.ExecuteObjectQuery(str, null, para).Tables[0];
            SunGolden.DBUtils.PostgreSQL.CloseCon();
            return dt;
        }
    }
}
