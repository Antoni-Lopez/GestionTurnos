Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration


Public Class subirfiles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Function ValidaExtension(ByVal sExtension As String) As Boolean
        Select Case sExtension
            Case ".pdf"
                Return True
            Case Else
                Return False
        End Select
    End Function

End Class