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
            Dim IDCliente As Integer, IDRol As Integer, IDCentro As Integer, NumServicios As Integer, Temporizador As Integer, IDServicio As Integer
            'Timer que vamos a mandar a la interfaz de turnos, si es = 0, habrá temporizador, si es = 1, no hay.
            Temporizador = 0
            IDServicio = 1

            If CompruebaEmail(Trim(txtUsuario.Text), Trim(TextPass.Text), IDCliente, IDRol, NumServicios, IDCentro) Then

                Select Case IDRol
                    Case 1 'Webmaster

                    Case 2 'Dueño de centros

                    Case 3 'Gestor de turnos

                    Case 4 'Mostrar servicios
                        Select Case NumServicios
                            Case 1 'Enviamos directamente a Turnos.aspx
                                'Temporizador es = 1 porque no vamos a tener nada más que 1 servicio a mostrar(en este caso solo tendremos Peluquería).
                                Temporizador = 1
                                Response.Redirect("Test.aspx?IDCliente=" & IDCliente & "&IDCentro=" & IDCentro & "&NServicios=" & NumServicios & "&IDServicio=" & IDServicio & "&timer=" & Temporizador, False)
                            Case 2 'Disponemos de 2 servicios a mostrar. Por ello redireccionamos a Servicios.aspx con 1 queryStream que nos dirá cuantos servicios mostramos.
                                Response.Redirect("Servicios.aspx?IDCliente=" & IDCliente & "&IDCentro=" & IDCentro & "&NServicios=" & NumServicios, False)
                            Case 3 'Disponemos de 3 servicios. Por ello redireccionamos a Servicios.aspx
                                Response.Redirect("Servicios.aspx?IDCliente=" & IDCliente & "&IDCentro=" & IDCentro & "&NServicios=" & NumServicios, False)
                            Case 4 'Disponemos de 4 servicios. Por ello redireccionamos a Servicios.aspx
                                Response.Redirect("Servicios.aspx?IDCliente=" & IDCliente & "&IDCentro=" & IDCentro & "&NServicios=" & NumServicios, False)
                        End Select
                End Select
            Else
                Response.Redirect("Intranet.aspx")
            End If
        End If
    End Sub

    Private Function CompruebaEmail(ByVal Email As String, ByVal Password As String, ByRef IDCliente As Integer, ByRef IDRol As Integer, ByRef NumServicios As Integer, Optional ByRef IDCentro As Integer = 0) As Boolean
        If Email = "hola@hola.com" And Password = "1234" Then
            IDCliente = 1
            IDRol = 4
            NumServicios = 1
            If IDRol = 4 Then
                IDCentro = 2
            End If
            Return True
        End If
    End Function

End Class