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
    public class CategoriesController : Controller
    {
        private Data_GSShopEntities db = new Data_GSShopEntities();
        String admin_qldmc = "/Admin/Categories/Index";
        // GET: Admin/Categories
        public ActionResult Index()
        {
            return View(db.Category.ToList());
        }

        // GET: Admin/Categories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Category.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // GET: Admin/Categories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Categories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "category_id,category_name,category_image,category_datecreated,category_active")] Category category, HttpPostedFileBase fileUpload)
        {
            // Tên file ảnh sản phẩm
            var fileimg = Path.GetFileName(fileUpload.FileName);
            // Đưa tên ảnh vào đúng file
            var pa = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg);
            // Ảnh trống
            if (fileUpload == null)
            {
                ViewBag.ThongBao = "Ảnh trống !";
                return View(category);
            }
            //Nếu tên ảnh trùng
            else if (System.IO.File.Exists(pa))
            {
                ViewBag.ThongBao = "Ảnh đã tồn tại";
                return View(category);
            }
            //Lưu pa vào name fileUpload
            else
            {
                fileUpload.SaveAs(pa);
                db.Category.Add(category);
                category.category_image = fileUpload.FileName;
                category.category_active = true;
                category.category_datecreated = DateTime.Now;
                db.SaveChanges();
                return Redirect(admin_qldmc);
            }
        }

        // GET: Admin/Categories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Category.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Admin/Categories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Edit([Bind(Include = "category_id,category_name,category_image,category_datecreated,category_active")] Category category, HttpPostedFileBase fileUpload)
        {
            db.Entry(category).State = EntityState.Modified;
            if (fileUpload == null)
            {
                Category categorys = db.Category.Find(Int32.Parse(category.category_id.ToString()));
                db.SaveChanges();
                return Redirect(admin_qldmc);
            }
            else
            {
                // Tên file ảnh sản phẩm
                var fileimg = Path.GetFileName(fileUpload.FileName);
                // Đưa tên ảnh vào đúng file
                var pa = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg);
                // Ảnh trống
                if (fileUpload == null)
                {
                    ViewBag.ThongBao = "Ảnh trống !";
                    return View(category);
                }
                //Nếu tên ảnh trùng
                else if (System.IO.File.Exists(pa))
                {
                    ViewBag.ThongBao = "Ảnh đã tồn tại";
                    return View(category);
                }
                //Lưu pa vào name fileUpload
                else
                {
                    fileUpload.SaveAs(pa);
                    category.category_image = fileUpload.FileName;
                    category.category_datecreated = DateTime.Now;
                    db.SaveChanges();
                    return Redirect(admin_qldmc);
                }
            }
        }

        // GET: Admin/Categories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Category.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Admin/Categories/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Category category = db.Category.Find(id);
            db.Category.Remove(category);
            db.SaveChanges();
            return RedirectToAction("Index");
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
