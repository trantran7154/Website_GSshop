﻿using System;
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
            return View(db.Product.Where(n => n.product_active == true).Take(40).ToList());
        }
        // Xem chi tiếêt sản phẩm của các bộ sưu tập
        public ActionResult CollectionsDetail()
        {
            return View(db.Product.ToList());
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
            }

            Session["product"] = id;
            db.Product.Find(id).product_view++;
            db.SaveChanges();
            return View(product);
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
        // Xem chi tiết danh mục
        public ActionResult CategoriesDetail(int id_categories = 0)
        {
            Category category = db.Category.SingleOrDefault(n => n.category_id == id_categories);
            Session["categories"] = category;
            return View(db.Product.Where(n => n.category_id == id_categories).OrderByDescending(n => n.product_datecreated).ToList());
        }
        //Phân loại sản phẩm theo danh mục
        public ActionResult ProductCategoriesList(int? id)
        {
            List<Product> products = db.Product.Where(n => n.banner_id == id).ToList();
            return View(products);
        }
    }
}