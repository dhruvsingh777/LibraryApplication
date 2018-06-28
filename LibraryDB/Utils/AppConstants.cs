using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LibraryDB.Utils
{
    public static class AppConstants
    {
        public static string ConnectionStringName = "DefaultConnectionString";
    }

    public static class AppSession
    {
        public static User CurrentUser
        {
            get
            {
                return HttpContext.Current.Session["CurrentUser"] as User;
            }
            set
            {
                HttpContext.Current.Session["CurrentUser"] = value;
            }
        }
    }
}