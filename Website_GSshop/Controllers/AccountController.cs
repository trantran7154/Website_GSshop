﻿using System;
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
            User user = (User)Session["user"];
            if(user != null)
            {
                return Redirect("/Display/Index");
            }    
            return View();
        }       
        // Đăng nhập người dùng
        [HttpPost]
        public ActionResult Login(FormCollection f)
        {
            String sEmail = f["user_email"].ToString();
            String sPassword = f["user_pass"].ToString();
            User user = db.User.Where(n => n.user_active == true && n.user_role == 1).SingleOrDefault(n => n.user_email == sEmail && n.user_pass == sPassword);
            if (user != null)
            {
                Session["user"] = user;
                db.User.Find(user.user_id).user_datelogin = DateTime.Now;
                db.User.Find(user.user_id).user_token = Guid.NewGuid().ToString();
                return Redirect("/Display/Index");
            }               
            else
            {
                Session["testlogin"] = "<div class='alert alert-danger'><b class='text-danger'><i class='fa fa-times-circle' style='color: red'>&nbsp;</i> Bạn sai tài khoản và mật khẩu.</b></div>";
                return Redirect(Request.UrlReferrer.ToString());
            }
        }
        // Đăng xuất người dùng và người bán
        public ActionResult LogOut()
        {
            Session["user"] = null;
            return Redirect("/Display/Index");
        }
        // Đăng ký người dùng
        [HttpPost]
        public ActionResult SignUp([Bind(Include = "user_id,user_login,user_pass,user_nicename,user_email,user_datecreated,user_token,user_role,user_datelogin,user_active,user_address,user_telephone,user_fristname,user_lastname,user_image,user_sex,user_birthday")] User user, FormCollection f)
        {
            String Email = f["user_email"].ToString();
            User user_email = db.User.SingleOrDefault(n => n.user_email == Email);
            if (user_email != null)
            {
                Session["testsignup"] = "<div class='alert alert-danger'><b class='text-danger'><i class='fa fa-times-circle' style='color: red'>&nbsp;</i> Tài khoản đã tồn tại.</b></div>";
                return Redirect(Request.UrlReferrer.ToString());
            }
            else if (ModelState.IsValid)
            {
                Session["user"] = user;
                user.user_datecreated = DateTime.Now;
                user.user_token = Guid.NewGuid().ToString();
                user.user_role = 1;
                user.user_datelogin = DateTime.Now;
                user.user_active = true;
                db.User.Add(user);
                db.SaveChanges();
                return Redirect("/Display/Index");
            }
            return View(user);
        }
        // Cập nhật thông tin cá nhân
        public PartialViewResult UpdateInfo()
        {
            return PartialView();
        }
        // Quên mật khẩu người dùng   
        
        // Đăng nhập người bán
        public ActionResult LoginSeller()
        {
            User user = (User)Session["user"];
            if (user != null)
            {
                return Redirect("/Display/Index");
            }
            return View();
        }
        [HttpPost]
        public ActionResult LoginSeller(FormCollection f)
        {
            String sEmail = f["seller_email"].ToString();
            String sPass = f["seller_pass"].ToString();
            User user = db.User.Where(n => n.user_active == true && n.user_role == 2).SingleOrDefault(n => n.user_email == sEmail && n.user_pass == sPass);
            if(user != null)
            {
                Session["user"] = user;
                db.User.Find(user.user_id).user_datelogin = DateTime.Now;
                db.User.Find(user.user_id).user_token = Guid.NewGuid().ToString();
                return Redirect("/Display/Index");
            }
            else
            {
                Session["testsellerlogin"] = "<div class='alert alert-danger'><b class='text-danger'><i class='fa fa-times-circle' style='color: red'>&nbsp;</i> Bạn sai tài khoản và mật khẩu.</b></div>";
                return Redirect(Request.UrlReferrer.ToString());
            }
        }
        // Đăng ký người bán
        [HttpPost]
        public ActionResult SignUpSeller([Bind(Include = "user_id,user_login,user_pass,user_nicename,user_email,user_datecreated,user_token,user_role,user_datelogin,user_active,user_address,user_telephone,user_fristname,user_lastname,user_image,user_sex,user_birthday")] User user)
        {
            if (ModelState.IsValid)
            {
                db.User.Add(user);
                db.SaveChanges();
                return Redirect("/Display/Index");
            }
            return View(user);
        }
    }
}