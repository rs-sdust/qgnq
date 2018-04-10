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
    public class ProductController : ApiController
    {
        /// <summary>
        /// 获取省级实时产品数据
        /// </summary>
        /// <param name="date">产品日期</param>
        /// <param name="productType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <param name="regionId">省份编号</param>
        /// <returns>DataTable</returns>
        [HttpGet]
        public DataTable GetProvRealTimeProduct(DateTime date, int productType, int cropType = -1, int diseaseType = -1, int regionId = -1)
        {

            string str = string.Format("SELECT * FROM f_product_getprovrealtimeproduct('{0}',{1},{2},{3},{4});", date, productType, cropType, diseaseType, regionId);
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }
        /// <summary>
        /// 获取地市级实时产品数据
        /// </summary>
        /// <param name="date">产品日期</param>
        /// <param name="productType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <param name="regionId">省份编号</param>
        /// <returns>DataTable</returns>
        [HttpGet]
        public DataTable GetCityRealTimeProduct(DateTime date, int productType, int cropType = -1, int diseaseType = -1, int regionId = -1)
        {

            string str = string.Format("SELECT * FROM f_product_getcityrealtimeproduct('{0}',{1},{2},{3},{4});", date, productType, cropType, diseaseType, regionId);
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];

        }
        /// <summary>
        /// 获取县级实时产品数据
        /// </summary> 
        /// <param name="date">产品日期</param>
        /// <param name="productType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <param name="regionId">地市编号</param>
        /// <returns>DataTable</returns>
        [HttpGet]
        public DataTable GetCountyRealTimeProduct(DateTime date, int productType, int cropType = -1, int diseaseType = -1, int regionId = -1)
        {

            string str = string.Format("SELECT * FROM f_product_getcountyrealtimeproduct('{0}',{1},{2},{3},{4});", date, productType, cropType, diseaseType, regionId);
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];

        }

        /// <summary>
        /// 获取全国实时空间分布产品数据
        /// </summary>
        /// <param name="productdate">产品日期</param>
        /// <param name="productType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <returns>DataTable</returns>
        [HttpGet]
        public DataTable GetRealTimeDistribution(DateTime productdate, int productType, int cropType = -1, int diseaseType = -1)
        {
            string str = string.Format("select * from f_product_getrealtimedistribution('{0}',{1},{2},{3},{4});", productdate, productType, cropType, diseaseType);           
           return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];

        }
    }
}
