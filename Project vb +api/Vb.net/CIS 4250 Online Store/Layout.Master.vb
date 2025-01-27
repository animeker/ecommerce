﻿Imports System.IO
Imports System.Net
Imports Newtonsoft.Json

Public Class Layout
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim req As HttpWebRequest = WebRequest.Create("https://localhost:44301/api/values")
        Dim res As HttpWebResponse = req.GetResponse()
        Dim sr As New StreamReader(res.GetResponseStream())
        Dim AvailableApps As Object = JsonConvert.DeserializeObject(sr.ReadToEnd())
        Dim table As DataTable = JsonConvert.DeserializeObject(Of DataTable)(AvailableApps)
        Dim tab() As DataRow = table.Select("[Parent]=0")
        If tab.Any Then
            Dim dt1 As DataTable = tab.CopyToDataTable()



            rpMainCategory.DataSource = dt1

            rpMainCategory.DataBind()
        End If



        If Session("Customer") <> "" Then
            hlLogin.Visible = False
            hlLogout.Visible = True
            lblCustomer.Text = Session("Customer")
            lblCustomer.Visible = True
        End If
        If Session("Customer") = "" Then
            hlLogin.Visible = True
            hlLogout.Visible = False
            ' lblCustomer.Text = Session("Customer") 
            lblCustomer.Visible = False
        End If
    End Sub

    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        If tbSearch.Text <> "" Then
            Dim strURL As String = ""
            ' check the number of words in the textbox
            Dim strCheck As String = " "
            If Not Trim(tbSearch.Text).Contains(strCheck) Then
                ' check if there is a ProductID match in the Product table 
                ' all the database objects delcared and instantiated 
                ' Dim strSQL As String = "Select * from Product Where ProductID = '" & Trim(tbSearch.Text) & "'"
                ' If there is a match, redirect to ProductDetail.aspx?...
                ' assign a dynamic value for strURL
                ' Response.Redirect(strURL)
            Else
                strURL = "Category.aspx?SearchString=" & Trim(tbSearch.Text)
                Response.Redirect(strURL)
            End If
        End If
    End Sub
End Class