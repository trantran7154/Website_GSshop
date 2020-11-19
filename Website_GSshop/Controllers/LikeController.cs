using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers
{
    public class LikeController : Controller
    {
        Data_GSShopEntities db = new Data_GSShopEntities();
        String detail = "/View/FlashSaleDetail/";
        String login = "/Account/Login";
        [HttpPost]
        public ActionResult Like([Bind(Include = "like_id,like_datecreated,like_bin,product_id,user_id,replycomment_id")] Like like, int? id)
        {
            User us = (User)Session["user"];
            if (us != null)
            {
                db.Like.Add(like);

                like.like_datecreated = DateTime.Now;
                like.like_bin = true;
                like.product_id = Int32.Parse(Session["product"].ToString());
                like.user_id = us.user_id;

                db.SaveChanges();
                return Redirect(detail + id);
            }
            else
            {
                return Redirect(login);
            }
        }
        // Xóa like bình luận
        public ActionResult LikeDelete(FormCollection f,int? id)
        {
            Like like = db.Like.Find(id);
            db.Like.Remove(like);
            db.SaveChanges();
            return Redirect(detail + like.product_id);
        }
    }
}