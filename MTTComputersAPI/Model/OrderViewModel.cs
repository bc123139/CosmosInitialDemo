using MTTComputersAPI.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTTComputersAPI.Model
{
    public class OrderViewModel
    {
        public string id { get; set; }
        public DateTime? OrderDate { get; set; }
        public string CustomerName { get; set; }
        public decimal? TotalAmount { get; set; }
        public List<OrderDetails> orderDetails { get; set; }
    }
}
