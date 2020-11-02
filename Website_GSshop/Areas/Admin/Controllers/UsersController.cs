using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Areas.Admin.Controllers
{
    public class UsersController : Controller
    {
        private Data_GSShopEntities db = new Data_GSShopEntities();
        String admin_qlu = "/Admin/Users/Index";
        // GET: Admin/Users
        public ActionResult Index()
        {
            return View(db.User.Where(n => n.user_bin == true).ToList());
        }

        // GET: Admin/Users/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.User.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // GET: Admin/Users/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Users/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create([Bind(Include = "user_id,user_pass,user_nicename,user_email,user_datecreated,user_token,user_role,user_datelogin,user_active,user_address,user_telephone,user_image,user_sex,user_provincecity,user_district,user_bin")] User user, HttpPostedFileBase fileUpload)
        {
            // Tên file ảnh sản phẩm
            var fileimg_edit = Path.GetFileName(fileUpload.FileName);
            // Đưa tên ảnh vào đúng file
            var pa_eidt = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit);
            // Ảnh trống
            if (fileUpload == null)
            {
                ViewBag.ThongBao = "Ảnh trống !";
                return View(user);
            }
            //Nếu tên ảnh trùng
            else if (System.IO.File.Exists(pa_eidt))
            {
                ViewBag.ThongBao = "Ảnh đã tồn tại";
                return View(user);
            }
            //Lưu pa vào name fileUpload
            else
            {
                fileUpload.SaveAs(pa_eidt);
                db.User.Add(user);
                user.user_image = fileUpload.FileName;
                user.user_datecreated = DateTime.Now;
                user.user_token = Guid.NewGuid().ToString();
                user.user_role = 1;
                user.user_datelogin = DateTime.Now;
                user.user_active = true;
                user.user_bin = true;
                db.SaveChanges();
                return Redirect(admin_qlu);
            }
        }

        // GET: Admin/Users/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.User.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: Admin/Users/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Edit([Bind(Include = "user_id,user_pass,user_nicename,user_email,user_datecreated,user_token,user_role,user_datelogin,user_active,user_address,user_telephone,user_image,user_sex,user_provincecity,user_district,user_bin")] User user, HttpPostedFileBase fileUpload)
        {
            db.Entry(user).State = EntityState.Modified;
            if (fileUpload == null)
            {
                User users = db.User.Find(Int32.Parse(user.user_id.ToString()));
                db.SaveChanges();
                return Redirect(admin_qlu);
            }
            else
            {
                // Tên file ảnh sản phẩm
                var fileimg_edit = Path.GetFileName(fileUpload.FileName);
                // Đưa tên ảnh vào đúng file
                var pa_eidt = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit);
                // Ảnh trống
                if (fileUpload == null)
                {
                    ViewBag.ThongBao = "Ảnh trống !";
                    return View(user);
                }
                //Nếu tên ảnh trùng
                else if (System.IO.File.Exists(pa_eidt))
                {
                    ViewBag.ThongBao = "Ảnh đã tồn tại";
                    return View(user);
                }
                //Lưu pa vào name fileUpload
                else
                {
                    fileUpload.SaveAs(pa_eidt);
                    user.user_image = fileUpload.FileName;
                    user.user_datecreated = DateTime.Now;
                    user.user_token = Guid.NewGuid().ToString();
                    user.user_role = 1;
                    user.user_datelogin = DateTime.Now;
                    db.SaveChanges();
                    return Redirect(admin_qlu);
                }
            }
        }

        // GET: Admin/Users/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.User.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: Admin/Users/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(User user)
        {
            User us = db.User.Find(Int32.Parse(user.user_id.ToString()));
            us.user_active = false;
            us.user_bin = false;
            db.SaveChanges();
            return Redirect(admin_qlu);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
