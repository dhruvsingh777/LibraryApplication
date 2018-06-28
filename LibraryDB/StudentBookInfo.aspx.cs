using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryDB
{
    public partial class StudentBookInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["CurrentUser"] != null)
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
                                       where t1.UserID == currentUser.UserID
                                       select new { t1.IssueID, t2.Title,t2.Author ,t1.IssueDate,t1.ReturnDate}).ToList();
                GrdBook.DataBind();
            }
        }
        


        protected void GrdBook_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GrdBook_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int row = int.Parse(e.CommandArgument.ToString());
            var issueId = int.Parse(GrdBook.Rows[row].Cells[0].Text.Trim());

            if (e.CommandName == "Submit")
            {
                using (DemoLibraryAppEntities context = new DemoLibraryAppEntities())
                {
                    LibraryDB.User currentUser = Session["CurrentUser"] as LibraryDB.User;
                    var issuedEntry = context.Issues.Where(x => x.IssueID == issueId).SingleOrDefault();
                    if(issuedEntry.ReturnDate == null)
                    {
                        issuedEntry.ReturnDate = DateTime.Now;
                        context.SaveChanges();
                        BindGrid();
                        Errorlabel.Text = " Submitted Successfully!";

                    }
                    else
                    {
                        Errorlabel.Text = "Already Submitted..!";
                    }
                }
            }
        }
    }
}