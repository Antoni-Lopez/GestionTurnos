Public Class Index_Intranet

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cls1General As New ClaseGeneral
        clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)

    End Sub
End Class