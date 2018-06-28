using LibraryDB.Utils;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibraryDB.Utils;

namespace LibraryDB
{
    public partial class BookDB : System.Web.UI.Page
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

        private List<Book> GetData()
        {
            using (DemoLibraryAppEntities context = new DemoLibraryAppEntities())
            {
                List<Book> books = context.Books.Where(x => x.IsDeleted == 0).ToList();
                return books ?? new List<Book>();
            }
        }

        private void BindGrid()
        {
            using (DemoLibraryAppEntities entities = new DemoLibraryAppEntities())
            {
                GrdBook.DataSource = GetData();
                GrdBook.DataBind();
            }
        }

        protected void GrdBook_Sorting(object sender, GridViewSortEventArgs e)
        {
            List<Book> books = GetData();
            books.SortList<Book>(e.SortExpression, e.SortDirection);
            GrdBook.DataSource = books;
            GrdBook.DataBind();

        }

        protected void Insert(object sender, EventArgs e)
        {
            using (DemoLibraryAppEntities entities = new DemoLibraryAppEntities())
            {
                LibraryDB.User currentUser = Session["CurrentUser"] as LibraryDB.User;
                Book NewBook = new Book
                {
                    Title = txtNewTitle.Text,
                    Author = txtAuthor.Text,
                    Category = txtCategory.Text,
                    Year = int.Parse(txtYear.Text),
                    Quantity = int.Parse(txtQuantity.Text),
                    Available = int.Parse(txtQuantity.Text),

                    IsDeleted = 0,
                    CreatedBy = currentUser.Name
                };

                entities.Books.Add(NewBook);
                entities.SaveChanges();
            }

            this.BindGrid();
            txtAuthor.Text = "";
            txtCategory.Text = "";
            txtYear.Text = "";
            txtQuantity.Text = "";

        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdBook.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }


        


        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GrdBook.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GrdBook.Rows[e.RowIndex];
            int bookid = Convert.ToInt32(GrdBook.DataKeys[e.RowIndex].Values[0]);
            string title = (row.FindControl("txtTitle") as TextBox).Text;
            string author = (row.FindControl("txtAuthor") as TextBox).Text;
            string category = (row.FindControl("txtCategory") as TextBox).Text;
            string year = (row.FindControl("txtYear") as TextBox).Text;
            string quantity = (row.FindControl("txtQuantity") as TextBox).Text;
            string available = (row.FindControl("txtQuantity") as TextBox).Text;

            using (DemoLibraryAppEntities entities = new DemoLibraryAppEntities())
            {
                Book NewBook = (from c in entities.Books
                                where c.BookID == bookid
                                select c).FirstOrDefault();
                NewBook.Title = title;
                NewBook.Author = author;
                NewBook.Category = category;
                NewBook.Year = int.Parse(year);
                NewBook.Quantity = int.Parse(quantity);
                NewBook.Available = int.Parse(available);
                entities.SaveChanges();

            }

            GrdBook.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GrdBook.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int bookid = Convert.ToInt32(GrdBook.DataKeys[e.RowIndex].Values[0]);
            using (DemoLibraryAppEntities entities = new DemoLibraryAppEntities())
            {
                Book NewBook = (from c in entities.Books
                                where c.BookID == bookid
                                select c).FirstOrDefault();
                NewBook.IsDeleted = 1;

                entities.SaveChanges();
            }
            this.BindGrid();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GrdBook.EditIndex)
            {
                (e.Row.Cells[7].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void AddBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBook.aspx");
        }
    }
}