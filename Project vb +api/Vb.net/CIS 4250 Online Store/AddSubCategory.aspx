<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="AddSubCategory.aspx.vb" Inherits="CIS_4250_Online_Store.AddSubCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
</asp:Content>
<asp:Content Visible="false" ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <div class="col-md-6 col-md-offset-2">
            <asp:DropDownList runat="server" ID="ddlcat" CssClass="form-control"></asp:DropDownList>
             <br />
            <br />
            <asp:TextBox runat="server" Placeholder="Category Main ID" CssClass="form-control" ID="txtCatID"></asp:TextBox>
            <br />
            <br />

            <asp:TextBox runat="server" Placeholder="Category Name " CssClass="form-control" ID="txtCategory"></asp:TextBox>
            <br />
            <br />
            <br />

            <asp:LinkButton runat="server" CssClass="btn btn-primary" ID="btnadd" Text="ADD" OnClick="btnadd_Click"></asp:LinkButton>
        <br /><br /><br />
        <table class="table  table-hover table-responsive table-bordered">
            <thead>
                <tr>
                    <th>Main Category ID</th>
                    <th>Category Name</th>
                    <th>Parent</th>

                    <th>Action</th>


                </tr>
            </thead>
            <tbody>
                <asp:ListView runat="server" ID="lvcategory">
                    <ItemTemplate>

                <tr>
                    <td><%#Eval("MainCategoryID") %></td>
                    <td><%#Eval("CategoryName") %></td>
                    <td><%#Eval("Parent") %></td>

                    <td><a href="AddSubCategory.aspx?EditID=<%# Eval("Id")%>&CategoryName=<%#Trim(Eval("CategoryName")) %>&ParentID=<%#Trim(Eval("Parent")) %>&MainCategoryIID=<%#Trim(Eval("MainCategoryID")) %>" class="btn btn-warning">Edit</a>
                        <a href="AddSubCategory.aspx?MainCategoryID=<%# Eval("Id")%>&ParentID=<%#Trim(Eval("Parent")) %>&&MainCategoryName=<%#Trim(Eval("CategoryName")) %>" class="btn btn-danger">Delete</a>
                    </td>


                </tr>
                
                    </ItemTemplate>
                </asp:ListView>
            </tbody>
        </table>
        </div>
    </div>
</asp:Content>
