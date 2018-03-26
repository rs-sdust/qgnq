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
        [System.Web.Http.HttpGet]
        public string test()
        {
            return "ASDadasasfasdfaswdf";
        }
        /// <summary>
        /// 获取省级实时产品数据
        /// </summary>
        /// <param name="date">产品日期</param>
        /// <param name="productType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <param name="provId">省份编号</param>
        /// <returns>DataTable</returns>
        [System.Web.Http.HttpGet]
        public DataTable GetProvRealTimeProduct(DateTime date, int productType, int cropType = -1, int diseaseType = -1,int provId = -1)
        {
            //string str = "";

            string str = string.Format("select \"provid\",\"provname\",\"geom\",\"Value\" from public.\"Product_Realtime_Province\" join \"geom_province\" on \"geom_province\".\"provid\" = \"Product_Realtime_Province\".\"ProvinceId\" where \"Time\" = '{0}' and \"ProductTypeId\" = {1} and \"CropTypeId\" = {2} and \"DiseaseTypeId\"  = {3} and \"ProvinceId\" = {4}", date, productType, cropType, diseaseType, provId);
            string tojson = string.Format(@"SELECT
	                                jsonb_build_object (
		                                'type',
		                                'FeatureCollection',
		                                'features',
		                                jsonb_agg (feature)
	                                )
                                FROM
	                                (
		                                SELECT
			                                jsonb_build_object (
				                                'type',
				                                'Feature',
				                                'id',
				                                provid,
				                                'geometry',
				                                ST_AsGeoJSON (geom) :: jsonb,
				                                'properties',
				                                to_jsonb (ROW) - 'geom'
			                                ) AS feature
		                                FROM
			                                ({0}) ROW
	                                ) features;",str);
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(tojson, 1000).Tables[0];
        }
        /// <summary>
        /// 获取地市级实时产品数据
        /// </summary>
        /// <param name="date">产品日期</param>
        /// <param name="productType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <param name="provId">地市编号</param>
        /// <returns>DataTable</returns>
        [System.Web.Http.HttpGet]
        public DataTable GetCityRealTimeProduct(DateTime date, int productType, int cropType = -1, int diseaseType = -1, int cityId = -1)
        {


            string str = "select * from public.\"Product_Realtime_City\"where productType = (@ProductTypeId) and cropType = (@CropTypeId) and diseaseType = (@DiseaseTypeId) and  CityId = (@cityId);";
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }
        /// <summary>
        /// 获取县级实时产品数据
        /// </summary>
        /// <param name="date">产品日期</param>
        /// <param name="productType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <param name="provId">区县编号</param>
        /// <returns>DataTable</returns>
        [System.Web.Http.HttpGet]
        public DataTable GetCountyRealTimeProduct(DateTime date, int productType, int cropType = -1, int diseaseType = -1, int countyId = -1)
        {

            string str = "select * from public.\"Product_Realtime_County\" where productType = (@ProductTypeId) and cropType = (@CropTypeId) and diseaseType = (@DiseaseTypeId) and CountyId = (@countyId);";
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }
        /// <summary>
        /// 获取全国实时空间分布产品数据
        /// </summary>
        /// <param name="date">产品日期</param>
        /// <param name="productType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <returns>DataTable</returns>
        [System.Web.Http.HttpGet]
        public DataTable GetRealTimeDistribution(DateTime date, int productType, int cropType = -1, int diseaseType = -1)
        {

            string str = "select * from public.\"Product_Realtime_Distribution\"where productType = (@ProductTypeId) and cropType = (@CropTypeId) and diseaseType = (@DiseaseTypeId);";
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }
    }
}
