Public Class Test
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim clsGeneral As New ClaseGeneral
        clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)

        'Variables que debemos recibir desde la BD.
        Dim ruta_imagen As String = "img/PEINARTE-LOG0.png"
        Dim direccion_tablet As String = "Carlota Pasaron, 25, Alicante"

        'Mostramos logotipo(img) y dirección(texto) en el banner que hemos creado.
        banner_img.Text = "<img src=" & ruta_imagen & " id='logo_img' class='logo_banner'/>"
        text_banner.InnerHtml = direccion_tablet

        Dim Comprobar_nombre As Integer, IDCliente As Integer, IDCentro As Integer, Nombre_servicio As String
        IDCliente = Request.QueryString("IDCliente")
        IDCentro = Request.QueryString("IDCentro")
        Comprobar_nombre = Request.QueryString("IDServicio")

        Select Case Comprobar_nombre
            Case 1
                Nombre_servicio = "Turno de peluquería"
                poner_nombre_turnos.InnerHtml = Nombre_servicio
            Case 2
                Nombre_servicio = "Turno de masajes"
                poner_nombre_turnos.InnerHtml = Nombre_servicio
            Case 3
                Nombre_servicio = "Turno de fisioterapia"
                poner_nombre_turnos.InnerHtml = Nombre_servicio
            Case 4
                Nombre_servicio = "Turno de Manícura/Pedícura"
                poner_nombre_turnos.InnerHtml = Nombre_servicio
        End Select


    End Sub

End Class