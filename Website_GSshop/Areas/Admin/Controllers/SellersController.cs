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
    public class SellersController : Controller
    {
        private Data_GSShopEntities db = new Data_GSShopEntities();
        String admin_qls = "/Admin/Sellers/Index";
        // GET: Admin/Sellers
        public ActionResult Index()
        {
            return View(db.Seller.ToList());
        }

        // GET: Admin/Sellers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Seller seller = db.Seller.Find(id);
            if (seller == null)
            {
                return HttpNotFound();
            }
            return View(seller);
        }

        // GET: Admin/Sellers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Sellers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "seller_id,seller_pass,seller_email,seller_telephone,seller_token,seller_slider1,seller_slider2,seller_slider3,seller_link1,seller_link2,seller_link3,seller_logo,seller_active,seller_nameshop,seller_datecreated,seller_address,seller_datelogin,seller_detail,seller_description,seller_role,seller_nicename,seller_provincecity,seller_district")] Seller seller, HttpPostedFileBase fileUpload1, HttpPostedFileBase fileUpload2, HttpPostedFileBase fileUpload3, HttpPostedFileBase fileUpload4)
        {
            // Tên file ảnh sản phẩm
            var fileimg_edit1 = Path.GetFileName(fileUpload1.FileName);
            var fileimg_edit2 = Path.GetFileName(fileUpload2.FileName);
            var fileimg_edit3 = Path.GetFileName(fileUpload3.FileName);
            var fileimg_edit4 = Path.GetFileName(fileUpload4.FileName);
            // Đưa tên ảnh vào đúng file
            var pa_eidt1 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit1);
            var pa_eidt2 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit2);
            var pa_eidt3 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit3);
            var pa_eidt4 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit4);
            // Ảnh trống
            if (fileUpload1 == null)
            {
                ViewBag.ThongBao = "Ảnh trống 1 !";
                return View(seller);
            }
            else if (fileUpload2 == null)
            {
                ViewBag.ThongBao = "Ảnh trống 2 !";
                return View(seller);
            }
            else if (fileUpload3 == null)
            {
                ViewBag.ThongBao = "Ảnh trống 3 !";
                return View(seller);
            }
            else if (fileUpload4 == null)
            {
                ViewBag.ThongBao = "Ảnh trống 4 !";
                return View(seller);
            }
            //Nếu tên ảnh trùng
            else if (System.IO.File.Exists(pa_eidt1))
            {
                ViewBag.ThongBao = "Ảnh 1 đã tồn tại";
                return View(seller);
            }
            else if (System.IO.File.Exists(pa_eidt2))
            {
                ViewBag.ThongBao = "Ảnh 2 đã tồn tại";
                return View(seller);
            }
            else if (System.IO.File.Exists(pa_eidt3))
            {
                ViewBag.ThongBao = "Ảnh 3 đã tồn tại";
                return View(seller);
            }
            else if (System.IO.File.Exists(pa_eidt4))
            {
                ViewBag.ThongBao = "Ảnh 4 đã tồn tại";
                return View(seller);
            }
            //Lưu pa vào name fileUpload
            else
            {
                fileUpload1.SaveAs(pa_eidt1);
                fileUpload2.SaveAs(pa_eidt2);
                fileUpload3.SaveAs(pa_eidt3);
                fileUpload4.SaveAs(pa_eidt4);
                db.Seller.Add(seller);
                seller.seller_logo = fileUpload1.FileName;
                seller.seller_slider1 = fileUpload2.FileName;
                seller.seller_slider2 = fileUpload3.FileName;
                seller.seller_slider3 = fileUpload4.FileName;
                seller.seller_token = Guid.NewGuid().ToString();
                seller.seller_active = true;
                seller.seller_datecreated = DateTime.Now;
                seller.seller_datelogin = DateTime.Now;
                db.SaveChanges();
                return Redirect(admin_qls);
            }
        }

        // GET: Admin/Sellers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Seller seller = db.Seller.Find(id);
            if (seller == null)
            {
                return HttpNotFound();
            }
            return View(seller);
        }

        // POST: Admin/Sellers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "seller_id,seller_pass,seller_email,seller_telephone,seller_token,seller_slider1,seller_slider2,seller_slider3,seller_link1,seller_link2,seller_link3,seller_logo,seller_active,seller_nameshop,seller_datecreated,seller_address,seller_datelogin,seller_detail,seller_description,seller_role,seller_nicename,seller_provincecity,seller_district")] Seller seller, HttpPostedFileBase fileUpload1, HttpPostedFileBase fileUpload2, HttpPostedFileBase fileUpload3, HttpPostedFileBase fileUpload4)
        {
            db.Entry(seller).State = EntityState.Modified;
            if (fileUpload1 == null || fileUpload2 == null || fileUpload3 == null || fileUpload4 == null)
            {
                Seller sellers = db.Seller.Find(Int32.Parse(seller.seller_id.ToString()));
                db.SaveChanges();
                return Redirect(admin_qls);
            }
            else
            {
                // Tên file ảnh seller
                var fileimg_edit1 = Path.GetFileName(fileUpload1.FileName);
                var fileimg_edit2 = Path.GetFileName(fileUpload2.FileName);
                var fileimg_edit3 = Path.GetFileName(fileUpload3.FileName);
                var fileimg_edit4 = Path.GetFileName(fileUpload4.FileName);
                // Đưa tên ảnh vào đúng file
                var pa_eidt1 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit1);
                var pa_eidt2 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit2);
                var pa_eidt3 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit3);
                var pa_eidt4 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit4);
                // Ảnh trống
                if (fileUpload1 == null)
                {
                    ViewBag.ThongBao = "Ảnh trống 1 !";
                    return View(seller);
                }
                else if (fileUpload2 == null)
                {
                    ViewBag.ThongBao = "Ảnh trống 2 !";
                    return View(seller);
                }
                else if (fileUpload3 == null)
                {
                    ViewBag.ThongBao = "Ảnh trống 3 !";
                    return View(seller);
                }
                else if (fileUpload4 == null)
                {
                    ViewBag.ThongBao = "Ảnh trống 4 !";
                    return View(seller);
                }
                //Nếu tên ảnh trùng
                else if (System.IO.File.Exists(pa_eidt1))
                {
                    ViewBag.ThongBao = "Ảnh 1 đã tồn tại";
                    return View(seller);
                }
                else if (System.IO.File.Exists(pa_eidt2))
                {
                    ViewBag.ThongBao = "Ảnh 2 đã tồn tại";
                    return View(seller);
                }
                else if (System.IO.File.Exists(pa_eidt3))
                {
                    ViewBag.ThongBao = "Ảnh 3 đã tồn tại";
                    return View(seller);
                }
                else if (System.IO.File.Exists(pa_eidt4))
                {
                    ViewBag.ThongBao = "Ảnh 4 đã tồn tại";
                    return View(seller);
                }
                //Lưu pa vào name fileUpload
                else
                {
                    fileUpload1.SaveAs(pa_eidt1);
                    fileUpload2.SaveAs(pa_eidt2);
                    fileUpload3.SaveAs(pa_eidt3);
                    fileUpload4.SaveAs(pa_eidt4);

                    seller.seller_logo = fileUpload1.FileName;
                    seller.seller_slider1 = fileUpload2.FileName;
                    seller.seller_slider2 = fileUpload3.FileName;
                    seller.seller_slider3 = fileUpload4.FileName;
                    seller.seller_token = Guid.NewGuid().ToString();
                    seller.seller_datecreated = DateTime.Now;
                    seller.seller_datelogin = DateTime.Now;
                    db.SaveChanges();
                    return Redirect(admin_qls);
                }
            }
        }

        // GET: Admin/Sellers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Seller seller = db.Seller.Find(id);
            if (seller == null)
            {
                return HttpNotFound();
            }
            return View(seller);
        }

        // POST: Admin/Sellers/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Seller seller = db.Seller.Find(id);
            db.Seller.Remove(seller);
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
