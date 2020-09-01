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
        // Menu trang Người Bán
        public PartialViewResult MenuSeller()
        {
            return PartialView(db.Category.Where(n => n.category_active == true).OrderBy(n => n.category_name).ToList());
        }
    }
}