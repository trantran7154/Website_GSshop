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
    public class ProductsController : Controller
    {       
        Data_GSShopEntities db = new Data_GSShopEntities();
        String admin_qlsp = "/Admin/Products/Index";
        // GET: Admin/Products
        public ActionResult Index()
        {
            var product = db.Product.Include(p => p.Seller).Include(p => p.User).Include(p => p.Category);
            return View(product.Where(n => n.product_bin == true).ToList());
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
            ViewBag.banner_id = new SelectList(db.Banner, "banner_id", "banner_name");
            ViewBag.category_id = new SelectList(db.Category, "category_id", "category_name");
            ViewBag.csc_id = new SelectList(db.ClassificationSubCategory, "csc_id", "csc_name");
            ViewBag.collection_id = new SelectList(db.Collection, "collection_id", "collection_name");
            ViewBag.gsmail_id = new SelectList(db.GSMall, "gsmall_id", "gsmall_name");
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_email");
            ViewBag.subcategory_id = new SelectList(db.SubCategory, "subcategory_id", "subcategory_name");
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass");
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "product_id,product_name,product_image,product_datecreated,product_active,product_note,product_price,product_ship,product_view,product_love,product_color,product_size,product_detail,product_description,product_option,product_sale,product_amount,product_dateedit,seller_id,user_id,category_id,subcategory_id,banner_id,collection_id,gsmall_id,product_bin")] Product product, HttpPostedFileBase fileUpload)
        {

            Random random = new Random();
            ViewBag.random = random.Next(0, 1000);

            var fileimg = Path.GetFileName(fileUpload.FileName);
            var pa = Path.Combine(Server.MapPath("~/Content/Layout/images"), ViewBag.random + fileimg);

            db.Product.Add(product);
            if (fileUpload == null)
            {
                ViewBag.ThongBao = "Chọn hình ảnh";
                return View();
            }
            else
            {

                fileUpload.SaveAs(pa);
                product.product_active = true;
                product.product_option = true;
                product.product_bin = true;


                product.product_datecreated = DateTime.Now;
                product.product_dateedit = DateTime.Now;


                product.product_image = ViewBag.random + fileUpload.FileName;

                db.SaveChanges();

                ViewBag.banner_id = new SelectList(db.Banner, "banner_id", "banner_name", product.banner_id);
                ViewBag.category_id = new SelectList(db.Category, "category_id", "category_name", product.category_id);
                ViewBag.csc_id = new SelectList(db.ClassificationSubCategory, "csc_id", "csc_name", product.csc_id);
                ViewBag.collection_id = new SelectList(db.Collection, "collection_id", "collection_name", product.collection_id);
                ViewBag.gsmail_id = new SelectList(db.GSMall, "gsmall_id", "gsmall_name", product.gsmail_id);
                ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_email", product.seller_id);
                ViewBag.subcategory_id = new SelectList(db.SubCategory, "subcategory_id", "subcategory_name", product.subcategory_id);
                ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", product.user_id);
                ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", product.user_id);

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
            ViewBag.banner_id = new SelectList(db.Banner, "banner_id", "banner_name");
            ViewBag.category_id = new SelectList(db.Category, "category_id", "category_name");
            ViewBag.csc_id = new SelectList(db.ClassificationSubCategory, "csc_id", "csc_name");
            ViewBag.collection_id = new SelectList(db.Collection, "collection_id", "collection_name");
            ViewBag.gsmail_id = new SelectList(db.GSMall, "gsmall_id", "gsmall_name");
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_email");
            ViewBag.subcategory_id = new SelectList(db.SubCategory, "subcategory_id", "subcategory_name");
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass");
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass");
            return View(product);
        }

        // POST: Admin/Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "product_id,product_name,product_image,product_datecreated,product_active,product_note,product_price,product_ship,product_view,product_love,product_color,product_size,product_detail,product_description,product_option,product_sale,product_amount,product_dateedit,seller_id,user_id,category_id,subcategory_id,banner_id,collection_id,gsmall_id,product_bin")] Product product, HttpPostedFileBase image)
        {
            Product pr = db.Product.Find(product.product_id);
            db.Entry(product).State = EntityState.Modified;
            if(image == null)
            {
                Product pro = db.Product.Find(Int32.Parse(product.product_id.ToString()));
                product.product_bin = pr.product_bin;
                product.product_datecreated = pr.product_datecreated;
                product.product_dateedit = DateTime.Now;
                db.SaveChanges();
                ViewBag.banner_id = new SelectList(db.Banner, "banner_id", "banner_name");
                ViewBag.category_id = new SelectList(db.Category, "category_id", "category_name");
                ViewBag.csc_id = new SelectList(db.ClassificationSubCategory, "csc_id", "csc_name");
                ViewBag.collection_id = new SelectList(db.Collection, "collection_id", "collection_name");
                ViewBag.gsmail_id = new SelectList(db.GSMall, "gsmall_id", "gsmall_name");
                ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_email");
                ViewBag.subcategory_id = new SelectList(db.SubCategory, "subcategory_id", "subcategory_name");
                ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass");
                ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass");
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
                    product.product_bin = true;
                    db.SaveChanges();
                    ViewBag.banner_id = new SelectList(db.Banner, "banner_id", "banner_name");
                    ViewBag.category_id = new SelectList(db.Category, "category_id", "category_name");
                    ViewBag.csc_id = new SelectList(db.ClassificationSubCategory, "csc_id", "csc_name");
                    ViewBag.collection_id = new SelectList(db.Collection, "collection_id", "collection_name");
                    ViewBag.gsmail_id = new SelectList(db.GSMall, "gsmall_id", "gsmall_name");
                    ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_email");
                    ViewBag.subcategory_id = new SelectList(db.SubCategory, "subcategory_id", "subcategory_name");
                    ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass");
                    ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass");
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
        public ActionResult DeleteConfirmed(Product product)
        {
            Product pr = db.Product.Find(Int32.Parse(product.product_id.ToString()));
            pr.product_bin = false;
            pr.product_active = false;
            db.SaveChanges();
            return Redirect(admin_qlsp);
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
