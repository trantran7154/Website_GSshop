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
    public class Seller_ProductController : Controller
    {
        Data_GSShopEntities db = new Data_GSShopEntities();
        String admin_qlsps = "/Admin/Seller_Product/Index";
        // GET: Admin/Seller_Product
        public ActionResult Index()
        {
            return View(db.Seller.Where(n => n.seller_bin == true).ToList());
        }

        // Danh sách sản phẩm
        public ActionResult SellerProductDetail(int ? id)
        {
            List<Product> products = db.Product.Where(n => n.seller_id == id && n.product_bin == true).ToList();
            return View(products);
        }

        // GET: Admin/Products/Details/5
        public ActionResult ProductDetail(int? id)
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
        public ActionResult ProductCreate()
        {
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_login");
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_login");
            ViewBag.category_id = new SelectList(db.Category, "category_id", "category_name");
            return View(db.Product.ToList());
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ProductCreate([Bind(Include = "product_id,product_name,product_image,product_datecreated,product_active,product_note,product_price,product_ship,product_view,product_love,product_color,product_size,product_detail,product_description,product_option,product_sale,product_amount,product_dateedit,seller_id,user_id,category_id,subcategory_id,banner_id,collection_id,gsmall_id,product_bin")] Product product, HttpPostedFileBase fileUpload)
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
                product.product_bin = true;
                db.SaveChanges();
                return Redirect(admin_qlsps);
            }
        }

        // GET: Admin/Products/Edit/5
        public ActionResult ProductEdit(int? id)
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
        public ActionResult ProductEdit([Bind(Include = "product_id,product_name,product_image,product_datecreated,product_active,product_note,product_price,product_ship,product_view,product_love,product_color,product_size,product_detail,product_description,product_option,product_sale,product_amount,product_dateedit,seller_id,user_id,category_id,subcategory_id,banner_id,collection_id,gsmall_id,product_bin")] Product product, HttpPostedFileBase image)
        {
            db.Entry(product).State = EntityState.Modified;
            if (image == null)
            {
                Product pro = db.Product.Find(Int32.Parse(product.product_id.ToString()));
                db.SaveChanges();
                return Redirect(admin_qlsps);
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
                    return Redirect(admin_qlsps);
                }
            }
        }

        // GET: Admin/Products/Delete/5
        public ActionResult ProductDelete(int? id)
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
        [HttpPost, ActionName("ProductDelete")]
        public ActionResult ProductDeleteConfirmed(Product product)
        {
            Product pro = db.Product.Find(Int32.Parse(product.product_id.ToString()));
            pro.product_bin = false;
            pro.product_active = false;
            db.SaveChanges();
            return Redirect(admin_qlsps);
        }
    }
}