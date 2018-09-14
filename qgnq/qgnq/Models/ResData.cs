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
 * Created: 2018/9/14 13:38:18
 * 
 * Summary: 返回的data结构
 * 
 ****************************************************************/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace qgnq.Models
{
    public class ResData
    {
        public String type { get; set; }
        public String unit { get; set; }
        public List<Series> series { get; set; }
    }
}