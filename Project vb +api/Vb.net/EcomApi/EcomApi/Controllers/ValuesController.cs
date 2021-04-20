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
    public class ValuesController : ApiController
    {
         OnlineStoreEntities db = new OnlineStoreEntities();

        // GET api/values
        public string Get()
        {
            var x = db.Categories.ToList();
            if (x == null)
            {
                return "no data found";

            }
            else
            {
                return JsonConvert.SerializeObject(x);

            }

        }

        // GET api/values/5
        public string Get(int id)
        {
            var category = db.Categories.Where(d => d.Id == id).FirstOrDefault();

            if (category == null)
            {
                return "no data found";

            }
            else
            {
                return JsonConvert.SerializeObject(category);

            }
        }

        [HttpPost]
        public IHttpActionResult PostCategory(Category category)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Categories.Add(category);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = category.Id }, category);
        }


        // PUT: api/Categories1/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutCategory(int id, Category category)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != category.Id)
            {
                return BadRequest();
            }

            db.Entry(category).State = EntityState.Modified;

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

        // DELETE: api/Categories1/5
        [ResponseType(typeof(Category))]
        public IHttpActionResult DeleteCategory(int id)
        {
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return NotFound();
            }

            db.Categories.Remove(category);
            db.SaveChanges();

            return Ok(category);
        }



    }
}
