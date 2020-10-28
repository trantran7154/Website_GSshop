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
    public class ProductsController : Controller
    {       
        private Data_GSShopEntities db = new Data_GSShopEntities();
        String admin_qlsp = "/Admin/Products/Index";
        // GET: Admin/Products
        public ActionResult Index()
        {
            var product = db.Product.Include(p => p.Seller).Include(p => p.User).Include(p => p.Category);
            return View(product.ToList());
        }

        // GET: Admin/Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Product.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Admin/Products/Create
        public ActionResult Create()
        {
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_login");
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_login");
            ViewBag.category_id = new SelectList(db.Category, "category_id", "category_name");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "product_id,product_name,product_image,product_datecreated,product_active,product_note,product_price,product_ship,product_view,product_love,product_color,product_size,product_detail,product_description,product_option,product_sale,product_amount,product_dateedit,seller_id,user_id,category_id")] Product product, HttpPostedFileBase fileUpload)
        {
            // Tên file ảnh sản phẩm
            var fileimg_edit = Path.GetFileName(fileUpload.FileName);
            // Đưa tên ảnh vào đúng file
            var pa_eidt = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit);
            // Ảnh trống
            if (fileUpload == null)
            {
                ViewBag.ThongBao = "Ảnh trống !";
                return View(product);
            }
            //Nếu tên ảnh trùng
            else if (System.IO.File.Exists(pa_eidt))
            {
                ViewBag.ThongBao = "Ảnh đã tồn tại";
                return View(product);
            }
            //Lưu pa vào name fileUpload
            else
            {
                fileUpload.SaveAs(pa_eidt);
                db.Product.Add(product);
                product.product_image = fileUpload.FileName;
                product.product_active = true;
                product.product_option = true;
                product.product_datecreated = DateTime.Now;
                product.product_dateedit = DateTime.Now;
                db.SaveChanges();
                return Redirect(admin_qlsp);
            }
        }

        // GET: Admin/Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Product.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_login", product.seller_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_login", product.user_id);
            ViewBag.category_id = new SelectList(db.Category, "category_id", "category_name", product.category_id);
            return View(product);
        }

        // POST: Admin/Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "product_id,product_name,product_image,product_datecreated,product_active,product_note,product_price,product_ship,product_view,product_love,product_color,product_size,product_detail,product_description,product_option,product_sale,product_amount,product_dateedit,seller_id,user_id,category_id")] Product product, HttpPostedFileBase image)
        {
            db.Entry(product).State = EntityState.Modified;
            if(image == null)
            {
                Product pro = db.Product.Find(Int32.Parse(product.product_id.ToString()));
                db.SaveChanges();
                return Redirect(admin_qlsp);
            }
            else
            {
                // Tên file ảnh sản phẩm
                var fileimg = Path.GetFileName(image.FileName);
                // Đưa tên ảnh vào đúng file
                var pa = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg);
                // Ảnh trống
                if (image == null)
                {
                    ViewBag.ThongBao = "Ảnh trống !";
                    return View(product);
                }
                //Nếu tên ảnh trùng
                else if (System.IO.File.Exists(pa))
                {
                    ViewBag.ThongBao = "Ảnh đã tồn tại";
                    return View(product);
                }
                //Lưu pa vào name fileUpload
                else
                {
                    image.SaveAs(pa);
                    product.product_image = image.FileName;
                    product.product_datecreated = DateTime.Now;
                    product.product_dateedit = DateTime.Now;
                    db.SaveChanges();
                    return Redirect(admin_qlsp);
                }
            }
        }

        // GET: Admin/Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Product.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Admin/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Product.Find(id);
            db.Product.Remove(product);
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
