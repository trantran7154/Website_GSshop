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
    
    public partial class User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User()
        {
            this.Comment = new HashSet<Comment>();
            this.Favourite = new HashSet<Favourite>();
            this.Like = new HashSet<Like>();
            this.PayDetail = new HashSet<PayDetail>();
            this.Product = new HashSet<Product>();
            this.Product1 = new HashSet<Product>();
            this.ReplyComment = new HashSet<ReplyComment>();
            this.Bill = new HashSet<Bill>();
        }
    
        public int user_id { get; set; }
        public string user_pass { get; set; }
        public string user_nicename { get; set; }
        public string user_email { get; set; }
        public Nullable<System.DateTime> user_datecreated { get; set; }
        public string user_token { get; set; }
        public Nullable<System.DateTime> user_datelogin { get; set; }
        public Nullable<bool> user_active { get; set; }
        public string user_address { get; set; }
        public string user_telephone { get; set; }
        public string user_image { get; set; }
        public string user_provincecity { get; set; }
        public string user_district { get; set; }
        public Nullable<bool> user_bin { get; set; }
        public Nullable<int> user_role { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comment> Comment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Favourite> Favourite { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Like> Like { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PayDetail> PayDetail { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product> Product { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product> Product1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ReplyComment> ReplyComment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Bill> Bill { get; set; }
    }
}
