using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers
{
    public class DisplayController : Controller
    {
        Data_GSShopEntities db = new Data_GSShopEntities();
        // GET: Display
        public ActionResult Index()
        {
            return View();
        }
        // Hiển thị danh mục
        public PartialViewResult Category()
        {
            return PartialView(db.Category.Where(n => n.category_active == true).OrderBy(n => n.category_name).ToList());
        }
        // Hiển thị top 6 Deal chớp nhoáng
        public PartialViewResult FlashSale()
        {
            return PartialView(db.Product.Where(n => n.product_active == true).OrderByDescending(n => n.product_sale).Take(6).ToList());
        }
        // Hiển thị tìm kiếm phổ biến
        public PartialViewResult MostPopular()
        {
            return PartialView(db.Product.Where(n => n.product_active == true).OrderByDescending(n => n.product_datecreated).Take(5).ToList());
        }
        // Hiển thị bộ sưu tập
        public PartialViewResult Collections()
        {
            return PartialView();
        }
        // Hiển thị thương hiệu hàng đầu
        public PartialViewResult GSMall()
        {
            return PartialView();
        }
        // Hiển thị danh mục ngành hàng
        public PartialViewResult Categories()
        {
            return PartialView();
        }
        // Dành riêng cho bạn
        public PartialViewResult JustForYou()
        {
            return PartialView();
        }
    }
}