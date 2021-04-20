Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Net
Imports Newtonsoft.Json

Public Class ProductDetail
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        BindProduct()


    End Sub

    Private Sub btnAddtoCart_Click(sender As Object, e As EventArgs) Handles btnAddtoCart.Click

        '*** get CartNo
        Dim strCartNo As String
        If HttpContext.Current.Request.Cookies("CartNo") Is Nothing Then
            strCartNo = GetRandomCartNoUsingGUID(10)
            Dim CookieTo As New HttpCookie("CartNo", strCartNo)
            HttpContext.Current.Response.AppendCookie(CookieTo)
        Else
            Dim CookieBack As HttpCookie
            CookieBack = HttpContext.Current.Request.Cookies("CartNo")
            strCartNo = CookieBack.Value
        End If



        Dim req As HttpWebRequest = WebRequest.Create("https://localhost:44301/api/cart")
        Dim res As HttpWebResponse = req.GetResponse()
        Dim sr As New StreamReader(res.GetResponseStream())
        Dim AvailableApps As Object = JsonConvert.DeserializeObject(sr.ReadToEnd())
        Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(AvailableApps)
        If table.Rows.Count > 0 Then
            Dim tab() As DataRow = table.Select("[CartNo]='" & strCartNo & "' and [ProductNo] ='" & lblProductNo.Text & "'")
            If tab.Any Then
                Dim dt1 As DataTable = tab.CopyToDataTable()
                Dim strProductNo As String = dt1.Rows.Item(0).Item("Id")
                Dim ProNO As String = dt1.Rows.Item(0).Item("ProductNo")
                Dim Name As String = dt1.Rows.Item(0).Item("ProductName")

                Dim ProPrice As String = dt1.Rows.Item(0).Item("Price")
                Dim Quantity As Integer = dt1.Rows.Item(0).Item("Quantity") + 1

                Dim webClient1 As New WebClient()
                Dim resByte1 As Byte()
                Dim resString1 As String
                Dim reqString1() As Byte
                Dim dictData1 As New Dictionary(Of String, Object)

                dictData1.Add("Id", strProductNo)

                dictData1.Add("CartNo", strCartNo)
                dictData1.Add("ProductNo", ProNO)
                dictData1.Add("ProductName", Name)
                dictData1.Add("Price", ProPrice)
                dictData1.Add("Quantity", Quantity)


                Try
                    webClient1.Headers("content-type") = "application/json"
                    reqString1 = Encoding.Default.GetBytes(JsonConvert.SerializeObject(dictData1, Formatting.Indented))
                    resByte1 = webClient1.UploadData("https://localhost:44301/api/cart/" + strProductNo, "put", reqString1)
                    resString1 = Encoding.Default.GetString(resByte1)
                    Console.WriteLine(resString1)
                    webClient1.Dispose()
                Catch ex As Exception
                    Console.WriteLine(ex.Message)
                End Try
                Response.Redirect("ViewCart.aspx")

            Else


                Dim webClient As New WebClient()
                Dim resByte As Byte()
                Dim resString As String
                Dim reqString() As Byte
                Dim dictData As New Dictionary(Of String, Object)

                dictData.Add("CartNo", strCartNo)
                dictData.Add("ProductNo", lblProductNo.Text)
                dictData.Add("ProductName", lblProductName.Text)
                dictData.Add("Price", lblUnitPrice.Text)
                dictData.Add("Quantity", "1")
                Try
                    webClient.Headers("content-type") = "application/json"
                    reqString = Encoding.Default.GetBytes(JsonConvert.SerializeObject(dictData, Formatting.Indented))
                    resByte = webClient.UploadData("https://localhost:44301/api/cart", "post", reqString)
                    resString = Encoding.Default.GetString(resByte)
                    Console.WriteLine(resString)
                    webClient.Dispose()
                Catch ex As Exception
                    Console.WriteLine(ex.Message)
                End Try


                Response.Redirect("ViewCart.aspx")

            End If


        Else

            Dim webClient As New WebClient()
            Dim resByte As Byte()
            Dim resString As String
            Dim reqString() As Byte
            Dim dictData As New Dictionary(Of String, Object)

            dictData.Add("CartNo", strCartNo)
            dictData.Add("ProductNo", lblProductNo.Text)
            dictData.Add("ProductName", lblProductName.Text)
            dictData.Add("Price", lblUnitPrice.Text)
            dictData.Add("Quantity", "1")
            Try
                webClient.Headers("content-type") = "application/json"
                reqString = Encoding.Default.GetBytes(JsonConvert.SerializeObject(dictData, Formatting.Indented))
                resByte = webClient.UploadData("https://localhost:44301/api/cart", "post", reqString)
                resString = Encoding.Default.GetString(resByte)
                Console.WriteLine(resString)
                webClient.Dispose()
            Catch ex As Exception
                Console.WriteLine(ex.Message)
            End Try


            Response.Redirect("ViewCart.aspx")




        End If

    End Sub
    Public Function GetRandomCartNoUsingGUID(ByVal length As Integer) As String
        'Get the GUID
        Dim guidResult As String = System.Guid.NewGuid().ToString()
        'Remove the hyphens
        guidResult = guidResult.Replace("-", String.Empty)
        'Make sure length is valid
        If length <= 0 OrElse length > guidResult.Length Then
            Throw New ArgumentException("Length must be between 1 and " & guidResult.Length)
        End If
        'Return the first length bytes
        Return guidResult.Substring(0, length)
    End Function


    Public Sub BindProduct()
        Dim req As HttpWebRequest = WebRequest.Create("https://localhost:44301/api/Products")
        Dim res As HttpWebResponse = req.GetResponse()
        Dim sr As New StreamReader(res.GetResponseStream())
        Dim AvailableApps As Object = JsonConvert.DeserializeObject(sr.ReadToEnd())
        Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(AvailableApps)


        If Request.QueryString("ProductID") <> "" Then
            Dim id As String = Request.QueryString("ProductID")

            Dim tab() As DataRow = table.Select("[ProductID]='" + id + "'")
            Dim drProduct As DataTable = tab.CopyToDataTable()

            lblProductNo.Text = drProduct.Rows.Item(0).Item("ProductNo")
            lblProductName.Text = drProduct.Rows.Item(0)("ProductName")
            lblUnitPrice.Text = drProduct.Rows.Item(0)("UnitPrice")
            lblProductDescription.Text = drProduct.Rows.Item(0)("ProductDescription")
            lblProductDescription2.Text = drProduct.Rows.Item(0)("ProductDescription")
            imgProduct.ImageUrl = drProduct.Rows.Item(0)("Productimg")

            If Session("Customer") <> "" Then
                lblUnitPrice.Text = drProduct.Rows.Item(0)("UnitPrice") * 0.2

            End If
        End If
    End Sub




End Class