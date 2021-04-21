﻿Imports System.IO
Imports System.Net
Imports Newtonsoft.Json

Public Class AddSubCategory
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            DeleteCategory()
            bindcategory()
            EditCategory()
        End If
    End Sub

    Protected Sub btnadd_Click(sender As Object, e As EventArgs)
        If btnadd.Text = "Update" Then

            If Request.QueryString("EditID") <> "" Then
                Dim id As String = Request.QueryString("EditID")



                Dim webClient As New WebClient()
                Dim resByte As Byte()
                Dim resString As String
                Dim reqString() As Byte
                Dim dictData As New Dictionary(Of String, Object)

                dictData.Add("Id", id)

                dictData.Add("MainCategoryID", txtCatID.Text)
                dictData.Add("CategoryName", txtCategory.Text)
                dictData.Add("Parent", ddlcat.SelectedValue)


                Try
                    webClient.Headers("content-type") = "application/json"
                    reqString = Encoding.Default.GetBytes(JsonConvert.SerializeObject(dictData, Formatting.Indented))
                    resByte = webClient.UploadData("https://localhost:44301/api/values/" + id, "put", reqString)
                    resString = Encoding.Default.GetString(resByte)
                    Console.WriteLine(resString)
                    webClient.Dispose()
                    ScriptManager.RegisterStartupScript(Page, Page.GetType, Guid.NewGuid().ToString(), "alert(' Category Updated ');window.location=('AddSubCategory.aspx')", True)

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

            dictData.Add("MainCategoryID", txtCatID.Text)
            dictData.Add("CategoryName", txtCategory.Text)
            dictData.Add("Parent", ddlcat.SelectedValue)

            Try
                webClient.Headers("content-type") = "application/json"
                reqString = Encoding.Default.GetBytes(JsonConvert.SerializeObject(dictData, Formatting.Indented))
                resByte = webClient.UploadData("https://localhost:44301/api/values", "post", reqString)
                resString = Encoding.Default.GetString(resByte)
                Console.WriteLine(resString)
                webClient.Dispose()
                ScriptManager.RegisterStartupScript(Page, Page.GetType, Guid.NewGuid().ToString(), "alert(' Category Added ');window.location=('AddSubCategory.aspx')", True)

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
        Dim tab2() As DataRow = table.Select("[Parent]<>0")

        Dim dt1 As DataTable = tab.CopyToDataTable()
        Dim dt2 As DataTable = tab2.CopyToDataTable()


        ddlcat.DataSource = dt1
        ddlcat.DataTextField = "CategoryName"
        ddlcat.DataValueField = "Id"
        ddlcat.DataBind()
        ddlcat.Items.Insert(0, New ListItem("Select Main Category", "0"))


        lvcategory.DataSource = dt2

        lvcategory.DataBind()

    End Sub

    Public Sub DeleteCategory()

        If Request.QueryString("MainCategoryID") <> "" Then
            Dim id As String = Request.QueryString("MainCategoryID")

            Dim req As HttpWebRequest = WebRequest.Create("https://localhost:44301/api/values/" + id)
            req.Method = "Delete"
            Dim res As HttpWebResponse = req.GetResponse()
            ScriptManager.RegisterStartupScript(Page, Page.GetType, Guid.NewGuid().ToString(), "alert('Main Category Deleted ');window.location=('AddSubCategory.aspx')", True)

        End If



    End Sub


    Public Sub EditCategory()

        If Request.QueryString("EditID") <> "" Then
            Dim id As String = Request.QueryString("EditID")
            Dim MainCategory As String = Request.QueryString("MainCategoryIID")
            Dim CategoryName As String = Request.QueryString("CategoryName")
            txtCategory.Text = Request.QueryString("CategoryName")
            txtCatID.Text = Request.QueryString("MainCategoryIID")
            ddlcat.SelectedValue = Request.QueryString("ParentID")
            btnadd.Text = "Update"




        End If



    End Sub
End Class