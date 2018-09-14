/****************************************************************
 * 
 * File name: GrowthController
 * 
 * Version: 1.0
 * 
 * Author: RickerYan
 * 
 * Company: SunGolden
 * 
 * Created: 2018/9/14 13:33:27
 * 
 * Summary: 长势产品
 * 
 ****************************************************************/
using Dapper;
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
    [RoutePrefix("growths")]
    public class GrowthController : ApiController
    {
        private String unit = "无";

        /// <summary>
        /// 获取全国的长势统计产品
        /// </summary>
        /// <param name="level">产品区划等级，1：省:2：市:3：县</param>
        /// <param name="crop">作物类型编号</param>
        /// <param name="limit"></param>
        /// <param name="offset"></param>
        /// <returns></returns>
        [Route("")]
        public ResultContent GetCountry(int level, int crop, int limit, int offset)
        {
            using (IDbConnection conn = DbConnection.OpenConnection(ConnectionType.PostgreSQL))
            {
                try
                {
                    //全国长势产品
                    var strSql = "SELECT * FROM f_growth_country(@level,@crop,@limit,@offset)";
                    var res = conn.Query<Product>(strSql, new { level = level, crop = crop, limit = limit, offset = offset });
                    if (res != null & res.Count() > 0)
                    {
                        var times = res.Select(p => p.date);
                        var distinct = times.Distinct();
                        var data = new ResData();
                        data.unit = unit;
                        switch (level)
                        {
                            case 1:
                                data.type = "省级长势产品";
                                break;
                            case 2:
                                data.type = "市级长势产品";
                                break;
                            case 3:
                                data.type = "县级长势产品";
                                break;
                        }
                        data.series = new List<Series>();
                        foreach (DateTime date in distinct)
                        {
                            var series = new Series();
                            series.date = date;
                            series.prod = res.Where(p => p.date == date).ToList();
                            data.series.Add(series);
                        }
                        return new ResultContent(true, data);
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

        /// <summary>
        /// 获取全省的长势统计产品
        /// </summary>
        /// <param name="level">产品区划等级，1：省:2：市:3：县</param>
        /// <param name="prov">省份编号</param>
        /// <param name="crop">作物类型编号</param>
        /// <param name="limit"></param>
        /// <param name="offset"></param>
        /// <returns></returns>
        [Route("")]
        public ResultContent GetProv(int level, String prov, int crop, int limit, int offset)
        {
            using (IDbConnection conn = DbConnection.OpenConnection(ConnectionType.PostgreSQL))
            {
                try
                {
                    //全省长势产品
                    var strSql = "SELECT * FROM f_growth_prov(@level,@prov,@crop,@limit,@offset)";
                    var res = conn.Query<Product>(strSql, new { level = level, prov = prov, crop = crop, limit = limit, offset = offset });
                    if (res != null && res.Count() > 0)
                    {
                        var times = res.Select(p => p.date);
                        var distinct = times.Distinct();
                        var data = new ResData();
                        data.unit = unit;
                        switch (level)
                        {
                            case 1:
                                data.type = "省级长势产品";
                                break;
                            case 2:
                                data.type = "市级长势产品";
                                break;
                            case 3:
                                data.type = "县级长势产品";
                                break;
                        }
                        data.series = new List<Series>();
                        foreach (DateTime date in distinct)
                        {
                            var series = new Series();
                            series.date = date;
                            series.prod = res.Where(p => p.date == date).ToList();
                            data.series.Add(series);
                        }
                        return new ResultContent(true, data);
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

        /// <summary>
        /// 获取全市的长势统计产品
        /// </summary>
        /// <param name="level">产品区划等级，1：省:2：市:3：县</param>
        /// <param name="city">城市编号</param>
        /// <param name="crop">作物类型编号</param>
        /// <param name="limit"></param>
        /// <param name="offset"></param>
        /// <returns></returns>
        [Route("")]
        public ResultContent GetCity(int level, String city, int crop, int limit, int offset)
        {
            using (IDbConnection conn = DbConnection.OpenConnection(ConnectionType.PostgreSQL))
            {
                try
                {
                    //全市长势产品
                    var strSql = "SELECT * FROM f_growth_city(@level,@city,@crop,@limit,@offset)";
                    var res = conn.Query<Product>(strSql, new { level = level, city = city, crop = crop, limit = limit, offset = offset });
                    if (res != null && res.Count() > 0)
                    {
                        var times = res.Select(p => p.date);
                        var distinct = times.Distinct();
                        var data = new ResData();
                        data.unit = unit;
                        switch (level)
                        {
                            case 2:
                                data.type = "市级长势产品";
                                break;
                            case 3:
                                data.type = "县级长势产品";
                                break;
                        }
                        data.series = new List<Series>();
                        foreach (DateTime date in distinct)
                        {
                            var series = new Series();
                            series.date = date;
                            series.prod = res.Where(p => p.date == date).ToList();
                            data.series.Add(series);
                        }
                        return new ResultContent(true, data);
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
