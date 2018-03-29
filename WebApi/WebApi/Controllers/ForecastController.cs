﻿using System;
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
        /// <param name="provId">省份编号</param>
        /// <returns>DataTable</returns>
        [HttpGet]
        public DataTable GetProvForecastProduct(DateTime date, int productType, int cropType = -1, int diseaseType = -1, int provId = -1)
        {

            string str = null;
            if (cropType == -1)
            {
                cropType = 0;
            }
            if (diseaseType == -1)
            {
                diseaseType = 0;
            }
            if (provId == -1)
            {
                str = string.Format("select \"provid\",\"provname\",\"geom\",\"ProductValue\" from public.\"Product_Forecast_Province\" join \"geom_province\" on \"geom_province\".\"provid\" = \"Product_Forecast_Province\".\"ProvinceId\" where \"ProductDate\" = '{0}' and \"ProductTypeId\" = {1} and \"CropTypeId\" = {2} and \"DiseaseTypeId\"  = {3} ", date, productType, cropType, diseaseType);
            }
            else
            {
                str = string.Format("select \"provid\",\"provname\",\"geom\",\"ProductValue\" from public.\"Product_Forecast_Province\" join \"geom_province\" on \"geom_province\".\"provid\" = \"Product_Forecast_Province\".\"ProvinceId\" where \"ProductDate\" = '{0}' and \"ProductTypeId\" = {1} and \"CropTypeId\" = {2} and \"DiseaseTypeId\"  = {3} and \"ProvinceId\" = {4}", date, productType, cropType, diseaseType, provId);
            }
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
	                                ) features;", str);
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(tojson, 1000).Tables[0];

            //string str = "select * from public.\"Product_Forecast_Province\" where productType = (@ProductTypeId) and cropType = (@CropTypeId) and diseaseType = (@DiseaseTypeId) and ProvinceId = （@provId）;";
            //return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }
        /// <summary>
        /// 获取地市级预报产品数据
        /// </summary>
        /// <param name="date">产品日期</param>
        /// <param name="productType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <param name="provId">地市编号</param>
        /// <returns>DataTable</returns>
        [HttpGet]
        public DataTable GetCityForecastProduct(DateTime date, int productType, int cropType = -1, int diseaseType = -1, int cityId = -1)
        {
            string str = null;
            if (cropType == -1)
            {
                cropType = 0;
            }
            if (diseaseType == -1)
            {
                diseaseType = 0;
            }
            if (cityId == -1)
            {
                str = string.Format("select \"cityid\",\"cityname\",\"geom\",\"ProductValue\" from public.\"Product_Forecast_City\" join \"geom_city\" on \"geom_city\".\"cityid\" = \"Product_Forecast_City\".\"CityId\" where \"ProductDate\" = '{0}' and \"ProductTypeId\" = {1} and \"CropTypeId\" = {2} and \"DiseaseTypeId\"  = {3} ", date, productType, cropType, diseaseType);
            }
            else
            {
                str = string.Format("select \"cityid\",\"cityname\",\"geom\",\"ProductValue\" from public.\"Product_Forecast_City\" join \"geom_city\" on \"geom_city\".\"cityid\" = \"Product_Forecast_City\".\"CityId\" where \"ProductDate\" = '{0}' and \"ProductTypeId\" = {1} and \"CropTypeId\" = {2} and \"DiseaseTypeId\"  = {3} and \"CityId\" = {4}", date, productType, cropType, diseaseType, cityId);
            }
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
				                                cityid,
				                                'geometry',
				                                ST_AsGeoJSON (geom) :: jsonb,
				                                'properties',
				                                to_jsonb (ROW) - 'geom'
			                                ) AS feature
		                                FROM
			                                ({0}) ROW
	                                ) features;", str);
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(tojson, 1000).Tables[0];

            //string str = "select * from public.\"Product_Forecast_City\" where productType = (@ProductTypeId) and cropType = (@CropTypeId) and diseaseType = (@DiseaseTypeId) and CityId = （@cityId）;";
            //return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }
        /// <summary>
        /// 获取县级预报产品数据
        /// </summary>
        /// <param name="date">产品日期</param>
        /// <param name="productType">产品类型编号</param>
        /// <param name="cropType">作物类型编号</param>
        /// <param name="diseaseType">病害类型编号</param>
        /// <param name="provId">区县编号</param>
        /// <returns>DataTable</returns>
        [HttpGet]
        public DataTable GetCountyForecastProduct(DateTime date, int productType, int cropType = -1, int diseaseType = -1, int countyId = -1)
        {
            string str = null;
            if (cropType == -1)
            {
                cropType = 0;
            }
            if (diseaseType == -1)
            {
                diseaseType = 0;
            }
            if (countyId == -1)
            {
                str = string.Format("select \"counid\",\"counname\",\"geom\",\"ProductValue\" from public.\"Product_Forecast_County\" join \"geom_county\" on \"geom_county\".\"counid\" = \"Product_Forecast_County\".\"CountyId\" where \"ProductDate\" = '{0}' and \"ProductTypeId\" = {1} and \"CropTypeId\" = {2} and \"DiseaseTypeId\"  = {3} ", date, productType, cropType, diseaseType);
            }
            else
            {
                str = string.Format("select \"counid\",\"counname\",\"geom\",\"ProductValue\" from public.\"Product_Forecast_County\" join \"geom_county\" on \"geom_county\".\"counid\" = \"Product_Forecast_County\".\"CountyId\" where \"ProductDate\" = '{0}' and \"ProductTypeId\" = {1} and \"CropTypeId\" = {2} and \"DiseaseTypeId\"  = {3} and \"CountyId\" = {4}", date, productType, cropType, diseaseType, countyId);
            }
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
				                                counid,
				                                'geometry',
				                                ST_AsGeoJSON (geom) :: jsonb,
				                                'properties',
				                                to_jsonb (ROW) - 'geom'
			                                ) AS feature
		                                FROM
			                                ({0}) ROW
	                                ) features;", str);
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(tojson, 1000).Tables[0];

            //string str = "select * from public.\"Product_Forecast_County\" where productType = (@ProductTypeId) and cropType = (@CropTypeId) and diseaseType = (@DiseaseTypeId) and CountyId = （@countyId）;";
            //return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
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

            if (cropType == -1)
            {
                cropType = 0;
            }
            if (diseaseType == -1)
            {
                diseaseType = 0;
            }
            string str = string.Format("select \"Id\",\"GeoString\" from public.\"Product_Forecast_Distribution\"  where \"DistributionDate\" = '{0}' and \"ProductTypeId\" = {1} and \"CropTypeId\" = {2} and \"DiseaseTypeId\"  = {3} ", date, productType, cropType, diseaseType);
           
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }
    }
}
