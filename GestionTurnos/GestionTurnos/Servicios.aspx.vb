Public Class Servicios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim clsGeneral As New ClaseGeneral
            clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)

            Dim ruta_imagen As String = "img/PEINARTE-LOG0.png"
            Dim ruta_peluqueria As String = "img/pelu.jpg"
            Dim ruta_massage As String = "img/masaje.jpg"
            Dim ruta_fisio As String = "img/fisio.jpg"
            Dim ruta_manicura As String = "img/manicura.jpg"
            Dim direccion_tablet As String = "Carlota Pasaran, 25, Alicante"
            logo_img.Text = "<img src=" & ruta_imagen & " id='logo_img'/>"
            text_banner.InnerHtml = direccion_tablet

            Dim IDCliente As Integer, IDCentro As Integer, VIDServicios() As Integer, VNombreServicios() As String, HTML As String
            IDCliente = Request.QueryString("IDCliente")
            IDCentro = Request.QueryString("IDCentro")
            DevuelveServicios(IDCliente, IDCentro, VIDServicios, VNombreServicios)
            Select Case VIDServicios.Length
                Case 1

                Case 2

                    HTML = "<div class='row alineado'><div class='col-xs-3'></div>"
                    HTML += "<div class='col-xs-3 dos_contenedores'><img class='img_pelu' src='" & ruta_peluqueria & "' onclick=" & Chr(34) & "alert('IDCliente: " & IDCliente & ", IDCentro: " & IDCentro & ", IDServicio: " & VIDServicios(0) & "')" & Chr(34) & "/ ></div>"
                    HTML += "<div Class='col-xs-3 dos_contenedores'><img class='img_massage' src='" & ruta_massage & "' onclick=" & Chr(34) & "alert('IDCliente: " & IDCliente & ", IDCentro: " & IDCentro & ", IDServicio: " & VIDServicios(1) & "')" & Chr(34) & "/ ></div><div class='col-xs-3'></div></div>"
                    HTML += "<p class='col-xs-3 texto_dos_cuadros'></p>"
                    HTML += "<p class='col-xs-3 texto_dos_cuadros'>" & VNombreServicios(0) & "</p>"
                    HTML += "<p class='col-xs-3 texto_dos_cuadros2'>" & VNombreServicios(1) & "</p>"
                    HTML += "<p class='col-xs-3 texto_dos_cuadros2'></p>"
                    'HTML = "<div class='row alineado'><div class='col-xs-6 col-xs-4_1'><img class='img_pelu' src='" & ruta_peluqueria & "' onclick=" & Chr(34) & "alert('IDCliente: " & IDCliente & ", IDCentro: " & IDCentro & ", IDServicio: " & VIDServicios(0) & "')" & Chr(34) & "/ ></div>"
                    'HTML += "<div class='col-xs-6 col-xs-4_2'><img class='img_massage' src='" & ruta_massage & "' onclick=" & Chr(34) & "alert('IDCliente: " & IDCliente & ", IDCentro: " & IDCentro & ", IDServicio: " & VIDServicios(1) & "')" & Chr(34) & "/ ></div></div>"

                    OrdenFilas.InnerHtml = HTML
                Case 3
                    'Botón 1: IDCliente=1, IDCentro=2, IDServicio=1
                    'Botón 2: IDCliente=1, IDCentro=2, IDServicio=2
                    HTML = "<div class='row alineado'><p class='col-xs-3 texto_tres_cuadros'></p>"
                    HTML += "<p class='col-xs-3 texto_tres_cuadros'>" & VNombreServicios(0) & "</p>"
                    HTML += "<p class='col-xs-3 texto_tres_cuadros'>" & VNombreServicios(1) & "</p><p class='col-xs-3 texto_tres_cuadros'></p></div>"
                    HTML += "<div class='row alineado'><div class='col-xs-3'></div>"
                    HTML += "<div class='col-xs-3 col-xs-4_1'><img class='img_pelu_tres' src='" & ruta_peluqueria & "'onclick=" & Chr(34) & "alert('IDCliente: " & IDCliente & ", IDCentro: " & IDCentro & ", IDServicio: " & VIDServicios(0) & "')" & Chr(34) & "/ ></div>"
                    HTML += "<div class='col-xs-3 col-xs-4_2'><img class='img_massage_tres' src='" & ruta_massage & "' onclick=" & Chr(34) & "alert('IDCliente: " & IDCliente & ", IDCentro: " & IDCentro & ", IDServicio: " & VIDServicios(1) & "')" & Chr(34) & "/ ></div>"
                    HTML += "<div class='col-xs-3'></div></div>"
                    HTML += "<div class='row alineado'><p class='col-xs-4'></p><p class='col-xs-4 texto_tres_cuadros especial'>" & VNombreServicios(2) & "</p><p class='col-xs-4 '></p></div>"
                    HTML += "<div class='row alineado'><div class='col-xs-4 '></div><div class='col-xs-4 col-xs-4_3'><img class='img_fisioterapia_tres' src='" & ruta_fisio & "' onclick=" & Chr(34) & "alert('IDCliente: " & IDCliente & ", IDCentro: " & IDCentro & ", IDServicio: " & VIDServicios(2) & "')" & Chr(34) & "/ ></div><div class='col-xs-4'></div></div>"
                    OrdenFilas.InnerHtml = HTML
                Case 4
                    HTML = "<div class='row alineado'><div class='col-xs-3 col-xs-4_1'><img class='img_pelu' src='" & ruta_peluqueria & "'onclick=" & Chr(34) & "alert('IDCliente: " & IDCliente & ", IDCentro: " & IDCentro & ", IDServicio: " & VIDServicios(0) & "')" & Chr(34) & "/ ></div>"
                    HTML += "<div class='col-xs-3 col-xs-4_2'><img class='img_massage' src='" & ruta_massage & "' onclick=" & Chr(34) & "alert('IDCliente: " & IDCliente & ", IDCentro: " & IDCentro & ", IDServicio: " & VIDServicios(1) & "')" & Chr(34) & "/ ></div>"
                    HTML += "<div class='col-xs-3 col-xs-4_3'><img class='img_estetica' src='" & ruta_fisio & "' onclick=" & Chr(34) & "alert('IDCliente: " & IDCliente & ", IDCentro: " & IDCentro & ", IDServicio: " & VIDServicios(2) & "')" & Chr(34) & "/ ></div>"
                    HTML += "<div class='col-xs-3 col-xs-4_4'><img class='img_pedicura' src='" & ruta_manicura & "' onclick=" & Chr(34) & "alert('IDCliente: " & IDCliente & ", IDCentro: " & IDCentro & ", IDServicio: " & VIDServicios(3) & "')" & Chr(34) & "/ ></div></div>"
                    HTML += "<p class='col-xs-3 texto_cuadro'>" & VNombreServicios(0) & "</p>"
                    HTML += "<p class='col-xs-3 texto_cuadro2_4'>" & VNombreServicios(1) & "</p>"
                    HTML += "<p class='col-xs-3 texto_cuadro3_1'>" & VNombreServicios(2) & "</p>"
                    HTML += "<p class='col-xs-3 texto_cuadro4'>" & VNombreServicios(3) & "</p>"
                    OrdenFilas.InnerHtml = HTML
            End Select
        Else

        End If
    End Sub

    Private Function DevuelveServicios(ByVal IDCliente As Integer, ByVal IDCentro As Integer, ByRef VIDServicios() As Integer, ByRef VNombreServicios() As String) As Boolean
        ReDim VIDServicios(2)
        ReDim VNombreServicios(2)
        VIDServicios(0) = 1
        VIDServicios(1) = 3
        VIDServicios(2) = 4
        'VIDServicios(3) = 2
        VNombreServicios(0) = "Turno de peluquería"
        VNombreServicios(1) = "Turno de masajes"
        VNombreServicios(2) = "Turno de fisioterapia"
        'VNombreServicios(3) = "Turno de Manícura/Pedícura"
    End Function

End Class