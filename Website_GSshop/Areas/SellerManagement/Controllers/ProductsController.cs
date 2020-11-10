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

namespace Website_GSshop.Areas.SellerManagement.Controllers
{
    public class ProductsController : Controller
    {
        private Data_GSShopEntities db = new Data_GSShopEntities();
        String login = "/Account/LoginSeller";
        String seller_qlsp = "/SellerManagement/Products/Index";
        // GET: SellerManagement/Products
        public ActionResult Index(int? id)
        {
            Seller se = (Seller)Session["seller"];
            if(se == null)
            {
                return Redirect(login);
            }
            List<Product> pr = db.Product.Where(n => n.seller_id == se.seller_id && n.product_bin == true).ToList();
            return View(pr);
        }

        // GET: SellerManagement/Products/Details/5
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

        // GET: SellerManagement/Products/Create
        public ActionResult Create()
        {
            ViewBag.banner_id = new SelectList(db.Banner, "banner_id", "banner_name");
            ViewBag.category_id = new SelectList(db.Category, "category_id", "category_name");
            ViewBag.collection_id = new SelectList(db.Collection, "collection_id", "collection_name");
            ViewBag.gsmail_id = new SelectList(db.GSMall, "gsmall_id", "gsmall_name");
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_pass");
            ViewBag.subcategory_id = new SelectList(db.SubCategory, "subcategory_id", "subcategory_name");
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass");
            return View();
        }

        // POST: SellerManagement/Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "product_id,product_name,product_image,product_datecreated,product_active,product_note,product_price,product_ship,product_view,product_love,product_color,product_size,product_detail,product_description,product_option,product_sale,product_amount,product_dateedit,seller_id,user_id,category_id,subcategory_id,banner_id,collection_id,gsmail_id,product_bin,product_related")] Product product, HttpPostedFileBase fileUpload)
        {
            Seller seller = (Seller)Session["seller"];
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
                product.seller_id = seller.seller_id;
                db.SaveChanges();
                return Redirect(seller_qlsp);
            }
        }

        // GET: SellerManagement/Products/Edit/5
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
            ViewBag.collection_id = new SelectList(db.Collection, "collection_id", "collection_name", product.collection_id);
            ViewBag.gsmail_id = new SelectList(db.GSMall, "gsmall_id", "gsmall_name", product.gsmail_id);
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_pass", product.seller_id);
            ViewBag.subcategory_id = new SelectList(db.SubCategory, "subcategory_id", "subcategory_name", product.subcategory_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", product.user_id);
            return View(product);
        }

        // POST: SellerManagement/Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "product_id,product_name,product_image,product_datecreated,product_active,product_note,product_price,product_ship,product_view,product_love,product_color,product_size,product_detail,product_description,product_option,product_sale,product_amount,product_dateedit,seller_id,user_id,category_id,subcategory_id,banner_id,collection_id,gsmail_id,product_bin,product_related")] Product product, HttpPostedFileBase image)
        {
            db.Entry(product).State = EntityState.Modified;
            Seller sesse = (Seller)Session["seller"];
            if (image == null)
            {
                Product pro = db.Product.Find(Int32.Parse(product.product_id.ToString()));
                db.SaveChanges();
                return Redirect(seller_qlsp);
            }
            else
            {
                // Radom ảnh
                Random rnd = new Random();
                int number = rnd.Next(1, 1000);
                // Tên file ảnh sản phẩm
                var fileimg = Path.GetFileName(number + image.FileName);
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
                    product.product_image = number + image.FileName;
                    product.product_datecreated = DateTime.Now;
                    product.product_dateedit = DateTime.Now;
                    product.seller_id = sesse.seller_id;
                    product.product_bin = true;
                    db.SaveChanges();
                    return Redirect(seller_qlsp);
                }
            }
        }

        // GET: SellerManagement/Products/Delete/5
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

        // POST: SellerManagement/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateInput(false)]
        public ActionResult DeleteConfirmed(Product product)
        {
            Product pr = db.Product.Find(Int32.Parse(product.product_id.ToString()));
            pr.product_bin = false;
            pr.product_active = false;
            db.SaveChanges();
            return Redirect(seller_qlsp);
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
