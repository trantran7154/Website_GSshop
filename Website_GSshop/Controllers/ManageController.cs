using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers
{
    public class ManageController : Controller
    {
        // GET: Manage
        Data_GSShopEntities db = new Data_GSShopEntities();
        String login = "/Account/Login";
        // Quản lý đơn hàng của user
        public ActionResult OrderManagement()
        {
            User user = (User)Session["user"];
            ShoppingCarts sc = (ShoppingCarts)Session["sptt"];
            if (user == null)
            {
                return Redirect(login);
            }
            return View(db.PayDetail.Where(n => n.user_id == user.user_id).ToList()); ;
        }
    }
}