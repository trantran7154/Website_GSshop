using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Website_GSshop.Models
{
    public class ForgotPassword
    {
        public int IDForgot { get; set; }
        public String ConfirmationEmail { get; set; }
        public String Theme { get; set; }
        public String Content { get; set; }
        public string Bcc { get; set; }
        public string Cc { get; set; }
    }
}