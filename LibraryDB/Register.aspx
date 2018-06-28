<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Menu.Master" CodeBehind="Register.aspx.cs" Inherits="LibraryDB.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPageContentHolder" runat="server">
    <form class="form-signin" id="form2" runat="server">
        <div>
            <div>
                <asp:ScriptManager ID="ScriptManager1" runat="server" />
            </div>
            
            <div class="py-5 text-center">
                <h1 class="h3 mb-3 font-weight-normal">Register</h1>
            </div>
            
            <asp:TextBox ID="Name" class="form-control" placeholder="Name" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Name" ErrorMessage="Name required" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:Label ID="ErrorMessage" runat="server" ForeColor="Red" Text=""></asp:Label>

            <asp:TextBox ID="Username" class="form-control" placeholder="Username" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Username" ErrorMessage="Username required." ForeColor="Red"></asp:RequiredFieldValidator>
            
            <asp:TextBox ID="Email" class="form-control" type="email" placeholder="Email" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Email" ErrorMessage="Email required." ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" ControlToValidate="Email" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>


            <asp:TextBox ID="Address" class="form-control" placeholder="Address" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Address" ErrorMessage="Address required" ForeColor="Red"></asp:RequiredFieldValidator>
                
            <asp:TextBox ID="Password" class="form-control" type="password" placeholder="Password" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Password" ErrorMessage="Password required" ForeColor="Red"></asp:RequiredFieldValidator>
            
                
            <asp:TextBox ID="CPasswordbox" class="form-control" type="password" placeholder="Confirm Password" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="CPasswordbox" ErrorMessage="Entered Password not same" ForeColor="Red"></asp:CompareValidator>
            
            <asp:DropDownList ID="UserRoleDrop" style="padding-top: 5px;" class="form-control" runat="server">
                <asp:ListItem>Select User Role</asp:ListItem>
                <asp:ListItem>User</asp:ListItem>
                <asp:ListItem>Admin</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="Select User Role" ErrorMessage="User Role required" ControlToValidate="UserRoleDrop" ForeColor="#FF3300"></asp:RequiredFieldValidator>


            <div style="padding-top:10px;">
                
                <asp:Button ID="RegisterUser" runat="server" class="btn btn-md btn-success" Text="Register" OnClick="Register_Click" />
                <input id="Reset1" class="btn btn-md btn-danger " type="reset" value="Reset" />
            </div>
        </div>
    </form>
</asp:Content>
