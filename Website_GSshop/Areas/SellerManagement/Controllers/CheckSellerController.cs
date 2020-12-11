using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Website_GSshop.Areas.SellerManagement.Controllers
{
    public class CheckSellerController : Controller
    {
        // GET: SellerManagement/Check
        public PartialViewResult FormValidation()
        {
            return PartialView();
        }
    }
}