Imports System.IdentityModel.Claims

Public Class Intranet

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim clsGeneral As New ClaseGeneral

            clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)
            Button1.Attributes.Add("onclick", "return Comprueba()")
            Dim ruta_img As String = "img/PEINARTE-LOG0.png"
            Dim direccion_tablet As String = "Cristo de la Epidemia, 52, Málaga"

            logo_img.Text = "<img src=" & ruta_img & " id='logo_img'/>"
            introducirtexto.InnerHtml = direccion_tablet
        Else
            Dim IDCliente As Integer, IDRol As Integer, IDCentro As Integer
            If CompruebaEmail(Trim(txtUsuario.Text), Trim(TextPass.Text), IDCliente, IDRol, IDCentro) Then
                Select Case IDRol
                    Case 1 'Webmaster

                    Case 2 'Dueño de centros

                    Case 3 'Gestor de turnos

                    Case 4 'Mostrar servicios
                        Response.Redirect("Servicios.aspx?IDCliente=" & IDCliente & "&IDCentro=" & IDCentro, False)
                End Select
            Else
                Response.Redirect("Intranet.aspx")
            End If
        End If
    End Sub

    Private Function CompruebaEmail(ByVal Email As String, ByVal Password As String, ByRef IDCliente As Integer, ByRef IDRol As Integer, Optional ByRef IDCentro As Integer = 0) As Boolean
        If Email = "hola@hola.com" And Password = "1234" Then
            IDCliente = 1
            IDRol = 4
            If IDRol = 4 Then
                IDCentro = 2
            End If
            Return True
        End If
    End Function

End Class