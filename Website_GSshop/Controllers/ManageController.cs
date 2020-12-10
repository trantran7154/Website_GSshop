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
        // Quản lý sản phẩm của user
        public ActionResult ProductManagement()
        {
            User user = (User)Session["user"];
            ShoppingCarts sc = (ShoppingCarts)Session["sptt"];
            if (user == null)
            {
                return Redirect(login);
            }
            return View(db.PayDetail.Where(n => n.user_id == user.user_id).ToList());
        }
        // Quản lý đơn đặt hàng của user
        public ActionResult OrderManagement()
        {
            User user = (User)Session["user"];
            ShoppingCarts sc = (ShoppingCarts)Session["sptt"];
            if (user == null)
            {
                return Redirect(login);
            }
            return View(db.Bill.Where(n => n.user_id == user.user_id).ToList());
        }
        // Danh sách yêu thích của user
        public ActionResult FavouriteManagement()
        {
            User us = (User)Session["user"];
            if (us == null)
            {
                return Redirect(login);
            }
            return View(db.Favourite.Where(n => n.user_id == us.user_id && n.fa_bin == false).ToList());
        }
        // Nhận xét của user
        public ActionResult CommentManagement()
        {
            User us = (User)Session["user"];
            if (us == null)
            {
                return Redirect(login);
            }
            return View(db.Comment.Where(n => n.user_id == us.user_id && n.comment_bin == true && n.comment_spam == true).ToList());
        }
    }
}