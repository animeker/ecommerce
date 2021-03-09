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
    public class CartController : ApiController
    {
        OnlineStoreEntities db = new OnlineStoreEntities();

        // GET api/Cart
        public string Get()
        {
            var x = db.Carts.ToList();


            if (x == null)
            {
                return "no data found";

            }
            else
            {
                return JsonConvert.SerializeObject(x);

            }

        }

    

    }

}