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
            Extraer_BD(IdUsuario)
        End If
    End Sub
    Private Function Extraer_BD(ByRef IdUsuario)
        'Realizamos la consulta en la BD
        VectorSQL(0) = "SELECT Auto AS userID ,idContacte AS Rol,idOrigen AS Agrupacion, Nom As Nombre,Cognoms As Apellidos, Mobil AS Numero, Email, Carrec AS Region,NIT AS Siglas, Password, Procedencia As Origen FROM eecontactes WHERE Auto='" & IdUsuario & "'"

        DS = New DataSet

        Dim userID As Integer, Rol As Integer, Agrupacion As Integer, Nombre As String, Apellidos As String, Numero As Integer, Email As String
        Dim Region As String, Siglas As String, Password As String, Origen As String
        Dim Check1 As Boolean, Check2 As Boolean
        Check1 = chekbox_delegado.Checked
        Check2 = chekbox_medico.Checked
        Dim troncho As String, troncho1 As String, troncho2 As String


        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            'Error.
            Return False
        Else
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
                    Password = DS.Tables(0).Rows(i).Item("Password")
                    Origen = DS.Tables(0).Rows(i).Item("Origen")
                Next
            End If
            troncho = "Aquí recibimos: userID=" & userID & " ,Rol=" & Rol & " ,Agrupacion=" & Agrupacion & " , Nombre=" & Nombre & " , Apellidos=" & Apellidos & " ,Numero=" & Numero & " ,Email=" & Email & " ,Region=" & Region & " , Siglas=" & Siglas & " ,Password=" & Password & " , Origen=" & Origen
            meua_prueba.InnerHtml = troncho
            texto_nombre.Text = Nombre
            texto_apellidos.Text = Apellidos
            texto_email.Text = Email
            texto_phone.Text = Numero
            texto_region.Text = Region

            Dim Sigla1 = Siglas
            Dim Sigla2 = "¦"
            Dim Buscar As Boolean
            Buscar = Sigla1.Contains(Sigla2)

            If Buscar Then
                Dim index As Integer
                index = Sigla1.IndexOf(Sigla2)
                If (index >= 0) Then

                End If

                texto_gerente.Text = Siglas
                texto_delegado.Text = index

                Return True
            End If
    End Function
End Class