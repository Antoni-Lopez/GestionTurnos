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
                cont_princi.Style.Add("opacity", "0")
                ClientScript.RegisterStartupScript(Page.GetType(), "no_credencial", "desactivar_todo();", True)
            Else
                If CompruebaEmail(Trim(email)) Then 'Si nos devuelve true, el email está en la BD.

                    Dim iduser As Integer, Rol As Integer, inscrito As String

                    iduser = CompruebaEmail(email)
                    BuscaNameApellido(iduser)



                    'Ahora comprobamos si está inscrito en alguna Actividad o Traslado.
                    'If comprueba_inscripcion(iduser) Then
                    '    'como si lo está, declaramos la variable isncrito para saber en cual esta apuntado.
                    '    inscrito = comprueba_inscripcion(iduser)
                    'End If

                    Rol = 0 'Lo ponemos a Martillo porque el rol esta dividido en 0->Traslados y 1->Actividades, como estamos en traslados, es 0 por narices ^^
                    RellenarTraslados(Rol, iduser)


                    Rol = 1 'Como ya hemos mostrado los Traslados, ahora ponemos el Rol= 1 para mostrar las Actividades.
                    RellenarActividades(Rol)


                    'Ahora comprobamos que sesiones tiene checked.
                    'Buscar_Tabla_Enlace(iduser)


                Else
                    'Pese a que nos ha proporcionado un Email, este, no se encuentra en nuestra Bd,
                    'por ello, le mostramos todo vacio salvo un mensaje donde le avisamos que no existe dicho email
                    'en nuestra BD.
                    ClientScript.RegisterStartupScript(Page.GetType(), "not_findEmail", "desactivar_principal();", True)
                    prueba_aspx.Style.Add("background", "#efefef")
                    prueba_aspx.InnerHtml = "<p style='padding:5px;text-align:center;margin:5px;'>No existe ese Email en nuestra Base de Datos <i class='fas fa-exclamation-circle' style='color:red;'></i></p>"
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

    'Funcion que nos comprueba si el email proporcionado por el usuario esta en nuestra BD
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
        paso_datos.Text = iduser

        Return iduser
    End Function

    'Funcion para Buscar el Nombre y Apellidos del Usuario y ponerlos en un Div con un icono de "home".
    Private Function BuscaNameApellido(ByRef iduser)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String, name As String, ape As String
        DS = New DataSet

        VectorSQL(0) = "SELECT nombre,apellidos FROM usuarios WHERE idusuarios='" & clsBD.Cometes(Left(iduser, 100)) & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar los datos de email en la BD.')", True)
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

    'Funcion que nos comprueba si el usuario esta inscrito en algo o no.
    Function comprueba_inscripcion(ByRef idusuario)

        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String, sesiones As String, long_idsesion As Integer, VArray() As String, x As String
        DS = New DataSet

        VectorSQL(0) = "SELECT idsesiones FROM enlace WHERE idusuario='" & clsBD.Cometes(Left(idusuario, 100)) & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            'ClientScript.RegisterStartupScript(Page.GetType(), "user_fail", "LanzaAviso('No hemos encontrado que este usuario tuviese sesiones activas en la BD.')", True)
            Return False
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    sesiones = DS.Tables(0).Rows(i).Item("idsesiones")
                Next

                If sesiones.Length = 0 Then
                    Return False
                Else
                    VArray = sesiones.Split("¦")
                End If
            End If
        End If
        Return VArray
    End Function

    'Funcion que nos muestra los checkboxs de los Traslados.
    Private Function RellenarTraslados(ByRef Rol, ByVal iduser)

        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String, name As String, ape As String
        DS = New DataSet

        Dim fecha As String, hora As String, Descripcion As String, idsesiones As String, miprueba As String, aforo As Integer, inscritos As Integer, Varray() As String
        Dim sesion_Chk_usuario() As String, Rol_sesion As String, long_sesiones As Integer, sesion_usuario As String, evento As Integer, plaza As String, long_traslados As String, x As Integer


        VectorSQL(0) = "SELECT fecha_fin,hora,Descripción,idsesiones,Aforo,inscritos FROM sesiones WHERE rol='" & clsBD.Cometes(Left(Rol, 100)) & "'ORDER BY fecha_fin, hora"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1

                    fecha = DS.Tables(0).Rows(i).Item("fecha_fin")
                    hora = DS.Tables(0).Rows(i).Item("hora")
                    Descripcion = DS.Tables(0).Rows(i).Item("Descripción")
                    idsesiones = DS.Tables(0).Rows(i).Item("idsesiones")
                    aforo = DS.Tables(0).Rows(i).Item("Aforo")
                    inscritos = DS.Tables(0).Rows(i).Item("inscritos")

                    plaza = aforo - inscritos

                    'Comprobamos si quedan plazas o no, sino quedan desabilitamos el chkbox.
                    If plaza <= 0 Then
                        Varray = comprueba_inscripcion(iduser) 'comprobamos cual tiene marcado el usuario.
                        x = longitud_traslados() 'comprobamos tamaño total de traslados.

                        'For z = 0 To x - 1
                        '    If Varray(z) = 
                        'Next

                        While x <> (Varray.Length - 1)
                            If Varray(x) = idsesiones Then
                                miprueba += "<th scope = 'row'><input type='checkbox' id='chk" & idsesiones & "' name='omg' runat='server' checked/></th><td>" & fecha & "</td><td>" & hora & "</td><td>" & Descripcion & "</td></tr>"
                            Else
                                miprueba += "<th scope = 'row' onclick='mensaje_full()'><input type='checkbox' id='chk" & idsesiones & "' name='omg' runat='server'/></th><td>" & fecha & "</td><td>" & hora & "</td><td>" & Descripcion & "</td></tr>"
                            End If
                            x = x + 1
                        End While

                    Else
                        miprueba += "<th scope = 'row'><input type='checkbox' id='chk" & idsesiones & "' name='omg' runat='server'/></th><td>" & fecha & "</td><td>" & hora & "</td><td>" & Descripcion & "</td></tr>"
                    End If





                Next

            End If
        End If
        comienzo_tabla.InnerHtml = miprueba
    End Function

    'Funcion que nos muestra los checkboxs de las Actividades.
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

    'Funcion que nos muestra
    Private Function Buscar_Tabla_Enlace(ByRef idusuario)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String, sesiones As String, VArray() As String, quesale As String, contador As Integer, chk As String, prueba As String, prueba2 As String, prueba3 As String, cont As Integer
        Dim extraerchk As String
        DS = New DataSet

        VectorSQL(0) = "SELECT idsesiones FROM enlace WHERE idusuario='" & clsBD.Cometes(Left(idusuario, 100)) & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    sesiones = DS.Tables(0).Rows(i).Item("idsesiones")
                Next

                quesale = sesiones.Length

                VArray = sesiones.Split("¦")
                chk = ""
                For contador = 0 To UBound(VArray)
                    chk += VArray(contador)
                Next

                prueba = sesiones.Replace("¦", " ")
                prueba2 = prueba.Length 'Longitud del array con formato asi: 2 3 5 6--> Long:7
                prueba3 = chk.Length 'Longitud del array final con un formato asi: (2356)--->Long:4

                For cont = 0 To (prueba3 - 1)
                    extraerchk = chk(cont)
                    'If Comprobar_Aforo(idusuario) Then
                    '    ClientScript.RegisterStartupScript(Page.GetType(), "chekear_chk", "orihuela('" & sesiones & "')", True)
                    'Else
                    '    Return False
                    'End If
                Next

            End If
        End If
        'Return sesiones
    End Function

    Private Function longitud_traslados()
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String, Rol As String, sesion_max As String
        DS = New DataSet

        Rol = "0"

        VectorSQL(0) = "SELECT idsesiones FROM sesiones WHERE rol='" & clsBD.Cometes(Left(Rol, 100)) & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    sesion_max = DS.Tables(0).Rows(i).Item("idsesiones")
                Next
            End If
        End If
        Return sesion_max
    End Function
End Class