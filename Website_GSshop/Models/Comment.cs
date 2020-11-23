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
    
    public partial class Comment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Comment()
        {
            this.ReplyComment = new HashSet<ReplyComment>();
            this.Like = new HashSet<Like>();
        }
    
        public int comment_id { get; set; }
        public string comment_content { get; set; }
        public Nullable<System.DateTime> commet_datecreated { get; set; }
        public Nullable<int> user_id { get; set; }
        public Nullable<int> product_id { get; set; }
        public Nullable<bool> comment_spam { get; set; }
        public Nullable<bool> comment_bin { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ReplyComment> ReplyComment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Like> Like { get; set; }
        public virtual Product Product { get; set; }
        public virtual User User { get; set; }
    }
}
