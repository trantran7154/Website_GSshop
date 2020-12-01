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
        String login = "/Account/Login/";
        // GET: View
        // Xem chi tiết các sản phẩm tìm kiếm phổ biến
        public ActionResult MostPopularDetail()
        {
            return View(db.Product.Where(n => n.product_active == true).Take(40).ToList());
        }
        // Xem chi tiết sản phẩm của các bộ sưu tập
        public ActionResult CollectionsDetail(int? id)
        {
            Product product = db.Product.SingleOrDefault(n => n.product_id == id);
            if(product == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.SaveChanges();
            return View(product);
        }
        // Xem chi tiết các sản phẩm sale mạnh
        public ActionResult FlashSaleDetail(int ? id)
        {
            User user = (User)Session["user"];
            Product product = db.Product.SingleOrDefault(n => n.product_id == id);
            if (product == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            // Đếm số lượng yêu thích
            if(user != null)
            {
                List<Favourite> fa = db.Favourite.Where(n => n.user_id == user.user_id && n.product_id == id && n.fa_bin == false).ToList();
                ViewBag.CountProduct = fa.Count;
                List<Like> like = db.Like.Where(n => n.user_id == user.user_id && n.product_id == id && n.like_bin == true).ToList();
                ViewBag.CountLike = like.Count;
            }
            Session["product"] = id;
            db.Product.Find(id).product_view++;
            db.SaveChanges();
            return View(product);
        }
        // Xem chi tiết các sản phẩm danh mục hàng
        public ActionResult CategoryDetail(int? id)
        {
            Product pr = db.Product.SingleOrDefault(n => n.product_id == id);
            return View(pr);
        }
        // Xem chi tiết sản phẩm của các cửa hàng kinh doanh
        public ActionResult GSMallDetail(int? id)
        {
            GSMall gSMall = db.GSMall.Find(id);
            return View(gSMall);
        }
        // Xem chi tiết thông tin các sản phẩm
        public ActionResult ProductDetail(int ? id)
        {
            User user = (User)Session["user"];
            Product product = db.Product.SingleOrDefault(n => n.product_id == id);
            if (product == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            // Đếm số lượng sản phẩm
            if (user != null)
            {
                List<Favourite> fa = db.Favourite.Where(n => n.user_id == user.user_id && n.product_id == id && n.fa_bin == false).ToList();
                ViewBag.ProductCount = fa.Count;
            }
            Session["product"] = id;
            db.Product.Find(id).product_view++;
            db.SaveChanges();
            return View(product);
        }
        // Xem chi tiết danh mục
        public ActionResult CategoriesDetail(int id_categories = 0)
        {
            Category category = db.Category.SingleOrDefault(n => n.category_id == id_categories);
            Session["categories"] = category;
            return View(db.Product.Where(n => n.category_id == id_categories).OrderByDescending(n => n.product_datecreated).ToList());
        }
        // Phân loại sản phẩm theo danh mục
        public ActionResult ProductCategoriesList(int? id)
        {
            List<Product> products = db.Product.Where(n => n.banner_id == id).ToList();
            return View(products);
        }
        // Chi tiết danh mục chính
        public ActionResult Category_Detail(int? id)
        {
            List<Product> products = db.Product.Where(n => n.category_id == id).ToList();
            return View(products);
        }
        // Chi tiết danh mục phụ
        public ActionResult Category_DetailTwo(int? id)
        {
            List<Product> products = db.Product.Where(n => n.subcategory_id == id).ToList();
            return View(products);
        }
        // Chi tiết danh mục con
        public ActionResult Category_DetailThree(int? id)
        {
            List<Product> products = db.Product.Where(n => n.csc_id == id).ToList();
            return View(products);
        }
    }
}