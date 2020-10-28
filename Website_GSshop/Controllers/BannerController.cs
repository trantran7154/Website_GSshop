using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers
{
    public class BannerController : Controller
    {
        Data_GSShopEntities db = new Data_GSShopEntities();
        // GET: Banner
        public PartialViewResult Banner()
        {
            return PartialView(db.Banner.Where(n => n.banner_active == true).ToList());
        }
        // Quảng cáo
        public ActionResult Advertise()
        {
            return View();
        }
    }
}