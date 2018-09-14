/****************************************************************
 * 
 * File name: Products
 * 
 * Version: 1.0
 * 
 * Author: RickerYan
 * 
 * Company: SunGolden
 * 
 * Created: 2018/9/14 13:09:08
 * 
 * Summary: 产品
 * 
 ****************************************************************/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace qgnq.Models
{
    public class Product
    {
        public DateTime date { get; set; }
        public String code { get; set; }
        public float value { get; set; }
        public int change { get; set; }
    }
}