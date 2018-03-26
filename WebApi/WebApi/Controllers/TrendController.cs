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
        public DataTable GetProvTrend(DateTime start, int days, int provId, int productType, int cropType = -1, int diseaseType = -1)
        {


            string str = "select * from public.\"GetProvTrend\";";
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }
        [HttpGet]
        public DataTable GetCityTrend(DateTime start, int days, int cityId, int productType, int cropType = -1, int diseaseType = -1)
        {
            string str = "select * from public.\"GetCityTrend\";";
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }
        [HttpGet]
        public DataTable GetCountyTrend(DateTime start, int days, int countyId, int productType, int cropType = -1, int diseaseType = -1)
        {
            string str = "select * from public.\"GetCountyTrend\";";
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }
    }
}
