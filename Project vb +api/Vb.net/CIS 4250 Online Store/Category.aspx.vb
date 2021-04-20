Imports System.IO
Imports System.Net
Imports Newtonsoft
Imports Newtonsoft.Json
Public Class Category
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load






        If Request.QueryString("MainCategoryID") <> "" Then
            Dim id As String = Request.QueryString("MainCategoryID")
            Dim req As HttpWebRequest = WebRequest.Create("https://localhost:44301/api/values")
            Dim res As HttpWebResponse = req.GetResponse()
            Dim sr As New StreamReader(res.GetResponseStream())
            Dim AvailableApps As Object = JsonConvert.DeserializeObject(sr.ReadToEnd())
            Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(AvailableApps)
            Dim tab() As DataRow = table.Select("[Parent]='" + id + "'")
            Dim dt1 As DataTable = tab.CopyToDataTable()
            rpSubCategory.DataSource = dt1
            rpSubCategory.DataBind()
            lblMainCategoryName.Text = Request.QueryString("MainCategoryName")
        End If
        BindProduct()

        'If Request.QueryString("SubCategoryID") <> "" Then
        '    SqlDSProductList.SelectCommand = "Select * from Product Where subcategoryid = " & CInt(Request.QueryString("SubCategoryID"))
        '    I have no label lblProductList.Text = "Products for " + Request.QueryString("SubCategoryName")'
        'End If




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

    Public Sub BindProduct()
        Dim req As HttpWebRequest = WebRequest.Create("https://localhost:44301/api/Products")
        Dim res As HttpWebResponse = req.GetResponse()
        Dim sr As New StreamReader(res.GetResponseStream())
        Dim AvailableApps As Object = JsonConvert.DeserializeObject(sr.ReadToEnd())
        Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(AvailableApps)
        If Request.QueryString("MainCategoryID") <> "" Then
            Dim id As String = Request.QueryString("MainCategoryID")

            Dim tab() As DataRow = table.Select("[MainCategoryID]='" + id + "' and  [Featured]='y'")
            If tab.Any() Then
                Dim dt1 As DataTable = tab.CopyToDataTable()
                rpProductList.DataSource = dt1
                rpProductList.DataBind()
                lblpro.Text = "Products for " + Request.QueryString("MainCategoryName")


            Else
                lblpro.Text = "No product Found"

            End If





        End If
        If Request.QueryString("SubCategoryID") <> "" Then
            Dim id As String = Request.QueryString("SubCategoryID")

            Dim tab() As DataRow = table.Select("[SubCategoryId]='" + id + "' ")
            If tab.Any Then

                Dim dt1 As DataTable = tab.CopyToDataTable()
                rpProductList.DataSource = dt1
                rpProductList.DataBind()
                lblpro.Text = "Products for " + Request.QueryString("SubCategoryName") '

            Else
                lblpro.Text = "No product Found"

            End If

            'SqlDSProductList.SelectCommand = "Select * from Product Where subcategoryid = " & CInt(Request.QueryString("SubCategoryID"))
        End If
    End Sub
End Class