
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Website_GSshop.Areas.Admin.Controllers
{
    public class CheckController : Controller
    {
        // GET: Admin/Check
        public PartialViewResult FormValidation()
        {
            return PartialView();
        }
    }
}