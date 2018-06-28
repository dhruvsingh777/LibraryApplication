<%@ Page Language="C#" MasterPageFile="~/Menuafter.Master" AutoEventWireup="true" CodeBehind="StudentBookInfo.aspx.cs" Inherits="LibraryDB.StudentBookInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPageContentHolder" runat="server">
    <div class="py-5 text-center">
        <h1 class="h3 mb-3 font-weight-normal">Your books</h1>
    </div>
    
    <div style="width: 100%;" class="container">
        <asp:GridView ID="GrdBook" runat="server"  style="width:100%;" AutoGenerateColumns="False"  PageSize="5" AllowPaging="True" OnPageIndexChanging="OnPageIndexChanging" BackColor="#DEBA84" OnSelectedIndexChanged="GrdBook_SelectedIndexChanged" OnRowCommand="GrdBook_RowCommand" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <Columns>

                <asp:BoundField ReadOnly="True" HeaderText="IssueID" InsertVisible="False" DataField="IssueID" SortExpression="IssueID"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Title" InsertVisible="False" DataField="Title" SortExpression="Title"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Author" InsertVisible="False" DataField="Author" SortExpression="Author"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="IssueDate" InsertVisible="False" DataField="IssueDate" SortExpression="IssueDate"></asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="ReturnDate" InsertVisible="False" DataField="ReturnDate" SortExpression="ReturnDate"></asp:BoundField>
                <asp:ButtonField Text='<ion-icon name="return-left"></ion-icon>'  CommandName="Submit"  />
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
        <asp:Label ID="Errorlabel" runat="server" style="font-size:large;" Text="" ForeColor="Red"></asp:Label>
    </div>

</asp:Content>
