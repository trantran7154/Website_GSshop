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
    
    public partial class Like
    {
        public int like_id { get; set; }
        public Nullable<System.DateTime> like_datecreated { get; set; }
        public Nullable<bool> like_bin { get; set; }
        public Nullable<int> product_id { get; set; }
        public Nullable<int> user_id { get; set; }
        public Nullable<int> replycomment_id { get; set; }
        public Nullable<int> comment_id { get; set; }
    
        public virtual Product Product { get; set; }
        public virtual ReplyComment ReplyComment { get; set; }
        public virtual User User { get; set; }
        public virtual Comment Comment { get; set; }
    }
}
