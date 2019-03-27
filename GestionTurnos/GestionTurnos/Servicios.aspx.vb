Public Class Servicios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'Archivos css y distintas librerias.
            Dim clsGeneral As New ClaseGeneral
            clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)

            'Variables que debemos recibir desde la BD.
            Dim ruta_imagen As String = "img/PEINARTE-LOG0.png"
            Dim ruta_peluqueria As String = "img/pelu.jpg"
            Dim ruta_massage As String = "img/masaje.jpg"
            Dim ruta_fisio As String = "img/fisio.jpg"
            Dim ruta_manicura As String = "img/manicura.jpg"
            Dim direccion_tablet As String = "Carlota Pasaran, 25, Alicante"

            'Mostramos logotipo(img) y dirección(texto) en el banner que hemos creado.
            logo_img.Text = "<img src=" & ruta_imagen & " id='logo_img'/>"
            text_banner.InnerHtml = direccion_tablet

            Dim tiempo_timing As Integer
            tiempo_timing = 0

            'Declaramos y recogemos los valores de Id del Cliente y ID del Centro.
            'Que accedemos a ellas a traves de 1 query stream.
            Dim IDCliente As Integer, IDCentro As Integer, VIDServicios() As Integer, VNombreServicios() As String, HTML As String
            IDCliente = Request.QueryString("IDCliente")
            IDCentro = Request.QueryString("IDCentro")

            DevuelveServicios(IDCliente, IDCentro, VIDServicios, VNombreServicios)

            Dim IDServicio As Integer


            IDServicio = VIDServicios(0)



            'Un switch de los servicios a mostrar, actualmente el max de servicios que hemos programado son para 4.
            Select Case VIDServicios.Length
                Case 1
                    'En este caso como solo tenemos un servicio a mostrar, por ello le decimos directamente a la aplicación
                    'que nos lleve a la interfaz de turnos, en este caso y por ahora es (Test.aspx)
                    tiempo_timing = 1
                    Response.Redirect("Test.aspx?IDCliente=" & IDCliente & "&IDCentro=" & IDCentro & "&timer=" & tiempo_timing, False)
                Case 2
                    'En este caso mostrariamos solo 2 servicios.
                    Dim IDServicio2 As Integer
                    IDServicio2 = VIDServicios(1)
                    HTML = "<div class='row alineado'><div class='col-xs-3'></div>"
                    HTML += "<div class='col-xs-3 dos_contenedores'><a href='Test.aspx?IDCliente=" & IDCliente & "&IDCentro=" & IDCentro & "&timer=" & tiempo_timing & "&servicio=" & IDServicio & "'><img class='img_pelu' src='" & ruta_peluqueria & "'/ ></a></div>"
                    HTML += "<div Class='col-xs-3 dos_contenedores'><a href='Test.aspx?IDCliente=" & IDCliente & "&IDCentro=" & IDCentro & "&timer=" & tiempo_timing & "&servicio=" & IDServicio2 & "'><img class='img_massage' src='" & ruta_massage & "'/ ></a></div><div class='col-xs-3'></div></div>"
                    HTML += "<p class='col-xs-3 texto_dos_cuadros'></p>"
                    HTML += "<p class='col-xs-3 texto_dos_cuadros'>" & VNombreServicios(0) & "</p>"
                    HTML += "<p class='col-xs-3 texto_dos_cuadros2'>" & VNombreServicios(1) & "</p>"
                    HTML += "<p class='col-xs-3 texto_dos_cuadros2'></p>"
                    OrdenFilas.InnerHtml = HTML
                Case 3
                    'En este caso mostrariamos 3 servicios.
                    Dim IDServicio2 As Integer
                    IDServicio2 = VIDServicios(1)
                    Dim IDServicio3 As Integer
                    IDServicio3 = VIDServicios(2)
                    'Botón 1: IDCliente=1, IDCentro=2, IDServicio=1
                    'Botón 2: IDCliente=1, IDCentro=2, IDServicio=2
                    HTML = "<div class='row alineado'><p class='col-xs-3 texto_tres_cuadros'></p>"
                    HTML += "<p class='col-xs-3 texto_tres_cuadros'>" & VNombreServicios(0) & "</p>"
                    HTML += "<p class='col-xs-3 texto_tres_cuadros'>" & VNombreServicios(1) & "</p><p class='col-xs-3 texto_tres_cuadros'></p></div>"
                    HTML += "<div class='row alineado'><div class='col-xs-3'></div>"
                    HTML += "<div class='col-xs-3 col-xs-4_1'><a href='Test.aspx?IDCliente=" & IDCliente & "&IDCentro=" & IDCentro & "&timer=" & tiempo_timing & "&servicio=" & IDServicio & "'><img class='img_pelu_tres' src='" & ruta_peluqueria & "'/ ></a></div>"
                    HTML += "<div class='col-xs-3 col-xs-4_2'><a href='Test.aspx?IDCliente=" & IDCliente & "&IDCentro=" & IDCentro & "&timer=" & tiempo_timing & "&servicio=" & IDServicio2 & "'><img class='img_massage_tres' src='" & ruta_massage & "'/ ></a></div>"
                    HTML += "<div class='col-xs-3'></div></div>"
                    HTML += "<div class='row alineado'><p class='col-xs-4'></p><p class='col-xs-4 texto_tres_cuadros especial'>" & VNombreServicios(2) & "</p><p class='col-xs-4 '></p></div>"
                    HTML += "<div class='row alineado'><div class='col-xs-4'></div><div class='col-xs-4 col-xs-4_3 tercer_cuadro'><a href='Test.aspx?IDCliente=" & IDCliente & "&IDCentro=" & IDCentro & "&timer=" & tiempo_timing & "&servicio=" & IDServicio3 & "'><img class='img_fisioterapia_tres' src='" & ruta_fisio & "'/ ></a></div><div class='col-xs-4'></div></div>"
                    OrdenFilas.InnerHtml = HTML
                Case 4
                    Dim IDServicio2 As Integer
                    IDServicio2 = VIDServicios(1)
                    Dim IDServicio3 As Integer
                    IDServicio3 = VIDServicios(2)
                    Dim IDServicio4 As Integer
                    IDServicio4 = VIDServicios(3)
                    'En este caso mostrariamos todos los servicios(4 max).
                    HTML = "<div class='row alineado'><div class='col-xs-3'></div>"
                    HTML += "<div class='col-xs-3 dos_contenedores'><a href='Test.aspx?IDCliente=" & IDCliente & "&IDCentro=" & IDCentro & "&timer=" & tiempo_timing & "&servicio=" & IDServicio & "'><img class='img_pelu' src='" & ruta_peluqueria & "'/ ></a></div>"
                    HTML += "<div Class='col-xs-3 dos_contenedores'><a href='Test.aspx?IDCliente=" & IDCliente & "&IDCentro=" & IDCentro & "&timer=" & tiempo_timing & "&servicio=" & IDServicio2 & "'><img class='img_massage' src='" & ruta_massage & "'/ ></a></div><div class='col-xs-3'></div></div>"
                    HTML += "<p class='col-xs-3 texto_dos_cuadros'></p>"
                    HTML += "<p class='col-xs-3 texto_dos_cuadros'>" & VNombreServicios(0) & "</p>"
                    HTML += "<p class='col-xs-3 texto_dos_cuadros2'>" & VNombreServicios(1) & "</p>"
                    HTML += "<p class='col-xs-3 texto_dos_cuadros2'></p>"
                    HTML += "<div class='row alineado'><div class='col-xs-3'></div>"
                    HTML += "<div class='col-xs-3 dos_contenedores'><a href='Test.aspx?IDCliente=" & IDCliente & "&IDCentro=" & IDCentro & "&timer=" & tiempo_timing & "&servicio=" & IDServicio3 & "'><img class='img_pelu' src='" & ruta_manicura & "'/ ></a></div>"
                    HTML += "<div Class='col-xs-3 dos_contenedores'><a href='Test.aspx?IDCliente=" & IDCliente & "&IDCentro=" & IDCentro & "&timer=" & tiempo_timing & "&servicio=" & IDServicio4 & "'><img class='img_massage' src='" & ruta_fisio & "'/ ></a></div><div class='col-xs-3'></div></div>"
                    HTML += "<p class='col-xs-3 texto_dos_cuadros'></p>"
                    HTML += "<p class='col-xs-3 texto_dos_cuadros'>" & VNombreServicios(2) & "</p>"
                    HTML += "<p class='col-xs-3 texto_cuadro4_4'>" & VNombreServicios(3) & "</p>"
                    HTML += "<p class='col-xs-3 texto_dos_cuadros2'></p>"
                    OrdenFilas.InnerHtml = HTML
            End Select
        Else

        End If
    End Sub
    'Función que será la encargada de conectar con la BD y devolvernos todos los datos 
    'que necesitemos, como, el nombre y el id de los distintos servicios.
    Private Function DevuelveServicios(ByVal IDCliente As Integer, ByVal IDCentro As Integer, ByRef VIDServicios() As Integer, ByRef VNombreServicios() As String) As Boolean
        ReDim VIDServicios(3)
        ReDim VNombreServicios(3)
        VIDServicios(0) = 1
        VIDServicios(1) = 3
        VIDServicios(2) = 4
        VIDServicios(3) = 2
        VNombreServicios(0) = "Turno de peluquería"
        VNombreServicios(1) = "Turno de masajes"
        VNombreServicios(2) = "Turno de fisioterapia"
        VNombreServicios(3) = "Turno de Manícura/Pedícura"
    End Function

End Class