using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Website_GSshop.Controllers
{
    public class PayController : Controller
    {
        // GET: Pay
        [HttpPost]
        public ActionResult ShoppingCart(FormCollection f)
        {
            return View();
        }
    }
}