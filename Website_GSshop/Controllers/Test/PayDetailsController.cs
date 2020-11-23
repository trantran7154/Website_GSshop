using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers.Test
{
    public class PayDetailsController : Controller
    {
        private Data_GSShopEntities db = new Data_GSShopEntities();

        // GET: PayDetails
        public ActionResult Index()
        {
            var payDetail = db.PayDetail.Include(p => p.Product).Include(p => p.User);
            return View(payDetail.ToList());
        }

        // GET: PayDetails/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayDetail payDetail = db.PayDetail.Find(id);
            if (payDetail == null)
            {
                return HttpNotFound();
            }
            return View(payDetail);
        }

        // GET: PayDetails/Create
        public ActionResult Create()
        {
            ViewBag.product_id = new SelectList(db.Product, "product_id", "product_name");
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass");
            return View();
        }

        // POST: PayDetails/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "pay_id,user_id,product_id,pay_money,pay_amount,pay_datecreated")] PayDetail payDetail)
        {
            if (ModelState.IsValid)
            {
                db.PayDetail.Add(payDetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.product_id = new SelectList(db.Product, "product_id", "product_name", payDetail.product_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", payDetail.user_id);
            return View(payDetail);
        }

        // GET: PayDetails/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayDetail payDetail = db.PayDetail.Find(id);
            if (payDetail == null)
            {
                return HttpNotFound();
            }
            ViewBag.product_id = new SelectList(db.Product, "product_id", "product_name", payDetail.product_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", payDetail.user_id);
            return View(payDetail);
        }

        // POST: PayDetails/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "pay_id,user_id,product_id,pay_money,pay_amount,pay_datecreated")] PayDetail payDetail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(payDetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.product_id = new SelectList(db.Product, "product_id", "product_name", payDetail.product_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", payDetail.user_id);
            return View(payDetail);
        }

        // GET: PayDetails/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayDetail payDetail = db.PayDetail.Find(id);
            if (payDetail == null)
            {
                return HttpNotFound();
            }
            return View(payDetail);
        }

        // POST: PayDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PayDetail payDetail = db.PayDetail.Find(id);
            db.PayDetail.Remove(payDetail);
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
