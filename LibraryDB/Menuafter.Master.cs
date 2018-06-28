using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryDB
{
    public partial class Menuafter : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] != null)
            {
                LibraryDB.User currentUser = Session["CurrentUser"] as LibraryDB.User;

                SignedInUser.Text = "Signed in as: " + currentUser.Name.ToString();
            }
            
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            
            Response.Redirect("Login.aspx");
        }

    }
}