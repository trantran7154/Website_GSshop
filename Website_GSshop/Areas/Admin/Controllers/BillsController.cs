using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Areas.Admin.Controllers
{
    public class BillsController : Controller
    {
        private Data_GSShopEntities db = new Data_GSShopEntities();
        String qlb = "/Admin/Bills/Index";
        // GET: Admin/Bills
        public ActionResult Index()
        {
            var bill = db.Bill.Include(b => b.User);
            return View(bill.Where(n => n.bill_bin == true).ToList());
        }

        // GET: Admin/Bills/Details/5
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

        // GET: Admin/Bills/Create
        public ActionResult Create()
        {
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_pass");
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass");
            return View();
        }

        // POST: Admin/Bills/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create([Bind(Include = "bill_id,bill_datecreated,seller_id,user_id,bill_address,bill_telephone,bill_sum,bill_dateset,bill_status,bill_note,bill_district,bill_provincecity,bill_sale,bill_bin")] Bill bill)
        {
            if (ModelState.IsValid)
            {
                db.Bill.Add(bill);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", bill.user_id);
            return View(bill);
        }

        // GET: Admin/Bills/Edit/5
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
            
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", bill.user_id);
            return View(bill);
        }

        // POST: Admin/Bills/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Edit([Bind(Include = "bill_id,bill_datecreated,seller_id,user_id,bill_address,bill_telephone,bill_sum,bill_dateset,bill_status,bill_note,bill_district,bill_provincecity,bill_sale,bill_bin")] Bill bill)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bill).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", bill.user_id);
            return View(bill);
        }

        // GET: Admin/Bills/Delete/5
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

        // POST: Admin/Bills/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Bill bills)
        {
            Bill bill = db.Bill.Find(Int32.Parse(bills.bill_id.ToString()));
            bill.bill_bin = false;
            db.SaveChanges();
            return Redirect(qlb);
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
