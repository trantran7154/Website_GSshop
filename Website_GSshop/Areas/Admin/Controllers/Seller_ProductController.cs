using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Areas.Admin.Controllers
{
    public class Seller_ProductController : Controller
    {
        Data_GSShopEntities db = new Data_GSShopEntities();
        // GET: Admin/Seller_Product
        public ActionResult Index()
        {
            return View(db.Seller.ToList());
        }
        public ActionResult SellerProductDetail(int ? id)
        {
            List<Product> products = db.Product.Where(n => n.seller_id == id).ToList();
            return View(products);
        }
    }
}