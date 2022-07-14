using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MTTComputersAPI;
using MTTComputersAPI.DAL;
using MTTComputersAPI.Model;
using Azure.Storage.Queues;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using Microsoft.Azure.Cosmos.Table;
using Microsoft.Azure.Cosmos;

namespace MTTComputersAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IConfiguration _config;
        public OrdersController(AppDbContext context, IConfiguration config)
        {
            _context = context;
            _config = config;
        }

        // GET: api/Orders
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Order>>> GetOrder()
        {
            return await _context.Order.ToListAsync();
        }

        // GET: api/Orders/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Order>> GetOrder(int id)
        {
            var order = await _context.Order.FindAsync(id);

            if (order == null)
            {
                return NotFound();
            }

            return order;
        }

        // PUT: api/Orders/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut]
        public async Task<IActionResult> PutOrder([FromBody] OrderViewModel orderVM)
        {
            string conString = _config["CosmosConString"];

            CosmosClient cosmosClient = new CosmosClient(conString);

            Container container = cosmosClient.GetContainer("ecommerce", "orders");

            await container.UpsertItemAsync<OrderViewModel>(orderVM);

            return NoContent();
        }

        // POST: api/Orders
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Order>> PostOrder([FromBody] OrderViewModel orderVM)
        {
            #region Generate Order EF Code
            //Order order = new Order()
            //{
            //    CustomerId = orderVM.CustomerId,
            //    OrderDate = DateTime.Now,
            //    TotalAmount = orderVM.TotalAmount
            //};
            //_context.Order.Add(order);
            //await _context.SaveChangesAsync();

            //foreach (var item in orderVM.orderDetails)
            //{
            //    OrderDetails orderDetails = new OrderDetails()
            //    {
            //        OrderId = order.Id,
            //        Price = item.Price,
            //        ProductId = item.ProductId,
            //        Quantity = item.Quantity
            //    };
            //    _context.OrderDetails.Add(orderDetails);
            //    await _context.SaveChangesAsync();
            //}

            #endregion

            #region OrderProcessing Unit
            //string msgBody = JsonConvert.SerializeObject(orderVM);
            //QueueClient orderQueue = new QueueClient(_config["StorageConnectionString"], _config["StorageQueueName"]);

            //await orderQueue.SendMessageAsync(msgBody);
            #endregion

            #region Table Storage OrderHistory
            //CloudStorageAccount acct = CloudStorageAccount.Parse(_config["StorageConnectionString"]);

            //var tableClient = acct.CreateCloudTableClient();

            //var table = tableClient.GetTableReference("orderhistory");

            //foreach(var item in orderVM.orderDetails)
            //{
            //    item.PartitionKey = "history";
            //    item.RowKey = Guid.NewGuid().ToString();

            //    TableOperation ins = TableOperation.InsertOrMerge(item);

            //    var result = await table.ExecuteAsync(ins);
            //}

            #endregion


            #region Store Data in Cosmos
            string conString = _config["CosmosConString"];

            CosmosClient cosmosClient = new CosmosClient(conString);

            Container container = cosmosClient.GetContainer("ecommerce", "orders");

            //orderVM.id = Guid.NewGuid();

            await container.CreateItemAsync<OrderViewModel>(orderVM,
                new PartitionKey(orderVM.CustomerName));


            #endregion
            return Ok();
        }

        [HttpGet("ReadQueue")]
        public async Task<IActionResult> ReadQueue()
        {
            QueueClient orderQueue = new QueueClient(_config["StorageConnectionString"], _config["StorageQueueName"]);

            var result = orderQueue.ReceiveMessages();
            return Ok(result);
        }

        [HttpGet("OrderHistory")]
        public async Task<IActionResult> OrderHistory()
        {
            string conString = _config["CosmosConString"];

            CosmosClient cosmosClient = new CosmosClient(conString);

            Container container = cosmosClient.GetContainer("ecommerce", "orders");

            List<OrderViewModel> result = new List<OrderViewModel>();

            string queryText = $"SELECT * FROM c where c.TotalAmount >  1000";

            var query = container.GetItemQueryIterator<OrderViewModel>(new QueryDefinition(queryText));
            try
            {
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    result.AddRange(response);
                }
            }
            catch(Exception ex)
            {

            }

            return Ok(result);
        }
        // DELETE: api/Orders/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Order>> DeleteOrder(int id)
        {
            var order = await _context.Order.FindAsync(id);
            if (order == null)
            {
                return NotFound();
            }

            _context.Order.Remove(order);
            await _context.SaveChangesAsync();

            return order;
        }
    }
}
