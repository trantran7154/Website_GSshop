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
        public ActionResult Create([Bind(Include = "gsmall_id,gsmall_name,gsmall_slogan,gsmall_active,gsmall_datecreate,gsmall_bg,gsmall_image,gsmall_bin,gsmall_img1,gsmall_img2,gsmall_img3,gsmall_img4,gsmall_img5,gsmall_img6,gsmall_img7")] GSMall gSMall, HttpPostedFileBase fileUpload1, HttpPostedFileBase fileUpload2)
        {
            // Tên file ảnh sản phẩm
            var fileimg_edit1 = Path.GetFileName(fileUpload1.FileName);
            var fileimg_edit2 = Path.GetFileName(fileUpload2.FileName);
            // Đưa tên ảnh vào đúng file
            var pa_eidt1 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit1);
            var pa_eidt2 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit2);
            // Ảnh trống
            if (fileUpload1 == null)
            {
                ViewBag.ThongBao = "Ảnh 1 trống !";
                return View(gSMall);
            }
            else if (fileUpload2 == null)
            {
                ViewBag.ThongBao = "Ảnh 2 trống !";
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
            //Lưu pa vào name fileUpload
            else
            {
                fileUpload1.SaveAs(pa_eidt1);
                fileUpload2.SaveAs(pa_eidt2);
                db.GSMall.Add(gSMall);
                gSMall.gsmall_bg = fileUpload1.FileName;
                gSMall.gsmall_image = fileUpload2.FileName;
                gSMall.gsmall_datecreate = DateTime.Now;
                gSMall.gsmall_active = true;
                gSMall.gsmall_bin = true;
                db.SaveChanges();
                return Redirect(admin_qldt);
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
        public ActionResult Edit([Bind(Include = "gsmall_id,gsmall_name,gsmall_slogan,gsmall_active,gsmall_datecreate,gsmall_bg,gsmall_image,gsmall_bin,gsmall_img1,gsmall_img2,gsmall_img3,gsmall_img4,gsmall_img5,gsmall_img6,gsmall_img7")] GSMall gSMall, HttpPostedFileBase gsmall_bg1, HttpPostedFileBase gsmall_image1)
        {
            db.Entry(gSMall).State = EntityState.Modified;
            if (gsmall_bg1 == null || gsmall_image1 == null)
            {
                GSMall gS = db.GSMall.Find(Int32.Parse(gSMall.gsmall_id.ToString()));
                db.SaveChanges();
                return Redirect(admin_qldt);
            }
            else
            {
                // Tên file ảnh bộ sưu tập
                var fileimg_edit1 = Path.GetFileName(gsmall_bg1.FileName);
                var fileimg_edit2 = Path.GetFileName(gsmall_image1.FileName);
                // Đưa tên ảnh vào đúng file
                var pa_eidt1 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit1);
                var pa_eidt2 = Path.Combine(Server.MapPath("~/Content/Layout/images"), fileimg_edit2);
                // Ảnh trống
                if (gsmall_bg1 == null)
                {
                    ViewBag.ThongBao = "Ảnh nền trống !";
                    return View(gSMall);
                }
                else if (gsmall_image1 == null)
                {
                    ViewBag.ThongBao = "Ảnh đại diện trống trống !";
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
                //Lưu pa vào name fileUpload
                else
                {
                    gsmall_bg1.SaveAs(pa_eidt1);
                    gsmall_image1.SaveAs(pa_eidt2);

                    gSMall.gsmall_bg = gsmall_bg1.FileName;
                    gSMall.gsmall_image = gsmall_image1.FileName;
                    gSMall.gsmall_datecreate = DateTime.Now;
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
