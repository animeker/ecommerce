Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Net
Imports Newtonsoft.Json

Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim req As HttpWebRequest = WebRequest.Create("https://localhost:44301/api/Customer")
        Dim res As HttpWebResponse = req.GetResponse()
        Dim sr As New StreamReader(res.GetResponseStream())
        Dim AvailableApps As Object = JsonConvert.DeserializeObject(sr.ReadToEnd())
        Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(AvailableApps)
        Dim tab() As DataRow = table.Select("[Email]='" & Trim(tbEmail.Text) & "' and  [Password]='" & Trim(tbPassword.Text) & "'")
        If tab.Any Then
            Dim dt1 As DataTable = tab.CopyToDataTable()
            Session("Customer") = Trim(tbEmail.Text)
            Response.Redirect("Default.aspx")
        Else
            lblMessage.Text = "Login Failed"
        End If

    End Sub
End Class