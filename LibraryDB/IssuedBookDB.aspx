<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Menuafter.Master" CodeBehind="IssuedBookDB.aspx.cs" Inherits="LibraryDB.IssuedBookDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPageContentHolder" runat="server">

    <div style="text-align:center; padding:20px 120px; width:80%;" class="container" >
        <div class="py-5 text-center">
        <h1 class="h3 mb-3 font-weight-normal">All books issued to the Users</h1>
    </div>
        <asp:GridView ID="GrdBook" PageSize="5" AllowPaging="True" OnPageIndexChanging="OnPageIndexChanging" style="width:100%;" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderWidth="1px" CellPadding="3" BorderStyle="None" CellSpacing="2">
            <AlternatingRowStyle HorizontalAlign="Center" />
            <Columns>

                <asp:BoundField ReadOnly="True" HeaderText="IssueID" InsertVisible="False" DataField="IssueID" SortExpression="IssueID"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="UserID" InsertVisible="False" DataField="UserID" SortExpression="UserID"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Name" InsertVisible="False" DataField="Name" SortExpression="Name"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="BookID" InsertVisible="False" DataField="BookID" SortExpression="BookID"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Title" InsertVisible="False" DataField="Title" SortExpression="Title"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Author" InsertVisible="False" DataField="Author" SortExpression="Author"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="IssueDate" InsertVisible="False" DataField="IssueDate" SortExpression="IssueDate"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="ReturnDate" InsertVisible="False" DataField="ReturnDate" SortExpression="ReturnDate"></asp:BoundField>

            </Columns>

            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" ForeColor="White" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
    </div>
</asp:Content>

