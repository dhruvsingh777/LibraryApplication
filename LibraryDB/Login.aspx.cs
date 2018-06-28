using LibraryDB.Utils;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryDB
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // if (IsPostBack)
            {
                
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            try
            {
                string uname = Username.Text;
                string pass = Password.Text;

                using ( DemoLibraryAppEntities context= new DemoLibraryAppEntities())
                {

                    var user = context.Users.FirstOrDefault(u => u.Username == uname);
                    if (user != null)
                    {
                        if(user.Password == pass)
                        {
                            Session["CurrentUser"] = user;
                            LibraryDB.User currentUser = Session["CurrentUser"] as LibraryDB.User;
                            if (currentUser.UserRole == "User")
                            {
                                Response.Redirect("HomeUser.aspx");
                            }
                            else
                            {
                                Response.Redirect("BookDB.aspx");
                            }
                        }
                        else
                        {
                            Response.Redirect("Register.aspx");
                        }
                    }
                    else
                    {
                        Response.Redirect("Register.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}