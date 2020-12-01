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
    public class GSMallsController : Controller
    {
        private Data_GSShopEntities db = new Data_GSShopEntities();
        String admin_qldt = "/Admin/GSMalls/Index";
        // GET: Admin/GSMalls
        public ActionResult Index()
        {
            var gSMall = db.GSMall.Include(g => g.Product);
            return View(gSMall.Where(n => n.gsmall_bin == true).ToList());
        }

        // GET: Admin/GSMalls/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GSMall gSMall = db.GSMall.Find(id);
            if (gSMall == null)
            {
                return HttpNotFound();
            }
            return View(gSMall);
        }

        // GET: Admin/GSMalls/Create
        public ActionResult Create()
        {
            ViewBag.product_id = new SelectList(db.Product, "product_id", "product_name");
            return View();
        }

        // POST: Admin/GSMalls/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create([Bind(Include = "gsmall_id,gsmall_name,gsmall_slogan,gsmall_active,gsmall_datecreate,gsmall_bg,gsmall_image,gsmall_bin,gsmall_img1,gsmall_img2,gsmall_img3,gsmall_img4,gsmall_img5,gsmall_img6,gsmall_img7")] GSMall gSMall, HttpPostedFileBase fileUpload1c, HttpPostedFileBase fileUpload2c, HttpPostedFileBase fileUpload3c, HttpPostedFileBase fileUpload4c, HttpPostedFileBase fileUpload5c, HttpPostedFileBase fileUpload6c, HttpPostedFileBase fileUpload7c, HttpPostedFileBase fileUpload8c, HttpPostedFileBase fileUpload9c)
        {
            // Tên file ảnh sản phẩm
            var fileimg_edit1 = Path.GetFileName(fileUpload1c.FileName);
            var fileimg_edit2 = Path.GetFileName(fileUpload2c.FileName);
            var fileimg_edit3 = Path.GetFileName(fileUpload3c.FileName);
            var fileimg_edit4 = Path.GetFileName(fileUpload4c.FileName);
            var fileimg_edit5 = Path.GetFileName(fileUpload5c.FileName);
            var fileimg_edit6 = Path.GetFileName(fileUpload6c.FileName);
            var fileimg_edit7 = Path.GetFileName(fileUpload7c.FileName);
            var fileimg_edit8 = Path.GetFileName(fileUpload8c.FileName);
            var fileimg_edit9 = Path.GetFileName(fileUpload9c.FileName);
            // Đưa tên ảnh vào đúng file
            var pa_eidt1 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit1);
            var pa_eidt2 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit2);
            var pa_eidt3 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit3);
            var pa_eidt4 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit4);
            var pa_eidt5 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit5);
            var pa_eidt6 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit6);
            var pa_eidt7 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit7);
            var pa_eidt8 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit8);
            var pa_eidt9 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit9);
            // Ảnh trống
            if (fileUpload1c == null)
            {
                ViewBag.ThongBao = "Ảnh 1 trống !";
                return View(gSMall);
            }
            else if (fileUpload2c == null)
            {
                ViewBag.ThongBao = "Ảnh 2 trống !";
                return View(gSMall);
            }
            else if (fileUpload3c == null)
            {
                ViewBag.ThongBao = "Ảnh 3 trống !";
                return View(gSMall);
            }
            else if (fileUpload4c == null)
            {
                ViewBag.ThongBao = "Ảnh 4 trống !";
                return View(gSMall);
            }
            else if (fileUpload5c == null)
            {
                ViewBag.ThongBao = "Ảnh 5 trống !";
                return View(gSMall);
            }
            else if (fileUpload6c == null)
            {
                ViewBag.ThongBao = "Ảnh 6 trống !";
                return View(gSMall);
            }
            else if (fileUpload7c == null)
            {
                ViewBag.ThongBao = "Ảnh 7 trống !";
                return View(gSMall);
            }
            else if (fileUpload8c == null)
            {
                ViewBag.ThongBao = "Ảnh 8 trống !";
                return View(gSMall);
            }
            else if (fileUpload9c == null)
            {
                ViewBag.ThongBao = "Ảnh 9 trống !";
                return View(gSMall);
            }
            //Nếu tên ảnh trùng
            else if (System.IO.File.Exists(pa_eidt1))
            {
                ViewBag.ThongBao = "Ảnh 1 đã tồn tại";
                return View(gSMall);
            }
            else if (System.IO.File.Exists(pa_eidt2))
            {
                ViewBag.ThongBao = "Ảnh 2 đã tồn tại";
                return View(gSMall);
            }
            else if (System.IO.File.Exists(pa_eidt3))
            {
                ViewBag.ThongBao = "Ảnh 3 đã tồn tại";
                return View(gSMall);
            }
            else if (System.IO.File.Exists(pa_eidt4))
            {
                ViewBag.ThongBao = "Ảnh 4 đã tồn tại";
                return View(gSMall);
            }
            else if (System.IO.File.Exists(pa_eidt5))
            {
                ViewBag.ThongBao = "Ảnh 5 đã tồn tại";
                return View(gSMall);
            }
            else if (System.IO.File.Exists(pa_eidt6))
            {
                ViewBag.ThongBao = "Ảnh 6 đã tồn tại";
                return View(gSMall);
            }
            else if (System.IO.File.Exists(pa_eidt7))
            {
                ViewBag.ThongBao = "Ảnh 7 đã tồn tại";
                return View(gSMall);
            }
            else if (System.IO.File.Exists(pa_eidt8))
            {
                ViewBag.ThongBao = "Ảnh 8 đã tồn tại";
                return View(gSMall);
            }
            else if (System.IO.File.Exists(pa_eidt9))
            {
                ViewBag.ThongBao = "Ảnh 9 đã tồn tại";
                return View(gSMall);
            }
            //Lưu pa vào name fileUpload
            else
            {
                fileUpload1c.SaveAs(pa_eidt1);
                fileUpload2c.SaveAs(pa_eidt2);
                fileUpload3c.SaveAs(pa_eidt3);
                fileUpload4c.SaveAs(pa_eidt4);
                fileUpload5c.SaveAs(pa_eidt5);
                fileUpload6c.SaveAs(pa_eidt6);
                fileUpload7c.SaveAs(pa_eidt7);
                fileUpload8c.SaveAs(pa_eidt8);
                fileUpload9c.SaveAs(pa_eidt9);
                db.GSMall.Add(gSMall);
                gSMall.gsmall_bg = fileUpload1c.FileName;
                gSMall.gsmall_image = fileUpload2c.FileName;
                gSMall.gsmall_img1 = fileUpload3c.FileName;
                gSMall.gsmall_img2 = fileUpload4c.FileName;
                gSMall.gsmall_img3 = fileUpload5c.FileName;
                gSMall.gsmall_img4 = fileUpload6c.FileName;
                gSMall.gsmall_img5 = fileUpload7c.FileName;
                gSMall.gsmall_img6 = fileUpload8c.FileName;
                gSMall.gsmall_img7 = fileUpload9c.FileName;
                gSMall.gsmall_datecreate = DateTime.Now;
                gSMall.gsmall_active = true;
                gSMall.gsmall_bin = true;
                db.SaveChanges();
                return Redirect(Request.UrlReferrer.ToString());
            }
        }

        // GET: Admin/GSMalls/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GSMall gSMall = db.GSMall.Find(id);
            if (gSMall == null)
            {
                return HttpNotFound();
            }
            return View(gSMall);
        }

        // POST: Admin/GSMalls/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Edit([Bind(Include = "gsmall_id,gsmall_name,gsmall_slogan,gsmall_active,gsmall_datecreate,gsmall_bg,gsmall_image,gsmall_bin,gsmall_img1,gsmall_img2,gsmall_img3,gsmall_img4,gsmall_img5,gsmall_img6,gsmall_img7")] GSMall gSMall, HttpPostedFileBase fileUpload1g, HttpPostedFileBase fileUpload2g, HttpPostedFileBase fileUpload3g, HttpPostedFileBase fileUpload4g, HttpPostedFileBase fileUpload5g, HttpPostedFileBase fileUpload6g, HttpPostedFileBase fileUpload7g, HttpPostedFileBase fileUpload8g, HttpPostedFileBase fileUpload9g)
        {
            db.Entry(gSMall).State = EntityState.Modified;
            if (fileUpload1g == null || fileUpload2g == null || fileUpload3g == null || fileUpload4g == null || fileUpload5g == null || fileUpload6g == null || fileUpload7g == null || fileUpload8g == null || fileUpload9g == null)
            {
                GSMall gS = db.GSMall.Find(Int32.Parse(gSMall.gsmall_id.ToString()));
                db.SaveChanges();
                return Redirect(admin_qldt);
            }
            else
            {
                // Tên file ảnh bộ sưu tập
                var fileimg_edit1 = Path.GetFileName(fileUpload1g.FileName);
                var fileimg_edit2 = Path.GetFileName(fileUpload2g.FileName);
                var fileimg_edit3 = Path.GetFileName(fileUpload3g.FileName);
                var fileimg_edit4 = Path.GetFileName(fileUpload4g.FileName);
                var fileimg_edit5 = Path.GetFileName(fileUpload5g.FileName);
                var fileimg_edit6 = Path.GetFileName(fileUpload6g.FileName);
                var fileimg_edit7 = Path.GetFileName(fileUpload7g.FileName);
                var fileimg_edit8 = Path.GetFileName(fileUpload8g.FileName);
                var fileimg_edit9 = Path.GetFileName(fileUpload9g.FileName);
                // Đưa tên ảnh vào đúng file
                var pa_eidt1 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit1);
                var pa_eidt2 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit2);
                var pa_eidt3 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit3);
                var pa_eidt4 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit4);
                var pa_eidt5 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit5);
                var pa_eidt6 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit6);
                var pa_eidt7 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit7);
                var pa_eidt8 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit8);
                var pa_eidt9 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit9);
                // Ảnh trống
                if (fileUpload1g == null && fileUpload2g != null && fileUpload3g != null && fileUpload4g != null && fileUpload5g != null && fileUpload6g != null && fileUpload7g != null && fileUpload8g != null && fileUpload9g != null)
                {
                    ViewBag.ThongBao = "Ảnh nền trống !";
                    return View(gSMall);
                }
                else if (fileUpload1g != null && fileUpload2g == null && fileUpload3g != null && fileUpload4g != null && fileUpload5g != null && fileUpload6g != null && fileUpload7g != null && fileUpload8g != null && fileUpload9g != null)
                {
                    ViewBag.ThongBao = "Ảnh đại diện trống trống !";
                    return View(gSMall);
                }
                else if (fileUpload1g != null && fileUpload2g != null && fileUpload3g == null && fileUpload4g != null && fileUpload5g != null && fileUpload6g != null && fileUpload7g != null && fileUpload8g != null && fileUpload9g != null)
                {
                    ViewBag.ThongBao = "Ảnh 1 trống !";
                    return View(gSMall);
                }
                else if (fileUpload1g != null && fileUpload2g != null && fileUpload3g != null && fileUpload4g == null && fileUpload5g != null && fileUpload6g != null && fileUpload7g != null && fileUpload8g != null && fileUpload9g != null)
                {
                    ViewBag.ThongBao = "Ảnh 2 trống !";
                    return View(gSMall);
                }
                else if (fileUpload1g != null && fileUpload2g != null && fileUpload3g != null && fileUpload4g != null && fileUpload5g == null && fileUpload6g != null && fileUpload7g != null && fileUpload8g != null && fileUpload9g != null)
                {
                    ViewBag.ThongBao = "Ảnh 3 trống !";
                    return View(gSMall);
                }
                else if (fileUpload1g != null && fileUpload2g != null && fileUpload3g != null && fileUpload4g != null && fileUpload5g != null && fileUpload6g == null && fileUpload7g != null && fileUpload8g != null && fileUpload9g != null)
                {
                    ViewBag.ThongBao = "Ảnh 4 trống !";
                    return View(gSMall);
                }
                else if (fileUpload1g != null && fileUpload2g != null && fileUpload3g != null && fileUpload4g != null && fileUpload5g != null && fileUpload6g != null && fileUpload7g == null && fileUpload8g != null && fileUpload9g != null)
                {
                    ViewBag.ThongBao = "Ảnh 5 trống !";
                    return View(gSMall);
                }
                else if (fileUpload1g != null && fileUpload2g != null && fileUpload3g != null && fileUpload4g != null && fileUpload5g != null && fileUpload6g != null && fileUpload7g != null && fileUpload8g == null && fileUpload9g != null)
                {
                    ViewBag.ThongBao = "Ảnh 6 trống !";
                    return View(gSMall);
                }
                else if (fileUpload1g != null && fileUpload2g != null && fileUpload3g != null && fileUpload4g != null && fileUpload5g != null && fileUpload6g != null && fileUpload7g != null && fileUpload8g != null && fileUpload9g == null)
                {
                    ViewBag.ThongBao = "Ảnh 7 trống !";
                    return View(gSMall);
                }
                //Nếu tên ảnh trùng
                else if (System.IO.File.Exists(pa_eidt1))
                {
                    ViewBag.ThongBao = "Ảnh nền đã tồn tại";
                    return View(gSMall);
                }
                else if (System.IO.File.Exists(pa_eidt2))
                {
                    ViewBag.ThongBao = "Ảnh đại diện đã tồn tại";
                    return View(gSMall);
                }
                else if (System.IO.File.Exists(pa_eidt3))
                {
                    ViewBag.ThongBao = "Ảnh 1 đã tồn tại";
                    return View(gSMall);
                }
                else if (System.IO.File.Exists(pa_eidt4))
                {
                    ViewBag.ThongBao = "Ảnh 2 đã tồn tại";
                    return View(gSMall);
                }
                else if (System.IO.File.Exists(pa_eidt5))
                {
                    ViewBag.ThongBao = "Ảnh 3 đã tồn tại";
                    return View(gSMall);
                }
                else if (System.IO.File.Exists(pa_eidt6))
                {
                    ViewBag.ThongBao = "Ảnh 4 đã tồn tại";
                    return View(gSMall);
                }
                else if (System.IO.File.Exists(pa_eidt7))
                {
                    ViewBag.ThongBao = "Ảnh 5 đã tồn tại";
                    return View(gSMall);
                }
                else if (System.IO.File.Exists(pa_eidt8))
                {
                    ViewBag.ThongBao = "Ảnh 6 đã tồn tại";
                    return View(gSMall);
                }
                else if (System.IO.File.Exists(pa_eidt9))
                {
                    ViewBag.ThongBao = "Ảnh 7 đã tồn tại";
                    return View(gSMall);
                }
                //Lưu pa vào name fileUpload
                else
                {
                    fileUpload1g.SaveAs(pa_eidt1);
                    fileUpload2g.SaveAs(pa_eidt2);
                    fileUpload3g.SaveAs(pa_eidt3);
                    fileUpload4g.SaveAs(pa_eidt4);
                    fileUpload5g.SaveAs(pa_eidt5);
                    fileUpload6g.SaveAs(pa_eidt6);
                    fileUpload7g.SaveAs(pa_eidt7);
                    fileUpload8g.SaveAs(pa_eidt8);
                    fileUpload9g.SaveAs(pa_eidt9);

                    gSMall.gsmall_bg = fileUpload1g.FileName;
                    gSMall.gsmall_image = fileUpload2g.FileName;
                    gSMall.gsmall_img1 = fileUpload3g.FileName;
                    gSMall.gsmall_img2 = fileUpload4g.FileName;
                    gSMall.gsmall_img3 = fileUpload5g.FileName;
                    gSMall.gsmall_img4 = fileUpload6g.FileName;
                    gSMall.gsmall_img5 = fileUpload7g.FileName;
                    gSMall.gsmall_img6 = fileUpload8g.FileName;
                    gSMall.gsmall_img7 = fileUpload9g.FileName;
                    gSMall.gsmall_datecreate = DateTime.Now;
                    gSMall.gsmall_bin = true;
                    gSMall.gsmall_active = true;
                    db.SaveChanges();
                    return Redirect(admin_qldt);
                }
            }
        }

        // GET: Admin/GSMalls/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GSMall gSMall = db.GSMall.Find(id);
            if (gSMall == null)
            {
                return HttpNotFound();
            }
            return View(gSMall);
        }

        // POST: Admin/GSMalls/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(GSMall gSMall)
        {
            GSMall gs = db.GSMall.Find(Int32.Parse(gSMall.gsmall_id.ToString()));
            gs.gsmall_bin = false;
            gs.gsmall_active = false;
            db.SaveChanges();
            return Redirect(admin_qldt);
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
