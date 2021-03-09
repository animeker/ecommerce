using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
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

        // POST api/values
        public void Post([FromBody] string value)
        {

        
        }

        // PUT api/values/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {

        }
    }
}
