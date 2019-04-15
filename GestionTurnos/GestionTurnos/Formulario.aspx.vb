Public Class Formulario
    Inherits System.Web.UI.Page

    Dim clsBD As New ClaseAccesoBD
    Dim DS As DataSet
    Dim VectorSQL(0) As String, Jose As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim clsGeneral As New ClaseGeneral
            clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)

            Dim IdUsuario As Integer, Rol As Integer, Agrupacion As Integer
            IdUsuario = Request.QueryString("IdUser")

            Rol = Extraer_Rol(IdUsuario)

            If Rol = 0 Then
                datos_input_radio.Checked = True
                Extraer_BD_Delegado(IdUsuario, Rol)

                'A partir de aqui, lo creamos para mostrar datos en el combotext.
                'Agrupacion = Extraer_Agrupacion(IdUsuario, Rol)


            Else
                'Agrupacion = Extraer_BD_Delegado(IdUsuario)
                ClientScript.RegisterStartupScript(Page.GetType(), "id", "ocultar_select()", True)
                Extraer_BD_Medicos(IdUsuario)
            End If
        Else

            'Declaramos las variables.
            Dim Rol As Integer, Agrupacion As Integer, Nombre As String, Apellidos As String, Numero As Integer, Email As String, IdUsuario As Integer
            Dim Region As String, Siglas As String, Asistes As String, Origen As String, Transpor As Integer, Aloja As String, Aler As String, Obser As String, Especialidad As String, Consen As Integer, Selas As String
            Dim input_hidden As String, input_hidden2 As String

            'boton_enviar.Attributes.Add("onclick", "return prueba_jose()")
            IdUsuario = Request.QueryString("IdUser")
            miselect.Attributes.Add("onchange", "elegir_accion(2)")
            Button_Medico.Attributes.Add("onclick", "elegir_accion(3)")
            input_hidden = jose_prueba.Text
            input_hidden2 = jose_prueba2.Text

            If input_hidden2 = -2 Then
                Borrar_inputs(IdUsuario)
            End If

            Select Case input_hidden
                Case 1
                    'Llamamos a la función para que nos inserte los datos.
                    ActualizarBD_Delegado(IdUsuario)
                Case 2
                    'Nos han elegido alguna opcion del ComboText.
                    Rol = Extraer_Rol(IdUsuario)
                    Agrupacion = Extraer_Agrupacion(IdUsuario, Rol)
                    Extraer_Medicos_Combo(IdUsuario, Rol, Agrupacion)
                Case 3
                    ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Entramossssssss!')", True)
                    Dim nombre_new_medic As String, Apellidoss As String
                    nombre_new_medic = nombre_medico.Text
                    Apellidoss = ape1medico.Text + "¦" + ape2medico.Text

                    Rol = Extraer_Rol(IdUsuario)
                    Agrupacion = Extraer_Agrupacion(IdUsuario, Rol)
                    insertar_BD_Medico(nombre_new_medic, Apellidoss, Agrupacion)



                Case 4
                Case 5
            End Select

            'Dim Context As HttpContext, mail As String
            'Context = HttpContext.Current
            'If Context.Items.Contains("userID") Then
            'userID = CType(Context.Items("userID").ToString, String)
            'Rol = CType(Context.Items("rol").ToString, String)
            'pacion = CType(Context.Items("agrupacion").ToString, Integer)
            'Nombre = CType(Context.Items("Nombre").ToString, Integer)
            'Apellidos = CType(Context.Items("Apellidos").ToString, Integer)
            'Numero = CType(Context.Items("Numero").ToString, Integer)
            'Email = CType(Context.Items("Email").ToString, Integer)
            'Region = CType(Context.Items("Region").ToString, Integer)
            'Siglas = CType(Context.Items("Siglas").ToString, Integer)
            'Asistes = CType(Context.Items("Asistes").ToString, Integer)
            'Origen = CType(Context.Items("Origen").ToString, Integer)
            'Transpor = CType(Context.Items("Transpor").ToString, Integer)
            'Aloja = CType(Context.Items("Aloja").ToString, Integer)
            'Aler = CType(Context.Items("Aler").ToString, Integer)
            'Obser = CType(Context.Items("Obser").ToString, Integer)
            'Especialidad = CType(Context.Items("Especialidad").ToString, Integer)
            'Consen = CType(Context.Items("Consentimiento").ToString, Integer)
            'Selas = CType(Context.Items("Selas").ToString, Integer)
            'Agrupacion = CType(Context.Items("Agrupacion").ToString, String)
            'o tambien: 
            'Me.lblTest.Text = Context.Items("miEjemplo").ToString() 
            'Else
            'userID = "No existe item userID en el Contexto"
            'End If
        End If
    End Sub
    Protected Sub boton_enviar_Click(sender As Object, e As EventArgs) Handles boton_enviar.Click
        jose_prueba.Text = 1
    End Sub

    'Funcion que creamos para la extarcción del Rol(Delegado/Medico)
    Private Function Extraer_Rol(ByRef idusuario)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String, ID_Usuario As Integer, Rol As Integer

        VectorSQL(0) = "SELECT idContacte FROM EEContactes WHERE Auto ='" & clsBD.Cometes(Left(idusuario, 100)) & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            'Problema
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    Rol = DS.Tables(0).Rows(i).Item("idContacte")
                Next
            Else
                'No nos devuelve valores
            End If
        End If
        Return Rol
    End Function

    'Funcion que creamos para la extracción de la agrupación.
    Private Function Extraer_Agrupacion(ByRef idusuario, ByVal Rol)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String, Agrupacion As Integer

        VectorSQL(0) = "SELECT idOrigen FROM EEContactes WHERE Auto ='" & clsBD.Cometes(Left(idusuario, 100)) & "'AND idContacte='" & clsBD.Cometes(Left(Rol, 100)) & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            'Problema
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    Agrupacion = DS.Tables(0).Rows(i).Item("idOrigen")
                Next
            Else
                'No nos devuelve valores
            End If
        End If
        Return Agrupacion
    End Function

    Private Function insertar_BD_Medico(ByRef nombre, ByVal Apel, ByVal Agrupa)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String, idFeria As Integer = 195
        Dim i As Integer, Ultimo As Integer = 0
        Dim Name As String, Apellido As String, Ape1 As String, Ape2 As String, Mail As String, Especialidad As Integer, NSelas As String
        Dim Consentimiento As Integer, Transporte As Integer, Alojamiento As Integer, Alergia As String, Observaciones As String
        Dim Rol As Integer, Agrupacion As Integer, Asiste As Integer, numero As String, Region As String, Origen As String


        Rol = 1

        If (transporte_medic_si.Checked = True) Then
            Transporte = 1
        Else
            Transporte = 0
        End If

        If (ConsentimientoSi.Checked = True) Then
            Transporte = 1
        Else
            Transporte = 0
        End If

        If (alojamiento_si.Checked = True) Then
            Alojamiento = 1
        Else
            Alojamiento = 0
        End If

        If (ConsentimientoSi.Checked = True) Then
            Consentimiento = 1
        Else
            Consentimiento = 0
        End If

        Mail = medicmail.Text
        NSelas = medic_selas.Text
        Alergia = alergia_medic.Text
        Observaciones = Observa_medic.Text
        Especialidad = medicespecialidad.Text

        VectorSQL(0) = "INSERT INTO eecontactes (idFira, idContacte, idTipusContacte,Nom,Cognoms,Email,SectorInteres,NickTwitter,NickFacebook,WebPersonal,Blog,Data) VALUES('" & clsBD.Cometes(Left(idFeria, 100)) & "','" & clsBD.Cometes(Left(Rol, 100)) & "','" & clsBD.Cometes(Left(Transporte, 100)) & "','" & clsBD.Cometes(Left(nombre, 100)) & "','" & clsBD.Cometes(Left(Apel, 100)) & "','" & clsBD.Cometes(Left(Mail, 100)) & "','" & clsBD.Cometes(Left(NSelas, 100)) & "','" & clsBD.Cometes(Left(Alojamiento, 100)) & "','" & clsBD.Cometes(Left(Alergia, 100)) & "','" & clsBD.Cometes(Left(Observaciones, 100)) & "','" & clsBD.Cometes(Left(Especialidad, 100)) & "','" & clsBD.Cometes(Left(Consentimiento, 100)) & "')"
        If Not clsBD.BaseDades(2, VectorSQL, , Ultimo) Then
            'Problema
        Else
            'La variable Ultimo tendrá el último ID autonumérico
        End If

    End Function

    Private Function Extraer_BD_Medicos(ByRef iduser)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String
        Dim Name As String, Apellido As String, Ape1 As String, Ape2 As String, Mail As String, Especialidad As Integer, NSelas As Integer
        Dim Consentimiento As Integer, Transporte As Integer, Alojamiento As Integer, Alergia As String, Observaciones As String
        Dim Rol As Integer, Agrupacion As Integer, Asiste As Integer, numero As String, Region As String, Origen As String

        Dim ID_Usuario As Integer

        VectorSQL(0) = "Select Auto As userID ,idContacte As Rol,idOrigen As Agrupacion,idTipusContacte As Transporte, idAlta As Asiste, Nom As Nombre,Cognoms As Apellidos, Mobil As Numero, Email, Carrec As Region,Blog, Procedencia As Origen, SectorInteres As Selas,NickTwitter As Alojamiento, NickFacebook As Alergias, WebPersonal As Observaciones, Data FROM eecontactes WHERE Auto='" & clsBD.Cometes(Left(iduser, 100)) & "'"

        'VectorSQL(0) = "SELECT Auto, idContacte, idOrigen, idTipusContacte, idAlta, Nom, Cognoms, Mobil, Email, Carrec, Procedencia, SectorInteres, NickTwitter, NickFacebook, WebPersonal, Blog, Data FROM eecontactes WHERE Auto='" & clsBD.Cometes(Left(iduser, 100)) & "'"
        If clsBD.BaseDades(1, VectorSQL, DS) Then
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    Rol = DS.Tables(0).Rows(i).Item("Rol")
                    Agrupacion = DS.Tables(0).Rows(i).Item("Agrupacion")
                    Name = DS.Tables(0).Rows(i).Item("Nombre")
                    Apellido = DS.Tables(0).Rows(i).Item("Apellidos")
                    numero = DS.Tables(0).Rows(i).Item("Numero")
                    Mail = DS.Tables(0).Rows(i).Item("Email")
                    Region = DS.Tables(0).Rows(i).Item("Region")
                    Origen = DS.Tables(0).Rows(i).Item("Origen")
                    Transporte = DS.Tables(0).Rows(i).Item("Transporte")
                    Asiste = DS.Tables(0).Rows(i).Item("Asiste")
                    Alojamiento = DS.Tables(0).Rows(i).Item("Alojamiento")
                    Alergia = DS.Tables(0).Rows(i).Item("Alergias")
                    Observaciones = DS.Tables(0).Rows(i).Item("Observaciones")
                    NSelas = DS.Tables(0).Rows(i).Item("Selas")
                    Especialidad = DS.Tables(0).Rows(i).Item("Blog")
                    Consentimiento = DS.Tables(0).Rows(i).Item("Data")
                Next
            End If

            nombre_medico.Text = Name
            medicmail.Text = Mail
            medicespecialidad.Text = Especialidad
            medic_selas.Text = NSelas
            alergia_medic.Text = Alergia
            Observa_medic.Text = Observaciones

            'medicmail.Style.Add("nopoint")

            If Consentimiento = 1 Then
                ConsentimientoSi.Checked = True
            Else
                ConsentimientoN.Checked = True
            End If

            If Transporte = 1 Then
                transporte_medic_si.Checked = True
            Else
                transporte_medic_no.Checked = True
            End If

            If Alojamiento = 1 Then
                yes.Checked = True
            Else
                no.Checked = True
            End If
            'Declaramos 1 array para separar los datos de los apellidos.
            'ya que la consulta nos devuelve 2 campos(1apellido y 2apellido) en el mismo registro de la BD.
            Dim Sigla1 As String
            Dim c As Long
            Dim VArray() As String

            'Asignamos valores.
            Sigla1 = Apellido

            'Creamos el array, y cada "substring" se lo asignaremos
            'a un elemento del array.
            'Usamos el caracter "¦" como separador
            VArray = Split(Sigla1, "¦")

            For c = LBound(VArray) To UBound(VArray)
                ape1medico.Text = VArray(0)
                ape2medico.Text = VArray(1)
            Next
        End If

        Return True
    End Function

    Private Function Extraer_BD_Delegado(ByRef IdUsuario, ByVal Rol)
        'Realizamos la consulta en la BD
        VectorSQL(0) = "SELECT Auto AS userID ,idContacte AS Rol,idOrigen AS Agrupacion,idTipusContacte As Transporte, idAlta As Asiste, Nom As Nombre,Cognoms As Apellidos, Mobil AS Numero, Email, Carrec AS Region,NIT AS Siglas, Password, Procedencia As Origen, SectorInteres As Selas,NickTwitter As Alojamiento, NickFacebook As Alergias, WebPersonal As Observaciones FROM eecontactes WHERE Auto='" & IdUsuario & "'AND idContacte='" & Rol & "'"
        DS = New DataSet

        Dim userID As Integer, Agrupacion As Integer, Nombre As String, Apellidos As String, Numero As Integer, Email As String
        Dim Region As String, Siglas As String, Asistes As String, Origen As String, Transpor As Integer, Aloja As String, Aler As String, Obser As String

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            'Error. 
            Return False
        Else
            'Bucles para recorrer la BD 
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    userID = DS.Tables(0).Rows(i).Item("userID")
                    Rol = DS.Tables(0).Rows(i).Item("Rol")
                    Agrupacion = DS.Tables(0).Rows(i).Item("Agrupacion")
                    Nombre = DS.Tables(0).Rows(i).Item("Nombre")
                    Apellidos = DS.Tables(0).Rows(i).Item("Apellidos")
                    Numero = DS.Tables(0).Rows(i).Item("Numero")
                    Email = DS.Tables(0).Rows(i).Item("Email")
                    Region = DS.Tables(0).Rows(i).Item("Region")
                    Siglas = DS.Tables(0).Rows(i).Item("Siglas")
                    'Password = DS.Tables(0).Rows(i).Item("Password")
                    Origen = DS.Tables(0).Rows(i).Item("Origen")
                    Transpor = DS.Tables(0).Rows(i).Item("Transporte")
                    Asistes = DS.Tables(0).Rows(i).Item("Asiste")
                    Aloja = DS.Tables(0).Rows(i).Item("Alojamiento")
                    Aler = DS.Tables(0).Rows(i).Item("Alergias")
                    Obser = DS.Tables(0).Rows(i).Item("Observaciones")
                Next
            End If

            'Comprobamos que valor recibimos de la Bd para el 1º radio button,
            'el que nos dice si asistimos o no.
            If (Asistes = 0) Then
                radio_asiste_no.Checked = True
            Else
                radio_asiste_si.Checked = True

            End If

            'Comprobamos que valor recibimos de la BD para el 2º radio button
            'El de transporte.
            If (Transpor = 0) Then
                transporte_no.Checked = True
            Else
                transporte_si.Checked = True
            End If

            'Rellenamos los inputs con los datos que extraemos de la BD.
            texto_nombre.Text = Nombre
            texto_email.Text = Email
            texto_phone.Text = Numero
            texto_region.Text = Region
            ciudad_origen.Text = Origen
            alergias.Text = Aler
            observaciones.Text = Obser



            'Declaramos 2 arrays para separar datos,
            'ya que alguna consulta nos puede devolver 2 campos en 1 mismo.
            Dim Sigla1 As String, Sigla2 As String
            Dim c As Long, p As Long
            Dim VArray() As String, VArray2() As String

            'Asignamos valores.
            Sigla1 = Siglas
            Sigla2 = Apellidos

            'Creamos el array, y cada "substring" se lo asignaremos
            'a un elemento del array.
            'Usamos el caracter "¦" como separador
            VArray = Split(Sigla1, "¦")
            VArray2 = Split(Sigla2, "¦")

            For c = LBound(VArray) To UBound(VArray)
                texto_gerente.Text = VArray(0)
                texto_delegado.Text = VArray(1)
            Next

            For p = LBound(VArray2) To UBound(VArray2)
                apellido1.Text = VArray2(0)
                apellido2.Text = VArray2(1)
            Next
        End If
        Extaer_Datos_Combo(IdUsuario, Rol, Agrupacion)
        Return True
    End Function

    Private Function ActualizarBD_Delegado(ByRef userID_insert)
        'Declaramos las variables que vamos a insertar en la BD
        Dim Nombre_insert As String, Apellidos_insert As String, Numero_insert As Integer, Email_insert As String
        Dim Region_insert As String, Siglas_insert As String, Asiste_insert As Integer, Transporte_insert As Integer
        Dim Alojamiento_insert As Integer, Origen_insert As String, Alergias_insert As String, Obser_insert As String

        Dim phone_check As String, phone_check1 As String

        'Extraemos los datos del formulario.
        Nombre_insert = texto_nombre.Text
        Apellidos_insert = apellido1.Text + "¦" + apellido2.Text
        Email_insert = texto_email.Text
        phone_check = texto_phone.Text
        phone_check1 = Len(phone_check)

        'Comprobamos que el número de telefono tenga 9 digitos.
        If (phone_check1 = 9) Then
            Numero_insert = phone_check
        Else
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Número de Telefono incorrecto, por favor, comprueba que su numero tiene 9 digitos!')", True)
        End If
        Region_insert = texto_region.Text
        Siglas_insert = texto_gerente.Text + "¦" + texto_delegado.Text

        'Extraemos los datos de los radio button.
        'si el radio de asiste,transporte o alergia esta marcado, guardamos la variable en la Bd como 1, sino como 0.
        If (radio_asiste_si.Checked = True) Then
            Asiste_insert = 1
        Else
            Asiste_insert = 0
        End If

        'Misma comprobación con el transporte.
        If (transporte_si.Checked = True) Then
            Transporte_insert = 1
            Origen_insert = ciudad_origen.Text
        Else
            Transporte_insert = 0
        End If

        'Misma comprobación con el alojamiento.
        If (alojamiento_si.Checked = True) Then
            Alojamiento_insert = 1
        Else
            Alojamiento_insert = 0
        End If

        Alergias_insert = alergias.Text
        Obser_insert = observaciones.Text

        'Realizamos la consulta, en este caso, la update de la BD.
        VectorSQL(0) = "UPDATE eecontactes SET Nom = '" & clsBD.Cometes(Left(Nombre_insert, 100)) & "', Cognoms = '" & clsBD.Cometes(Left(Apellidos_insert, 100)) & "', Email= '" & clsBD.Cometes(Left(Email_insert, 100)) & "', Mobil= '" & clsBD.Cometes(Left(Numero_insert, 100)) & "', Carrec = '" & clsBD.Cometes(Left(Region_insert, 100)) & "', NIT= '" & clsBD.Cometes(Left(Siglas_insert, 100)) & "', idAlta= '" & clsBD.Cometes(Left(Asiste_insert, 100)) & "', idTipusContacte= '" & clsBD.Cometes(Left(Transporte_insert, 100)) & "',Procedencia='" & clsBD.Cometes(Left(Origen_insert, 100)) & "', NickTwitter='" & clsBD.Cometes(Left(Alojamiento_insert, 100)) & "',NickFacebook= '" & clsBD.Cometes(Left(Alergias_insert, 100)) & "',WebPersonal='" & clsBD.Cometes(Left(Obser_insert, 100)) & "' WHERE Auto = '" & userID_insert & "' AND Nom = '" & Nombre_insert & "'"

        If Not clsBD.BaseDades(2, VectorSQL) Then
            'Problema
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al actualizar los datos!')", True)
        Else
            'Correcto
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Actualización perfecta en la BD (-; ')", True)
        End If
    End Function

    'Funcion que creamos para la extraccion de datos en el combotext.
    Private Function Extaer_Datos_Combo(ByRef idusuario, ByVal Rol, ByVal Agrupa)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String

        VectorSQL(0) = "SELECT idContacte, Nom, Cognoms, idOrigen FROM EEContactes WHERE idContacte<>'" & Rol & "'AND idOrigen ='" & Agrupa & "'ORDER BY Cognoms, Nom"
        If clsBD.BaseDades(1, VectorSQL, DS) Then
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    miselect.Items.Add(New ListItem(DS.Tables(0).Rows(i).Item("Cognoms").Replace("¦", " ") & ", " & DS.Tables(0).Rows(i).Item("Nom"), i + 1))
                Next
            End If
        End If
        Return True
    End Function

    Private Function Extraer_Medicos_Combo(ByRef iduser, ByVal Rol, ByVal agrupa)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String

        Dim UserID As String, Name As String, Apellido As String, Ape1 As String, Ape2 As String, Mail As String, Especialidad As Integer, NSelas As Integer
        Dim Consentimiento As Integer, Transporte As Integer, Alojamiento As Integer, Alergia As String, Observaciones As String
        Dim Asiste As Integer, numero As String, Region As String, Origen As String, input_hidden2 As String, n As Integer

        input_hidden2 = jose_prueba2.Text

        VectorSQL(0) = "SELECT Auto, idContacte, idOrigen, idTipusContacte,idAlta,Nom, Cognoms,Mobil,Email,Carrec,NIT,Procedencia,SectorInteres,NickTwitter,NickFacebook,WebPersonal,Blog,data FROM EEContactes WHERE idOrigen ='" & agrupa & "' AND idContacte <>'" & Rol & "'ORDER BY Cognoms, Nom"

        Select Case input_hidden2
            Case 1
                n = 0
            Case 2
                n = 1
            Case 3
                n = 2
            Case 4
                n = 3
            Case 5
                n = 4
            Case 6
                n = 5
            Case 7
                n = 6
            Case 8
                n = 7
            Case 9
                n = 8
            Case 10
                n = 9
        End Select

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            'Problema
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    UserID = DS.Tables(0).Rows(n).Item("Auto")
                    Rol = DS.Tables(0).Rows(n).Item("idContacte")
                    agrupa = DS.Tables(0).Rows(n).Item("idOrigen")
                    Name = DS.Tables(0).Rows(n).Item("Nom")
                    Apellido = DS.Tables(0).Rows(n).Item("Cognoms")
                    numero = DS.Tables(0).Rows(n).Item("Mobil")
                    Mail = DS.Tables(0).Rows(n).Item("Email")
                    Region = DS.Tables(0).Rows(n).Item("Carrec")
                    Origen = DS.Tables(0).Rows(n).Item("Procedencia")
                    Transporte = DS.Tables(0).Rows(n).Item("idTipusContacte")
                    Asiste = DS.Tables(0).Rows(n).Item("idAlta")
                    Alojamiento = DS.Tables(0).Rows(n).Item("NickTwitter")
                    Alergia = DS.Tables(0).Rows(n).Item("NickFacebook")
                    Observaciones = DS.Tables(0).Rows(n).Item("WebPersonal")
                    NSelas = DS.Tables(0).Rows(n).Item("SectorInteres")
                    Especialidad = DS.Tables(0).Rows(n).Item("Blog")
                    Consentimiento = DS.Tables(0).Rows(n).Item("Data")
                Next





                'No nos devuelve valores
                nombre_medico.Text = Name
                medicmail.Text = Mail
                medicespecialidad.Text = Especialidad
                medic_selas.Text = NSelas
                alergia_medic.Text = Alergia
                Observa_medic.Text = Observaciones

                'medicmail.Style.Add("nopoint")

                If Consentimiento = 1 Then
                    ConsentimientoSi.Checked = True
                Else
                    ConsentimientoN.Checked = True
                End If

                If Transporte = 1 Then
                    transporte_medic_si.Checked = True
                Else
                    transporte_medic_no.Checked = True
                End If

                If Alojamiento = 1 Then
                    yes.Checked = True
                Else
                    no.Checked = True
                End If
                'Declaramos 1 array para separar los datos de los apellidos.
                'ya que la consulta nos devuelve 2 campos(1apellido y 2apellido) en el mismo registro de la BD.
                Dim Sigla1 As String
                Dim c As Long
                Dim VArray() As String

                'Asignamos valores.
                Sigla1 = Apellido

                'Creamos el array, y cada "substring" se lo asignaremos
                'a un elemento del array.
                'Usamos el caracter "¦" como separador
                VArray = Split(Sigla1, "¦")

                For c = LBound(VArray) To UBound(VArray)
                    ape1medico.Text = VArray(0)
                    ape2medico.Text = VArray(1)
                Next
            End If
        End If

        Return True
    End Function

    Private Function Borrar_inputs(ByRef IdUsuario)
        nombre_medico.Text = ""
        medicmail.Text = ""
        medicespecialidad.Text = ""
        medic_selas.Text = ""
        alergia_medic.Text = ""
        Observa_medic.Text = ""
        ape1medico.Text = ""
        ape2medico.Text = ""
        no.Checked = True
        transporte_medic_no.Checked = True
        ConsentimientoN.Checked = True

        Return True
    End Function

End Class