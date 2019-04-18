Public Class Formulario2
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
            Agrupacion = Extraer_Agrupacion(IdUsuario, Rol)

            If Rol = 0 Then
                radio1.Checked = True
                Extaer_Datos_Combo(IdUsuario, Rol, Agrupacion)
                Extraer_BD_Delegado(IdUsuario, Rol)
            Else
                ClientScript.RegisterStartupScript(Page.GetType(), "id", "desactivar();", True)
                Extraer_BD_Medicos(IdUsuario)
            End If
        Else
            'Declaramos las variables.
            Dim Rol As Integer, Agrupacion As Integer, Nombre As String, Apellidos As String, Numero As Integer, Email As String, IdUsuario As Integer
            Dim Region As String, Siglas As String, Asistes As String, Origen As String, Transpor As Integer, Aloja As String, Aler As String, Obser As String, Especialidad As String, Consen As Integer, Selas As String
            Dim input_hidden As String, input_hidden2 As String

            'Recogemos el id de usuario que esta oculto.
            IdUsuario = Request.QueryString("IdUser")
            'Declaramos el combotext para que nos mande a una accion con javascript.
            soflow.Attributes.Add("onchange", "elegir_accion(2);")

            'Declaramos las acciones al pulsar los botones.
            Button_Medico.Attributes.Add("onclick", "boton_enviar_medico();")
            Button_Medico_Delete.Attributes.Add("onclick", "elegir_accion(5);")
            Button_delegado.Attributes.Add("onclick", "elegir_accion(5);")




            'Captamos los valores de los inputs hidden.
            input_hidden = paso_datos.Text
            input_hidden2 = paso_datos2.Text

            Select Case input_hidden2
                Case -2
                    If input_hidden = 2 Then
                        'Vamos a proceder a registrar un nuevo medico.
                        'Por ello primero limpiamos todos los inputs.
                        'Al seleccionar nueva alta, automaticamente, limpiamos todos los inputs.
                        ClientScript.RegisterStartupScript(Page.GetType(), "vaciar_inputs", "vaciar_inputs_medicos();", True)
                    End If
                Case -1
                    input_hidden = 2
            End Select

            Rol = Extraer_Rol(IdUsuario)
            Agrupacion = Extraer_Agrupacion(IdUsuario, Rol)

            Select Case input_hidden
                Case 1
                    'Llamamos a la función para que nos actualize los datos.
                    'ActualizarBD_Delegado(IdUsuario)
                Case 2
                    'Actualizamos el ComboText.
                    Extraer_Medicos_Combo(IdUsuario, Rol, Agrupacion)
                Case 3
                    'El Delegado le pulsa al botón de enviar en medicos, la web lo interpreta como que quiere introducir un nuevo registro de medico en la BD
                    insertar_new_Medico(Agrupacion)
                Case 4
                    'El Delegado le pulsa al botón de enviar en medicos, la web lo interpreta como que quiere modificar un  registro ya existente en la BD de medico
                    UPDATE_BD_Medicos(Agrupacion, Rol)
                Case 5
                    'Boton eliminar registro de medico en la BD.
                    Delete_1Medico_BD()

                    soflow.DataTextField = ("") 'Borra el texto del combo

                    Refresh_Datos_Combo(IdUsuario, Rol, Agrupacion)
                    'ClientScript.RegisterStartupScript(Page.GetType(), "id", "EnviemFormulari()", True)
            End Select
        End If
    End Sub

    Protected Sub Button_delegado_Click(sender As Object, e As EventArgs) Handles Button_delegado.Click
        paso_datos.Text = 1
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

            name_medic.Text = Name
            medic_mail.Text = Mail
            medic_especialidad.Text = Especialidad
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
                ape1_medic.Text = VArray(0)
                ape2_medic.Text = VArray(1)
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
                Asistencia_no.Checked = True
            Else
                Asistencia_si.Checked = True

            End If

            'Comprobamos que valor recibimos de la BD para el 2º radio button
            'El de transporte.
            If (Transpor = 0) Then
                transporte_medic_no1.Checked = True
            Else
                transporte_medic_si1.Checked = True
            End If

            'Rellenamos los inputs con los datos que extraemos de la BD.
            name_delegado.Text = Nombre
            email_delegado.Text = Email
            numero_delegado.Text = Numero
            region_delegado.Text = Region
            city_origen_delegado.Text = Origen
            alergia_delegado.Text = Aler
            observa_delegado.Text = Obser



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
                siglas_gerente_delegado.Text = VArray(0)
                siglas_delegado.Text = VArray(1)
            Next

            For p = LBound(VArray2) To UBound(VArray2)
                ape1_delegado.Text = VArray2(0)
                ape2_delegado.Text = VArray2(1)
            Next
        End If
        Return True
    End Function


    'Funcion que creamos para la extraccion de datos en el combotext.
    Private Function Extaer_Datos_Combo(ByRef idusuario, ByVal Rol, ByVal Agrupa)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String


        VectorSQL(0) = "SELECT Auto , Nom, Cognoms, idOrigen FROM EEContactes WHERE idContacte<>'" & Rol & "'AND idOrigen ='" & Agrupa & "'ORDER BY Cognoms, Nom"
        If clsBD.BaseDades(1, VectorSQL, DS) Then
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    soflow.Items.Add(New ListItem(DS.Tables(0).Rows(i).Item("Cognoms").Replace("¦", " ") & ", " & DS.Tables(0).Rows(i).Item("Nom") & ", " & DS.Tables(0).Rows(i).Item("Auto"), i + 1))
                Next
            End If
        End If
        Return True
    End Function

    'Funcion que creamos para la extraccion de datos en el combotext.
    Private Function Refresh_Datos_Combo(ByRef idusuario, ByVal Rol, ByVal Agrupa)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String, id_eliminado As Integer

        id_eliminado = paso_datos3.Text

        VectorSQL(0) = "SELECT Auto , Nom, Cognoms, idOrigen FROM EEContactes WHERE idContacte<>'" & Rol & "'AND idOrigen ='" & Agrupa & "'And Auto<>'" & id_eliminado & "'ORDER BY Cognoms, Nom"
        If clsBD.BaseDades(1, VectorSQL, DS) Then
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    soflow.Items.Add(New ListItem(DS.Tables(0).Rows(i).Item("Cognoms").Replace("¦", " ") & ", " & DS.Tables(0).Rows(i).Item("Nom") & ", " & DS.Tables(0).Rows(i).Item("Auto"), i + 1))
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

        input_hidden2 = paso_datos2.Text

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

                paso_datos3.Text = UserID

                'No nos devuelve valores
                name_medic.Text = Name
                medic_mail.Text = Mail
                medic_especialidad.Text = Especialidad
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
                    ape1_medic.Text = VArray(0)
                    ape2_medic.Text = VArray(1)
                Next
            End If
        End If

        Return True
    End Function

    Private Function insertar_new_Medico(ByRef Agrupacion As Integer)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String, idFeria As Integer
        Dim i As Integer, Ultimo As Integer = 0

        Dim Name As String, Apellido As String, Ape1 As String, Ape2 As String, Mail As String, Especialidad As String, NSelas As String
        Dim Consentimiento As Integer, Transporte As Integer, Alojamiento As Integer, Alergia As String, Observaciones As String, Password As String
        Dim Rol As Integer, Asiste As Integer, numero As String, Region As String, Origen As String, Nit As Integer, NITactivat As Integer

        'Rellenamos las variables con los datos introducidos en los inputs.
        Name = name_medic.Text
        Apellido = ape1_medic.Text + "¦" + ape2_medic.Text
        Mail = medic_mail.Text
        NSelas = medic_selas.Text
        Alergia = alergia_medic.Text
        Observaciones = Observa_medic.Text
        Especialidad = medic_especialidad.Text
        Origen = origen_medic.Text
        numero = 0
        Password = ""
        Region = ""
        Nit = 0
        Asiste = 0
        NITactivat = 1

        'Ponemos el Rol a 1 como default, porque estámos insertando medicos, ya que tenemos que tener claro, que este registro lo hace el delegado.
        Rol = 1
        'Tambien ponemos el id de la feria a "martillo"
        idFeria = 195

        If (transporte_medic_si.Checked = True) Then
            Transporte = 1
        Else
            Transporte = 0
        End If
        If (yes.Checked = True) Then
            Alojamiento = 1
        Else
            Alojamiento = 0
        End If

        If (ConsentimientoSi.Checked = True) Then
            Consentimiento = 1
        Else
            Consentimiento = 0
        End If
        VectorSQL(0) = "INSERT INTO eecontactes (idFira, idContacte, idOrigen, idTipusContacte, idAlta, Nom, Cognoms, Mobil, Email, Carrec, Nit, NITactivat, Password, Blog, SectorInteres, Data, NickTwitter, Procedencia, NickFacebook, WebPersonal) " &
                        "VALUES(" & idFeria & "," & Rol & "," & Agrupacion & "," & Transporte & "," & Asiste & ",'" & clsBD.Cometes(Left(Name, 100)) & "','" & clsBD.Cometes(Left(Apellido, 100)) & "'," &
                        "'" & numero & "','" & clsBD.Cometes(Left(Mail, 100)) & "','" & Region & "','" & Nit & "'," & NITactivat & ",'" & clsBD.Cometes(Left(Password, 100)) & "','" & clsBD.Cometes(Left(Especialidad, 100)) & "','" & clsBD.Cometes(Left(NSelas, 100)) & "','" & Consentimiento & "'," &
                        "" & Alojamiento & ",'" & clsBD.Cometes(Left(Origen, 100)) & "','" & clsBD.Cometes(Left(Alergia, 100)) & "','" & clsBD.Cometes(Left(Observaciones, 100)) & "')"

        '195,1,1,0,0, Victor,Mateo¦Cases,,natimateo@gmail.com,,,,,,1325,1,0,Torrevieja,Dana,Nada que destacar)"

        If Not clsBD.BaseDades(2, VectorSQL, , Ultimo) Then
            'If Not clsBD.BaseDades(2, VectorSQL) Then
            'Problema
        Else
            'La variable Ultimo tendrá el último ID autonumérico
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Registro de nuevo medico concluido sin problemas!');", True)
            Return Ultimo
        End If

    End Function

    Private Function UPDATE_BD_Medicos(ByRef agrupacion, ByVal Rol)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String, IDUser As Integer

        Dim Name As String, Apellido As String, Ape1 As String, Ape2 As String, Mail As String, Especialidad As String, NSelas As String
        Dim Consentimiento As String, Transporte As Integer, Alojamiento As String, Alergia As String, Observaciones As String, Password As String
        Dim Asiste As Integer, numero As String, Region As String, Origen As String, Nit As Integer, NITactivat As String



        IDUser = paso_datos3.Text
        'Rellenamos las variables con los datos introducidos en los inputs.
        Name = name_medic.Text
        Apellido = ape1_medic.Text + "¦" + ape2_medic.Text
        Mail = medic_mail.Text
        NSelas = medic_selas.Text
        Alergia = alergia_medic.Text
        Observaciones = Observa_medic.Text
        Especialidad = medic_especialidad.Text
        Origen = origen_medic.Text

        'Ponemos el Rol a 1 como default, porque estámos actualizando medicos, ya que tenemos que tener claro, que esta modificacion lo hace el delegado.
        Rol = 1

        If (transporte_medic_si.Checked = True) Then
            Transporte = 1
        Else
            Transporte = 0
        End If
        If (yes.Checked = True) Then
            Alojamiento = 1
        Else
            Alojamiento = 0
        End If

        If (ConsentimientoSi.Checked = True) Then
            Consentimiento = 1
        Else
            Consentimiento = 0
        End If

        'VectorSQL(0) = "UPDATE eecontactes SET Nom = '" & clsBD.Cometes(Left(Nombre_insert, 100)) & "', Cognoms = '" & clsBD.Cometes(Left(Apellidos_insert, 100)) & "', Email= '" & clsBD.Cometes(Left(Email_insert, 100)) & "', Mobil= '" & clsBD.Cometes(Left(Numero_insert, 100)) & "', Carrec = '" & clsBD.Cometes(Left(Region_insert, 100)) & "', NIT= '" & clsBD.Cometes(Left(Siglas_insert, 100)) & "', idAlta= '" & clsBD.Cometes(Left(Asiste_insert, 100)) & "', idTipusContacte= '" & clsBD.Cometes(Left(Transporte_insert, 100)) & "',Procedencia='" & clsBD.Cometes(Left(Origen_insert, 100)) & "', NickTwitter='" & clsBD.Cometes(Left(Alojamiento_insert, 100)) & "',NickFacebook= '" & clsBD.Cometes(Left(Alergias_insert, 100)) & "',WebPersonal='" & clsBD.Cometes(Left(Obser_insert, 100)) & "' WHERE Auto = '" & userID_insert & "' AND Nom = '" & Nombre_insert & "'"

        VectorSQL(0) = "UPDATE eecontactes SET idContacte = '" & Rol & "', idOrigen='" & agrupacion & "', idTipusContacte='" & Transporte & "', Nom='" & clsBD.Cometes(Left(Name, 100)) & "', Cognoms='" & clsBD.Cometes(Left(Apellido, 100)) & "', Email='" & clsBD.Cometes(Left(Mail, 100)) & "', Procedencia='" & Origen & "', SectorInteres='" & NSelas & "', NickTwitter='" & Alojamiento & "', NickFacebook='" & clsBD.Cometes(Left(Alergia, 100)) & "', WebPersonal='" & clsBD.Cometes(Left(Observaciones, 100)) & "',Blog='" & Especialidad & "',Data='" & Consentimiento & "' WHERE Auto = '" & IDUser & "'"
        If Not clsBD.BaseDades(2, VectorSQL) Then
            'Problema
        Else
            'Correcto
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Actualización perfecta en la BD (-; ')", True)
        End If
    End Function

    Private Function Delete_1Medico_BD()
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String, IDUser As Integer

        IDUser = paso_datos3.Text


        VectorSQL(0) = "DELETE FROM eecontactes WHERE Auto = '" & IDUser & "'"
        If Not clsBD.BaseDades(2, VectorSQL) Then
            'Problema
        Else
            'Correcto
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Eliminación de 1 medico de la BD sin problemas!');", True)
        End If
        Return True
    End Function
End Class