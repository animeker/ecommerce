using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using EcomApi.Models;
using Newtonsoft.Json;

namespace EcomApi.Controllers
{
    public class ProductsController : ApiController
    {
        OnlineStoreEntities db = new OnlineStoreEntities();

        public IEnumerable<Product> GetAllProducts()
        {
            //https://docs.microsoft.com/en-us/aspnet/web-api/overview/getting-started-with-aspnet-web-api/using-web-api-with-aspnet-web-forms
            List<Product> plist = db.Products.ToList();
            return plist;
        }

        //// GET api/Products
        //public string Get()
        //{
        //    var x = db.Products.ToList();

                               
        //    if (x == null)
        //    {
        //        return "no data found";

        //    }
        //    else
        //    {
        //        return JsonConvert.SerializeObject(x);

        //    }

        //}

        // GET api/Products/5
        public string Get(int id)
        {
            var category = db.Products.Where(d => d.ProductId == id).FirstOrDefault();

            if (category == null)
            {
                return "no data found";

            }
            else
            {
                return JsonConvert.SerializeObject(category);

            }
        }

        // PUT: api/Products1/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutProduct(int id, Product product)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != product.ProductId)
            {
                return BadRequest();
            }

            db.Entry(product).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
               
                    throw;
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Products1
        [HttpPost]
        public IHttpActionResult PostProduct(Product product)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Products.Add(product);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = product.ProductId }, product);
        }

        // DELETE: api/Products1/5
        [ResponseType(typeof(Product))]
        public IHttpActionResult DeleteProduct(int id)
        {
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return NotFound();
            }

            db.Products.Remove(product);
            db.SaveChanges();

            return Ok(product);
        }

        

        private bool ProductExists(int id)
        {
            return db.Products.Count(e => e.ProductId == id) > 0;
        }
    }
}