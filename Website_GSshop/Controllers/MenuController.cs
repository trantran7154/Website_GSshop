using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers
{
    public class MenuController : Controller
    {
        Data_GSShopEntities db = new Data_GSShopEntities();
        // GET: Menu
        public PartialViewResult Menu()
        {
            return PartialView(db.Category.Where(n => n.category_active == true).OrderBy(n => n.category_name).ToList());
        }
        // Menu chính
        public ActionResult Menu_GSMall()
        {
            return View(db.Product.Where(n => n.product_active == true).OrderByDescending(n => n.product_datecreated).ToList());
        }
        //Menu voucher giảm giá từ các đối tác và thương hiệu nổi tiếng
        public ActionResult Menu_Vouchers()
        {
            return View(db.Product.Where(n => n.product_active == true).OrderByDescending(n => n.product_datecreated).ToList());
        }
        //Menu nạp thẻ
        public ActionResult Menu_TopUp()
        {
            return View(db.Product.Where(n => n.product_active == true).OrderByDescending(n => n.product_datecreated).ToList());
        }
        //Menu 
        public ActionResult Menu_LazGlobal()
        {
            return View(db.Product.Where(n => n.product_active == true).OrderByDescending(n => n.product_datecreated).ToList());
        }
    }
}