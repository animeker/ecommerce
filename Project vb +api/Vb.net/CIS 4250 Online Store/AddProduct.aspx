<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="AddProduct.aspx.vb" Inherits="CIS_4250_Online_Store.AddProduct" %>
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
        <div class="col-md-12 ">
            <asp:TextBox runat="server" Placeholder="Product No" CssClass="form-control" ID="txtProductNo"></asp:TextBox>
            <br />
            <asp:TextBox runat="server" Placeholder="Product Name" CssClass="form-control" ID="txtProductName"></asp:TextBox>
            <br />
            <asp:TextBox runat="server" Placeholder="Product Description"  TextMode="MultiLine" Rows="3" CssClass="form-control" ID="txtProductDescription"></asp:TextBox>
            <br />
            <asp:TextBox runat="server" Placeholder="Product Unit" CssClass="form-control" ID="txtProductUnitPrice"></asp:TextBox>
            <br />
            <asp:DropDownList runat="server" ID="ddlcat" OnSelectedIndexChanged="ddlcat_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
            <br />
            <asp:DropDownList runat="server" ID="ddlsubcat" CssClass="form-control"></asp:DropDownList>
            <br />
            <asp:FileUpload  runat="server" ID="file" CssClass="form-control"/>
            <br />
            <br />
            <br />

            <asp:LinkButton runat="server" CssClass="btn btn-primary" ID="btnadd" Text="ADD" OnClick="btnadd_Click"></asp:LinkButton>
        <br /><br /><br />
        <table class="table  table-hover table-responsive table-bordered">
            <thead>
                <tr>
                    
            
                    <th>Product NO</th>
                    <th>Product Name</th>
                  
                      <th>Product Description</th>
                    <th>UnitPrice</th>
                  
                    <th>Image</th>
                    <th>Action</th>


                </tr>
            </thead>
            <tbody>
                <asp:ListView runat="server" ID="lvProduct">
                    <ItemTemplate>

                <tr>
                    <td><%#Eval("ProductNO") %></td>
                    <td><%#Eval("ProductName") %></td>
                    <td><%#Eval("ProductDescription") %></td>
                    <td><%#Eval("UnitPrice") %></td>
                    
                    <td><asp:Image  runat="server" ImageUrl=' <%#Eval("Productimg") %>' Height="100px" Width="100px"/> </td>

                    <td><a href="AddProduct.aspx?ProductIdEdit=<%# Eval("ProductId")%>&ProductDescription=<%#Trim(Eval("ProductDescription")) %>&UnitPrice=<%#Trim(Eval("UnitPrice")) %>&MainCategoryID=<%#Trim(Eval("MainCategoryID")) %>&SubCategoryID=<%#Trim(Eval("SubCategoryID")) %>&ProductNO=<%#Trim(Eval("ProductNO")) %>&Productimg=<%#Trim(Eval("Productimg")) %>&ProductName=<%#Trim(Eval("ProductName")) %>" class="btn btn-warning">Edit</a>
                   <a href="AddProduct.aspx?ProductIdDelete=<%# Eval("ProductId")%>&ProductDescription=<%#Trim(Eval("ProductDescription")) %>&UnitPrice=<%#Trim(Eval("UnitPrice")) %>&MainCategoryID=<%#Trim(Eval("MainCategoryID")) %>&SubCategoryID=<%#Trim(Eval("SubCategoryID")) %>&ProductNO=<%#Trim(Eval("ProductNO")) %>&Productimg=<%#Trim(Eval("Productimg")) %>&ProductName=<%#Trim(Eval("ProductName")) %>" class="btn btn-danger">Delete</a></td>


                </tr>
                
                    </ItemTemplate>
                </asp:ListView>
            </tbody>
        </table>
        </div>
    </div>
</asp:Content>

