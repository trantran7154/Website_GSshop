using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers
{
    public class PayController : Controller
    {
        String home = "/Display/Index";
        Data_GSShopEntities db = new Data_GSShopEntities();
        // GET: Pay
        public ActionResult Confirm()
        {
            List<ShoppingCarts> ghtt = Session["sptt"] as List<ShoppingCarts>;
            return View(ghtt);
        }
        [HttpPost]
        public ActionResult CreateBill([Bind(Include = "bill_id,bill_datecreated,seller_id,user_id,bill_address,bill_telephone,bill_sum,bill_dateset,bill_status,bill_note")] Bill bill)
        {
            if (ModelState.IsValid)
            {
                db.Bill.Add(bill);
                db.SaveChanges();
                return Redirect(home);
            }
            return View(bill);
        }
    }
}