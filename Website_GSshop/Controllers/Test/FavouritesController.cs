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
    public class FavouritesController : Controller
    {
        private Data_GSShopEntities db = new Data_GSShopEntities();

        // GET: Favourites
        public ActionResult Index()
        {
            var favourite = db.Favourite.Include(f => f.Product).Include(f => f.User);
            return View(favourite.ToList());
        }

        // GET: Favourites/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Favourite favourite = db.Favourite.Find(id);
            if (favourite == null)
            {
                return HttpNotFound();
            }
            return View(favourite);
        }

        // GET: Favourites/Create
        public ActionResult Create()
        {
            ViewBag.product_id = new SelectList(db.Product, "product_id", "product_name");
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass");
            return View();
        }

        // POST: Favourites/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "fa_id,fa_likes,fa_datereated,fa_bin,product_id,user_id")] Favourite favourite)
        {
            if (ModelState.IsValid)
            {
                db.Favourite.Add(favourite);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.product_id = new SelectList(db.Product, "product_id", "product_name", favourite.product_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", favourite.user_id);
            return View(favourite);
        }

        // GET: Favourites/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Favourite favourite = db.Favourite.Find(id);
            if (favourite == null)
            {
                return HttpNotFound();
            }
            ViewBag.product_id = new SelectList(db.Product, "product_id", "product_name", favourite.product_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", favourite.user_id);
            return View(favourite);
        }

        // POST: Favourites/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "fa_id,fa_likes,fa_datereated,fa_bin,product_id,user_id")] Favourite favourite)
        {
            if (ModelState.IsValid)
            {
                db.Entry(favourite).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.product_id = new SelectList(db.Product, "product_id", "product_name", favourite.product_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", favourite.user_id);
            return View(favourite);
        }

        // GET: Favourites/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Favourite favourite = db.Favourite.Find(id);
            if (favourite == null)
            {
                return HttpNotFound();
            }
            return View(favourite);
        }

        // POST: Favourites/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Favourite favourite = db.Favourite.Find(id);
            db.Favourite.Remove(favourite);
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
