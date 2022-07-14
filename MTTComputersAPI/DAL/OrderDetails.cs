using System;
using System.Collections.Generic;

namespace MTTComputersAPI.DAL
{
    public partial class OrderDetails 
    {
        public int? ProductId { get; set; }
        public int? Quantity { get; set; }
        public decimal? Price { get; set; }
    }
}
