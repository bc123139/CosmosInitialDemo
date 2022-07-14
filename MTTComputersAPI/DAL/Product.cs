using System;
using System.Collections.Generic;

namespace MTTComputersAPI.DAL
{
    public partial class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImagePath { get; set; }
        public string Price { get; set; }
    }
}
