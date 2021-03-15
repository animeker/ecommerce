using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EcomApi.Controllers
{
    public class TestTestController : Controller
    {
        // /TestTest or /TestTest/Index won't work if you remove Index() method
        // GET: /TestTest or /TestTest/Index
        public ActionResult Index()
        {
            return View();
        }

        // GET: TestTest/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: TestTest/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: TestTest/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: TestTest/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: TestTest/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: TestTest/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: TestTest/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
