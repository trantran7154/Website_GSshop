using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Website_GSshop.Models
{
    public class ShoppingCarts
    {
        public int product_id { get; set; }
        public string product_image { get; set; }
        public int pay_amount { get; set; }
        public int product_price { get; set; }
        public string product_name { get; set; }
        public int pay_money { get { return pay_amount * product_price; } }
    }
}