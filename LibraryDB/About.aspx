<%@ Page Language="C#" MasterPageFile="~/Menuafter.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="LibraryDB.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPageContentHolder" runat="server">
    <br />
    <h2><%: Title %>.</h2>
    <br />
    <div class="text-left">
        <h4>Library application which can be used by the user to issue books of his/her choice. Further functionalities are also provided to the user.</h4>
        <br />
        <p>Admin role has been created to give a admin power to add or edit books in the system. He also has access to all the book records.</p>
    </div>

</asp:Content>
