using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Areas.Admin.Controllers
{
    public class AccountController : Controller
    {
        // GET: Admin/Account
        String adminhome = "/Admin/Home/Index";
        Data_GSShopEntities db = new Data_GSShopEntities();
        // Đăng nhập Admin
        public ActionResult Login()
        {
            AdminData admin = (AdminData)Session["admin"];
            if (admin != null)
            {
                return Redirect(adminhome);
            }
            return View(admin);
        }
        // Đăng nhập Admin
        [HttpPost]
        public ActionResult Login(FormCollection f)
        {
            String sEmail = f["admin_email"].ToString();
            String sPassword = f["admin_pass"].ToString();
            AdminData admin = db.AdminData.Where(n => n.admin_bin == true && n.admin_role == 3 && n.admin_active == true).SingleOrDefault(n => n.admin_email == sEmail && n.admin_pass == sPassword);
            if (admin != null)
            {
                Session["admin"] = admin;
                db.AdminData.Find(admin.admin_id).admin_datecreated = DateTime.Now;
                db.AdminData.Find(admin.admin_id).admin_datelogin = DateTime.Now;
                db.AdminData.Find(admin.admin_id).admin_active = true;
                db.AdminData.Find(admin.admin_id).admin_token = Guid.NewGuid().ToString();
                return Redirect(adminhome);
            }
            else
            {
                Session["testloginadmin"] = "<div class='alert alert-danger'><b class='text-danger'><i class='fa fa-times-circle' style='color: red'>&nbsp;</i> Nhập sai tài khoản hoặc mật khẩu.</b></div>";
                return Redirect(Request.UrlReferrer.ToString());
            }
        }
    }
}