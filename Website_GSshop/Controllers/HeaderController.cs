﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Website_GSshop.Controllers
{
    public class HeaderController : Controller
    {
        // GET: Header
        public PartialViewResult Header()
        {
            return PartialView();
        }
    }
}