using Dapper;
using Newtonsoft.Json;
using qgnq.Common;
using qgnq.Models;
using SunGolden.DbUtils;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace qgnq.Controllers
{
    [RoutePrefix("maps")]
    public class MapController : ApiController
    {
        [Route("")]
        public ResultContent GetCountry(int level)
        {
            using (IDbConnection conn = DbConnection.OpenConnection(ConnectionType.PostgreSQL))
            {
                try
                {
                    //全国区划
                    var strSql = "SELECT * FROM f_map_country(@level)";
                    var res = conn.QueryFirstOrDefault<string>(strSql, new { level = level });
                    if (res != null)
                    {
                        return new ResultContent(true, JsonConvert.DeserializeObject(res));
                    }
                    else
                    {
                        return new ResultContent(false, MSG.GetInstance().DATA_NOT_FOUND, null);
                    }
                }
                catch (Exception)
                {
                    return new ResultContent(false, MSG.GetInstance().SERVER_ERROR, null);
                }

            }
        }
        [Route("")]
        public ResultContent GetProv(int level,String prov)
        {
            using (IDbConnection conn = DbConnection.OpenConnection(ConnectionType.PostgreSQL))
            {
                try
                {
                    //省级区划
                    var strSql = "SELECT * FROM f_map_prov(@level,@prov)";
                    var res = conn.QueryFirstOrDefault<string>(strSql, new { level = level ,prov=prov});
                    if (res != null)
                    {
                        return new ResultContent(true, JsonConvert.DeserializeObject(res));
                    }
                    else
                    {
                        return new ResultContent(false, MSG.GetInstance().DATA_NOT_FOUND, null);
                    }
                }
                catch (Exception)
                {
                    return new ResultContent(false, MSG.GetInstance().SERVER_ERROR, null);
                }

            }
        }
        [Route("")]
        public ResultContent GetCity(int level, String city)
        {
            using (IDbConnection conn = DbConnection.OpenConnection(ConnectionType.PostgreSQL))
            {
                try
                {
                    //市级区划
                    var strSql = "SELECT * FROM f_map_city(@level,@city)";
                    var res = conn.QueryFirstOrDefault<string>(strSql, new { level = level, city = city });
                    if (res != null)
                    {
                        return new ResultContent(true, JsonConvert.DeserializeObject(res));
                    }
                    else
                    {
                        return new ResultContent(false, MSG.GetInstance().DATA_NOT_FOUND, null);
                    }
                }
                catch (Exception)
                {
                    return new ResultContent(false, MSG.GetInstance().SERVER_ERROR, null);
                }

            }
        }
    }
}
