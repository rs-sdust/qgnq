// ***********************************************************************
// Assembly         : SunGolden.DBUtils
// Author           : Richer Yan
// Created          : 03-23-2018
//
// Last Modified By : Richer Yan
// Last Modified On : 03-23-2018
// ***********************************************************************
// <copyright file="DbHelperPostgresql.cs" company="SunGolden">
//     Copyright (c) SunGolden. All rights reserved.
// </copyright>
// <summary>postgresql 操作类</summary>
// ***********************************************************************
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Npgsql;

/// <summary>
/// The DBUtils namespace.
/// </summary>
namespace SunGolden.DBUtils
{
    /// <summary>
    /// Class DbHelperPostgresql.
    /// </summary>
    public class DbHelperPostgresql
    {
        //数据库连接字符串(web.config来配置)，可以动态更改connectionString支持多数据库.		
        /// <summary>
        /// The connection string
        /// </summary>
        public static string connectionString = PubConstant.ConnectionString;


        /// <summary>
        /// 执行查询，返回DataSet
        /// </summary>
        /// <param name="SQLString">The SQL string.</param>
        /// <param name="Times">The times.</param>
        /// <returns>DataSet.</returns>
        public static DataSet ExecuteQuery(string SQLString, int Times)
        {
            using (NpgsqlConnection conn = new NpgsqlConnection(connectionString))
            {
                using (NpgsqlCommand cmd = new NpgsqlCommand())
                {
                    DataSet ds = new DataSet();
                    try
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.CommandText = SQLString;
                        cmd.CommandTimeout = Times;
                        using (NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd))
                        {
                            da.Fill(ds, "QueryResult");
                        }
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                    finally
                    {
                        conn.Close();
                    }
                    return ds;
                }
            }
        }

    }
}
