using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers
{
    public class AccountController : Controller
    {
        Data_GSShopEntities db = new Data_GSShopEntities();
        // GET: Login
        public ActionResult Login()
        {
            User us = (User)Session["ac"];
            if(us != null)
            {
                return Redirect("/Display/Index");
            }    
            return View();
        }
        // Đăng nhập người dùng
        [HttpPost]
        public ActionResult Login(FormCollection f)
        {
            String sUserLogin = f["name"].ToString();
            String sPassword = f["pass"].ToString();
            User us = db.User.SingleOrDefault(n => n.user_login == sUserLogin && n.user_pass == sPassword);
            if (us != null)
            {
                Session["ac"] = us;
                return Redirect("/Display/Index");
            }
            else if (sUserLogin == "")
            {
                ViewBag.Login = "Vui lòng nhập tài khoản !";
            }
            else if (sPassword == "")
            {
                ViewBag.Pass = "Vui lòng nhập mật khẩu !";
            }      
            else
            {
                ViewBag.UP = "<div class='alert alert-danger text-center'>Sai tài khoản hoặc mật khẩu !</div>";
            }
            return View();
        }
        // Đăng xuất người dùng
        public ActionResult LogOut()
        {
            Session["ac"] = null;
            return Redirect("/Display/Index");
        }
    }
}