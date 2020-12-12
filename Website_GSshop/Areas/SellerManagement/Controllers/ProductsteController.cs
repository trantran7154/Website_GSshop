using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Areas.SellerManagement.Controllers
{
    public class ProductsteController : Controller
    {
        private Data_GSShopEntities db = new Data_GSShopEntities();

        // GET: SellerManagement/Productste
        public ActionResult Index()
        {
            var product = db.Product.Include(p => p.Banner).Include(p => p.Category).Include(p => p.ClassificationSubCategory).Include(p => p.Collection).Include(p => p.GSMall).Include(p => p.Seller).Include(p => p.SubCategory).Include(p => p.User).Include(p => p.User1);
            return View(product.ToList());
        }

        // GET: SellerManagement/Productste/Details/5
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

        // GET: SellerManagement/Productste/Create
        public ActionResult Create()
        {
            ViewBag.banner_id = new SelectList(db.Banner, "banner_id", "banner_name");
            ViewBag.category_id = new SelectList(db.Category, "category_id", "category_name");
            ViewBag.csc_id = new SelectList(db.ClassificationSubCategory, "csc_id", "csc_name");
            ViewBag.collection_id = new SelectList(db.Collection, "collection_id", "collection_name");
            ViewBag.gsmail_id = new SelectList(db.GSMall, "gsmall_id", "gsmall_name");
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_pass");
            ViewBag.subcategory_id = new SelectList(db.SubCategory, "subcategory_id", "subcategory_name");
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass");
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass");
            return View();
        }

        // POST: SellerManagement/Productste/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "product_id,product_name,product_image,product_datecreated,product_active,product_note,product_price,product_ship,product_view,product_love,product_color,product_size,product_detail,product_description,product_option,product_sale,product_amount,product_dateedit,seller_id,category_id,subcategory_id,banner_id,collection_id,gsmail_id,product_bin,product_related,user_id,csc_id")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Product.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.banner_id = new SelectList(db.Banner, "banner_id", "banner_name", product.banner_id);
            ViewBag.category_id = new SelectList(db.Category, "category_id", "category_name", product.category_id);
            ViewBag.csc_id = new SelectList(db.ClassificationSubCategory, "csc_id", "csc_name", product.csc_id);
            ViewBag.collection_id = new SelectList(db.Collection, "collection_id", "collection_name", product.collection_id);
            ViewBag.gsmail_id = new SelectList(db.GSMall, "gsmall_id", "gsmall_name", product.gsmail_id);
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_pass", product.seller_id);
            ViewBag.subcategory_id = new SelectList(db.SubCategory, "subcategory_id", "subcategory_name", product.subcategory_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", product.user_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", product.user_id);
            return View(product);
        }

        // GET: SellerManagement/Productste/Edit/5
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
            ViewBag.banner_id = new SelectList(db.Banner, "banner_id", "banner_name", product.banner_id);
            ViewBag.category_id = new SelectList(db.Category, "category_id", "category_name", product.category_id);
            ViewBag.csc_id = new SelectList(db.ClassificationSubCategory, "csc_id", "csc_name", product.csc_id);
            ViewBag.collection_id = new SelectList(db.Collection, "collection_id", "collection_name", product.collection_id);
            ViewBag.gsmail_id = new SelectList(db.GSMall, "gsmall_id", "gsmall_name", product.gsmail_id);
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_pass", product.seller_id);
            ViewBag.subcategory_id = new SelectList(db.SubCategory, "subcategory_id", "subcategory_name", product.subcategory_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", product.user_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", product.user_id);
            return View(product);
        }

        // POST: SellerManagement/Productste/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "product_id,product_name,product_image,product_datecreated,product_active,product_note,product_price,product_ship,product_view,product_love,product_color,product_size,product_detail,product_description,product_option,product_sale,product_amount,product_dateedit,seller_id,category_id,subcategory_id,banner_id,collection_id,gsmail_id,product_bin,product_related,user_id,csc_id")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.banner_id = new SelectList(db.Banner, "banner_id", "banner_name", product.banner_id);
            ViewBag.category_id = new SelectList(db.Category, "category_id", "category_name", product.category_id);
            ViewBag.csc_id = new SelectList(db.ClassificationSubCategory, "csc_id", "csc_name", product.csc_id);
            ViewBag.collection_id = new SelectList(db.Collection, "collection_id", "collection_name", product.collection_id);
            ViewBag.gsmail_id = new SelectList(db.GSMall, "gsmall_id", "gsmall_name", product.gsmail_id);
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_pass", product.seller_id);
            ViewBag.subcategory_id = new SelectList(db.SubCategory, "subcategory_id", "subcategory_name", product.subcategory_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", product.user_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", product.user_id);
            return View(product);
        }

        // GET: SellerManagement/Productste/Delete/5
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

        // POST: SellerManagement/Productste/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
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
