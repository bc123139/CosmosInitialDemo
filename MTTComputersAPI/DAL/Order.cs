using System;
using System.Collections.Generic;

namespace MTTComputersAPI.DAL
{
    public partial class Order
    {
        public int id { get; set; }
        public DateTime? OrderDate { get; set; }
        public int? CustomerId { get; set; }
        public decimal? TotalAmount { get; set; }
    }
}
