Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Net
Imports Newtonsoft.Json

Public Class ViewCart
    Inherits System.Web.UI.Page
    Public strCartNo As String = " "
    Dim CookieBack As HttpCookie = HttpContext.Current.Request.Cookies("CartNo")
    Public strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionStringOnlineStore").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' get CartNo
        If Not CookieBack Is Nothing Then
            strCartNo = CookieBack.Value
        End If


        If Not IsPostBack Then
            Dim req As HttpWebRequest = WebRequest.Create("https://localhost:44301/api/cart")
            Dim res As HttpWebResponse = req.GetResponse()
            Dim sr As New StreamReader(res.GetResponseStream())
            Dim AvailableApps As Object = JsonConvert.DeserializeObject(sr.ReadToEnd())
            Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(AvailableApps)
            If table.Rows.Count > 0 Then
                Dim tab() As DataRow = table.Select("[CartNo]='" & strCartNo & "'")
                If tab.Any Then
                    Dim dt1 As DataTable = tab.CopyToDataTable()

                    lvCart.DataSource = dt1
                    lvCart.DataBind()

                Else
                    Response.Redirect("Default.aspx")

                End If
            Else
                Response.Redirect("Default.aspx")

            End If

        End If


    End Sub
    Protected Sub lvCart_OnItemCommand(ByVal sender As Object, ByVal e As ListViewCommandEventArgs)
        If e.CommandName = "cmdUpdate" Then

            ' get productno and quantity
            Dim strProductNo As String = e.CommandArgument
            Dim tbQuantity As TextBox = CType(e.Item.FindControl("tbQuantity"), TextBox)

            Dim Name As Label = CType(e.Item.FindControl("ProName"), Label)
            Dim ProNO As Label = CType(e.Item.FindControl("ProNo"), Label)
            Dim ProPrice As Label = CType(e.Item.FindControl("ProPrice"), Label)

            Dim webClient As New WebClient()
            Dim resByte As Byte()
            Dim resString As String
            Dim reqString() As Byte
            Dim dictData As New Dictionary(Of String, Object)

            dictData.Add("Id", strProductNo)

            dictData.Add("CartNo", strCartNo)
            dictData.Add("ProductNo", ProNO.Text)
            dictData.Add("ProductName", Name.Text)
            dictData.Add("Price", ProPrice.Text)
            dictData.Add("Quantity", tbQuantity.Text)


            Try
                webClient.Headers("content-type") = "application/json"
                reqString = Encoding.Default.GetBytes(JsonConvert.SerializeObject(dictData, Formatting.Indented))
                resByte = webClient.UploadData("https://localhost:44301/api/cart/" + strProductNo, "put", reqString)
                resString = Encoding.Default.GetString(resByte)
                Console.WriteLine(resString)
                webClient.Dispose()
            Catch ex As Exception
                Console.WriteLine(ex.Message)
            End Try
            Bindcart()

        ElseIf e.CommandName = "cmdDelete" Then
            ' get productid and quantity


            Dim strProductNo As String = e.CommandArgument
            Dim req As HttpWebRequest = WebRequest.Create("https://localhost:44301/api/cart/" + strProductNo)
            req.Method = "Delete"
            Dim res As HttpWebResponse = req.GetResponse()
            Bindcart()


        End If

    End Sub

    Protected Sub DataPager1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataPager1.PreRender
        Dim total_pages As Integer
        Dim current_page As Integer
        lvCart.DataBind()
        total_pages = DataPager1.TotalRowCount / DataPager1.PageSize
        current_page = DataPager1.StartRowIndex / DataPager1.PageSize + 1
        If DataPager1.TotalRowCount Mod DataPager1.PageSize <> 0 Then
            total_pages = total_pages + 1
        End If
        If CInt(lvCart.Items.Count) <> 0 Then
            Dim lbl As Label = lvCart.FindControl("lblPage")
            lbl.Text = "Page " + CStr(current_page) + " of " + CStr(total_pages) + " (Total items: " + CStr(DataPager1.TotalRowCount) + ")"
        End If
        If CInt(lvCart.Items.Count) = 0 Then
            DataPager1.Visible = False
            show_next.Visible = False
            show_prev.Visible = False
        End If
    End Sub

    Protected Sub show_prev_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles show_prev.Click
        Dim pagesize As Integer = DataPager1.PageSize
        Dim current_page As Integer = DataPager1.StartRowIndex / DataPager1.PageSize + 1
        Dim total_pages As Integer = DataPager1.TotalRowCount / DataPager1.PageSize
        Dim last As Integer = total_pages \ 3
        last = last * 3
        Do While current_page < last
            last = last - 3
        Loop
        If last < 3 Then
            last = 0
        Else
            last = last - 3
        End If
        DataPager1.SetPageProperties(last * pagesize, pagesize, True)
    End Sub

    Protected Sub show_next_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles show_next.Click
        Dim last As Integer = 3
        Dim pagesize As Integer = DataPager1.PageSize
        Dim current_page As Integer = DataPager1.StartRowIndex / DataPager1.PageSize + 1
        Dim total_pages As Integer = DataPager1.TotalRowCount / DataPager1.PageSize
        Do While current_page > last
            last = last + 3
        Loop
        If last > total_pages Then
            last = total_pages
        End If
        DataPager1.SetPageProperties(last * pagesize, pagesize, True)
    End Sub

    Public Sub Bindcart()
        If Not CookieBack Is Nothing Then
            strCartNo = CookieBack.Value
        End If
        Dim req As HttpWebRequest = WebRequest.Create("https://localhost:44301/api/cart")
        Dim res As HttpWebResponse = req.GetResponse()
        Dim sr As New StreamReader(res.GetResponseStream())
        Dim AvailableApps As Object = JsonConvert.DeserializeObject(sr.ReadToEnd())
        Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(AvailableApps)
        If table.Rows.Count > 0 Then
            Dim tab() As DataRow = table.Select("[CartNo]='" & strCartNo & "'")
            If tab.Any Then
                Dim dt1 As DataTable = tab.CopyToDataTable()

                lvCart.DataSource = dt1
                lvCart.DataBind()

            Else
                Response.Redirect("Default.aspx")

            End If
        Else
            Response.Redirect("Default.aspx")

        End If

    End Sub
End Class