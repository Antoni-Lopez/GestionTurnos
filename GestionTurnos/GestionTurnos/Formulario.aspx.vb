﻿Public Class Formulario
    Inherits System.Web.UI.Page

    Dim clsBD As New ClaseAccesoBD
    Dim DS As DataSet
    Dim VectorSQL(0) As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim clsGeneral As New ClaseGeneral
            clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)

            Dim IdUsuario As Integer
            IdUsuario = Request.QueryString("IDUser")

            Dim Alojamiento As String, Alojamiento2 As String, Transporte As String, Transporte2 As String
            boton_enviar.Attributes.Add("onclick", "return Valida()")

            Extraer_BD(IdUsuario)
        Else
            Dim userID_insert As Integer


            'Alojamiento = Request.Form("alojamiento_si")
            'Alojamiento2 = Request.Form("alojamiento_no")
            'transporte = Request.Form("transporte_si")
            'Transporte2 = Request.Form("transporte_no")

            ActualizarBD(userID_insert)

        End If
    End Sub
    Private Function Extraer_BD(ByRef IdUsuario)
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
            transporte.Text = Origen
            alergias.Text = Aler
            observaciones.Text = Obser


            'ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('aqui recivimos de idAlta/Asiste:'" & Asistes & "')", True)

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

    Private Function ActualizarBD(ByRef userID_insert)
        'Declaramos las variables que vamos a insertar en la BD
        Dim Rol_insert As Integer, Agrupacion_insert As Integer, Nombre_insert As String, Apellidos_insert As String, Numero_insert As Integer, Email_insert As String
        Dim Region_insert As String, Siglas_insert As String, Password_insert As String, Origen_insert As String

        'VectorSQL(0) = "SELECT Auto AS userID ,idContacte AS Rol,idOrigen AS Agrupacion, Nom As Nombre,Cognoms As Apellidos, Mobil AS Numero, Email, Carrec AS Region,NIT AS Siglas, Password, Procedencia As Origen FROM eecontactes WHERE Auto='" & IdUsuario & "'"

        'Extraemos los datos del formulario.
        Nombre_insert = texto_nombre.Text
        Numero_insert = texto_phone.Text
        Email_insert = texto_email.Text
        Region_insert = texto_region.Text
        Siglas_insert = texto_gerente.Text + "'¦'" + texto_delegado.Text

        'Realizamos la consulta, en este caso, la update de la BD.
        VectorSQL(0) = "UPDATE eecontactes SET Auto = '" & clsBD.Cometes(Left(userID_insert, 100)) & "', Nom = '" & clsBD.Cometes(Left(Nombre_insert, 100)) & "', Mobil = '" & Numero_insert & "',Email = '" & clsBD.Cometes(Left(Email_insert, 100)) & "',Password = '" & clsBD.Cometes(Left(Password_insert, 100)) & "',Carrec = '" & clsBD.Cometes(Left(Region_insert, 100)) & "',NIT = '" & clsBD.Cometes(Left(Siglas_insert, 100)) & "' WHERE Auto = '" & userID_insert & "' AND Nom = '" & Nombre_insert & "'"

        If Not clsBD.BaseDades(2, VectorSQL) Then
            'Problema
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al actualizar los datos!')", True)
        Else
            'Correcto
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Actualización perfecta en la BD (-; ')", True)
        End If
    End Function

End Class