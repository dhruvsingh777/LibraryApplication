<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Menuafter.Master" CodeBehind="BookDB.aspx.cs" Inherits="LibraryDB.BookDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainPageContentHolder" runat="server">

    <div class="py-5 text-center">
        <h1 class="h3 mb-3 font-weight-normal">List of all Books</h1>
    </div>

    <div class="container">
        <asp:GridView ID="GrdBook" runat="server" AllowSorting="True" OnSorting="GrdBook_Sorting" AutoGenerateColumns="False" DataKeyNames="BookID" PageSize="5" AllowPaging="True" OnPageIndexChanging="OnPageIndexChanging" OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <Columns>
                <asp:TemplateField SortExpression="BookID" HeaderText="BookID">
                    <ItemTemplate>
                        <asp:Label ID="lblbookID" runat="server" Text='<%# Eval("BookID") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="40px"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="Title" HeaderText="Title">
                    <ItemTemplate>
                        <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTitle" runat="server" Style="width: 100%;" Text='<%# Eval("Title") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RsfequiredFieldValidator1" ValidationGroup="EditBookGroup" runat="server" ErrorMessage="Title required" ControlToValidate="txtTitle" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Author" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblAuthor" runat="server" Text='<%# Eval("Author") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAuthor" runat="server" Style="width: 100%;" Text='<%# Eval("Author") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="EditBookGroup" runat="server" ErrorMessage="Author required" ControlToValidate="txtAuthor" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Category">
                    <ItemTemplate>
                        <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCategory" Style="width: 100%;" runat="server" Text='<%# Eval("Category") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="EditBookGroup" runat="server" ErrorMessage="Category required" ControlToValidate="txtCategory" ForeColor="Red"></asp:RequiredFieldValidator>

                    </EditItemTemplate>

                    <ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Year">
                    <ItemTemplate>
                        <asp:Label ID="lblYear" runat="server" Text='<%# Eval("Year") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtYear" Style="width: 100%;" runat="server" Text='<%# Eval("Year") %>'></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtYear" MaximumValue="2018" MinimumValue="1" Type="Integer" ErrorMessage="Invalid Year" ForeColor="Red"></asp:RangeValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="EditBookGroup" runat="server" ErrorMessage="Year required" ControlToValidate="txtYear" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator runat="server" Operator="DataTypeCheck" ValidationGroup="EditBookGroup" Type="Integer" ControlToValidate="txtYear" ErrorMessage="Incorrect" ForeColor="Red" />
                    </EditItemTemplate>

                    <ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Qunatity" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtQuantity" Style="width: 100%;" runat="server" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtQuantity" MaximumValue="100" MinimumValue="1" Type="Integer" ErrorMessage="Max 100" ForeColor="Red"></asp:RangeValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="EditBookGroup" runat="server" ErrorMessage="Quantity required" ControlToValidate="txtQuantity" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator runat="server" Operator="DataTypeCheck" ValidationGroup="EditBookGroup" Type="Integer" ControlToValidate="txtQuantity" ErrorMessage="Incorrect" ForeColor="Red" />
                    </EditItemTemplate>

                    <ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Available" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblAvailable" runat="server" Text='<%# Eval("Available") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAvailable" Style="width: 100%;" runat="server" Text='<%# Eval("Available") %>'></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtAvailable" MaximumValue="100" MinimumValue="1" Type="Integer" ErrorMessage="Max 100" ForeColor="Red"></asp:RangeValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="EditBookGroup" runat="server" ErrorMessage="Available required" ControlToValidate="txtAvailable" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator runat="server" Operator="DataTypeCheck" ValidationGroup="EditBookGroup" Type="Integer" ControlToValidate="txtAvailable" ErrorMessage="Incorrect" ForeColor="Red" />
                    </EditItemTemplate>


                    <ItemStyle Width="100"></ItemStyle>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Link" ShowEditButton="true" ValidationGroup="EditBookGroup" ShowDeleteButton="true" ItemStyle-Width="150" CancelText="&lt;ion-icon name=&quot;close&quot;&gt;&lt;/ion-icon&gt;" DeleteText="  &lt;ion-icon name=&quot;trash&quot;&gt;&lt;/ion-icon&gt;" EditText="&lt;ion-icon name=&quot;arrow-down&quot;&gt;&lt;/ion-icon&gt;" UpdateText="  &lt;ion-icon name=&quot;checkmark&quot;&gt;&lt;/ion-icon&gt;">
                    <ItemStyle Width="100px"></ItemStyle>
                </asp:CommandField>
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
        <div>
            <table style="margin-top: 20px; border-collapse: collapse;" border="1" class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col" style="width: 220px">Title</th>
                    <th scope="col">Author</th>
                    <th scope="col" style="width: 273px">Category</th>
                    <th scope="col" style="width: 220px">Year</th>
                    <th scope="col" style="width: 235px">Quantity</th>
                    <th scope="col" style="width: 160px">Add</th>
                </tr>
            </thead>
            <tbody >
                <tr>
                    <td ">
                        <asp:TextBox ID="txtNewTitle" runat="server" />
                        <asp:RequiredFieldValidator ID="ReqsuiredFieldValidator1" ValidationGroup="AddBookGroup" runat="server" ErrorMessage="Title required" ControlToValidate="txtNewTitle" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td >
                        <asp:TextBox ID="txtAuthor" runat="server"  />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="AddBookGroup" ErrorMessage="Author required" ControlToValidate="txtAuthor" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCategory" runat="server"  />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="AddBookGroup" ErrorMessage="Category required" ControlToValidate="txtCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td >
                        <asp:TextBox ID="txtYear" runat="server" />
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtYear" ValidationGroup="AddBookGroup" MaximumValue="2018" MinimumValue="1" Type="Integer" ErrorMessage="Invalid Year" ForeColor="Red"></asp:RangeValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="AddBookGroup" ErrorMessage="Year is required" ControlToValidate="txtYear" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtYear" ErrorMessage="Incorrect Data" ForeColor="Red" />
                    </td>
                    <td >
                        <asp:TextBox ID="txtQuantity" runat="server"  />
                        <asp:RangeValidator ID="RangeValidator6" runat="server" ControlToValidate="txtQuantity" ValidationGroup="AddBookGroup" MaximumValue="100" MinimumValue="1" Type="Integer" ErrorMessage="Max 100" ForeColor="Red"></asp:RangeValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="AddBookGroup" ErrorMessage="Quantity required" ControlToValidate="txtQuantity" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtQuantity" ErrorMessage="Incorrect Data" ForeColor="Red" />
                    </td>


                    <td ">
                        <asp:Button ID="btnAdd" runat="server" ValidationGroup="AddBookGroup"  Text="Submit" OnClick="Insert" />
                    </td>
                </tr>
            </tbody>

        </table>

        <br />
        <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
        <br />
        <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" />
        </div>
        
    </div>






</asp:Content>
