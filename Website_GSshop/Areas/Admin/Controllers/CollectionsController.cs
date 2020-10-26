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
            ViewBag.product_id = new SelectList(db.Product, "product_id", "product_name", collection.product_id);
            return View(collection);
        }

        // POST: Admin/Collections/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Edit([Bind(Include = "collection_id,collection_name,collection_image1,collection_image2,collection_image3,product_id,collection_datecreate,collection_active")] Collection collection)
        {
            if (ModelState.IsValid)
            {
                db.Entry(collection).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.product_id = new SelectList(db.Product, "product_id", "product_name", collection.product_id);
            return View(collection);
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
        public ActionResult DeleteConfirmed(int id)
        {
            Collection collection = db.Collection.Find(id);
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
