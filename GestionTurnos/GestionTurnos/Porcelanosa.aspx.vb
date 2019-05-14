Public Class Porcelanosa
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim clsGeneral As New ClaseGeneral, email As String
        clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)
        If Not IsPostBack Then
            'Button_enviar.Attributes.Add("onclick", "comprobar_marcados();")
            email = Request.QueryString("mail")

            If email = Nothing Then
                prueba_aspx.Style.Add("background-color", "#efefef")
                ClientScript.RegisterStartupScript(Page.GetType(), "no_credencial", "desactivar_todo();", True)
            Else
                If CompruebaEmail(Trim(email)) Then

                    Dim iduser As Integer, Rol As Integer

                    iduser = CompruebaEmail(email)
                    BuscaNameApellido(iduser)

                    Rol = 0 'Lo ponemos a Martillo porque el rol esta dividido en 0->Traslados y 1->Actividades, como estamos en traslados, es 0 por narices ^^
                    RellenarTraslados(Rol)

                    Rol = 1 'Como ya hemos mostrado los Traslados, ahora ponemos el Rol= 1 para mostrar las Actividades.
                    RellenarActividades(Rol)


                    'Ahora comprobamos que sesiones tiene checked.
                    Buscar_Tabla_Enlace(iduser)


                Else
                    prueba_aspx.InnerHtml = "<p>No existe ese Email en nuestra Base de Datos!</p>"
                End If
            End If


        Else
            Dim iduser As Integer

            'Button_enviar.Attributes.Add("onclick", "comprobar_marcados();")
            email = Request.QueryString("mail")


            iduser = CompruebaEmail(email)
            BuscaNameApellido(iduser)
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
                prueba_aspx.InnerHtml = "<p class='text_benvingut'>Bienvenido <span>" & name & " " & ape & "</span> <i class='fas fa-home' style='color:green;'></i></p>"
            End If
        End If
        Return iduser
    End Function

    Private Function RellenarTraslados(ByRef Rol)

        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String, name As String, ape As String
        DS = New DataSet

        Dim fecha As String, hora As String, Descripcion As String, idsesiones As String, miprueba As String

        VectorSQL(0) = "SELECT fecha_fin,hora,Descripción,idsesiones FROM sesiones WHERE rol='" & clsBD.Cometes(Left(Rol, 100)) & "'ORDER BY fecha_fin, hora"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1

                    fecha = DS.Tables(0).Rows(i).Item("fecha_fin")
                    hora = DS.Tables(0).Rows(i).Item("hora")
                    Descripcion = DS.Tables(0).Rows(i).Item("Descripción")
                    idsesiones = DS.Tables(0).Rows(i).Item("idsesiones")

                    miprueba += "<th scope = 'row'><input type='checkbox' id='chk" & idsesiones & "' name='omg' runat='server'/></th><td>" & fecha & "</td><td>" & hora & "</td><td>" & Descripcion & "</td></tr>"

                Next
                comienzo_tabla.InnerHtml = miprueba
            End If
        End If
    End Function

    Private Function RellenarActividades(ByRef Rol)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String, name As String, ape As String
        DS = New DataSet

        Dim fecha As String, hora As String, Descripcion As String, miprueba As String, idsesiones As String

        VectorSQL(0) = "SELECT fecha_fin,hora,Descripción,idsesiones FROM sesiones WHERE rol='" & clsBD.Cometes(Left(Rol, 100)) & "'ORDER BY fecha_fin, hora"
        '"'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1

                    fecha = DS.Tables(0).Rows(i).Item("fecha_fin")
                    hora = DS.Tables(0).Rows(i).Item("hora")
                    Descripcion = DS.Tables(0).Rows(i).Item("Descripción")
                    idsesiones = DS.Tables(0).Rows(i).Item("idsesiones")

                    miprueba += "<th scope = 'row'><input type='checkbox' id='chk" & idsesiones & "' name='omg' runat='server'/></th><td>" & fecha & "</td><td>" & hora & "</td><td>" & Descripcion & "</td></tr>"
                Next
                comienzo_tabla2.InnerHtml = miprueba
            End If
        End If
    End Function

    Private Function Buscar_Tabla_Enlace(ByRef idusuario)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String, sesiones As String, VArray() As String, quesale As String
        DS = New DataSet

        VectorSQL(0) = "SELECT idsesiones FROM enlace WHERE idusuario='" & clsBD.Cometes(Left(idusuario, 100)) & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    sesiones = DS.Tables(0).Rows(i).Item("idsesiones")
                Next

                ClientScript.RegisterStartupScript(Page.GetType(), "chekear_chk", "orihuela('" & sesiones & "')", True)

                'VArray = sesiones.Split("¦")
                'quesale = VArray.Length

                'chk1.checked = True

                'Creamos el array, y cada "substring" se lo asignaremos
                'a un elemento del array.
                'Usamos el caracter "¦" como separador
                'For c = LBound(VArray) To UBound(VArray)
                '    paso_datos.Text = VArray(c)
                '    'ape1_medic.Text = VArray(c)
                '    'ape2_medic.Text = VArray(c)
                'Next
            End If
        End If
        Return sesiones
    End Function
End Class