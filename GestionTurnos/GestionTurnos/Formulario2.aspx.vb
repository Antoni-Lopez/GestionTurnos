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

            paso_datos3.Text = IdUsuario


            Rol = Extraer_Rol(IdUsuario)
            Agrupacion = Extraer_Agrupacion(IdUsuario, Rol)

            If Rol = 0 Then
                radio1.Checked = True
                Extaer_Datos_Combo(IdUsuario, Rol, Agrupacion)
                Extraer_BD_Delegado(IdUsuario, Rol)
                'Button_delegado.Attributes.Add("onclick", "elegir_accion(1);")
                Button_delegado.Attributes.Add("onclick", "Registre(1);")
                Button_EnvioMail.Attributes.Add("onclick", "elegir_accion(7);")
                name_delegado.Attributes.Add("onclick", "desbloquear();")
                ape1_delegado.Attributes.Add("onclick", "desbloquear();")
                ape2_delegado.Attributes.Add("onclick", "desbloquear();")
                email_delegado.Attributes.Add("onclick", "desbloquear();")
            Else
                ClientScript.RegisterStartupScript(Page.GetType(), "desactivar_delegado", "desactivar();", True)
                Extraer_BD_Medicos(IdUsuario)
                name_medic.Attributes.Add("onclick", "desbloquear2();")
                ape1_medic.Attributes.Add("onclick", "desbloquear2();")
                ape2_medic.Attributes.Add("onclick", "desbloquear2();")
                medic_mail.Attributes.Add("onclick", "desbloquear2();")
                Button_envio_medico.Attributes.Add("onclick", "elegir_accion(6);")
            End If
            'Desactivamos los campos de delegado que no se podrán modificar en la BD.
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "onlyread_inputs_delegado();", True)
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
            'Button_delegado.Attributes.Add("onclick", "elegir_accion(1);")

            Button_envio_medico.Attributes.Add("onclick", "elegir_accion(6);")

            'Desactivamos los campos de delegado que no se podrán modificar en la BD.
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "onlyread_inputs_delegado();", True)

            'Captamos los valores de los inputs hidden.
            input_hidden = paso_datos.Text
            input_hidden2 = paso_datos2.Text

            If (input_hidden2 = -2) Then
                If (input_hidden = 2) Then
                    'Vamos a proceder a registrar un nuevo medico.
                    'Por ello primero limpiamos todos los inputs.
                    'Al seleccionar nueva alta, automaticamente, limpiamos todos los inputs.
                    ClientScript.RegisterStartupScript(Page.GetType(), "vaciar_inputs", "nueva_alta();", True)

                    'Reseteamos todos los campos de los inputs.
                    alojamiento_medico_si.Checked = False
                    alojamiento_medico_no.Checked = False
                    transpor_si.Checked = False
                    transpor_no.Checked = False
                    consen_si.Checked = False
                    consen_no.Checked = False
                    city_origen_medico.Attributes.Add("opacity", "0")
                    alergia_medic.Text = ""
                    Observa_medic.Text = ""
                Else
                    ClientScript.RegisterStartupScript(Page.GetType(), "onlyreaddoctors", "onlyread_inputs_medicos2();", True)
                End If
            Else
                ClientScript.RegisterStartupScript(Page.GetType(), "onlyreaddoctors", "onlyread_inputs_medicos2();", True)
            End If

            Rol = Extraer_Rol(IdUsuario)
            Agrupacion = Extraer_Agrupacion(IdUsuario, Rol)


            If Rol <> 0 Then
                ClientScript.RegisterStartupScript(Page.GetType(), "desactivar_delegado", "desactivar();", True)
                Button_envio_medico.Attributes.Add("onclick", "elegir_accion(6);")
            End If

            Select Case input_hidden
                Case 1
                    'Llamamos a la función para que nos actualize los datos.
                    'ActualizarBD_Delegado(IdUsuario)
                    'ClientScript.RegisterStartupScript(Page.GetType(), "lanzarAjax", "Registre(1);", True)

                Case 2
                    'Mostramos la eleccion del ComboText.
                    'ClientScript.RegisterStartupScript(Page.GetType(), "anadir_optgroup_select", "michorra();", True)
                    Extraer_Medicos_Combo(IdUsuario, Rol, Agrupacion)
                    name_medic.Attributes.Add("onclick", "desbloquear2();")
                    ape1_medic.Attributes.Add("onclick", "desbloquear2();")
                    ape2_medic.Attributes.Add("onclick", "desbloquear2();")
                    medic_mail.Attributes.Add("onclick", "desbloquear2();")
                Case 3
                    'El Delegado le pulsa al botón de enviar en medicos, la web lo interpreta como que quiere introducir un nuevo registro de medico en la BD
                    insertar_new_Medico(Agrupacion)
                    soflow.Items.Clear()  'Borra el texto del combo
                    soflow.Items.Add(New ListItem("Nueva Alta Médico", "-2"))  'Añadimos otra opcion.
                    soflow.Items.Add(New ListItem("------------------------------------------------", "-1"))  'Añadimos primera opcion.

                    Extaer_Datos_Combo(IdUsuario, Rol, Agrupacion)
                Case 4
                    'El Delegado le pulsa al botón de enviar en medicos, la web lo interpreta como que quiere modificar un  registro ya existente en la BD de medico
                    UPDATE_BD_Medicos(Agrupacion, Rol)
                    soflow.Items.Clear()  'Borra el texto del combo
                    soflow.Items.Add(New ListItem("Nueva Alta Médico", "-2"))  'Añadimos otra opcion.
                    soflow.Items.Add(New ListItem("Listado De Medicos", "-1"))  'Añadimos primera opcion.
                    Extaer_Datos_Combo(IdUsuario, Rol, Agrupacion)
                Case 5
                    'Boton eliminar registro de medico en la BD.
                    Delete_1Medico_BD()
                    ClientScript.RegisterStartupScript(Page.GetType(), "vaciar_inputs_medicos", "vaciar_inputs_medicos();", True)
                    soflow.Items.Clear()  'Borra el texto del combo
                    soflow.Items.Add(New ListItem("Nueva Alta Médico", "-2"))  'Añadimos otra opcion.
                    soflow.Items.Add(New ListItem("Listado De Medicos", "-1"))  'Añadimos primera opcion.
                    ClientScript.RegisterStartupScript(Page.GetType(), "anadir_optgroup_select", "michorra();", True)
                    Extaer_Datos_Combo(IdUsuario, Rol, Agrupacion)
                Case 6
                    'Llamamos a las funciones correspondientes
                    Update_Medico_ElMismo(IdUsuario, Rol, Agrupacion)
            End Select
        End If
    End Sub


    Protected Sub Button_delegado_Click(sender As Object, e As EventArgs) Handles Button_delegado.Click
        'ClientScript.RegisterStartupScript(Page.GetType(), "Llamar_Ajax", "Registre(1);", True)
        

    End Sub

    Protected Sub Button_envio_medico_Click(sender As Object, e As EventArgs) Handles Button_envio_medico.Click
        paso_datos.Text = 6
        paso_datos2.Text = 1
    End Sub

    Protected Sub Button_EnvioMail_Click(sender As Object, e As EventArgs) Handles Button_EnvioMail.Click
        'Datos necesarios para el envio de mails.
        Dim send_mail As New ClaseEmail
        Dim destinatario As String, Cabecera As String, Cuerpo As String, From As String
        Dim ServidorSMTP As String, UsuariSMTP As String, PasswordSMTP As String
        Dim Puerto As Integer, envio As Boolean, FitxerAdjunt As String, nombre As String, Ape1 As String


        'Datos necearios para la extracción de los medicos asociados al delegado.
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String, UserID As String, Rol As Integer, Agrupacion As Integer
        'Dim Nombre_medic As String, Apellidos_medics As String, Mail_medic As String, contador As Integer

        'Nos buscamos los datos necesarios para realizar la consulta que queremos.
        UserID = Request.QueryString("IdUser")
        Rol = Extraer_Rol(UserID)
        Agrupacion = Extraer_Agrupacion(UserID, Rol)

        'La consulta.
        VectorSQL(0) = "SELECT Auto , Nom, Cognoms, Email, idOrigen FROM EEContactes WHERE idContacte<>'" & Rol & "'AND idOrigen ='" & Agrupacion & "'ORDER BY Auto"

        nombre = name_delegado.Text
        Ape1 = ape1_delegado.Text
        destinatario = email_delegado.Text
        Cabecera = "Probando Mails de Novonordisk"
        Cuerpo = "<!DOCTYPE html><html xmlns='http://www.w3.org/1999/xhtml'><head runat='server'><meta http-equiv='Content-Type' content='text/html; charset=utf-8'/>
                <title></title><asp:literal id='bootstrap_min_css' runat='server'></asp:literal><asp:literal id='jquery_1_9_1_min_js' runat='server'></asp:literal>
                <asp:literal id='bootstrap_min_js' runat='server'></asp:literal><asp:literal id='bootbox_min_js' runat='server'></asp:literal><style>
                body{margin: 0;padding: 0;box-sizing:border-box;}.padd{padding:10px;}.principal{max-width:650px;width:100%;border: 2px solid black;height: auto;margin-top: 2%;background-color: #efefef;}
                .img_logo img{width: 100%;}.contenido{margin-top:2.5%!important;margin:auto;max-width:500px;width:100%;margin-bottom: 2.5% !important;}/* Style para la Tabla*/
                table{text-align:center;}.header_tabla{background-color: #20032F !important;color:#fff !important;text-align:center;}tr:nth-child(odd) {background-color:#F0174C !important;color: #fff;}
                tr:nth-child(even) {background-color: #f2f2f2   !important;}/* Media Querys para diseño Responsive.*/@media (max-width: 660px) {
                .principal{max-width: 450px; width: 100%;}}</style></head><body><div class='container-fluid principal verde'>
                <div class='row img_logo'><img src='file:///D:/sancheado/GestionTurnos/GestionTurnos/GestionTurnos/GestionTurnos/img/banner_novonordisk.jpg'/></div>
                <div class='row contenido padd'><h3>Bienvenido " & nombre & " " & Ape1 & " </h3><p> A continuación vamos a detallarle los datos de los medicos<br />
                que usted tiene a su cargo:</p><table class='table table-responsive table-striped'><thead><tr class='header_tabla'><th class='header_tabla'>Nombre</th>
                <th class='header_tabla'>Apellidos</th><th class='header_tabla'>Email</th></tr></thead><tbody>"

        If clsBD.BaseDades(1, VectorSQL, DS) Then
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    'Nombre_medic = DS.Tables(0).Rows(i).Item("Nom")
                    'Apellidos_medics = DS.Tables(0).Rows(i).Item("Cognoms").Replace("¦", " ")
                    'Mail_medic = DS.Tables(0).Rows(i).Item("Email")
                    Cuerpo += "<tr><td>" & DS.Tables(0).Rows(i).Item("Nom") & "</td><td>" & DS.Tables(0).Rows(i).Item("Cognoms").Replace("¦", " ") & "</td><td>" & DS.Tables(0).Rows(i).Item("Email") & "</td></tr>"
                Next
            End If
        End If

        Cuerpo += "</tbody></table></div></div></body></html>"

        From = "administrator@novonordisk.com"
        ServidorSMTP = "smtp.towerplane.com"
        UsuariSMTP = "jsmateo@towerplane.com"
        PasswordSMTP = "yjiumnvpgD"
        Puerto = "25"
        FitxerAdjunt = ""


        envio = send_mail.EnviarEmail_System_Web_Mail_BO(destinatario, From, Cabecera, Cuerpo, , ServidorSMTP,, UsuariSMTP, PasswordSMTP,,,,,)
        If envio Then
            ClientScript.RegisterStartupScript(Page.GetType(), "envio_OK", "LanzaAviso('Email enviado sin problemas aparentes!');", True)
        Else
            ClientScript.RegisterStartupScript(Page.GetType(), "envio_KO", "LanzaAviso('UPS algo ha fallado y no se ha podido enviar el email!');", True)
        End If
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

    'Funcion que nos muestra los datos del medico. Tanto en Panel de Delegado/Medico
    'como en el panel de medico solo.
    Private Function Extraer_BD_Medicos(ByRef iduser)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String
        Dim Name As String, Apellido As String, Ape1 As String, Ape2 As String, Mail As String, Especialidad As Integer, NSelas As Integer
        Dim Consentimiento As Integer, Transporte As Integer, Alojamiento As Integer, Alergia As String, Observaciones As String
        Dim Rol As Integer, Agrupacion As Integer, Asiste As Integer, numero As String, Region As String, Origen As String

        Dim ID_Usuario As Integer

        VectorSQL(0) = "Select Auto As userID ,idContacte As Rol,idOrigen As Agrupacion,idTipusContacte As Transporte, idAlta As Asiste, Nom As Nombre,Cognoms As Apellidos, Mobil As Numero, Email, Carrec As Region,Blog, Procedencia As Origen, SectorInteres As Selas,NickTwitter As Alojamiento, NickFacebook As Alergias, WebPersonal As Observaciones, Data FROM eecontactes WHERE Auto='" & clsBD.Cometes(Left(iduser, 100)) & "'"

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

            Select Case Especialidad
                Case 0
                    medic_especialidad1.SelectedValue = 0
                Case 1
                    medic_especialidad1.SelectedValue = 1
                Case 2
                    medic_especialidad1.SelectedValue = 2
                Case 3
                    medic_especialidad1.SelectedValue = 3
                Case 4
                    medic_especialidad1.SelectedValue = 4
                Case 5
                    medic_especialidad1.SelectedValue = 5
            End Select

            medic_selas.Text = NSelas
            origen_medic.Text = Origen
            alergia_medic.Text = Alergia
            Observa_medic.Text = Observaciones


            If Consentimiento = 1 Then
                consen_si.Checked = True
            Else
                consen_no.Checked = True
            End If

            If Transporte = 1 Then
                transpor_si.Checked = True
            Else
                transpor_no.Checked = True
            End If

            If Alojamiento = 1 Then
                alojamiento_medico_si.Checked = True
            Else
                alojamiento_medico_no.Checked = True
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

    'Funcion que nos muestra los datos del delegado, obviamente, solo en el caso de los Delegados.
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


            'Rellenamos los inputs con los datos que extraemos de la BD.
            name_delegado.Text = Nombre
            email_delegado.Text = Email
            numero_delegado.Text = Numero
            region_delegado.Text = Region
            alergia_delegado.Text = Aler
            observa_delegado.Text = Obser

            'Comprobamos que valor recibimos de la Bd para el 1º radio button,
            'el que nos dice si asistimos o no.
            Select Case Asistes
                Case 0
                    asistira_delegado_no.Checked = True
                Case 1
                    asistira_delegado_si.Checked = True
                    city_origen_delegado.Text = Origen
            End Select

            'Comprobamos que valor recibimos de la BD para el 2º radio button
            'El de transporte.
            Select Case Transpor
                Case 0
                    transporte_delegado_no.Checked = True
                Case 1
                    transporte_delegado_si.Checked = True
            End Select

            'Radio Button para alojamiento
            Select Case Aloja
                Case 0
                    alojamiento_delegado_no.Checked = True
                Case 1
                    alojamiento_delegado_si.Checked = True
            End Select



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
        Dim VectorSQL(0) As String, UserID As String
        Dim item() As String


        VectorSQL(0) = "SELECT Auto , Nom, Cognoms, idOrigen FROM EEContactes WHERE idContacte<>'" & Rol & "'AND idOrigen ='" & Agrupa & "'ORDER BY Cognoms, Nom"
        If clsBD.BaseDades(1, VectorSQL, DS) Then
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    UserID = DS.Tables(0).Rows(i).Item("Auto")
                    soflow.Items.Add(New ListItem(DS.Tables(0).Rows(i).Item("Cognoms").Replace("¦", " ") & ", " & DS.Tables(0).Rows(i).Item("Nom"), UserID))
                Next
            End If
        End If
        Return True

    End Function

    'Funcion que nos creamos para cuando el usuario pincha el Select/ComboBox rellenar 
    'los inputs con los datos de la eleccion del ComboBox.
    Private Function Extraer_Medicos_Combo(ByRef iduser, ByVal Rol, ByVal agrupa)
        'Declaramos los datos para acceder a la BD.
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String

        'Nos declaramos las distintas variables que necesitaremos para la función.
        Dim UserID As String, Name As String, Apellido As String, Ape1 As String, Ape2 As String, Mail As String, Especialidad As Integer, NSelas As Integer
        Dim Consentimiento As Integer, Transporte As Integer, Alojamiento As Integer, Alergia As String, Observaciones As String
        Dim Asiste As Integer, numero As String, Region As String, Origen As String, input_hidden2 As String, n As Integer
        Dim contador As Integer, number_pass As Integer, Rolete As Integer, agrupasion As Integer

        'Pasamos texto al input hidden, para luego ir tomando decisiones mediante el.
        UserID = paso_datos2.Text


        'Sentencia SQL
        VectorSQL(0) = "SELECT Auto, idContacte, idOrigen, idTipusContacte,idAlta,Nom, Cognoms,Mobil,Email,Carrec,NIT,Procedencia,SectorInteres,NickTwitter,NickFacebook,WebPersonal,Blog,data FROM EEContactes WHERE Auto ='" & UserID & "'ORDER BY Cognoms, Nom"



        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            'Problema
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    Rolete = DS.Tables(0).Rows(i).Item("idContacte")
                    agrupasion = DS.Tables(0).Rows(i).Item("idOrigen")
                    Name = DS.Tables(0).Rows(i).Item("Nom")
                    Apellido = DS.Tables(0).Rows(i).Item("Cognoms")
                    numero = DS.Tables(0).Rows(i).Item("Mobil")
                    Mail = DS.Tables(0).Rows(i).Item("Email")
                    Region = DS.Tables(0).Rows(i).Item("Carrec")
                    Origen = DS.Tables(0).Rows(i).Item("Procedencia")
                    Transporte = DS.Tables(0).Rows(i).Item("idTipusContacte")
                    Asiste = DS.Tables(0).Rows(i).Item("idAlta")
                    Alojamiento = DS.Tables(0).Rows(i).Item("NickTwitter")
                    Alergia = DS.Tables(0).Rows(i).Item("NickFacebook")
                    Observaciones = DS.Tables(0).Rows(i).Item("WebPersonal")
                    NSelas = DS.Tables(0).Rows(i).Item("SectorInteres")
                    Especialidad = DS.Tables(0).Rows(i).Item("Blog")
                    Consentimiento = DS.Tables(0).Rows(i).Item("Data")
                Next

                If Rolete = Rol Or agrupa <> agrupasion Then
                    'Error
                Else
                    'Empezamos a rellenar los datos de la BD en los inputs.
                    name_medic.Text = Name
                    medic_mail.Text = Mail
                    medic_selas.Text = NSelas
                    alergia_medic.Text = Alergia
                    Observa_medic.Text = Observaciones

                    'Dependiendo el numero almacenado en la BD, nos mostrara 1 select ú otro.
                    Select Case Especialidad
                        Case 0
                            medic_especialidad1.SelectedValue = 0
                        Case 1
                            medic_especialidad1.SelectedValue = 1
                        Case 2
                            medic_especialidad1.SelectedValue = 2
                        Case 3
                            medic_especialidad1.SelectedValue = 3
                        Case 4
                            medic_especialidad1.SelectedValue = 4
                        Case 5
                            medic_especialidad1.SelectedValue = 5
                    End Select

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
                    'Primero vaciamos todos los inputs para que no quede ninguno marcado/completado
                    'Y así, lo rellenamos con los datos de la BD.
                    'ClientScript.RegisterStartupScript(Page.GetType(), "reseteo_inputs_medicos", "resetear_radios_medics();", True)
                    alojamiento_medico_no.Checked = False
                    alojamiento_medico_si.Checked = False
                    consen_no.Checked = False
                    consen_si.Checked = False
                    transpor_no.Checked = False
                    transpor_si.Checked = False


                    'Les asignamos la posicion a los radio button, si ó no.
                    Select Case Alojamiento
                        Case 0
                            alojamiento_medico_no.Checked = True
                        Case 1
                            alojamiento_medico_si.Checked = True
                            origen_medic.Text = Origen
                    End Select

                    Select Case Consentimiento
                        Case 0
                            consen_no.Checked = True
                        Case 1
                            consen_si.Checked = True
                    End Select

                    Select Case Transporte
                        Case 0
                            transpor_no.Checked = True
                        Case 1
                            transpor_si.Checked = True
                    End Select
                End If
            End If
            End If
        Return True
    End Function

    'Inserta nuevos medicos en la BD
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
        If buscar_email(Mail) Then
            'hemos encontrado 1 mail =, no hacemos nada + salvo limpiar campos de rellenar.
            'ClientScript.RegisterStartupScript(Page.GetType(), "lanzarAviso", "LanzaAviso('Lo sentimos hemos encontrado ya un email igual en la base de datos! Por favor ponga otra distinto.');", True)
            ClientScript.RegisterStartupScript(Page.GetType(), "lanzarAvisos", "Email_Medic_BD();", True)
        Else
            NSelas = medic_selas.Text
            Alergia = alergia_medic.Text
            Observaciones = Observa_medic.Text
            Especialidad = paso_datos4.Text
            'Origen = origen_medic.Text
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

            'If (transpor_si.Checked = True) Then
            'Transporte = 1
            'Else
            Transporte = 0
            'End If
            'If (Alojamiento_si.Checked = True) Then
            'Alojamiento = 1
            'Else
            'Alojamiento = 0
            'End If

            If (consen_si.Checked = True) Then
                Consentimiento = 1
            Else
                Consentimiento = 0
            End If
            VectorSQL(0) = "INSERT INTO eecontactes (idFira, idContacte, idOrigen, idTipusContacte, idAlta, Nom, Cognoms, Mobil, Email, Carrec, Nit, NITactivat, Password, Blog, SectorInteres, Data, NickTwitter, Procedencia, NickFacebook, WebPersonal) " &
                        "VALUES(" & idFeria & "," & Rol & "," & Agrupacion & "," & Transporte & "," & Asiste & ",'" & clsBD.Cometes(Left(Name, 100)) & "','" & clsBD.Cometes(Left(Apellido, 100)) & "'," &
                        "'" & numero & "','" & clsBD.Cometes(Left(Mail, 100)) & "','" & Region & "','" & Nit & "'," & NITactivat & ",'" & clsBD.Cometes(Left(Password, 100)) & "','" & clsBD.Cometes(Left(Especialidad, 100)) & "','" & clsBD.Cometes(Left(NSelas, 100)) & "','" & Consentimiento & "'," &
                        "" & Alojamiento & ",'" & clsBD.Cometes(Left(Origen, 100)) & "','" & clsBD.Cometes(Left(Alergia, 100)) & "','" & clsBD.Cometes(Left(Observaciones, 100)) & "')"

            If Not clsBD.BaseDades(2, VectorSQL, , Ultimo) Then
                'Problema
                ClientScript.RegisterStartupScript(Page.GetType(), "Create_New_Medic_Fail", "LanzaAviso('Ha ocurrido un problema y no hemos podido realizar el nuevo ingreso en la Base de Datos.');", True)
            Else
                'La variable Ultimo tendrá el último ID autonumérico
                ClientScript.RegisterStartupScript(Page.GetType(), "Create_New_Medic_Ok", "LanzaAviso('Registro de nuevo medico en la Base de Datos concluido con exito!');", True)
                Return Ultimo
            End If
        End If
    End Function

    'Actualizar datos de medicos en la BD.
    Private Function UPDATE_BD_Medicos(ByRef agrupacion, ByVal Rol)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String, IDUser As Integer

        Dim Name As String, Apellido As String, Ape1 As String, Ape2 As String, Mail As String, Especialidad As String, NSelas As String
        Dim Consentimiento As String, Transporte As Integer, Alojamiento As String, Alergia As String, Observaciones As String, Password As String
        Dim Asiste As Integer, numero As String, Region As String, Origen As String, Nit As Integer, NITactivat As String, comprueba_mail As String
        Dim NumeroSelas As String, long_nselas As Integer, eleccion_especialidad As Integer, alergi As String, long_alergia_medico As Integer



        'IDUser = paso_datos3.Text
        'Rellenamos las variables con los datos introducidos en los inputs.
        Name = name_medic.Text
        Apellido = ape1_medic.Text + "¦" + ape2_medic.Text
        Mail = medic_mail.Text

        NumeroSelas = medic_selas.Text
        long_nselas = Len(NumeroSelas)

        If long_nselas <= 0 Then
            ClientScript.RegisterStartupScript(Page.GetType(), "KO_NumeroSelas", "LanzaAviso('Lo sentimos pero el Número de Selas no puede estar vacio ya que es 1 campo obligatorio.')", True)
            Return False
        Else
            NSelas = medic_selas.Text
        End If

        alergi = alergia_medic.Text
        long_alergia_medico = Len(alergi)

        If long_alergia_medico <= 0 Then
            ClientScript.RegisterStartupScript(Page.GetType(), "KO_Alergia_Medico", "LanzaAviso('Lo sentimos pero el campo de alergia no puede estar vacio ya que es 1 campo obligatorio.')", True)
            Return False
        Else
            Alergia = alergia_medic.Text
        End If

        Observaciones = Observa_medic.Text

        eleccion_especialidad = medic_especialidad1.Items(medic_especialidad1.SelectedIndex).Value

        If eleccion_especialidad = 0 Then
            ClientScript.RegisterStartupScript(Page.GetType(), "KO_Especialidad_Medico", "LanzaAviso('Lo sentimos pero debes elegir una opcion en el campo de especialidad, la opción elegida no es factible.')", True)
            Return False
        Else
            Especialidad = medic_especialidad1.Items(medic_especialidad1.SelectedIndex).Value
        End If

        Origen = origen_medic.Text

        'Ponemos el Rol a 1 como default, porque estámos actualizando medicos, ya que tenemos que tener claro, que esta modificacion lo hace el delegado.
        Rol = 1

        If transpor_si.Checked = True Then
            Transporte = 1
        Else
            Transporte = 0
        End If

        If alojamiento_medico_si.Checked = True Then
            Alojamiento = 1
        Else
            Alojamiento = 0
        End If

        If consen_si.Checked = True Then
            Consentimiento = 1
        Else
            ClientScript.RegisterStartupScript(Page.GetType(), "KO_Asistencia_Medico", "LanzaAviso('Lo sentimos pero la opcion de asistencia es obligatoria y no esta marcada, marquela y pruebe de nuevo.')", True)
            Return False
        End If

        VectorSQL(0) = "UPDATE eecontactes SET idContacte = '" & Rol & "', idOrigen='" & agrupacion & "', idTipusContacte='" & Transporte & "', Nom='" & clsBD.Cometes(Left(Name, 100)) & "', Cognoms='" & clsBD.Cometes(Left(Apellido, 100)) & "', Email='" & clsBD.Cometes(Left(Mail, 100)) & "', Procedencia='" & Origen & "', SectorInteres='" & NSelas & "', NickTwitter='" & Alojamiento & "', NickFacebook='" & clsBD.Cometes(Left(Alergia, 100)) & "', WebPersonal='" & clsBD.Cometes(Left(Observaciones, 100)) & "',Blog='" & Especialidad & "',Data='" & Consentimiento & "' WHERE Auto = '" & IDUser & "'"
        If Not clsBD.BaseDades(2, VectorSQL) Then
            'Problema
            ClientScript.RegisterStartupScript(Page.GetType(), "Update_Medico_Fail", "LanzaAviso('UPS! Algo ha salido mal y no hemos podido actualizar los datos.')", True)
        Else
            'Correcto
            ClientScript.RegisterStartupScript(Page.GetType(), "Update_Medico_Ok", "LanzaAviso('Actualización concluida en la BD (-; ')", True)
        End If
    End Function

    'Actulizar datos de medico desde el panel de solo medico. (el solo vámos)
    Private Function Update_Medico_ElMismo(ByRef IDUser, ByRef Rol, ByRef Agrupacion)
        'Nos declaramos las variables que nos hagan falta para el envio y actualizacion de los datos en la BD.
        Dim Nombre As String, Apellidos As String, Email As String, Especialidad As Integer, NSelas As String
        Dim Consentimiento As Integer, Transporte As Integer, Alojamiento As Integer, city_origen As String, Alergia As String, Observaciones As String

        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String

        'Comenzamos a llenar valores de los inputs.
        Nombre = name_medic.Text
        Apellidos = ape1_medic.Text + "¦" + ape2_medic.Text
        Email = medic_mail.Text
        Especialidad = medic_especialidad1.Items(medic_especialidad1.SelectedIndex).Value
        NSelas = medic_selas.Text

        If (transpor_si.Checked = True) Then
            Transporte = 1
        Else
            Transporte = 0
        End If

        If (alojamiento_medico_si.Checked = True) Then
            Alojamiento = 1
            city_origen = origen_medic.Text
        Else
            Alojamiento = 0
        End If

        If (consen_si.Checked = True) Then
            Consentimiento = 1
        Else
            Consentimiento = 0
        End If


        Alergia = alergia_medic.Text
        Observaciones = Observa_medic.Text

        VectorSQL(0) = "UPDATE eecontactes SET idContacte = '" & Rol & "', idOrigen='" & Agrupacion & "', idTipusContacte='" & Transporte & "', Nom='" & clsBD.Cometes(Left(Nombre, 100)) & "', Cognoms='" & clsBD.Cometes(Left(Apellidos, 100)) & "', Email='" & clsBD.Cometes(Left(Email, 100)) & "', Procedencia='" & city_origen & "', SectorInteres='" & NSelas & "', NickTwitter='" & Alojamiento & "', NickFacebook='" & clsBD.Cometes(Left(Alergia, 100)) & "', WebPersonal='" & clsBD.Cometes(Left(Observaciones, 100)) & "',Blog='" & Especialidad & "',Data='" & Consentimiento & "' WHERE Auto = '" & IDUser & "'"
        If Not clsBD.BaseDades(2, VectorSQL) Then
            'Problema
            ClientScript.RegisterStartupScript(Page.GetType(), "Update_Medico_HimSelf_Fail", "LanzaAviso('Algo ha salido mal y no hemos podido actualizar el registro en la Base de Datos. ');", True)
        Else
            'Correcto
            ClientScript.RegisterStartupScript(Page.GetType(), "Update_Medico_HimSelf_Ok", "LanzaAviso('Actualización concluida con exito en la BD (-; ')", True)
        End If
    End Function

    'Eliminar 1 registro de 1 medico.
    Private Function Delete_1Medico_BD()
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String, IDUser As Integer

        IDUser = paso_datos2.Text


        VectorSQL(0) = "DELETE FROM eecontactes WHERE Auto = '" & IDUser & "'"
        If Not clsBD.BaseDades(2, VectorSQL) Then
            'Problema
            ClientScript.RegisterStartupScript(Page.GetType(), "Delete_Medic_Fail", "LanzaAviso('Ha ocurrido un problema y no hemos podido eliminar ese registro.');", True)
        Else
            'Correcto
            ClientScript.RegisterStartupScript(Page.GetType(), "Delete_Medic_OK", "LanzaAviso('Eliminación de 1 medico de la BD sin problemas!');", True)
        End If
        Return True
    End Function

    'Actulizar datos de delegado.
    Private Function ActualizarBD_Delegado(ByRef userID_insert)
        'Declaramos las variables que vamos a insertar en la BD
        Dim Nombre_insert As String, Apellidos_insert As String, Numero_insert As Integer, Email_insert As String
        Dim Region_insert As String, Siglas_insert As String, Asiste_insert As Integer, Transporte_insert As Integer
        Dim Alojamiento_insert As Integer, Origen_insert As String, Alergias_insert As String, Obser_insert As String

        Dim phone_check As String, phone_check1 As String, primer_numero As Integer, Long_region As Integer, Regio As String, long_sigla_delegado As Integer
        Dim sigladelegat As String, siglagerente As String, long_sigla_gerente As Integer, long_alergia As Integer, alergi As String

        'Extraemos los datos del formulario.
        Nombre_insert = name_delegado.Text
        Apellidos_insert = ape1_delegado.Text + "¦" + ape2_delegado.Text
        Email_insert = email_delegado.Text
        phone_check = numero_delegado.Text
        phone_check1 = Len(phone_check)

        'Comprobamos que el número de telefono empieze por 6 o 7.
        primer_numero = phone_check.Substring(0, 1)

        If primer_numero = 6 Or primer_numero = 7 Then
            Numero_insert = phone_check
        Else
            ClientScript.RegisterStartupScript(Page.GetType(), "Error_Phone", "LanzaAviso('Número de Telefono incorrecto, por favor, comprueba que su numero comience por (6) o por (7)!')", True)
            Return False
        End If

        Regio = region_delegado.Text
        Long_region = Len(Regio)

        If Long_region <= 0 Then
            ClientScript.RegisterStartupScript(Page.GetType(), "Error_Region", "LanzaAviso('El campo región es obligatorio y no puede estar vacio. Por favor introduzca el dato correctamente!')", True)
            Return False
        Else
            Region_insert = Regio
        End If

        sigladelegat = siglas_delegado.Text
        long_sigla_delegado = Len(sigladelegat)

        siglagerente = siglas_gerente_delegado.Text
        long_sigla_gerente = Len(siglagerente)

        If long_sigla_delegado <= 0 Or long_sigla_gerente <= 0 Then
            ClientScript.RegisterStartupScript(Page.GetType(), "Error_Siglas", "LanzaAviso('Los campos siglas delegado/gerente son obligatorios y no pueden estar vacio. Por favor introduzca los datos correctamente!')", True)
            Return False
        Else
            Siglas_insert = siglas_delegado.Text + "¦" + siglas_gerente_delegado.Text
        End If


        'Extraemos los datos de los radio button.
        'si el radio de asiste,transporte o alergia esta marcado, guardamos la variable en la Bd como 1, sino como 0.
        If asistira_delegado_si.Checked = True Then
            Asiste_insert = 1
        Else
            ClientScript.RegisterStartupScript(Page.GetType(), "Error_Asistencia", "LanzaAviso('Usted no ha marcado/seleccionado la casilla de asistencia si, es un campo obligatorio, por favor, compruebela y marquela para continuar.')", True)
            Return False
        End If

        'Misma comprobación con el transporte.
        If (transporte_delegado_si.Checked = True) Then
            Transporte_insert = 1
        Else
            Transporte_insert = 0
        End If

        'Misma comprobación con el alojamiento.
        If alojamiento_delegado_si.Checked = True Then
            Alojamiento_insert = 1
            Origen_insert = city_origen_delegado.Text
        Else
            Alojamiento_insert = 0
        End If

        alergi = alergia_delegado.Text
        long_alergia = Len(alergi)

        If long_alergia <= 0 Then
            ClientScript.RegisterStartupScript(Page.GetType(), "Error_Alergia", "LanzaAviso('Error el campo alergia no puede estar vacio. Gracias!')", True)
            Return False
        Else
            Alergias_insert = alergi
        End If


        Obser_insert = observa_delegado.Text

        'Realizamos la consulta, en este caso, la update de la BD.
        VectorSQL(0) = "UPDATE eecontactes SET Nom = '" & clsBD.Cometes(Left(Nombre_insert, 100)) & "', Cognoms = '" & clsBD.Cometes(Left(Apellidos_insert, 100)) & "', Email= '" & clsBD.Cometes(Left(Email_insert, 100)) & "', Mobil= '" & clsBD.Cometes(Left(Numero_insert, 100)) & "', Carrec = '" & clsBD.Cometes(Left(Region_insert, 100)) & "', NIT= '" & clsBD.Cometes(Left(Siglas_insert, 100)) & "', idAlta= '" & clsBD.Cometes(Left(Asiste_insert, 100)) & "', idTipusContacte= '" & clsBD.Cometes(Left(Transporte_insert, 100)) & "',Procedencia='" & clsBD.Cometes(Left(Origen_insert, 100)) & "', NickTwitter='" & clsBD.Cometes(Left(Alojamiento_insert, 100)) & "',NickFacebook= '" & clsBD.Cometes(Left(Alergias_insert, 100)) & "',WebPersonal='" & clsBD.Cometes(Left(Obser_insert, 100)) & "' WHERE Auto = '" & userID_insert & "' AND Nom = '" & Nombre_insert & "'"

        If Not clsBD.BaseDades(2, VectorSQL) Then
            'Problema
            ClientScript.RegisterStartupScript(Page.GetType(), "Fail_UpdateDB_Delegado", "LanzaAviso('Error al actualizar los datos!')", True)
        Else
            'Correcto
            ClientScript.RegisterStartupScript(Page.GetType(), "OK_UpdateDB_Delegado", "LanzaAviso('Actualización perfecta en la BD (-; ')", True)
        End If
    End Function

    'busqueda de email en bd para comprobar si ya existe o no.
    Private Function buscar_email(ByRef mail)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String
        Dim Dato1 As String

        VectorSQL(0) = "SELECT Email FROM EEContactes WHERE Email ='" & clsBD.Cometes(Left(mail, 100)) & "'"
        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            'Problema
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    Dato1 = DS.Tables(0).Rows(i).Item("Email")
                Next
                Return True
            Else
                'No nos devuelve valores
                Return False
            End If
        End If
    End Function
End Class