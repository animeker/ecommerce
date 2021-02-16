Public Class Category
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("MainCategoryID") <> "" Then
            SqlDSSubCategory.SelectCommand = "Select * from Category Where parent =" & CInt(Request.QueryString("MainCategoryID"))
            lblMainCategoryName.Text = Request.QueryString("MainCategoryName")
            ' assign selectcommand to SqlDSProductList for the featured products of the main category
            SqlDSProductList.SelectCommand = "Select * From Product Where maincategoryid =" & CInt(Request.QueryString("MainCategoryID")) & "And Featured = 'y'"
        End If

        If Request.QueryString("SubCategoryID") <> "" Then
            SqlDSProductList.SelectCommand = "Select * from Product Where subcategoryid = " & CInt(Request.QueryString("SubCategoryID"))
            'I have no label lblProductList.Text = "Products for " + Request.QueryString("SubCategoryName")'
        End If




    End Sub
    Public Function GetWholesalePrice(ByVal OriginalPrice As Decimal) As String
        Dim decWholesalePrice As Decimal = 0.00
        If Session("Customer") <> "" Then
            decWholesalePrice = OriginalPrice * 0.9
        Else
            decWholesalePrice = OriginalPrice
        End If
        Return decWholesalePrice
    End Function
End Class