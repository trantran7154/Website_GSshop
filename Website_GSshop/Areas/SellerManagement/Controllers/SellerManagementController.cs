using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Areas.SellerManagement.Controllers
{
    public class SellerManagementController : Controller
    {
        String sellerlogin = "/Account/LoginSeller";
        Data_GSShopEntities db = new Data_GSShopEntities();
        // GET: SellerManagement/SellerManagement
        public ActionResult Index()
        {
            Seller seller = (Seller)Session["seller"];
            if(seller == null)
            {
                return Redirect(sellerlogin);
            }
            return View();
        }
        public PartialViewResult CSS_Sematic()
        {
            return PartialView();
        }
    }
}