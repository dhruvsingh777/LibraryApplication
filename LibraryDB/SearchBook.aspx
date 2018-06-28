<%@ Page Language="C#" MasterPageFile="~/Menuafter.Master" AutoEventWireup="true" CodeBehind="SearchBook.aspx.cs" Inherits="LibraryDB.SearchBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPageContentHolder" runat="server">
    <div class="py-5 text-center">
        <h1 class="h3 mb-3 font-weight-normal">Search your Book</h1>
    </div>
    <div class="container" style="width: 100%;">
        <div style="margin: 10px;">
            <asp:TextBox ID="txtTitle" type="search" placeholder="Search" aria-label="Search" runat="server"></asp:TextBox>
            <asp:Button ID="SearchTitle" runat="server" class="btn btn-outline-success my-2 my-sm-0" type="submit" Text="Search by Title" OnClick="SearchTitle_Click" />
            
        </div>
        <asp:GridView ID="GrdBook"  Style="width: 100%;" runat="server" AllowSorting="true" PageSize="5" AllowPaging="True" OnPageIndexChanging="OnPageIndexChanging" BackColor="#DEBA84" AutoGenerateColumns="False" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
            OnSelectedIndexChanged="GrdBook_SelectedIndexChanged" OnRowCommand="GrdBook_RowCommand">
            <Columns>
                <asp:BoundField ReadOnly="True" HeaderText="BookID" InsertVisible="False" DataField="BookID" SortExpression="BookID"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Title" InsertVisible="False" DataField="Title" SortExpression="Title"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Author" InsertVisible="False" DataField="Author" SortExpression="Author"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Category" InsertVisible="False" DataField="Category" SortExpression="Category"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Year" InsertVisible="False" DataField="Year" SortExpression="Year"></asp:BoundField>
                <asp:ButtonField Text="&lt;ion-icon name=&quot;cart&quot;&gt;&lt;/ion-icon&gt;" CommandName="Issue" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>

        <asp:Label ID="Errorlabel"  runat="server" style="font-size: large; margin-top:30px;" Text="" ForeColor="Red" ></asp:Label>
    </div>
</asp:Content>
