Public Class Porcelanosa
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim clsGeneral As New ClaseGeneral, email As String
        clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)
        If Not IsPostBack Then
            Button_enviar.Attributes.Add("onclick", "comprobar_marcados();")
            email = Request.QueryString("mail")

            If email = Nothing Then
                ClientScript.RegisterStartupScript(Page.GetType(), "no_credencial", "desactivar_todo();", True)
            Else
                If CompruebaEmail(Trim(email)) Then
                    Dim iduser As Integer
                    iduser = CompruebaEmail(email)
                    BuscaNameApellido(iduser)
                Else
                    prueba_aspx.InnerText = "<p>No existe ese Email en nuestra Base de Datos!</p>"
                End If
            End If


        Else
            Button_enviar.Attributes.Add("onclick", "comprobar_marcados();")
            prueba_aspx.InnerHtml = "<p style='color:Blue;text-align:center;'>Ahora me llamo Antonio el dueño de este Bastón..</p>"
        End If


    End Sub

    Private Function CompruebaEmail(ByRef email)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String, iduser As Integer
        DS = New DataSet

        VectorSQL(0) = "SELECT idusuarios FROM usuarios WHERE Email='" & clsBD.Cometes(Left(email, 100)) & "'"
        'VectorSQL(0) = "SELECT Auto AS userID ,idContacte AS Rol,idOrigen AS Agrupacion,idTipusContacte As Transporte, idAlta As Asiste, Nom As Nombre,Cognoms As Apellidos, Mobil AS Numero, Email, Carrec AS Region,NIT AS Siglas, Password, Procedencia As Origen, SectorInteres As Selas,NickTwitter As Alojamiento, NickFacebook As Alergias, WebPersonal As Observaciones, Blog As Especialidad, Data As consentimiento FROM usuarios WHERE Email='" & clsBD.Cometes(Left(email, 100)) & "'"
        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    iduser = DS.Tables(0).Rows(i).Item("idusuarios")
                Next
            End If
        End If
        Return iduser
    End Function

    Private Function BuscaNameApellido(ByRef iduser)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String, name As String, ape As String
        DS = New DataSet

        VectorSQL(0) = "SELECT nombre,apellidos FROM usuarios WHERE idusuarios='" & clsBD.Cometes(Left(iduser, 100)) & "'"
        'VectorSQL(0) = "SELECT Auto AS userID ,idContacte AS Rol,idOrigen AS Agrupacion,idTipusContacte As Transporte, idAlta As Asiste, Nom As Nombre,Cognoms As Apellidos, Mobil AS Numero, Email, Carrec AS Region,NIT AS Siglas, Password, Procedencia As Origen, SectorInteres As Selas,NickTwitter As Alojamiento, NickFacebook As Alergias, WebPersonal As Observaciones, Blog As Especialidad, Data As consentimiento FROM usuarios WHERE Email='" & clsBD.Cometes(Left(email, 100)) & "'"
        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    name = DS.Tables(0).Rows(i).Item("nombre")
                    ape = DS.Tables(0).Rows(i).Item("apellidos")
                Next
                prueba_aspx.InnerHtml = "<p class='text_benvingut'>Bienvenido <span>" & name & "" & ape & "</span> <i class='fas fa-home' style='color:green;'></i></p>"
            End If
        End If
        Return iduser
    End Function
End Class