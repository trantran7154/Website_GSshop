using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Areas.SellerManagement.Controllers
{
    public class SellerManagementController : Controller
    {
        String loginseller = "/Account/LoginSeller";
        Data_GSShopEntities db = new Data_GSShopEntities();
        // GET: SellerManagement/SellerManagement
        public ActionResult Index()
        {
            Seller seller = (Seller)Session["seller"];
            if(seller == null)
            {
                return Redirect(loginseller);
            }
            return View();
        }
        public PartialViewResult CSS_Sematic()
        {
            return PartialView();
        }
        // Form show đăng nhập
        public PartialViewResult Form()
        {
            Seller seller = (Seller)Session["seller"];
            if (seller == null)
            {
                Response.Redirect(loginseller);
            }
            return PartialView();
        }
        // Đăng xuất người bán
        public ActionResult LogOutSeller()
        {
            Session["seller"] = null;
            return Redirect(Request.UrlReferrer.ToString());
        }
        // Thông tin cá nhân Seller
        public ActionResult InfoSeller()
        {
            Seller seller = (Seller)Session["seller"];
            if (seller == null)
            {
                Response.Redirect(loginseller);
            }
            return View(seller);
        }
        // Cập nhật thông tin Seller
        [HttpPost]
        public ActionResult UpdateInfoSeller(FormCollection f)
        {
            Seller seller = (Seller)Session["seller"];
            if (seller == null)
            {
                Response.Redirect(loginseller);
            }
            Seller sellernew = db.Seller.SingleOrDefault(n => n.seller_id == seller.seller_id);
            String sNicname = f["seller_nicename"].ToString();
            String sEmail = f["seller_email"].ToString();
            String sNameshop = f["seller_nameshop"].ToString();
            db.Seller.Find(seller.seller_id).seller_nicename = sNicname;
            db.Seller.Find(seller.seller_id).seller_email = sEmail;
            db.Seller.Find(seller.seller_id).seller_nameshop = sNameshop;
            Session["seller"] = sellernew;
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }
        // Thêm thông tin cá nhân Seller phần info
        [HttpPost]
        public ActionResult CreateInfoSeller(FormCollection f)
        {
            Seller seller = (Seller)Session["seller"];
            if (seller == null)
            {
                Response.Redirect(loginseller);
            }
            Seller sellernew = db.Seller.SingleOrDefault(n => n.seller_id == seller.seller_id);
            String sAddress = f["seller_address"].ToString();
            String sDis = f["seller_district"].ToString();
            String sPro = f["seller_provincecity"].ToString();
            db.Seller.Find(seller.seller_id).seller_address = sAddress;
            db.Seller.Find(seller.seller_id).seller_district = sDis;
            db.Seller.Find(seller.seller_id).seller_provincecity = sPro;
            Session["user"] = sellernew;
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }
        // Thay đổi mật khẩu Seller
        [HttpPost]
        public ActionResult ChangePassWordSeller(FormCollection f)
        {
            Seller seller = (Seller)Session["seller"];
            if (seller == null)
            {
                Response.Redirect(loginseller);
            }
            var id = seller.seller_id;
            String pass_old = f["pass_old"].ToString();
            String seller_pass = f["seller_pass"].ToString();
            String pass_repeat = f["pass_repeat"].ToString();
            db.Seller.Find(id).seller_pass = seller_pass;
            db.SaveChanges();
            Session["seller"] = db.Seller.Find(id);
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}