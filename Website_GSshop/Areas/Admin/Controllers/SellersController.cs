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
            return View(db.Seller.Where(n => n.seller_bin == true).ToList());
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
        public ActionResult Create([Bind(Include = "seller_id,seller_pass,seller_email,seller_telephone,seller_token,seller_slider1,seller_slider2,seller_slider3,seller_link1,seller_link2,seller_link3,seller_logo,seller_active,seller_nameshop,seller_datecreated,seller_address,seller_datelogin,seller_detail,seller_description,seller_role,seller_nicename,seller_provincecity,seller_district,seller_bin")] Seller seller, HttpPostedFileBase efileUpload1, HttpPostedFileBase efileUpload2, HttpPostedFileBase efileUpload3, HttpPostedFileBase efileUpload4)
        {

            Random random = new Random();
            ViewBag.random = random.Next(0, 1000);


            // Tên file ảnh sản phẩm
            var fileimg_edit1 = Path.GetFileName(efileUpload1.FileName);
            var fileimg_edit2 = Path.GetFileName(efileUpload2.FileName);
            var fileimg_edit3 = Path.GetFileName(efileUpload3.FileName);
            var fileimg_edit4 = Path.GetFileName(efileUpload4.FileName);
            // Đưa tên ảnh vào đúng file
            var pa_eidt1 = Path.Combine(Server.MapPath("~/Content/Layout/images"), ViewBag.random + fileimg_edit1);
            var pa_eidt2 = Path.Combine(Server.MapPath("~/Content/Layout/images"), ViewBag.random + fileimg_edit2);
            var pa_eidt3 = Path.Combine(Server.MapPath("~/Content/Layout/images"), ViewBag.random + fileimg_edit3);
            var pa_eidt4 = Path.Combine(Server.MapPath("~/Content/Layout/images"), ViewBag.random + fileimg_edit4);
            // Ảnh trống
            if (efileUpload1 == null)
            {
                ViewBag.ThongBao = "Ảnh trống 1 !";
                return View(seller);
            }
            else if (efileUpload2 == null)
            {
                ViewBag.ThongBao = "Ảnh trống 2 !";
                return View(seller);
            }
            else if (efileUpload3 == null)
            {
                ViewBag.ThongBao = "Ảnh trống 3 !";
                return View(seller);
            }
            else if (efileUpload4 == null)
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
                efileUpload1.SaveAs(pa_eidt1);
                efileUpload2.SaveAs(pa_eidt2);
                efileUpload3.SaveAs(pa_eidt3);
                efileUpload4.SaveAs(pa_eidt4);
                db.Seller.Add(seller);
                seller.seller_logo = ViewBag.random + efileUpload1.FileName;
                seller.seller_slider1 = ViewBag.random + efileUpload2.FileName;
                seller.seller_slider2 = ViewBag.random + efileUpload3.FileName;
                seller.seller_slider3 = ViewBag.random + efileUpload4.FileName;
                seller.seller_token = Guid.NewGuid().ToString();
                seller.seller_datecreated = DateTime.Now;
                seller.seller_datelogin = DateTime.Now;
                seller.seller_bin = true;
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
        public ActionResult Edit([Bind(Include = "seller_id,seller_pass,seller_email,seller_telephone,seller_token,seller_slider1,seller_slider2,seller_slider3,seller_link1,seller_link2,seller_link3,seller_logo,seller_active,seller_nameshop,seller_datecreated,seller_address,seller_datelogin,seller_detail,seller_description,seller_role,seller_nicename,seller_provincecity,seller_district,seller_bin")] Seller seller, HttpPostedFileBase fileUpload1, HttpPostedFileBase fileUpload2, HttpPostedFileBase fileUpload3, HttpPostedFileBase fileUpload4)
        {
            Random random = new Random();
            ViewBag.random = random.Next(0, 1000);

            db.Entry(seller).State = EntityState.Modified;
            if (fileUpload1 == null || fileUpload2 == null || fileUpload3 == null || fileUpload4 == null)
            {
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
                var pa_eidt1 = Path.Combine(Server.MapPath("~/Content/Layout/images"), ViewBag.random + fileimg_edit1);
                var pa_eidt2 = Path.Combine(Server.MapPath("~/Content/Layout/images"), ViewBag.random + fileimg_edit2);
                var pa_eidt3 = Path.Combine(Server.MapPath("~/Content/Layout/images"), ViewBag.random + fileimg_edit3);
                var pa_eidt4 = Path.Combine(Server.MapPath("~/Content/Layout/images"), ViewBag.random + fileimg_edit4);
                // Ảnh trống
                if (fileUpload1 == null)
                {
                    ViewBag.ThongBao = "Ảnh trống 1 !";
                }
                else if (fileUpload2 == null)
                {
                    ViewBag.ThongBao = "Ảnh trống 2 !";
                }
                else if (fileUpload3 == null)
                {
                    ViewBag.ThongBao = "Ảnh trống 3 !";
                }
                else if (fileUpload4 == null)
                {
                    ViewBag.ThongBao = "Ảnh trống 4 !";
                }
                //Nếu tên ảnh trùng
                else if (System.IO.File.Exists(pa_eidt1))
                {
                    ViewBag.ThongBao = "Ảnh 1 đã tồn tại";
                }
                else if (System.IO.File.Exists(pa_eidt2))
                {
                    ViewBag.ThongBao = "Ảnh 2 đã tồn tại";
                }
                else if (System.IO.File.Exists(pa_eidt3))
                {
                    ViewBag.ThongBao = "Ảnh 3 đã tồn tại";
                }
                else if (System.IO.File.Exists(pa_eidt4))
                {
                    ViewBag.ThongBao = "Ảnh 4 đã tồn tại";
                }
                //Lưu pa vào name fileUpload
                else
                {
                    fileUpload1.SaveAs(pa_eidt1);
                    fileUpload2.SaveAs(pa_eidt2);
                    fileUpload3.SaveAs(pa_eidt3);
                    fileUpload4.SaveAs(pa_eidt4);

                    seller.seller_logo = ViewBag.random + fileUpload1.FileName;
                    seller.seller_slider1 = ViewBag.random + fileUpload2.FileName;
                    seller.seller_slider2 = ViewBag.random + fileUpload3.FileName;
                    seller.seller_slider3 = ViewBag.random + fileUpload4.FileName;
                    seller.seller_token = Guid.NewGuid().ToString();
                    seller.seller_datecreated = DateTime.Now;
                    seller.seller_datelogin = DateTime.Now;
                    db.SaveChanges();
                    return Redirect(admin_qls);
                }
                return Redirect(Request.UrlReferrer.ToString());
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
        public ActionResult DeleteConfirmed(Seller seller)
        {
            Seller se = db.Seller.Find(Int32.Parse(seller.seller_id.ToString()));
            se.seller_bin = false;
            db.SaveChanges();
            return Redirect(admin_qls);
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
