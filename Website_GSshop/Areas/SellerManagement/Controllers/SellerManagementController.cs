using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Website_GSshop.Areas.SellerManagement.Controllers
{
    public class SellerManagementController : Controller
    {
        // GET: SellerManagement/SellerManagement
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult CSS_Sematic()
        {
            return PartialView();
        }
    }
}