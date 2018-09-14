/****************************************************************
 * 
 * File name: ResData
 * 
 * Version: 1.0
 * 
 * Author: RickerYan
 * 
 * Company: SunGolden
 * 
 * Created: 2018/9/14 13:33:27
 * 
 * Summary: data 中的 时间序列数据
 * 
 ****************************************************************/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace qgnq.Models
{
    public class Series
    {
        public DateTime date { get; set; }
        public List<Product> prod { get; set; }
    }
}