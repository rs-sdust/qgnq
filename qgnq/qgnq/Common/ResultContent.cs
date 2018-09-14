/****************************************************************
 * 
 * File name: ResultContent
 * 
 * Version: 1.0
 * 
 * Author: RickerYan
 * 
 * Company: SunGolden
 * 
 * Created: 2018/9/14 13:15:06
 * 
 * Summary: 
 * 
 ****************************************************************/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace qgnq.Common
{
    public class ResultContent
    {
        //执行状态，true：成功；false：失败
        public bool status { get; set; }
        //消息反馈
        public string msg { get; set; }
        //数据反馈
        public object data { get; set; }

        /// <summary>
        /// 执行成功时使用该构造器，默认添加成功消息
        /// </summary>
        /// <param name="status">执行状态</param>
        /// <param name="data">数据反馈</param>
        public ResultContent(bool status, object data)
        {
            this.status = status;
            this.msg = MSG.GetInstance().SUCCEED;
            this.data = data;
        }
        /// <summary>
        /// 适用于所有情景
        /// </summary>
        /// <param name="status">执行状态</param>
        /// <param name="msg">消息反馈</param>
        /// <param name="data">数据反馈</param>
        public ResultContent(bool status, string msg, object data)
        {
            this.status = status;
            this.msg = msg;
            this.data = data;
        }
    }
}