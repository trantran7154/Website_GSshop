using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers
{
    public class ReplyCommentController : Controller
    {
        // GET: ReplyComment
        Data_GSShopEntities db = new Data_GSShopEntities();
        String detail = "/View/FlashSaleDetail/";
        [HttpPost]
        public ActionResult ReplyComment([Bind(Include = "replycomment_id,replycomment_content,comment_id,user_id,product_id,seller_id,replycomment_spam,replycomment_datecreated,replycomment_bin")] ReplyComment replyComment, int? id)
        {
            User us = (User)Session["user"];
            replyComment.user_id = us.user_id;
            replyComment.product_id = Int32.Parse(Session["product"].ToString());
            replyComment.replycomment_spam = true;
            replyComment.replycomment_bin = true;
            replyComment.replycomment_datecreated = DateTime.Now;
            db.ReplyComment.Add(replyComment);
            db.SaveChanges();
            return Redirect(detail + id);
        }
    }
}