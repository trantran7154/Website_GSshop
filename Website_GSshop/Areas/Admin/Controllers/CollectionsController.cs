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
    public class CollectionsController : Controller
    {
        private Data_GSShopEntities db = new Data_GSShopEntities();
        String admin_qlbst = "/Admin/Collections/Index";
        // GET: Admin/Collections
        public ActionResult Index()
        {
            var collection = db.Collection.Include(c => c.Product);
            return View(collection.ToList());
        }

        // GET: Admin/Collections/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Collection collection = db.Collection.Find(id);
            if (collection == null)
            {
                return HttpNotFound();
            }
            return View(collection);
        }

        // GET: Admin/Collections/Create
        public ActionResult Create()
        {
            ViewBag.product_id = new SelectList(db.Product, "product_id", "product_name");
            return View();
        }

        // POST: Admin/Collections/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create([Bind(Include = "collection_id,collection_name,collection_image1,collection_image2,collection_image3,product_id,collection_datecreate,collection_active")] Collection collection, HttpPostedFileBase fileUpload1, HttpPostedFileBase fileUpload2, HttpPostedFileBase fileUpload3)
        {
            // Tên file ảnh sản phẩm
            var fileimg_edit1 = Path.GetFileName(fileUpload1.FileName);
            var fileimg_edit2 = Path.GetFileName(fileUpload2.FileName);
            var fileimg_edit3 = Path.GetFileName(fileUpload3.FileName);
            // Đưa tên ảnh vào đúng file
            var pa_eidt1 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit1);
            var pa_eidt2 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit2);
            var pa_eidt3 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit3);
            // Ảnh trống
            if (fileUpload1 == null)
            {
                ViewBag.ThongBao = "Ảnh 1 trống !";
                return View(collection);
            }
            else if (fileUpload2 == null)
            {
                ViewBag.ThongBao = "Ảnh 2 trống !";
                return View(collection);
            }
            else if (fileUpload3 == null)
            {
                ViewBag.ThongBao = "Ảnh 3 trống !";
                return View(collection);
            }
            //Nếu tên ảnh trùng
            else if (System.IO.File.Exists(pa_eidt1))
            {
                ViewBag.ThongBao = "Ảnh 1 đã tồn tại";
                return View(collection);
            }
            else if (System.IO.File.Exists(pa_eidt2))
            {
                ViewBag.ThongBao = "Ảnh 2 đã tồn tại";
                return View(collection);
            }
            else if (System.IO.File.Exists(pa_eidt3))
            {
                ViewBag.ThongBao = "Ảnh 3 đã tồn tại";
                return View(collection);
            }
            //Lưu pa vào name fileUpload
            else
            {
                fileUpload1.SaveAs(pa_eidt1);
                fileUpload2.SaveAs(pa_eidt2);
                fileUpload3.SaveAs(pa_eidt3);
                db.Collection.Add(collection);
                collection.collection_image1 = fileUpload1.FileName;
                collection.collection_image2 = fileUpload2.FileName;
                collection.collection_image3 = fileUpload3.FileName;
                collection.collection_datecreate = DateTime.Now;
                collection.collection_active = true;
                db.SaveChanges();
                return Redirect(admin_qlbst);
            }
        }

        // GET: Admin/Collections/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Collection collection = db.Collection.Find(id);
            if (collection == null)
            {
                return HttpNotFound();
            }
            return View(collection);
        }

        // POST: Admin/Collections/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Edit([Bind(Include = "collection_id,collection_name,collection_image1,collection_image2,collection_image3,product_id,collection_datecreate,collection_active")] Collection collection, HttpPostedFileBase collection_image1a, HttpPostedFileBase collection_image2a, HttpPostedFileBase collection_image3a)
        {
            db.Entry(collection).State = EntityState.Modified;
            //Kiểm tra 1 một trong 3 ảnh bị trống
            if(collection_image1a == null || collection_image2a == null || collection_image3a == null) 
            {
                Collection col = db.Collection.Find(Int32.Parse(collection.collection_id.ToString()));
                db.SaveChanges();
                return Redirect(admin_qlbst);
            }
            //Cả 3 ảnh đều trống
            else if(collection_image1a == null && collection_image2a == null && collection_image3a == null)
            {
                Collection col = db.Collection.Find(Int32.Parse(collection.collection_id.ToString()));
                db.SaveChanges();
                return Redirect(admin_qlbst);
            }
            //Thay đổi ảnh 1
            else if (collection_image1a == null && collection_image2a != null && collection_image3a != null)
            {
                // Tên file ảnh sản phẩm
                var fileimg_edit1 = Path.GetFileName(collection_image1a.FileName);
                // Đưa tên ảnh vào đúng file
                var pa_eidt1 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit1);
                // Ảnh trống
                if (collection_image1a == null)
                {
                    ViewBag.ThongBao = "Ảnh 1 trống !";
                    return View(collection);
                }
                //Nếu tên ảnh trùng
                else if (System.IO.File.Exists(pa_eidt1))
                {
                    ViewBag.ThongBao = "Ảnh 1 đã tồn tại";
                    return View(collection);
                }
                //Lưu pa vào name fileUpload
                else
                {
                    collection_image1a.SaveAs(pa_eidt1);

                    collection.collection_image1 = collection_image1a.FileName;
                    db.SaveChanges();
                    return Redirect(admin_qlbst);
                }
            }
            //Thay đổi ảnh 2
            else if (collection_image1a != null && collection_image2a == null && collection_image3a != null)
            {
                // Tên file ảnh sản phẩm
                var fileimg_edit2 = Path.GetFileName(collection_image2a.FileName);
                // Đưa tên ảnh vào đúng file
                var pa_eidt2 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit2);
                // Ảnh trống
                if (collection_image2a == null)
                {
                    ViewBag.ThongBao = "Ảnh 2 trống !";
                    return View(collection);
                }
                //Nếu tên ảnh trùng
                else if (System.IO.File.Exists(pa_eidt2))
                {
                    ViewBag.ThongBao = "Ảnh 2 đã tồn tại";
                    return View(collection);
                }
                //Lưu pa vào name fileUpload
                else
                {
                    collection_image2a.SaveAs(pa_eidt2);

                    collection.collection_image2 = collection_image2a.FileName;
                    db.SaveChanges();
                    return Redirect(admin_qlbst);
                }
            }
            //Thay đổi ảnh 3
            else if (collection_image1a != null && collection_image2a != null && collection_image3a == null)
            {
                // Tên file ảnh sản phẩm
                var fileimg_edit3 = Path.GetFileName(collection_image1a.FileName);
                // Đưa tên ảnh vào đúng file
                var pa_eidt3 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit3);
                // Ảnh trống
                if (collection_image3a == null)
                {
                    ViewBag.ThongBao = "Ảnh 3 trống !";
                    return View(collection);
                }
                //Nếu tên ảnh trùng
                else if (System.IO.File.Exists(pa_eidt3))
                {
                    ViewBag.ThongBao = "Ảnh 3 đã tồn tại";
                    return View(collection);
                }
                //Lưu pa vào name fileUpload
                else
                {
                    collection_image1a.SaveAs(pa_eidt3);

                    collection.collection_image1 = collection_image1a.FileName;
                    db.SaveChanges();
                    return Redirect(admin_qlbst);
                }
            }
            //Ảnh không trống
            else
            {
                // Tên file ảnh sản phẩm
                var fileimg_edit1 = Path.GetFileName(collection_image1a.FileName);
                var fileimg_edit2 = Path.GetFileName(collection_image2a.FileName);
                var fileimg_edit3 = Path.GetFileName(collection_image3a.FileName);
                // Đưa tên ảnh vào đúng file
                var pa_eidt1 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit1);
                var pa_eidt2 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit2);
                var pa_eidt3 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit3);
                // Ảnh trống
                if (collection_image1a == null)
                {
                    ViewBag.ThongBao = "Ảnh 1 trống !";
                    return View(collection);
                }
                else if (collection_image2a == null)
                {
                    ViewBag.ThongBao = "Ảnh 2 trống !";
                    return View(collection);
                }
                else if (collection_image3a == null)
                {
                    ViewBag.ThongBao = "Ảnh 3 trống !";
                    return View(collection);
                }
                //Nếu tên ảnh trùng
                else if (System.IO.File.Exists(pa_eidt1))
                {
                    ViewBag.ThongBao = "Ảnh 1 đã tồn tại";
                    return View(collection);
                }
                else if (System.IO.File.Exists(pa_eidt2))
                {
                    ViewBag.ThongBao = "Ảnh 2 đã tồn tại";
                    return View(collection);
                }
                else if (System.IO.File.Exists(pa_eidt3))
                {
                    ViewBag.ThongBao = "Ảnh 3 đã tồn tại";
                    return View(collection);
                }
                //Lưu pa vào name fileUpload
                else
                {
                    collection_image1a.SaveAs(pa_eidt1);
                    collection_image2a.SaveAs(pa_eidt2);
                    collection_image3a.SaveAs(pa_eidt3);

                    collection.collection_image1 = collection_image1a.FileName;
                    collection.collection_image2 = collection_image2a.FileName;
                    collection.collection_image3 = collection_image3a.FileName;
                    collection.collection_datecreate = DateTime.Now;
                    db.SaveChanges();
                    return Redirect(admin_qlbst);
                }
            }
        }

        // GET: Admin/Collections/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Collection collection = db.Collection.Find(id);
            if (collection == null)
            {
                return HttpNotFound();
            }
            return View(collection);
        }

        // POST: Admin/Collections/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int? id)
        {
            Collection collection = db.Collection.Find(id);
            List<Product> products = db.Product.Where(n => n.collection_id == id).ToList();
            foreach (var item in products)
            {
                List<Comment> comments = db.Comment.Where(n => n.product_id == item.product_id).ToList();
                foreach (var item2 in comments)
                {
                    db.Comment.Remove(item2);
                }
                List<ReplyComment> rep = db.ReplyComment.Where(n => n.product_id == item.product_id).ToList();
                foreach (var item3 in rep)
                {
                    db.ReplyComment.Remove(item3);
                }
                List<View> views = db.View.Where(n => n.product_id == item.product_id).ToList();
                foreach (var item4 in views)
                {
                    db.View.Remove(item4);
                }
                List<Product_Category> pc = db.Product_Category.Where(n => n.product_id == item.product_id).ToList();
                foreach (var item5 in pc)
                {
                    db.Product_Category.Remove(item5);
                }
                db.Product.Remove(item);
            }
            db.Collection.Remove(collection);
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
