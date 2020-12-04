//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Website_GSshop.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            this.Comment = new HashSet<Comment>();
            this.Favourite = new HashSet<Favourite>();
            this.Like = new HashSet<Like>();
            this.PayDetail = new HashSet<PayDetail>();
            this.ReplyComment = new HashSet<ReplyComment>();
            this.ReplyComment1 = new HashSet<ReplyComment>();
        }
    
        public int product_id { get; set; }
        public string product_name { get; set; }
        public string product_image { get; set; }
        public Nullable<System.DateTime> product_datecreated { get; set; }
        public Nullable<bool> product_active { get; set; }
        public string product_note { get; set; }
        public Nullable<decimal> product_price { get; set; }
        public Nullable<bool> product_ship { get; set; }
        public Nullable<int> product_view { get; set; }
        public Nullable<int> product_love { get; set; }
        public string product_color { get; set; }
        public string product_size { get; set; }
        public string product_detail { get; set; }
        public string product_description { get; set; }
        public Nullable<bool> product_option { get; set; }
        public Nullable<decimal> product_sale { get; set; }
        public Nullable<int> product_amount { get; set; }
        public Nullable<System.DateTime> product_dateedit { get; set; }
        public Nullable<int> seller_id { get; set; }
        public Nullable<int> category_id { get; set; }
        public Nullable<int> subcategory_id { get; set; }
        public Nullable<int> banner_id { get; set; }
        public Nullable<int> collection_id { get; set; }
        public Nullable<int> gsmail_id { get; set; }
        public Nullable<bool> product_bin { get; set; }
        public Nullable<int> product_related { get; set; }
        public Nullable<int> user_id { get; set; }
        public Nullable<int> csc_id { get; set; }
    
        public virtual Banner Banner { get; set; }
        public virtual Category Category { get; set; }
        public virtual ClassificationSubCategory ClassificationSubCategory { get; set; }
        public virtual Collection Collection { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comment> Comment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Favourite> Favourite { get; set; }
        public virtual GSMall GSMall { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Like> Like { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PayDetail> PayDetail { get; set; }
        public virtual Seller Seller { get; set; }
        public virtual SubCategory SubCategory { get; set; }
        public virtual User User { get; set; }
        public virtual User User1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ReplyComment> ReplyComment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ReplyComment> ReplyComment1 { get; set; }
    }
}
