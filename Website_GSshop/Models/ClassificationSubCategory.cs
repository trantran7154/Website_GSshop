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
    
    public partial class ClassificationSubCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ClassificationSubCategory()
        {
            this.Product = new HashSet<Product>();
        }
    
        public int csc_id { get; set; }
        public string csc_name { get; set; }
        public string csc_image { get; set; }
        public Nullable<System.DateTime> csc_datecreate { get; set; }
        public Nullable<bool> csc_active { get; set; }
        public Nullable<int> subcategory_id { get; set; }
        public Nullable<bool> csc_bin { get; set; }
    
        public virtual SubCategory SubCategory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product> Product { get; set; }
    }
}
