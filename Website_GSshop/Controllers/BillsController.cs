using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers
{
    public class BillsController : Controller
    {
        private Data_GSShopEntities db = new Data_GSShopEntities();

        // GET: Bills
        public ActionResult Index()
        {
            var bill = db.Bill.Include(b => b.Seller).Include(b => b.User);
            return View(bill.ToList());
        }

        // GET: Bills/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bill bill = db.Bill.Find(id);
            if (bill == null)
            {
                return HttpNotFound();
            }
            return View(bill);
        }

        // GET: Bills/Create
        public ActionResult Create()
        {
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_pass");
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass");
            return View();
        }

        // POST: Bills/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "bill_id,bill_datecreated,seller_id,user_id,bill_address,bill_telephone,bill_sum,bill_dateset,bill_status,bill_note")] Bill bill)
        {
            if (ModelState.IsValid)
            {
                db.Bill.Add(bill);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_pass", bill.seller_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", bill.user_id);
            return View(bill);
        }

        // GET: Bills/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bill bill = db.Bill.Find(id);
            if (bill == null)
            {
                return HttpNotFound();
            }
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_pass", bill.seller_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", bill.user_id);
            return View(bill);
        }

        // POST: Bills/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "bill_id,bill_datecreated,seller_id,user_id,bill_address,bill_telephone,bill_sum,bill_dateset,bill_status,bill_note")] Bill bill)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bill).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_pass", bill.seller_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", bill.user_id);
            return View(bill);
        }

        // GET: Bills/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bill bill = db.Bill.Find(id);
            if (bill == null)
            {
                return HttpNotFound();
            }
            return View(bill);
        }

        // POST: Bills/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Bill bill = db.Bill.Find(id);
            db.Bill.Remove(bill);
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
