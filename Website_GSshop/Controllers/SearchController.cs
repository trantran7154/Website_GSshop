using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers
{
    public class SearchController : Controller
    {
        Data_GSShopEntities db = new Data_GSShopEntities();
        [HttpPost]
        // GET: Search
        public ActionResult SearchResults(FormCollection f, int id_categories = 0)
        {
            String sKeyWord = f["txtSearch"].ToString();
            Category category = db.Category.SingleOrDefault(n => n.category_id == id_categories);
            Session["categories"] = category;
            ViewBag.KeyWord = sKeyWord;
            List<Product> TK = db.Product.Where(n => n.product_name.Contains(sKeyWord)).ToList();
            if (TK.Count == 0)
            {
                ViewBag.Notification = "Không tìm thấy kết quả nào!";
            }
            ViewBag.Notification = "Đã tìm thấy " + TK.Count + " kết quả ";
            return View(TK.OrderBy(n => n.product_name).ToList());
        }
        [HttpGet]
        public ActionResult SearchResults(String sKeyWord, int id_categories = 0)
        {
            ViewBag.KeyWord = sKeyWord;
            Category category = db.Category.SingleOrDefault(n => n.category_id == id_categories);
            Session["categories"] = category;
            List<Product> TK = db.Product.Where(n => n.product_name.Contains(sKeyWord)).ToList();
            if (TK.Count == 0)
            {
                ViewBag.Notification = "Không tìm thấy kết quả nào ";
            }
            ViewBag.Notification = "Đã tìm thấy " + TK.Count + " kết quả!";
            return View(TK.OrderBy(n => n.product_name).ToList());
        }
    }
}