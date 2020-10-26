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
    public class ReplyCommentsController : Controller
    {
        private Data_GSShopEntities db = new Data_GSShopEntities();
        String admin_qlr = "/Admin/ReplyComments/Index";
        // GET: Admin/ReplyComments
        public ActionResult Index()
        {
            var replyComment = db.ReplyComment.Include(r => r.Comment).Include(r => r.Product).Include(r => r.Seller).Include(r => r.User);
            return View(replyComment.ToList());
        }

        // GET: Admin/ReplyComments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReplyComment replyComment = db.ReplyComment.Find(id);
            if (replyComment == null)
            {
                return HttpNotFound();
            }
            return View(replyComment);
        }

        // GET: Admin/ReplyComments/Create
        public ActionResult Create()
        {
            ViewBag.comment_id = new SelectList(db.Comment, "comment_id", "comment_content");
            ViewBag.product_id = new SelectList(db.Product, "product_id", "product_name");
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_pass");
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass");
            return View();
        }

        // POST: Admin/ReplyComments/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "replycomment_id,replycomment_content,comment_id,user_id,product_id,seller_id,replycomment_spam")] ReplyComment replyComment)
        {
            if (replyComment == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            else
            {
                db.ReplyComment.Add(replyComment);
                replyComment.replycomment_datecreated = DateTime.Now;
                replyComment.replycomment_spam = true;
                db.SaveChanges();
                return Redirect(admin_qlr);
            }
        }

        // GET: Admin/ReplyComments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReplyComment replyComment = db.ReplyComment.Find(id);
            if (replyComment == null)
            {
                return HttpNotFound();
            }
            ViewBag.comment_id = new SelectList(db.Comment, "comment_id", "comment_content", replyComment.comment_id);
            ViewBag.product_id = new SelectList(db.Product, "product_id", "product_name", replyComment.product_id);
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_pass", replyComment.seller_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", replyComment.user_id);
            return View(replyComment);
        }

        // POST: Admin/ReplyComments/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Edit([Bind(Include = "replycomment_id,replycomment_content,comment_id,user_id,product_id,seller_id,replycomment_spam")] ReplyComment replyComment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(replyComment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.comment_id = new SelectList(db.Comment, "comment_id", "comment_content", replyComment.comment_id);
            ViewBag.product_id = new SelectList(db.Product, "product_id", "product_name", replyComment.product_id);
            ViewBag.seller_id = new SelectList(db.Seller, "seller_id", "seller_pass", replyComment.seller_id);
            ViewBag.user_id = new SelectList(db.User, "user_id", "user_pass", replyComment.user_id);
            return View(replyComment);
        }

        // GET: Admin/ReplyComments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReplyComment replyComment = db.ReplyComment.Find(id);
            if (replyComment == null)
            {
                return HttpNotFound();
            }
            return View(replyComment);
        }

        // POST: Admin/ReplyComments/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            ReplyComment replyComment = db.ReplyComment.Find(id);
            db.ReplyComment.Remove(replyComment);
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
