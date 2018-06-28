<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Menu.Master" CodeBehind="Login.aspx.cs" Inherits="LibraryDB.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPageContentHolder" runat="server">
    <form class="form-signin" id="form1" runat="server">
            <div>
                <asp:ScriptManager ID="ScriptManager" runat="server" />
            </div>
            <div class="py-5 text-center">
                <h1 class="h3 mb-3 font-weight-normal">Login Page</h1>
            </div>
            <div>
                <asp:TextBox ID="Username" runat="server" class="form-control"  placeholder="Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username Required" ControlToValidate="Username" ForeColor="#33CC33"></asp:RequiredFieldValidator>
            
                <asp:TextBox ID="Password" runat="server" class="form-control" type="password" placeholder="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password Required" ControlToValidate="Password" ForeColor="#33CC33"></asp:RequiredFieldValidator>

            </div>
            <div>
                <asp:Button ID="LoginButton" runat="server" class="btn btn-md btn-success" Text="Login" OnClick="Login_Click" />
                <input id="Reset1" class="btn btn-md btn-danger " type="reset" value="Reset" />
            </div>
            
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </form>

</asp:Content>
