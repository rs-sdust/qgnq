// ***********************************************************************
// Assembly         : WebApi
// Author           : Richer Yan
// Created          : 03-23-2018
//
// Last Modified By : Richer Yan
// Last Modified On : 03-23-2018
// ***********************************************************************
// <copyright file="DicController.cs" company="SunGolden">
//     Copyright (c) SunGolden. All rights reserved.
// </copyright>
// <summary>获取数据字典</summary>
// ***********************************************************************
using System.Data;
using System.Data.Common;
using System.Web.Http;
using System.Xml;

/// <summary>
/// The Controllers namespace.
/// </summary>
namespace WebApi.Controllers
{
    /// <summary>
    /// 数据字典控制器.
    /// </summary>
    public class DicController : ApiController
    {
        // GET api/Dic/GetProductType
        /// <summary>
        /// 获取产品类型字典.
        /// </summary>
        /// <returns>DataTable.</returns>
        [HttpGet]
        public DataTable GetProductType()
        {
            string str = @"select * from f_dic_getprodtype();";
            SunGolden.DBUtils.PostgreSQL.OpenCon();
            DataTable dt=SunGolden.DBUtils.PostgreSQL.ExecuteObjectQuery(str,null,new DbParameter[0]).Tables[0];
            SunGolden.DBUtils.PostgreSQL.CloseCon();
            return dt;
        }

        // GET api/Dic/GetCropType
        /// <summary>
        /// 获取作物类型字典
        /// </summary>
        /// <returns>DataTable.</returns>
        [HttpGet]
        public DataTable GetCropType()
        {
            string str = @"select * from f_dic_getcroptype();";
            //return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
            SunGolden.DBUtils.PostgreSQL.OpenCon();
            DataTable dt = SunGolden.DBUtils.PostgreSQL.ExecuteObjectQuery(str, null, new DbParameter[0]).Tables[0];
            SunGolden.DBUtils.PostgreSQL.CloseCon();
            return dt;
        }

        // GET api/Dic/GetDiseaseType
        /// <summary>
        /// 获取病害类型字典
        /// </summary>
        /// <returns>DataTable.</returns>
        [HttpGet]
        public DataTable GetDiseaseType()
        {
            string str = @"select * from f_dic_getdiseasetype();";
            //return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
            SunGolden.DBUtils.PostgreSQL.OpenCon();
            DataTable dt = SunGolden.DBUtils.PostgreSQL.ExecuteObjectQuery(str, null, new DbParameter[0]).Tables[0];
            SunGolden.DBUtils.PostgreSQL.CloseCon();
            return dt;
        }
        // GET api/Dic/GetCatalog
        /// <summary>
        /// 获取目录配置
        /// </summary>
        /// <returns>System.String.</returns>
        [HttpGet]
        public string GetCatalog(string client)
        {

            string str = "select * from f_dic_getcatalog(@client);";
            SunGolden.DBUtils.PostgreSQL.OpenCon();
            DbParameter[] para = new DbParameter[1];
            para[0] = SunGolden.DBUtils.PostgreSQL.NewParameter("@client", client);
            DataTable res = SunGolden.DBUtils.PostgreSQL.ExecuteObjectQuery(str, null, para).Tables[0];
            if (res.Rows.Count > 0)
            {
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(res.Rows[0][0].ToString());
                string json = Newtonsoft.Json.JsonConvert.SerializeXmlNode(doc);
                SunGolden.DBUtils.PostgreSQL.CloseCon();
                return json.Replace("@", "");
            }
            else
            {
                return "未找到指定目录，请确认客户端类型！";
            }
        }
    }
}
