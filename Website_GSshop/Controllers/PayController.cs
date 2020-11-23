//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.Mvc;
//using Website_GSshop.Models;

//namespace Website_GSshop.Controllers
//{
//    public class PayController : Controller
//    {
//        Data_GSShopEntities db = new Data_GSShopEntities();
//        // GET: Pay
//        [HttpPost]
//        public ActionResult ShoppingCart(FormCollection f)
//        {
//            List<ShoppingCarts> ghtt = Session["sptt"] as List<ShoppingCarts>;
//            return View(ghtt);
//        }
//        public ActionResult AddToCart(int? idproduct)
//        {
//            if (Session["sptt"] == null)
//            {
//                Session["sptt"] = new List<ShoppingCarts>();
//                Session["count"] = "Trống";
//            }
//            List<ShoppingCarts> ghtt = Session["sptt"] as List<ShoppingCarts>;
//            if (ghtt.FirstOrDefault(n => n.product_id == idproduct) == null)
//            {
//                Product pr = db.Product.Find(idproduct);
//                if (Session["count"].ToString() == "Trống")
//                    Session["count"] = "0";
//                Session["count"] = Int32.Parse(Session["count"].ToString()) + 1;
//                ShoppingCarts value = new ShoppingCarts()
//                {
//                    product_id = pr.product_id,
//                    product_image = pr.product_image,
//                    product_name = pr.product_name,
//                    pay_amount = 1,
//                    product_price = decimal.ToInt32(pr.product_price.Value)
//                };
//                ghtt.Add(value);
//            }
//            else
//            {
//                ShoppingCarts gh = ghtt.FirstOrDefault(n => n.product_id == idproduct);
//                gh.pay_amount++;
//            }
//            return Redirect(Request.UrlReferrer.ToString());
//        }
//        [HttpGet]
//        public ActionResult PayCart()
//        {
//            List<ShoppingCarts> ghtt = Session["sptt"] as List<ShoppingCarts>;
//            User user= db.User.Find(Int32.Parse(Session["mand"].ToString()));
//            PayDetail pd = new PayDetail();
//            pd.user_id = user.user_id;
//            var i = ghtt;
//            pd.pay_money = i.Sum(n => n.product_price);
//            pd.pay_amount = i.Sum(n => n.pay_amount);
//            return View(pd);
//        }
//        [HttpPost]
//        public ActionResult ThanhToan([Bind(Include = "maDH,maKH,Email,tinhTP,quanHuyen,ghiChu,PTVC,PTTT,maKM,SDT,maSP,thanhTien,ngayMua,soLuong")] ChiTietDonHang chiTietDonHang)
//        {
//            KhachHang kh = (KhachHang)Session["tk"];
//            if (ModelState.IsValid)
//            {
//                chiTietDonHang.ngayMua = DateTime.Now;
//                chiTietDonHang.maKH = kh.maKH;
//                db.ChiTietDonHangs.Add(chiTietDonHang);
//                db.SaveChanges();
//                return RedirectToAction("/ThanhToanTC/ThanhToan");
//            }
//            ViewBag.maKH = new SelectList(db.KhachHangs, "maKH", "tenKH", chiTietDonHang.maKH);
//            ViewBag.maSP = new SelectList(db.SanPhams, "maSP", "noiDung", chiTietDonHang.maSP);
//            return View(chiTietDonHang);
//        }
//        public RedirectToRouteResult Xoa(int masp)
//        {
//            List<GioHangTT> ghtt = Session["sptt"] as List<GioHangTT>;
//            GioHangTT xoa = ghtt.FirstOrDefault(n => n.maSP == masp);
//            if (xoa != null)
//            {
//                ghtt.Remove(xoa);
//                Session["dem"] = Int32.Parse(Session["dem"].ToString()) - 1;
//            }
//            return RedirectToAction("GioHang");
//        }
//        public RedirectToRouteResult CapNhat(int masp, int mamoi)
//        {
//            List<GioHangTT> ghtt = Session["sptt"] as List<GioHangTT>;
//            GioHangTT capnhat = ghtt.FirstOrDefault(n => n.maSP == masp);
//            if (capnhat != null)
//            {
//                capnhat.soLuong = mamoi;
//            }
//            return RedirectToAction("GioHang");
//        }
//    }
//}