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
        public ActionResult MostPopularDetail()
        {
            return View(db.Product.ToList());
        }
        public ActionResult CollectionsDetail()
        {
            return View(db.Product.ToList());
        }
        public ActionResult FlashSaleDetail()
        {
            return View(db.Product.ToList());
        }
        public ActionResult CategoriesDetail()
        {
            return View(db.Product.Where(n => n.product_active == true).OrderByDescending(n => n.product_datecreated).Take(36).ToList());
        }
    }
}