using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers
{
    public class FavouriteController : Controller
    {
        String home = "/Display/Index";
        String login = "/Account/Login";
        String detail = "/View/FlashSaleDetail/";
        Data_GSShopEntities db = new Data_GSShopEntities();
        // GET: Favourite
        public ActionResult Favourite([Bind(Include = "fa_id,fa_likes,fa_datereated,fa_bin,product_id,user_id")] Favourite favourite, int? id)
        {
            User us = (User)Session["user"];
            if(us != null)
            {
                db.Favourite.Add(favourite);

                favourite.fa_datereated = DateTime.Now;
                favourite.fa_bin = false;
                favourite.user_id = us.user_id;
                favourite.product_id = id;

                db.SaveChanges();
                return Redirect(detail + id);
            }
            else
            {
                return Redirect(login);
            }
        }
        public ActionResult FavouriteDelete(int? id)
        {
            Favourite fa = db.Favourite.Find(id);
            fa.fa_bin = true;
            db.SaveChanges();
            return Redirect(detail + fa.product_id);
        }
    }
}