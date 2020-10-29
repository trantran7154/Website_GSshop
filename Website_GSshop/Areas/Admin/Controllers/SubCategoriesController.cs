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
    public class SubCategoriesController : Controller
    {
        private Data_GSShopEntities db = new Data_GSShopEntities();
        String admin_qldmp = "/Admin/SubCategories/Index";
        // GET: Admin/SubCategories
        public ActionResult Index()
        {
            var subCategory = db.SubCategory.Include(s => s.Category);
            return View(subCategory.ToList());
        }

        // GET: Admin/SubCategories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubCategory subCategory = db.SubCategory.Find(id);
            if (subCategory == null)
            {
                return HttpNotFound();
            }
            return View(subCategory);
        }

        // GET: Admin/SubCategories/Create
        public ActionResult Create()
        {
            ViewBag.category_id = new SelectList(db.Category, "category_id", "category_name");
            return View();
        }

        // POST: Admin/SubCategories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create([Bind(Include = "subcategory_id,subcategory_name,subcategory_image,subcategory_datecreated,subcategory_active,category_id")] SubCategory subCategory, HttpPostedFileBase fileUpload)
        {
            // Tên file ảnh sản phẩm
            var fileimg_edit = Path.GetFileName(fileUpload.FileName);
            // Đưa tên ảnh vào đúng file
            var pa_eidt = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit);
            // Ảnh trống
            if (fileUpload == null)
            {
                ViewBag.ThongBao = "Ảnh trống !";
                return View(subCategory);
            }
            //Nếu tên ảnh trùng
            else if (System.IO.File.Exists(pa_eidt))
            {
                ViewBag.ThongBao = "Ảnh đã tồn tại";
                return View(subCategory);
            }
            //Lưu pa vào name fileUpload
            else
            {
                fileUpload.SaveAs(pa_eidt);
                db.SubCategory.Add(subCategory);
                subCategory.subcategory_image = fileUpload.FileName;
                subCategory.subcategory_datecreated = DateTime.Now;
                subCategory.subcategory_active = true;
                db.SaveChanges();
                return Redirect(admin_qldmp);
            }
        }

        // GET: Admin/SubCategories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubCategory subCategory = db.SubCategory.Find(id);
            if (subCategory == null)
            {
                return HttpNotFound();
            }
            ViewBag.category_id = new SelectList(db.Category, "category_id", "category_name", subCategory.category_id);
            return View(subCategory);
        }

        // POST: Admin/SubCategories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Edit([Bind(Include = "subcategory_id,subcategory_name,subcategory_image,subcategory_datecreated,subcategory_active,category_id")] SubCategory subCategory, HttpPostedFileBase fileUpload)
        {
            db.Entry(subCategory).State = EntityState.Modified;
            if (fileUpload == null)
            {
                SubCategory subCategorys = db.SubCategory.Find(Int32.Parse(subCategory.subcategory_id.ToString()));
                db.SaveChanges();
                return Redirect(admin_qldmp);
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
                    return View(subCategory);
                }
                //Nếu tên ảnh trùng
                else if (System.IO.File.Exists(pa_eidt))
                {
                    ViewBag.ThongBao = "Ảnh đã tồn tại";
                    return View(subCategory);
                }
                //Lưu pa vào name fileUpload
                else
                {
                    fileUpload.SaveAs(pa_eidt);
                    subCategory.subcategory_image = fileUpload.FileName;
                    subCategory.subcategory_datecreated = DateTime.Now;
                    db.SaveChanges();
                    return Redirect(admin_qldmp);
                }
            }
        }

        // GET: Admin/SubCategories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubCategory subCategory = db.SubCategory.Find(id);
            if (subCategory == null)
            {
                return HttpNotFound();
            }
            return View(subCategory);
        }

        // POST: Admin/SubCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            SubCategory subCategory = db.SubCategory.Find(id);
            db.SubCategory.Remove(subCategory);
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
