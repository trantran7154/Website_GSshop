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
        String login = "/Account/Login";
        Data_GSShopEntities db = new Data_GSShopEntities();
        // GET: Pay
        // Xác nhận thanh toán
        public ActionResult Confirm()
        {
            User user = (User)Session["user"];
            if (user == null)
            {
                return Redirect(login);
            }
            List<ShoppingCarts> ghtt = Session["sptt"] as List<ShoppingCarts>;
            return View(ghtt);
        }
        // Tạo và lưu hóa đơn vào csdl
        [HttpPost]
        public ActionResult CreateBill([Bind(Include = "bill_id,bill_datecreated,seller_id,user_id,bill_address,bill_telephone,bill_sum,bill_dateset,bill_status,bill_note,bill_district,bill_provincecity,bill_sale,bill_bin")] Bill bill)
        {
            db.Bill.Add(bill);
            bill.bill_datecreated = DateTime.Now;
            bill.bill_dateset = DateTime.Now;
            bill.bill_bin = true;
            db.SaveChanges();
            return RedirectToAction("PayDetail", new { id = bill.bill_id });
        }
        // Lưu bill vào csdl
        public RedirectToRouteResult PayDetail(int id)
        {
            List<ShoppingCarts> ghtt = Session["sptt"] as List<ShoppingCarts>;
            User user = (User)Session["user"];
            foreach (var item in ghtt)
            {
                PayDetail dh = new PayDetail();
                dh.bill_id = id;
                dh.product_id = item.product_id;
                dh.user_id = user.user_id;
                dh.pay_amount = item.pay_amount;
                dh.pay_money = item.pay_money;
                dh.pay_datecreated = DateTime.Now;
                db.PayDetail.Add(dh);
            }
            db.SaveChanges();
            Session["sptt"] = null;
            return RedirectToAction("Index","Display");
        }
    }
}