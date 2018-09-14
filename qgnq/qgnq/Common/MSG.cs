/****************************************************************
 * 
 * File name: MSG
 * 
 * Version: 1.0
 * 
 * Author: RickerYan
 * 
 * Company: SunGolden
 * 
 * Created: 2018/9/14 13:15:35
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
    public class MSG
    {
        private static MSG mMSG;
        private static readonly object locker = new object();

        public string SUCCEED = "succeed";
        public string UNKNOWN_ERROR = "未知错误";
        public string SERVER_ERROR = "服务器错误";
        public string NOT_AUTH = "未授权";
        public string AUTH_ERROR = "授权错误";
        public string DATA_NOT_FOUND = "请求的数据不存在";
        public string INVALID_MOBILE = "无效的手机号码";
        public string INVALID_DATA = "无效的数据";
        public string ALREADY_EXISTS = "数据已存在";
        private MSG()
        { }

        public static MSG GetInstance()
        {
            if (mMSG == null)
            {
                lock (locker)
                {
                    mMSG = new MSG();
                }
            }
            return mMSG;
        }

    }
}