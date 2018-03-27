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
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data;
using Newtonsoft.Json;
using System.Xml;

/// <summary>
/// The Controllers namespace.
/// </summary>
namespace WebApi.Controllers
{
    /// <summary>
    /// Class DicController.
    /// </summary>
    public class DicController : ApiController
    {
        // GET api/Dic/GetProductType
        [HttpGet]
        public DataTable GetProductType()
        {
            string str = "select * from public.\"Dic_ProductType\";";
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }

        // GET api/Dic/GetCropType
        [HttpGet]
        public DataTable GetCropType()
        {
            string str = "select * from public.\"Dic_CropType\";";
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }

        // GET api/Dic/GetDiseaseType
        [HttpGet]
        public DataTable GetDiseaseType()
        {
            string str = "select * from public.\"Dic_DiseaseType\";";
            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
        }
        // GET api/Dic/GetCatalog
        [HttpGet]
        public string GetCatalog()
        {
            string str = "select \"Catalog\" from public.\"Dic_Catalog\" where \"Name\" = 'web';";
            string xml = SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0].Rows[0][0].ToString();
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(xml);
            string json = Newtonsoft.Json.JsonConvert.SerializeXmlNode(doc);
            return json.Replace("@", "");
        }

//        [HttpGet]
//        public DataTable GetProvJson()
//        {
//            string str = @"SELECT jsonb_build_object(
//    'type',     'FeatureCollection',
//    'features', jsonb_agg(feature)
//)
//FROM (
//  SELECT jsonb_build_object(
//    'type',       'Feature',
//    'id',         provid,
//    'geometry',   ST_AsGeoJSON(geom)::jsonb,
//    'properties', to_jsonb(row) - 'geom'
//  ) AS feature
//  FROM (SELECT provid,provname,geom FROM geom_prov_slim) row) features;";

//            return SunGolden.DBUtils.DbHelperPostgresql.ExecuteQuery(str, 1000).Tables[0];
//        }


    }
}
