using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_GSshop.Models;

namespace Website_GSshop.Controllers
{
    public class CartController : Controller
    {
        Data_GSShopEntities db = new Data_GSShopEntities();
        // GET: Cart
        //Trang in danh sach gio hang
        public ActionResult IndexCart()
        {
            List<ShoppingCarts> ghtt = Session["sptt"] as List<ShoppingCarts>;
            return View(ghtt);
        }
        //xu ly them vao gio hang
        public ActionResult CreateCart(int ?id)
        {
            //In so tren thanh gio hang (truong hop khong co)
            if (Session["sptt"] == null)
            {
                Session["sptt"] = new List<ShoppingCarts>();
                Session["dem"] = "Trống";
            }
            //xu ly lu sesion va +so ngay gio hang lay theo id san pha
            List<ShoppingCarts> ghtt = Session["sptt"] as List<ShoppingCarts>;
            if (ghtt.FirstOrDefault(n => n.product_id == id) == null)
            {
                Product sp = db.Product.Find(id);
                if (Session["dem"].ToString() == "Trống")
                    Session["dem"] = "0";
                Session["dem"] = Int32.Parse(Session["dem"].ToString()) + 1;
                ShoppingCarts giatri = new ShoppingCarts()
                {
                    product_id = sp.product_id,
                    product_image = sp.product_image,
                    product_name= sp.product_name,
                    pay_amount = 1,
                    product_price = decimal.ToInt32(sp.product_price.Value)
                };
                ghtt.Add(giatri);
            }
            else
            {
                ShoppingCarts gh = ghtt.FirstOrDefault(n => n.product_id == id);
                gh.pay_amount++;
            }
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}