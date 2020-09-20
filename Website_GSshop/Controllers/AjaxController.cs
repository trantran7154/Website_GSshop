using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers
{
    public class AjaxController : Controller
    {
        Data_GSShopEntities db = new Data_GSShopEntities();
        // GET: Ajax
        //Most Popular
        public PartialViewResult AllMostPopular()
        {
            List<Product> products = db.Product.Where(n => n.product_active == true).OrderByDescending(n => n.product_datecreated).ToList();
            return PartialView("_MostPopular",products);
        }
        public PartialViewResult MostPopularSale()
        {
            List<Product> products = db.Product.Where(n => n.product_active == true).OrderBy(n => n.product_sale).Take(5).ToList();
            return PartialView("_MostPopular", products);
        }
        public PartialViewResult MostPopularView()
        {
            List<Product> products = db.Product.Where(n => n.product_active == true).OrderByDescending(n => n.product_view).Take(5).ToList();
            return PartialView("_MostPopular", products);
        }
        public PartialViewResult MostPopularLove()
        {
            List<Product> products = db.Product.Where(n => n.product_active == true).OrderByDescending(n => n.product_love).Take(5).ToList();
            return PartialView("_MostPopular", products);
        }
        //Lọc theo bảng
        public PartialViewResult Table()
        {
            List<Product> products = db.Product.Where(n => n.product_active == true).OrderByDescending(n => n.product_datecreated).Take(36).ToList();
            return PartialView("_Table", products);
        }
        //Lọc danh theo sách bảng
        public PartialViewResult TableList()
        {
            List<Product> products = db.Product.Where(n => n.product_active == true).OrderByDescending(n => n.product_datecreated).Take(36).ToList();
            return PartialView("_TableList", products);
        }
    }
}