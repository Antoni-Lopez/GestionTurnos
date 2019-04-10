Public Class Formulario
    Inherits System.Web.UI.Page

    Dim clsBD As New ClaseAccesoBD
    Dim DS As DataSet
    Dim VectorSQL(0) As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim clsGeneral As New ClaseGeneral
            clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)

            Dim IdUsuario As Integer, grupo As Integer
            IdUsuario = Request.QueryString("IDUser")

            boton_enviar.Attributes.Add("onclick", "return Valida()")

            Extraer_BD_Delegado(IdUsuario)
            Extraer_BD_Medicos(IdUsuario, grupo)
        Else
            Dim userID_insert As Integer
            userID_insert = Request.QueryString("IDUser")
            ActualizarBD_Delegado(userID_insert)





        End If
    End Sub
    Private Function Extraer_BD_Medicos(ByRef iduser, ByVal agru)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String
        Dim Agrupacion As Integer, rol As String, rolete As String, i As Integer, Ultimo As Integer = 0


        VectorSQL(0) = "SELECT Auto,idOrigen FROM eecontactes WHERE Auto='" & iduser & "'"
        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            'Problema
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    Agrupacion = DS.Tables(0).Rows(i).Item("idOrigen")
                    rol = DS.Tables(0).Rows(i).Item("idContacte")
                Next
            Else
                'No nos devuelve valores
            End If
        End If

        'VectorSQL(0) = "SELECT idContacte, Nom, Cognoms FROM EEContactes WHERE idFira = 1 AND idTipusContacte = 0 ORDER BY Cognoms, Nom"
        rolete = 1


        VectorSQL(0) = "SELECT Auto,idContacte,idOrigen ,idTipusContacte, idAlta , Nom ,Cognoms, Mobil , Email, Carrec,NIT , Password, Procedencia, SectorInteres ,NickTwitter , NickFacebook , WebPersonal  FROM eecontactes WHERE idOrigen='" & Agrupacion & "'And idContacte='" & rolete & "'ORDER BY Cognoms"

        If clsBD.BaseDades(1, VectorSQL, DS) Then
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1

                    Dim Sigla1 As String, Ape1 As String, Ape2 As String
                    Dim p As Long
                    Dim VArray() As String

                    'Asignamos valores.
                    Sigla1 = DS.Tables(0).Rows(i).Item("Cognoms")
                    'Creamos el array, y cada "substring" se lo asignaremos
                    'a un elemento del array.
                    'Usamos el caracter "¦" como separador
                    VArray = Split(Sigla1, "¦")
                    For p = LBound(VArray) To UBound(VArray)
                        Ape1 = VArray(0)
                        Ape2 = VArray(1)
                    Next

                    miselect.Items.Add(New ListItem(DS.Tables(0).Rows(i).Item("Ape1") & ", " & DS.Tables(0).Rows(i).Item("Nom"), DS.Tables(0).Rows(i).Item("idOrigen"))) Then
                Next
            Else
                'Error
            End If
        End If
        Return True
    End Function

    Private Function Extraer_BD_Delegado(ByRef IdUsuario)
        'Realizamos la consulta en la BD
        VectorSQL(0) = "SELECT Auto AS userID ,idContacte AS Rol,idOrigen AS Agrupacion,idTipusContacte As Transporte, idAlta As Asiste, Nom As Nombre,Cognoms As Apellidos, Mobil AS Numero, Email, Carrec AS Region,NIT AS Siglas, Password, Procedencia As Origen, SectorInteres As Selas,NickTwitter As Alojamiento, NickFacebook As Alergias, WebPersonal As Observaciones FROM eecontactes WHERE Auto='" & IdUsuario & "'"

        DS = New DataSet

        Dim userID As Integer, Rol As Integer, Agrupacion As Integer, Nombre As String, Apellidos As String, Numero As Integer, Email As String
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
            'Comprobamos que valor recibimos de la BD para el 1º radio button
            'Mostramos o bien mis datos, o bien datos de doctores.
            If (Rol = 0) Then
                datos_input_radio.Checked = True
            Else
                datos_input_radio.Disabled = True
                ClientScript.RegisterStartupScript(Page.GetType(), "id", "ocultar_select()", True)
                datos_input_medico.Checked = True
            End If

            'Comprobamos que valor recibimos de la Bd para el 2º radio button,
            'el que nos dice si asistimos o no.
            If (Asistes = 0) Then
                radio_asiste_no.Checked = True
            Else
                radio_asiste_si.Checked = True

            End If

            'Comprobamos que valor recibimos de la BD para el 3º radio button
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
            Return True
        End If
    End Function

    Private Function ActualizarBD_Delegado(ByRef userID_insert)
        'Declaramos las variables que vamos a insertar en la BD
        Dim Nombre_insert As String, Apellidos_insert As String, Numero_insert As Integer, Email_insert As String
        Dim Region_insert As String, Siglas_insert As String, Asiste_insert As Integer, Transporte_insert As Integer
        Dim Alojamiento_insert As Integer, Origen_insert As String, Alergias_insert As String, Obser_insert As String

        Dim phone_check As String, phone_check1 As String

        'VectorSQL(0) = "SELECT Auto AS userID ,idContacte AS Rol,idOrigen AS Agrupacion, Nom As Nombre,Cognoms As Apellidos, Mobil AS Numero, Email, Carrec AS Region,NIT AS Siglas, Password, Procedencia As Origen FROM eecontactes WHERE Auto='" & IdUsuario & "'"

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

End Class