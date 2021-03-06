﻿using System;
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
    public class ClassificationSubCategoriesController : Controller
    {
        private Data_GSShopEntities db = new Data_GSShopEntities();
        String admin_qldmc = "/Admin/ClassificationSubCategories/Index";
        // GET: Admin/ClassificationSubCategories
        public ActionResult Index()
        {
            var classificationSubCategory = db.ClassificationSubCategory.Include(c => c.SubCategory);
            return View(classificationSubCategory.Where(n => n.csc_bin == true).OrderByDescending(n=>n.csc_datecreate).ToList());
        }

        // GET: Admin/ClassificationSubCategories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClassificationSubCategory classificationSubCategory = db.ClassificationSubCategory.Find(id);
            if (classificationSubCategory == null)
            {
                return HttpNotFound();
            }
            return View(classificationSubCategory);
        }

        // GET: Admin/ClassificationSubCategories/Create
        public ActionResult Create()
        {
            ViewBag.subcategory_id = new SelectList(db.SubCategory, "subcategory_id", "subcategory_name");
            return View();
        }

        // POST: Admin/ClassificationSubCategories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create([Bind(Include = "csc_id,csc_name,csc_image,csc_datecreate,csc_active,subcategory_id,csc_bin")] ClassificationSubCategory classificationSubCategory, HttpPostedFileBase fileUpload)
        {
            Random random = new Random();
            ViewBag.random = random.Next(0, 1000);
            // Tên file ảnh sản phẩm
            var fileimg_edit = Path.GetFileName(fileUpload.FileName);
            // Đưa tên ảnh vào đúng file
            var pa_eidt = Path.Combine(Server.MapPath("~/Content/Layout/images"), ViewBag.random + fileimg_edit);
            // Ảnh trống
            if (fileUpload == null)
            {
                ViewBag.ThongBao = "Ảnh trống !";
                return View(classificationSubCategory);
            }
            //Nếu tên ảnh trùng
            else if (System.IO.File.Exists(pa_eidt))
            {
                ViewBag.ThongBao = "Ảnh đã tồn tại";
                return View(classificationSubCategory);
            }
            //Lưu pa vào name fileUpload
            else
            {
                fileUpload.SaveAs(pa_eidt);
                db.ClassificationSubCategory.Add(classificationSubCategory);
                classificationSubCategory.csc_image = ViewBag.random + fileUpload.FileName;
                classificationSubCategory.csc_datecreate = DateTime.Now;
                classificationSubCategory.csc_bin = true;
                db.SaveChanges();
                return Redirect(admin_qldmc);
            }
        }

        // GET: Admin/ClassificationSubCategories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClassificationSubCategory classificationSubCategory = db.ClassificationSubCategory.Find(id);
            if (classificationSubCategory == null)
            {
                return HttpNotFound();
            }
            ViewBag.subcategory_id = new SelectList(db.SubCategory, "subcategory_id", "subcategory_name", classificationSubCategory.subcategory_id);
            return View(classificationSubCategory);
        }

        // POST: Admin/ClassificationSubCategories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Edit([Bind(Include = "csc_id,csc_name,csc_image,csc_datecreate,csc_active,subcategory_id,csc_bin")] ClassificationSubCategory classificationSubCategory, HttpPostedFileBase img)
        {
            Random random = new Random();
            ViewBag.random = random.Next(0, 1000);

            db.Entry(classificationSubCategory).State = EntityState.Modified;
            if (img == null)
            {
                db.SaveChanges();
                return Redirect(admin_qldmc);
            }
            else
            {
                // Tên file ảnh sản phẩm
                var fileimg_edit = Path.GetFileName(img.FileName);
                // Đưa tên ảnh vào đúng file
                var pa_eidt = Path.Combine(Server.MapPath("~/Content/Layout/images"), ViewBag.random + fileimg_edit);
                // Ảnh trống
                if (img == null)
                {
                    ViewBag.ThongBao = "Ảnh trống !";
                }
                //Lưu pa vào name fileUpload
                else
                {
                    img.SaveAs(pa_eidt);
                    classificationSubCategory.csc_image = ViewBag.random + img.FileName;
                    db.SaveChanges();
                    return Redirect(admin_qldmc);
                }
                return Redirect(Request.UrlReferrer.ToString());
            }
        }

        // GET: Admin/ClassificationSubCategories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClassificationSubCategory classificationSubCategory = db.ClassificationSubCategory.Find(id);
            if (classificationSubCategory == null)
            {
                return HttpNotFound();
            }
            return View(classificationSubCategory);
        }

        // POST: Admin/ClassificationSubCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(ClassificationSubCategory classificationSubCategory)
        {
            ClassificationSubCategory csc = db.ClassificationSubCategory.Find(Int32.Parse(classificationSubCategory.csc_id.ToString()));
            csc.csc_bin = false;
            db.SaveChanges();
            return Redirect(admin_qldmc);
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
