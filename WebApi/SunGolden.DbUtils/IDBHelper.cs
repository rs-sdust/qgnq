// ***********************************************************************
// Assembly         : SunGolden.DBUtils
// Author           : sdzh09
// Created          : 04-11-2018
//
// Last Modified By : sdzh09
// Last Modified On : 03-23-2018
// ***********************************************************************
// <copyright file="IDBHelper.cs" company="SunGolden">
//     Copyright ©  2018
// </copyright>
// <summary>数据库操作接口</summary>
// ***********************************************************************
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Common;

namespace SunGolden.DBUtils
{
    /// <summary>
    /// Interface IDBHelper
    /// </summary>
    public interface IDBHelper
    {
        /// <summary>
        /// 执行 Transact-SQL 语句并返回受影响的行数。
        /// </summary>
        /// <param name="connectionString">The connection string.</param>
        /// <param name="cmdType">Type of the command.</param>
        /// <param name="cmdText">The command text.</param>
        /// <param name="cmdParms">The command parms.</param>
        /// <returns>System.Int32.</returns>
        int ExecuteNonQuery(string connectionString, System.Data.CommandType cmdType, string cmdText, params System.Data.Common.DbParameter[] cmdParms);

        /// <summary>
        /// 在事务中执行 Transact-SQL 语句并返回受影响的行数。
        /// </summary>
        /// <param name="trans">The trans.</param>
        /// <param name="cmdType">Type of the command.</param>
        /// <param name="cmdText">The command text.</param>
        /// <param name="cmdParms">The command parms.</param>
        /// <returns>System.Int32.</returns>
        int ExecuteNonQuery(System.Data.Common.DbTransaction trans, System.Data.CommandType cmdType, string cmdText, params System.Data.Common.DbParameter[] cmdParms);

        /// <summary>
        /// 在事务中执行查询，返回DataSet
        /// </summary>
        /// <param name="trans">The trans.</param>
        /// <param name="cmdType">Type of the command.</param>
        /// <param name="cmdText">The command text.</param>
        /// <param name="cmdParms">The command parms.</param>
        /// <returns>DataSet.</returns>
        DataSet ExecuteQuery(System.Data.Common.DbTransaction trans, System.Data.CommandType cmdType, string cmdText, params System.Data.Common.DbParameter[] cmdParms);

        /// <summary>
        /// 执行查询，返回DataSet
        /// </summary>
        /// <param name="connectionString">The connection string.</param>
        /// <param name="cmdType">Type of the command.</param>
        /// <param name="cmdText">The command text.</param>
        /// <param name="cmdParms">The command parms.</param>
        /// <returns>DataSet.</returns>
        DataSet ExecuteQuery(string connectionString, System.Data.CommandType cmdType, string cmdText, params System.Data.Common.DbParameter[] cmdParms);

        /// <summary>
        /// 在事务中执行查询，返回DataReader
        /// </summary>
        /// <param name="trans">The trans.</param>
        /// <param name="cmdType">Type of the command.</param>
        /// <param name="cmdText">The command text.</param>
        /// <param name="cmdParms">The command parms.</param>
        /// <returns>DbDataReader.</returns>
        DbDataReader ExecuteReader(System.Data.Common.DbTransaction trans, System.Data.CommandType cmdType, string cmdText, params System.Data.Common.DbParameter[] cmdParms);

        /// <summary>
        /// 执行查询，返回DataReader
        /// </summary>
        /// <param name="connectionString">The connection string.</param>
        /// <param name="cmdType">Type of the command.</param>
        /// <param name="cmdText">The command text.</param>
        /// <param name="cmdParms">The command parms.</param>
        /// <returns>DbDataReader.</returns>
        DbDataReader ExecuteReader(string connectionString, System.Data.CommandType cmdType, string cmdText, params System.Data.Common.DbParameter[] cmdParms);

        /// <summary>
        /// 在事务中执行查询，并返回查询所返回的结果集中第一行的第一列。忽略其他列或行。
        /// </summary>
        /// <param name="trans">The trans.</param>
        /// <param name="cmdType">Type of the command.</param>
        /// <param name="cmdText">The command text.</param>
        /// <param name="cmdParms">The command parms.</param>
        /// <returns>System.Object.</returns>
        object ExecuteScalar(System.Data.Common.DbTransaction trans, System.Data.CommandType cmdType, string cmdText, params System.Data.Common.DbParameter[] cmdParms);

        /// <summary>
        /// 执行查询，并返回查询所返回的结果集中第一行的第一列。忽略其他列或行。
        /// </summary>
        /// <param name="connectionString">The connection string.</param>
        /// <param name="cmdType">Type of the command.</param>
        /// <param name="cmdText">The command text.</param>
        /// <param name="cmdParms">The command parms.</param>
        /// <returns>System.Object.</returns>
        object ExecuteScalar(string connectionString, System.Data.CommandType cmdType, string cmdText, params System.Data.Common.DbParameter[] cmdParms);

        /// <summary>
        /// 得到数据条数
        /// </summary>
        /// <param name="connectionString">The connection string.</param>
        /// <param name="tblName">表名</param>
        /// <param name="condition">条件(不需要where)</param>
        /// <returns>数据条数</returns>
        int GetCount(string connectionString, string tblName, string condition);
    }
}
