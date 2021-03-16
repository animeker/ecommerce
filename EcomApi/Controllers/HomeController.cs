using EcomApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EcomApi.Controllers
{

    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            ProductsController products = new ProductsController();

            // ViewBag enables sharing of values dynamically between the Controller and View
            ViewBag.Name = "JohnDoe";
            ViewBag.Product1 = products.Get(1);
            // ViewBag.Products = products.Get();

            // View() returns the name of the action method which is the index, "ActionResult Index()"
            return View();
        }

        public ActionResult Products()
        {

            return View();
        }

       
    }
}