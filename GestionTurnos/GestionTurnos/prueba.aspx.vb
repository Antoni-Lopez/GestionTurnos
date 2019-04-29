Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Public Class prueba
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim clsGeneral As New ClaseGeneral
        clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)

        Dim script As String = "$(document).ready(function () { $('[id*=btnSubmit]').click(); });"
        ClientScript.RegisterStartupScript(Me.GetType, "load", script, True)

    End Sub
End Class