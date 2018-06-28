using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryDB
{
    public partial class SearchBook : System.Web.UI.Page
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
                        
                    }
                    else
                    {
                        Response.Redirect("BookDB.aspx");
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
                GrdBook.DataSource = (from book in entities.Books
                                      where book.IsDeleted == 0
                                      select book).ToList();
                GrdBook.DataBind();
            }
        }


        protected void SearchTitle_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text;

            using (DemoLibraryAppEntities context = new DemoLibraryAppEntities())
            {
                GrdBook.DataSource = (from b in context.Books where b.Title.Contains(title) && b.IsDeleted==0 select b).ToList();
                GrdBook.DataBind();

            }
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdBook.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }



        protected void GrdBook_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GrdBook_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            using (DemoLibraryAppEntities context = new DemoLibraryAppEntities())
            {
                int row = int.Parse(e.CommandArgument.ToString());
                var bookid = int.Parse(GrdBook.Rows[row].Cells[0].Text.Trim());
                Book bookToIssue = context.Books.Where(x => x.BookID == bookid).SingleOrDefault();
                if (bookToIssue.Issues.Where(x => x.ReturnDate != null).Count() < bookToIssue.Quantity)
                {

                }
                if (e.CommandName == "Issue")
                {

                    var issuedResult = IssueBook(bookid);
                    if (!issuedResult)
                    {
                        Errorlabel.Text = "Already issued";
                    }
                    else
                    {
                        Errorlabel.Text = "Issued Successfully.";
                    }
                }
            }
        }

        private bool IsAlreadyIssued(int userId, int bookId)
        {
            using (DemoLibraryAppEntities context = new DemoLibraryAppEntities())
            {
              var user =  context.Users.Where(x => x.UserID == userId).SingleOrDefault();
                if (user != null)
                {
                    return user.Issues.Any(x => x.BookID == bookId);
                }
            }
            return false;
        }

        private bool IssueBook(int bookId)
        {
            int resultCount = 0;
            using (DemoLibraryAppEntities context = new DemoLibraryAppEntities())
            {
                LibraryDB.User currentUser = Session["CurrentUser"] as LibraryDB.User;
                Book bookToIssue = context.Books.Where(x => x.BookID == bookId).SingleOrDefault();

                if (!IsAlreadyIssued(currentUser.UserID, bookId))
                {
                    bookToIssue.Issues.Add(new Issue
                    {
                        BookID = bookToIssue.BookID,
                        UserID = currentUser.UserID,
                        IssueDate = DateTime.Now
                    });
                    --bookToIssue.Available;
                    resultCount = context.SaveChanges();
                }
            }
            return resultCount > 0;
        }
    }
}