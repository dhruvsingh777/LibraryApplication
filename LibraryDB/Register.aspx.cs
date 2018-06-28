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
    public partial class Register : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            try
            {
                string username = Username.Text;

                using (DemoLibraryAppEntities context = new DemoLibraryAppEntities())
                {
                    var user = context.Users.FirstOrDefault(u => u.Username == username);
                    if (user != null)
                    {
                        ErrorMessage.Text = "Username already exists.";
                    }
                    else
                    {

                        User useradd = new User();
                        useradd.Name = Name.Text;
                        useradd.Username = Username.Text;
                        useradd.Email = Email.Text;
                        useradd.Address = Address.Text;
                        useradd.Password = Password.Text;
                        useradd.UserRole = UserRoleDrop.Text;
                        context.Users.Add(useradd);
                        context.SaveChanges();
                        Response.Redirect("Login.aspx");
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