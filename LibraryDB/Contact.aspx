<%@ Page Language="C#" MasterPageFile="~/Menuafter.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="LibraryDB.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPageContentHolder" runat="server">
    <br />
    <h2><%: Title %>.</h2>
    <br />
    <br />
    <h3>Contact Us</h3>
    <address>
        Particle41
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@particle41.com">Support@particle41.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@particle41.com</a>
    </address>
</asp:Content>

