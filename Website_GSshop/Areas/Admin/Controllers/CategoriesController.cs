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
            return View(db.Category.OrderByDescending(n=>n.category_datecreated).ToList());
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
        public ActionResult Create([Bind(Include = "category_id,category_name,category_image,category_datecreated,category_active,category_bin")] Category category, HttpPostedFileBase fileUpload)
        {
            Random random = new Random();
            ViewBag.random = random.Next(0, 1000);

            // Tên file ảnh sản phẩm
            var fileimg = Path.GetFileName(fileUpload.FileName);
            // Đưa tên ảnh vào đúng file
            var pa = Path.Combine(Server.MapPath("~/Content/Layout/images"), ViewBag.random + fileimg);
            // Ảnh trống
            if (fileUpload == null)
            {
                ViewBag.ThongBao = "Ảnh trống !";
            }
            //Lưu pa vào name fileUpload
            else
            {
                fileUpload.SaveAs(pa);
                db.Category.Add(category);
                category.category_image = ViewBag.random + fileUpload.FileName;
                category.category_datecreated = DateTime.Now;
                db.SaveChanges();
                return Redirect(admin_qldmc);
            }
            return Redirect(Request.UrlReferrer.ToString());
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
        public ActionResult Edit([Bind(Include = "category_id,category_name,category_image,category_datecreated,category_active,category_bin")] Category category, HttpPostedFileBase imgCate)
        {
            Random random = new Random();
            ViewBag.random = random.Next(0, 1000);

            db.Entry(category).State = EntityState.Modified;
            if (imgCate == null)
            {
                db.SaveChanges();
                return Redirect(admin_qldmc);
            }
            else
            {
                // Tên file ảnh sản phẩm
                var fileimg = Path.GetFileName(imgCate.FileName);
                // Đưa tên ảnh vào đúng file
                var pa = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg);
                // Ảnh trống
                if (imgCate == null)
                {
                    ViewBag.ThongBao = "Ảnh trống !";
                }
                //Lưu pa vào name fileUpload
                else
                {
                    imgCate.SaveAs(pa);
                    category.category_image = imgCate.FileName;
                    db.SaveChanges();
                    return Redirect(admin_qldmc);
                }
                return Redirect(Request.UrlReferrer.ToString());
            }
        }
        // POST: Admin/Categories/Delete/5
        [HttpPost]
        public ActionResult DeleteConfirmed(int ?id)
        {
            Category cate = db.Category.Find(id);
            cate.category_bin = !cate.category_bin;
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
