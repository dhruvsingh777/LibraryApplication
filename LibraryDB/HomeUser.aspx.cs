using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryDB
{
    public partial class HomeUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] != null)
                {
                    LibraryDB.User currentUser = Session["CurrentUser"] as LibraryDB.User;

                    if (currentUser.UserRole == "User")
                    {
                        BindGrid();
                    }
                    else
                    {
                        Response.Redirect("Login.aspx");
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }


        private void BindGrid()
        {
            using (DemoLibraryAppEntities entities = new DemoLibraryAppEntities())
            {
                LibraryDB.User currentUser = Session["CurrentUser"] as LibraryDB.User;
                GrdBook.DataSource = (from t1 in entities.Issues
                                      join t2 in entities.Books
                                      on t1.BookID equals t2.BookID
                                      where t1.UserID == currentUser.UserID
                                      orderby t1.IssueDate descending
                                      select t2).Take(5).ToList();
                GrdBook.DataBind();
            }
        }
        protected void GrdBook_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void GrdBook_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}