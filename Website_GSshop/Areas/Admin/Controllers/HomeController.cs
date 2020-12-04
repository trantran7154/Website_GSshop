using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        String loginadmin = "/Admin/Account/Login";
        // GET: Admin/Home
        Data_GSShopEntities db = new Data_GSShopEntities();
        public ActionResult Index()
        {
            AdminData admin = (AdminData)Session["admin"];
            if (admin == null)
            {
                return Redirect(loginadmin);
            }
            return View();
        }
        public PartialViewResult CSS_Sematic()
        {
            return PartialView();
        }
    }
}