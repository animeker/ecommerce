using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using EcomApi.Models;
using Newtonsoft.Json;

namespace EcomApi.Controllers
{
    public class ProductsController : ApiController
    {
        public ActionResult Products()
        {
            return View();
        }

        private ActionResult View()
        {
            throw new NotImplementedException();
        }

        OnlineStoreEntities db = new OnlineStoreEntities();

        // GET api/Products
        public string Get()
        {
            var x = db.Products.ToList();

                               
            if (x == null)
            {
                return "no data found";

            }
            else
            {
                return JsonConvert.SerializeObject(x);

            }

        }

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

    }
}