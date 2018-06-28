<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Menuafter.Master" CodeBehind="HomeUser.aspx.cs" Inherits="LibraryDB.HomeUser" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainPageContentHolder" runat="server">
    <div class="py-5 text-center">
        <h1 class="h3 mb-3 font-weight-normal">Welcome <%= LibraryDB.Utils.AppSession.CurrentUser.Name %> .</h1>
        <br />
        <h4>Here is the list of your last 5 issued books.</h4>
        <br />
        <div class="container">
            <asp:GridView ID="GrdBook" runat="server"  style="width:100%;" AutoGenerateColumns="False"  BackColor="#DEBA84" OnSelectedIndexChanged="GrdBook_SelectedIndexChanged" OnRowCommand="GrdBook_RowCommand" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <Columns>


                <asp:BoundField ReadOnly="True" HeaderText="Title" InsertVisible="False" DataField="Title" SortExpression="Title"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Author" InsertVisible="False" DataField="Author" SortExpression="Author"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Category" InsertVisible="False" DataField="Category" SortExpression="Category"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Year" InsertVisible="False" DataField="Year" SortExpression="Year"></asp:BoundField>
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
        </div>
        

        </div>
</asp:Content>
