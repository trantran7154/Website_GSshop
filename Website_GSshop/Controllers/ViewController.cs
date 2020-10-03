using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers
{
    public class ViewController : Controller
    {
        Data_GSShopEntities db = new Data_GSShopEntities();
        // GET: View
        // Xem chi tiết các sản phẩm tìm kiếm phổ biến
        public ActionResult MostPopularDetail()
        {
            Product product = (Product)Session["product"];
            return View(db.Product.Where(n => n.product_active == true).Take(40).ToList());
        }
        // Xem chi tiếêt sản phẩm của các bộ sưu tập
        public ActionResult CollectionsDetail()
        {
            return View(db.Product.ToList());
        }
        // Xem chi tiết các sản phẩm sale mạnh
        public ActionResult FlashSaleDetail()
        {
            return View(db.Product.ToList());
        }
        // Xem chi tiết các sản phẩm danh mục hàng
        public ActionResult CategoriesDetail()
        {
            return View(db.Product.Where(n => n.product_active == true).OrderByDescending(n => n.product_datecreated).Take(36).ToList());
        }
        // Xem chi tiết sản phẩm của các cửa hàng kinh doanh
        public ActionResult GSMallDetail()
        {
            return View(db.Product.ToList());
        }
        // Xem chi tiết thông tin các sản phẩm
        public ActionResult ProductDetail(int ? id)
        {
            Product product = db.Product.SingleOrDefault(n => n.product_id == id);
            if (product == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            Session["product"] = id;
            db.Product.Find(id).product_view++;
            db.SaveChanges();
            return View(product);
        }
    }
}