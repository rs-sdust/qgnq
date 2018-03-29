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
    public class TrendController : ApiController
    {
     
        [HttpGet]
        public DataTable GetProvTrend(DateTime start, int days, int RegionId, int productType, int cropType = -1, int diseaseType = -1)
        {
            string str = null;
            DateTime end = start.AddDays(days);
            string strday = string.Format("select  max ( \"ProductDate\" ) from \"Product_Realtime_Province\"");
            DateTime Maxday = Convert.ToDateTime(SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(strday, 1000).Tables[0].Rows[0][0]);
            //string  day = string.Format("select date_part ('day','{0}'::timestamp - '{1}' :: timestamp) ", Maxday, start);
            if (DateTime.Compare(Maxday, end) >= 0)
            {
                str = string.Format("select \"ProductDate\",\"ProductValue\" from public.\"Product_Realtime_Province\" where (\"ProductDate\"between '{0}' and '{1}') and \"ProvinceId\" = {2} and \"ProductTypeId\" = {3} and \"CropTypeId\" = {4} and \"DiseaseTypeId\"  = {5} ", start, end, RegionId, productType, cropType, diseaseType);

            }
            else
            {
                str = string.Format("select \"ProductDate\",\"ProductValue\" from public.\"Product_Realtime_Province\"  where (\"ProductDate\"between '{0}' and '{1}') and \"ProvinceId\" = {2} and \"ProductTypeId\" = {3} and \"CropTypeId\" = {4} and \"DiseaseTypeId\"  = {5} ", start, Maxday, RegionId, productType, cropType, diseaseType);
                str += string.Format("UNION select \"ProductDate\",\"ProductValue\" from public.\"Product_Forecast_Province\" where (\"ProductDate\"between '{0}' and '{1}') and \"ProvinceId\" = {2} and \"ProductTypeId\" = {3} and \"CropTypeId\" = {4} and \"DiseaseTypeId\"  = {5} ", Maxday.AddDays(1), end, RegionId, productType, cropType, diseaseType);

            }
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }
        [HttpGet]
        public DataTable GetCityTrend(DateTime start, int days, int RegionId, int productType, int cropType = -1, int diseaseType = -1)
        {
            string str = null;
            DateTime end = start.AddDays(days);
            string strday = string.Format("select  max ( \"ProductDate\" ) from \"Product_Realtime_City\"");
            DateTime Maxday = Convert.ToDateTime(SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(strday, 1000).Tables[0].Rows[0][0]);
            //string  day = string.Format("select date_part ('day','{0}'::timestamp - '{1}' :: timestamp) ", Maxday, start);
            if (DateTime.Compare(Maxday, end) >= 0)
            {
                str = string.Format("select \"ProductDate\",\"ProductValue\" from public.\"Product_Realtime_City\" where (\"ProductDate\"between '{0}' and '{1}') and \"CityId\" = {2} and \"ProductTypeId\" = {3} and \"CropTypeId\" = {4} and \"DiseaseTypeId\"  = {5} ", start, end, RegionId, productType, cropType, diseaseType);

            }
            else
            {
                str = string.Format("select \"ProductDate\",\"ProductValue\" from public.\"Product_Realtime_City\" where (\"ProductDate\"between '{0}' and '{1}') and \"CityId\" = {2} and \"ProductTypeId\" = {3} and \"CropTypeId\" = {4} and \"DiseaseTypeId\"  = {5} ", start, Maxday, RegionId, productType, cropType, diseaseType);
                str += string.Format("UNION select \"ProductDate\",\"ProductValue\" from public.\"Product_Forecast_City\" where (\"ProductDate\"between '{0}' and '{1}') and \"CityId\" = {2} and \"ProductTypeId\" = {3} and \"CropTypeId\" = {4} and \"DiseaseTypeId\"  = {5} ", Maxday.AddDays(1), end, RegionId, productType, cropType, diseaseType);

            }
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }
        [HttpGet]
        public DataTable GetCountyTrend(DateTime start, int days, int RegionId, int productType, int cropType = -1, int diseaseType = -1)
        {
            string str = null;
            DateTime end = start.AddDays(days);
            string strday = string.Format("select  max ( \"ProductDate\" ) from \"Product_Realtime_County\"");
            DateTime Maxday = Convert.ToDateTime(SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(strday, 1000).Tables[0].Rows[0][0]);
            //string  day = string.Format("select date_part ('day','{0}'::timestamp - '{1}' :: timestamp) ", Maxday, start);
            if (DateTime.Compare(Maxday, end) >= 0)
            {
                str = string.Format("select \"ProductDate\",\"ProductValue\" from public.\"Product_Realtime_County\" where (\"ProductDate\"between '{0}' and '{1}') and \"CountyId\" = {2} and \"ProductTypeId\" = {3} and \"CropTypeId\" = {4} and \"DiseaseTypeId\"  = {5} ", start, end, RegionId, productType, cropType, diseaseType);

            }
            else
            {
                str = string.Format("select\"ProductDate\",\"ProductValue\" from public.\"Product_Realtime_County\" where (\"ProductDate\"between '{0}' and '{1}') and \"CountyId\" = {2} and \"ProductTypeId\" = {3} and \"CropTypeId\" = {4} and \"DiseaseTypeId\"  = {5} ", start, Maxday, RegionId, productType, cropType, diseaseType);
                str += string.Format("UNION select \"ProductDate\",\"ProductValue\" from public.\"Product_Forecast_County\" where (\"ProductDate\"between '{0}' and '{1}') and \"CountyId\" = {2} and \"ProductTypeId\" = {3} and \"CropTypeId\" = {4} and \"DiseaseTypeId\"  = {5} ", Maxday.AddDays(1), end, RegionId, productType, cropType, diseaseType);

            }
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }
    }
}
