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

    public class CustomerController : ApiController
    {
        OnlineStoreEntities db = new OnlineStoreEntities();

        // GET api/Customer
        public string Get()
        {
            var x = db.Customers.ToList();


            if (x == null)
            {
                return "no data found";

            }
            else
            {
                return JsonConvert.SerializeObject(x);

            }

        }

        // GET api/Customer/5
        public string Get(int id)
        {
            var category = db.Customers.Where(d => d.Id == id).FirstOrDefault();

            if (category == null)
            {
                return "no data found";

            }
            else
            {
                return JsonConvert.SerializeObject(category);

            }
        }

    }
}