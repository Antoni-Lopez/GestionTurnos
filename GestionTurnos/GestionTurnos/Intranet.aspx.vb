Imports System.IdentityModel.Claims

Public Class Intranet

    Inherits System.Web.UI.Page

    Private this As Object

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim clsGeneral As New ClaseGeneral
        clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)
        If Not Page.IsPostBack Then

        End If
        'Aquí deberemos recibir desde la Bd valores como, img del logo, direccion
        'Y por supuesto, verificar el usuario y la pass que nos diga el usuario.
        Dim ruta_img As String = "img/PEINARTE-LOG0.png"
        Dim direccion_tablet As String = "Cristo de la Epidemia, 52, Málaga"
        Dim usuario As String = "Sanchez"
        Dim password As String = "1234"
        'Dim user As String = Request["txtUsuario"]
        'Dim clave As String = Request["TextPass"]

        Dim direccion As String = "<div id='introducir_texto' class='col-md-6 banner'>" & direccion_tablet & "</div>"

        Me.logo_img.Text = "<img src=" & ruta_img & " id='logo_img'/>"
        Me.introducir_texto.Text = direccion
    End Sub
End Class