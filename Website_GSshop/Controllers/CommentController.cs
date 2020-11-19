using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers
{
    public class CommentController : Controller
    {
        // GET: Comment
        Data_GSShopEntities db = new Data_GSShopEntities();
        [HttpPost]
        public ActionResult Comment([Bind(Include = "comment_id,comment_content,commet_datecreated,user_id,product_id,seller_id,comment_spam,comment_bin")] Comment comment)
        {
            User user = (User)Session["user"];
            comment.commet_datecreated = DateTime.Now;
            comment.user_id = user.user_id;
            comment.product_id = Int32.Parse(Session["product"].ToString());
            comment.comment_spam = true;
            comment.comment_bin = true;
            db.Comment.Add(comment);
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}