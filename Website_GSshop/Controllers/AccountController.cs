using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers
{
    public class AccountController : Controller
    {
        String home = "/Display/Index";
        String login = "/Account/Login";
        String loginseller = "/Account/LoginSeller";
        String update = "/Account/UpdateInfo";
        String updateseller = "/Account/UpdateInfoSeller";
        String manage = "/SellerManagement/SellerManagement/Index";
        String infouser = "/Account/Info";
        Data_GSShopEntities db = new Data_GSShopEntities();
        // GET: Login
        public ActionResult Login()
        {
            User user = (User)Session["user"];
            if(user != null)
            {
                return Redirect(home);
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
                return Redirect(home);
            }    
            else
            {
                Session["testlogin"] = "<div class='alert alert-danger'><b class='text-danger'><i class='fa fa-times-circle' style='color: red'>&nbsp;</i> Nhập sai tài khoản hoặc mật khẩu.</b></div>";
                return Redirect(Request.UrlReferrer.ToString());
            }
        }
        // Đăng xuất người dùng
        public ActionResult LogOut()
        {
            Session["user"] = null;
            return Redirect(home);
        }
        // Đăng ký người dùng
        [HttpPost]
        public ActionResult SignUp([Bind(Include = "user_id,user_pass,user_nicename,user_email,user_datecreated,user_token,user_role,user_datelogin,user_active,user_address,user_telephone,user_image,user_provincecity,user_district,user_bin,user_role")] User user, FormCollection f)
        {
            User user_email = db.User.SingleOrDefault(n => n.user_email == user.user_email);
            if (user_email != null)
            {
                Session["testsignup"] = "<div class='alert alert-danger'><b class='text-danger'><i class='fa fa-times-circle' style='color: red'>&nbsp;</i> Tài khoản đã tồn tại.</b></div>";
                return Redirect(Request.UrlReferrer.ToString());
            }
            else
            {
                Session["user"] = user;
                user.user_datecreated = DateTime.Now;
                user.user_token = Guid.NewGuid().ToString();
                user.user_role = 1;
                user.user_datelogin = DateTime.Now;
                user.user_active = true;
                user.user_bin = true;
                db.User.Add(user);
                db.SaveChanges();
                return Redirect(update);
            }
        }
        // Cập nhật thông tin cá nhân
        public PartialViewResult UpdateInfo()
        {
            User user = (User)Session["user"];
            if (user == null)
            {
                Response.Redirect(login);
            }
            return PartialView();
        }       
        [HttpPost]
        public ActionResult UpdateInfo(FormCollection f)
        {
            User user = (User)Session["user"];
            User usernew = db.User.SingleOrDefault(n => n.user_id == user.user_id);
            String sImage = f["user_image"].ToString();
            String sNicname = f["user_nicename"].ToString();
            String sTelephone = f["user_telephone"].ToString();
            String sAddress = f["user_address"].ToString();
            String sProvinceCity = f["user_provincecity"].ToString();
            String sDistrict = f["user_district"].ToString();
            db.User.Find(user.user_id).user_image = sImage;
            db.User.Find(user.user_id).user_nicename = sNicname;
            db.User.Find(user.user_id).user_address = sAddress;
            db.User.Find(user.user_id).user_telephone = sTelephone;
            db.User.Find(user.user_id).user_address = sAddress;
            db.User.Find(user.user_id).user_provincecity = sProvinceCity;
            db.User.Find(user.user_id).user_district = sDistrict;
            Session["user"] = usernew;
            db.SaveChanges();
            return Redirect(home);
        }
        // Thông tin cá nhân
        public ActionResult Info()
        {
            User user = (User)Session["user"];
            if (user == null)
            {
                Response.Redirect(login);
            }
            return View(user);
        }
        // Sửa thông tin cá nhân user phần info
        [HttpPost]
        public ActionResult UpdateInfoUser(FormCollection f)
        {
            User user = (User)Session["user"];
            User usernew = db.User.SingleOrDefault(n => n.user_id == user.user_id);
            String sNicname = f["user_nicename"].ToString();
            String sEmail = f["user_email"].ToString();
            db.User.Find(user.user_id).user_nicename = sNicname;
            db.User.Find(user.user_id).user_email = sEmail;
            Session["user"] = usernew;
            db.SaveChanges();
            return Redirect(infouser);
        }
        // Thêm thông tin cá nhân user phần info
        [HttpPost]
        public ActionResult CreateInfoUser(FormCollection f)
        {
            User user = (User)Session["user"];
            User usernew = db.User.SingleOrDefault(n => n.user_id == user.user_id);
            String sAddress = f["user_address"].ToString();
            String sDis = f["user_district"].ToString();
            String sPro = f["user_provincecity"].ToString();
            db.User.Find(user.user_id).user_address = sAddress;
            db.User.Find(user.user_id).user_district = sDis;
            db.User.Find(user.user_id).user_provincecity = sPro;
            Session["user"] = usernew;
            db.SaveChanges();
            return Redirect(infouser);
        }
        // Quên mật khẩu người dùng   

        // Đăng nhập người bán
        public ActionResult LoginSeller()
        {
            Seller seller = (Seller)Session["seller"];
            if (seller != null)
            {
                return Redirect(home);
            }
            return View();
        }
        // Đăng xuất người dùng
        public ActionResult LogOutSeller()
        {
            Session["seller"] = null;
            return Redirect(home);
        }
        [HttpPost]
        public ActionResult LoginSeller(FormCollection f)
        {
            String sEmail = f["seller_email"].ToString();
            String sPass = f["seller_pass"].ToString();
            Seller seller = db.Seller.Where(n => n.seller_active == true && n.seller_role == 2).SingleOrDefault(n => n.seller_email == sEmail && n.seller_pass == sPass);
            if(seller != null)
            {
                Session["seller"] = seller;
                db.Seller.Find(seller.seller_id).seller_datecreated = DateTime.Now;
                db.Seller.Find(seller.seller_id).seller_token = Guid.NewGuid().ToString();
                return Redirect(manage);
            }
            else
            {
                Session["testsellerlogin"] = "<div class='alert alert-danger'><b class='text-danger'><i class='fa fa-times-circle' style='color: red'>&nbsp;</i> Nhập sai tài khoản hoặc mật khẩu.</b></div>";
                return Redirect(Request.UrlReferrer.ToString());
            }
        }
        // Đăng ký người bán
        [HttpPost]
        public ActionResult SignUpSeller([Bind(Include = "seller_id,seller_login,seller_pass,seller_email,seller_telephone,seller_token,seller_slider1,seller_slider2,seller_slider3,seller_link1,seller_link2,seller_link3,seller_logo,seller_active,seller_nameshop,seller_datecreated,seller_address,seller_datelogin,seller_detail,seller_description,seller_role,seller_nicename,seller_provincecity,seller_district")] Seller seller)
        {
            Seller seller_email = db.Seller.SingleOrDefault(n => n.seller_email == seller.seller_email);
            if (seller_email != null)
            {
                Session["testsignup"] = "<div class='alert alert-danger'><b class='text-danger'><i class='fa fa-times-circle' style='color: red'>&nbsp;</i> Tài khoản đã tồn tại.</b></div>";
                return Redirect(Request.UrlReferrer.ToString());
            }
            else
            {
                Session["seller"] = seller;
                seller.seller_token = Guid.NewGuid().ToString();
                seller.seller_active = true;
                seller.seller_datecreated = DateTime.Now;
                seller.seller_datelogin = DateTime.Now;
                seller.seller_role = 2;
                db.Seller.Add(seller);
                db.SaveChanges();
                return Redirect(updateseller);
            }
        }
        // Cập nhật thông tin Seller
        public PartialViewResult UpdateInfoSeller()
        {
            Seller seller = (Seller)Session["seller"];
            if (seller == null)
            {
                Response.Redirect(loginseller);
            }
            return PartialView();
        }
        [HttpPost]
        public ActionResult UpdateInfoSeller(FormCollection f)
        {
            Seller seller = (Seller)Session["seller"];
            Seller sellernew = db.Seller.SingleOrDefault(n => n.seller_id == seller.seller_id);
            String sLogo = f["seller_logo"].ToString();
            String sNicname = f["seller_nicename"].ToString();
            String sTelephone = f["seller_telephone"].ToString();
            String sAddress = f["seller_address"].ToString();
            String sProvinceCity = f["seller_provincecity"].ToString();
            String sDistrict = f["seller_district"].ToString();
            String sNameshop = f["seller_nameshop"].ToString();
            db.Seller.Find(seller.seller_id).seller_logo = sLogo;
            db.Seller.Find(seller.seller_id).seller_nicename = sNicname;
            db.Seller.Find(seller.seller_id).seller_address = sAddress;
            db.Seller.Find(seller.seller_id).seller_telephone = sTelephone;
            db.Seller.Find(seller.seller_id).seller_address = sAddress;
            db.Seller.Find(seller.seller_id).seller_provincecity = sProvinceCity;
            db.Seller.Find(seller.seller_id).seller_district = sDistrict;
            db.Seller.Find(seller.seller_id).seller_nameshop = sNameshop;
            Session["seller"] = sellernew;
            db.SaveChanges();
            return Redirect(home);
        }
        // Thay đổi mật khẩu User
        [HttpPost]
        public ActionResult ChangePassWordUser(FormCollection f)
        {
            User user = (User)Session["user"];
            var id = user.user_id;
            String pass_old = f["passold"].ToString();
            String user_pass = f["userpass"].ToString();
            String pass_repeat = f["passrepeat"].ToString();
            db.User.Find(id).user_pass = user_pass;
            db.SaveChanges();
            Session["user"] = db.User.Find(id);
            return Redirect(Request.UrlReferrer.ToString());
        }
        // Quên mật khẩu User
        public ActionResult SendEmail()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SendEmail(ForgotPassword fp)
        {
            try
            {
                // Máy chủ gmail
                WebMail.SmtpServer = "smtp.gmail.com";
                // Cổng
                WebMail.SmtpPort = 587;
                WebMail.SmtpUseDefaultCredentials = true;
                //Gửi gmail với giao thức bảo mật
                WebMail.EnableSsl = true;
                //Tài khoản dùng để đăng nhập vào gmail để gửi
                WebMail.UserName = "vuongbaot1905@gmail.com";
                WebMail.Password = "tran1905";
                // Nội dung gửi
                WebMail.From = "vuongbaot1905@gmail.com";
                User user = db.User.SingleOrDefault(n => n.user_email == fp.ConfirmationEmail);
                fp.Theme = "Xác nhận mật khẩu Web";
                fp.Content = "Xác Nhận: https://localhost:44311/Account/ChangePassword/" + user.user_id + "&Token=" + user.user_token;
                //Gửi gmail
                WebMail.Send(to: fp.ConfirmationEmail, subject: fp.Theme, body: fp.Content, cc: fp.Cc, bcc: fp.Bcc, isBodyHtml: true);
                ViewBag.Sucess = "Gửi thành công! Vui lòng kiểm tra email/gmail.";
            }
            catch (Exception)
            {
                ViewBag.Fail = "Gửi gmail thất bại! Vui lòng thử lại.";
            }
            return View();
        }
        public ActionResult ChangePassword()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword(String pnew, String pconfirm, int? id)
        {
            if (pnew != pconfirm)
            {
                ViewBag.thong = "Sai mật khẩu nhập lại";
                return View();
            }
            else
            {
                db.User.Find(id).user_pass = pnew;
                db.User.Find(id).user_token = Guid.NewGuid().ToString();
                db.SaveChanges();
                return Redirect(login);
            }
        }
    }
}