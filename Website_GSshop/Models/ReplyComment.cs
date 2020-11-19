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
    
    public partial class ReplyComment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ReplyComment()
        {
            this.Like = new HashSet<Like>();
        }
    
        public int replycomment_id { get; set; }
        public string replycomment_content { get; set; }
        public Nullable<int> comment_id { get; set; }
        public Nullable<int> user_id { get; set; }
        public Nullable<int> product_id { get; set; }
        public Nullable<int> seller_id { get; set; }
        public Nullable<bool> replycomment_spam { get; set; }
        public Nullable<System.DateTime> replycomment_datecreated { get; set; }
        public Nullable<bool> replycomment_bin { get; set; }
    
        public virtual Comment Comment { get; set; }
        public virtual Product Product { get; set; }
        public virtual Seller Seller { get; set; }
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Like> Like { get; set; }
    }
}
