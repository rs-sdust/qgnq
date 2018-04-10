using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data;
using Newtonsoft.Json;

namespace WebApi.Controllers
{
    public class ForecastController : ApiController
    {
        /// <summary>
        /// 获取省级预报产品数据
        /// </summary>
        /// <param name="date">产品日期</param>
        /// <param name="productType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <param name="RegionId">省份编号</param>
        /// <returns>DataTable</returns>
        [HttpGet]
        public DataTable GetProvForecastProduct(DateTime date, int productType, int cropType = -1, int diseaseType = -1, int RegionId = -1)
        {
            string tojson = string.Format("select * from f_forecast_getprovforecastproduct('{0}',{1},{2},{3},{4});", date, productType, cropType, diseaseType, RegionId);
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(tojson, 1000).Tables[0];

        }
        /// <summary>
        /// 获取地市级预报产品数据
        /// </summary>
        /// <param name="date">产品日期</param>
        /// <param name="productType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <param name="RegionId">地市编号</param>
        /// <returns>DataTable</returns>
        [HttpGet]
        public DataTable GetCityForecastProduct(DateTime date, int productType, int cropType = -1, int diseaseType = -1, int RegionId = -1)
        {
            string tojson = string.Format("select * from f_forecast_getcityforecastproduct('{0}',{1},{2},{3},{4});", date, productType, cropType, diseaseType, RegionId);
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(tojson, 1000).Tables[0];
        }
        /// <summary>
        /// 获取县级预报产品数据
        /// </summary>
        /// <param name="date">产品日期</param>
        /// <param name="productType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <param name="RegionId">区县编号</param>
        /// <returns>DataTable</returns>
        [HttpGet]
        public DataTable GetCountyForecastProduct(DateTime date, int productType, int cropType = -1, int diseaseType = -1, int RegionId = -1)
        {
           
            string tojson = string.Format("select * from f_forecast_getcountyforecastproduct('{0}',{1},{2},{3},{4});", date, productType, cropType, diseaseType, RegionId);
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(tojson, 1000).Tables[0];

        }
      
        /// <summary>
        /// 获取全国预报空间分布产品数据
        /// </summary>
        /// <param name="date">产品日期</param>
        /// <param name="productType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <returns>DataTable</returns>
        [HttpGet]
        public DataTable GetForecastDistribution(DateTime date, int productType, int cropType = -1, int diseaseType = -1)
        {
            string str = string.Format("select * from f_forecast_getforecastdistribution('{0}',{1},{2},{3});", date, productType, cropType, diseaseType);
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }
    }
}
