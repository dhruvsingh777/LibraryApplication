using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryDB
{
    public partial class IssuedBookDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] != null)
                {
                    LibraryDB.User currentUser = Session["CurrentUser"] as LibraryDB.User;

                    if (currentUser.UserRole == "Admin")
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

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdBook.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }


        private void BindGrid()
        {
            using (DemoLibraryAppEntities entities = new DemoLibraryAppEntities())
            {
                LibraryDB.User currentUser = Session["CurrentUser"] as LibraryDB.User;
                GrdBook.DataSource = (from t1 in entities.Issues
                                        join t2 in entities.Books
                                        on t1.BookID equals t2.BookID
                                        select new { t1.IssueID, t1.UserID,currentUser.Name,t1.BookID, t2.Title, t2.Author ,t1.IssueDate,t1.ReturnDate}).ToList();
                GrdBook.DataBind();
            }
        }
    }
}