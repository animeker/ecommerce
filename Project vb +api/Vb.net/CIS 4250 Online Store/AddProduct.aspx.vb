Imports System.IO
Imports System.Net
Imports Newtonsoft.Json

Public Class AddProduct
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            DeleteProduct()
            bindcategory()
            EditCategory()
            bindProducts()
        End If
    End Sub

    Protected Sub btnadd_Click(sender As Object, e As EventArgs)
        If btnadd.Text = "Update" Then

            If Request.QueryString("ProductIdEdit") <> "" Then
                Dim id As String = Request.QueryString("ProductIdEdit")

                Dim Image As String = Request.QueryString("Productimg")
                Dim x As String = ""
                Dim filePath As String = file.PostedFile.FileName
                Dim filename As String = Path.GetFileName(filePath)
                Dim ext As String = Path.GetExtension(filename)
                If filePath <> String.Empty Then
                    file.PostedFile.SaveAs(Server.MapPath("~/img/product/" + filePath))
                    Dim Imagex As String = "~/img/product/" + filePath.ToString()
                    x = Imagex
                End If
                If Image <> String.Empty Then
                    x = Image
                End If
                Dim webClient As New WebClient()
                Dim resByte As Byte()
                Dim resString As String
                Dim reqString() As Byte
                Dim dictData As New Dictionary(Of String, Object)

                dictData.Add("ProductID", id)

                dictData.Add("ProductNO", txtProductNo.Text)
                dictData.Add("ProductName", txtProductName.Text)
                dictData.Add("ProductDescription", txtProductDescription.Text)
                dictData.Add("UnitPrice", txtProductUnitPrice.Text)
                dictData.Add("MainCategoryID", ddlcat.SelectedValue)
                dictData.Add("SubCategoryID", ddlsubcat.SelectedValue)
                dictData.Add("Productimg", x)
                dictData.Add("Featured", "y")


                Try
                    webClient.Headers("content-type") = "application/json"
                    reqString = Encoding.Default.GetBytes(JsonConvert.SerializeObject(dictData, Formatting.Indented))
                    resByte = webClient.UploadData("https://localhost:44301/api/Products/" + id, "put", reqString)
                    resString = Encoding.Default.GetString(resByte)
                    Console.WriteLine(resString)
                    webClient.Dispose()
                    ScriptManager.RegisterStartupScript(Page, Page.GetType, Guid.NewGuid().ToString(), "alert('Product Updated ');window.location=('AddProduct.aspx')", True)

                Catch ex As Exception
                    Console.WriteLine(ex.Message)
                End Try



            End If


        Else
            Dim webClient As New WebClient()
            Dim resByte As Byte()
            Dim resString As String
            Dim reqString() As Byte
            Dim dictData As New Dictionary(Of String, Object)
            Dim x As String = ""
            Dim filePath As String = file.PostedFile.FileName
            Dim filename As String = Path.GetFileName(filePath)
            Dim ext As String = Path.GetExtension(filename)
            If filePath <> String.Empty Then
                file.PostedFile.SaveAs(Server.MapPath("~/img/product/" + filePath))
                Dim Image As String = "~/img/product/" + filePath.ToString()
                x = Image
            End If

            dictData.Add("ProductNO", txtProductNo.Text)
            dictData.Add("ProductName", txtProductName.Text)
            dictData.Add("ProductDescription", txtProductDescription.Text)
            dictData.Add("UnitPrice", txtProductUnitPrice.Text)
            dictData.Add("MainCategoryID", ddlcat.SelectedValue)
            dictData.Add("SubCategoryID", ddlsubcat.SelectedValue)
            dictData.Add("Productimg", x)
            dictData.Add("Featured", "y")

            Try
                webClient.Headers("content-type") = "application/json"
                reqString = Encoding.Default.GetBytes(JsonConvert.SerializeObject(dictData, Formatting.Indented))
                resByte = webClient.UploadData("https://localhost:44301/api/Products", "post", reqString)
                resString = Encoding.Default.GetString(resByte)
                Console.WriteLine(resString)
                webClient.Dispose()
                ScriptManager.RegisterStartupScript(Page, Page.GetType, Guid.NewGuid().ToString(), "alert('Product Added ');window.location=('AddProduct.aspx')", True)

            Catch ex As Exception
                Console.WriteLine(ex.Message)
            End Try

        End If
    End Sub
    Public Sub bindcategory()
        Dim req As HttpWebRequest = WebRequest.Create("https://localhost:44301/api/values")
        Dim res As HttpWebResponse = req.GetResponse()
        Dim sr As New StreamReader(res.GetResponseStream())
        Dim AvailableApps As Object = JsonConvert.DeserializeObject(sr.ReadToEnd())
        Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(AvailableApps)
        Dim tab() As DataRow = table.Select("[Parent]=0")
        If tab.Any Then
            Dim dt1 As DataTable = tab.CopyToDataTable()


            ddlcat.DataSource = dt1
            ddlcat.DataTextField = "CategoryName"
            ddlcat.DataValueField = "Id"
            ddlcat.DataBind()
            ddlcat.Items.Insert(0, New ListItem("Select Main Category", "0"))

        End If


    End Sub

    Public Sub bindGlobal()
        Dim req As HttpWebRequest = WebRequest.Create("https://localhost:44301/api/values")
        Dim res As HttpWebResponse = req.GetResponse()
        Dim sr As New StreamReader(res.GetResponseStream())
        Dim AvailableApps As Object = JsonConvert.DeserializeObject(sr.ReadToEnd())
        Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(AvailableApps)
        If table.Rows.Count > 0 Then


            ddlsubcat.DataSource = table
            ddlsubcat.DataTextField = "CategoryName"
            ddlsubcat.DataValueField = "Id"
            ddlsubcat.DataBind()
            ddlsubcat.Items.Insert(0, New ListItem("Select Sub Category", "0"))

        End If


    End Sub
    Public Sub DeleteProduct()

        If Request.QueryString("ProductIdDelete") <> "" Then
            Dim id As String = Request.QueryString("ProductIdDelete")

            Dim req As HttpWebRequest = WebRequest.Create("https://localhost:44301/api/Products/" + id)
            req.Method = "Delete"
            Dim res As HttpWebResponse = req.GetResponse()
            ScriptManager.RegisterStartupScript(Page, Page.GetType, Guid.NewGuid().ToString(), "alert('Product Deleted ');window.location=('AddProduct.aspx')", True)

        End If



    End Sub

    Public Sub bindProducts()
        Dim req As HttpWebRequest = WebRequest.Create("https://localhost:44301/api/Products")
        Dim res As HttpWebResponse = req.GetResponse()
        Dim sr As New StreamReader(res.GetResponseStream())
        Dim AvailableApps As Object = JsonConvert.DeserializeObject(sr.ReadToEnd())
        Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(AvailableApps)

        If table.Rows.Count > 0 Then
            lvProduct.DataSource = table
            lvProduct.DataBind()



        End If


    End Sub

    Public Sub EditCategory()

        If Request.QueryString("ProductIdEdit") <> "" Then

            txtProductNo.Text = Request.QueryString("ProductNO")
            txtProductName.Text = Request.QueryString("ProductName")
            txtProductDescription.Text = Request.QueryString("ProductDescription")
            txtProductUnitPrice.Text = Request.QueryString("UnitPrice")
            ddlcat.SelectedValue = Request.QueryString("MainCategoryID")
            bindGlobal()
            ddlsubcat.SelectedValue = Request.QueryString("SubCategoryID")
            btnadd.Text = "Update"
        End If



    End Sub

    Protected Sub ddlcat_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim req As HttpWebRequest = WebRequest.Create("https://localhost:44301/api/values")
        Dim res As HttpWebResponse = req.GetResponse()
        Dim sr As New StreamReader(res.GetResponseStream())
        Dim AvailableApps As Object = JsonConvert.DeserializeObject(sr.ReadToEnd())
        Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(AvailableApps)
        Dim tab() As DataRow = table.Select("[Parent]='" & ddlcat.SelectedValue & "'")
        If tab.Any Then
            Dim dt1 As DataTable = tab.CopyToDataTable()


            ddlsubcat.DataSource = dt1
            ddlsubcat.DataTextField = "CategoryName"
            ddlsubcat.DataValueField = "Id"
            ddlsubcat.DataBind()
            ddlsubcat.Items.Insert(0, New ListItem("Select Sub Category", "0"))

        End If

    End Sub
End Class