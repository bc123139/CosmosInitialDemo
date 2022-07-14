using Microsoft.EntityFrameworkCore;
using MTTComputersAPI.DAL;
using System;
using System.Collections.Generic;
using System.Text;

namespace MTTComputersAPI
{
    public class AppDbContext : DbContext
    {
        public AppDbContext()
        {
        }

        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }
        public virtual DbSet<Order> Order { get; set; }
        //public virtual DbSet<OrderDetails> OrderDetails { get; set; }
        public virtual DbSet<Product> Product { get; set; }
    }
}
