﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Data_GSShopEntities : DbContext
    {
        public Data_GSShopEntities()
            : base("name=Data_GSShopEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AdminData> AdminData { get; set; }
        public virtual DbSet<Banner> Banner { get; set; }
        public virtual DbSet<Bill> Bill { get; set; }
        public virtual DbSet<BillStatus> BillStatus { get; set; }
        public virtual DbSet<Category> Category { get; set; }
        public virtual DbSet<ClassificationSubCategory> ClassificationSubCategory { get; set; }
        public virtual DbSet<Collection> Collection { get; set; }
        public virtual DbSet<Comment> Comment { get; set; }
        public virtual DbSet<Favourite> Favourite { get; set; }
        public virtual DbSet<GSMall> GSMall { get; set; }
        public virtual DbSet<Like> Like { get; set; }
        public virtual DbSet<PayDetail> PayDetail { get; set; }
        public virtual DbSet<ReplyComment> ReplyComment { get; set; }
        public virtual DbSet<Seller> Seller { get; set; }
        public virtual DbSet<SubCategory> SubCategory { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<Product> Product { get; set; }
    }
}
