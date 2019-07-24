Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.IO

Public Class lecturaTxt
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim clsGeneral As New ClaseGeneral
        clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)

        Dim data = File.ReadAllText(Server.MapPath("Importacion/insertar_emails.txt"))
        Dim prueba() As String
        Dim idferia As String, Rol As String, agrupacion As String, transporte As String, asiste As String, name As String, apellido As String, numero As String
        Dim mail As String, region As String, nit As String, nitactivat As String, Password As String, especialidad As String, alojamiento As String, origen As String, alergia As String, observaciones As String
        Dim NSelas As String, Consentimiento As String

        idferia = "210"
        Rol = "0"
        agrupacion = "0"
        transporte = "0"
        asiste = "0"
        name = "0"
        apellido = "0"
        numero = "0"
        region = "0"
        nit = "0"
        nitactivat = "0"
        Password = "0"
        especialidad = "0"
        alojamiento = "0"
        origen = "0"
        alergia = "0"
        observaciones = "0"
        NSelas = "0"
        Consentimiento = "0"



        prueba = data.Split({Environment.NewLine}, StringSplitOptions.RemoveEmptyEntries)

        For i = 0 To UBound(prueba)

            Dim p As New HtmlGenericControl("p")
            p.InnerText = prueba(i)
            insertar.Controls.Add(p)
            'Dim clsBD As New ClaseAccesoBD
            'Dim DS As DataSet
            'Dim VectorSQL(0) As String
            'DS = New DataSet
            'Dim Ultimo As Integer = 0

            'mail = prueba(i)

            'VectorSQL(0) = "INSERT INTO eecontactes (idFira, idContacte, idOrigen, idTipusContacte, idAlta, Nom, Cognoms, Mobil, Email, Carrec, Nit, NITactivat, Password, Blog, SectorInteres, Data, NickTwitter, Procedencia, NickFacebook, WebPersonal) " &
            '                            "VALUES(" & idferia & "," & Rol & "," & agrupacion & "," & transporte & "," & asiste & ",'" & clsBD.Cometes(Left(name, 100)) & "','" & clsBD.Cometes(Left(apellido, 100)) & "'," &
            '                            "'" & numero & "','" & clsBD.Cometes(Left(mail, 100)) & "','" & region & "','" & nit & "'," & nitactivat & ",'" & clsBD.Cometes(Left(Password, 100)) & "','" & clsBD.Cometes(Left(especialidad, 100)) & "','" & clsBD.Cometes(Left(NSelas, 100)) & "','" & Consentimiento & "'," &
            '                            "" & alojamiento & ",'" & clsBD.Cometes(Left(origen, 100)) & "','" & clsBD.Cometes(Left(alergia, 100)) & "','" & clsBD.Cometes(Left(observaciones, 100)) & "')"

            'If Not clsBD.BaseDades(2, VectorSQL, , Ultimo) Then
            '    'Problema

            'Else
            '    'La variable Ultimo tendrá el último ID autonumérico
            '    Dim z As New HtmlGenericControl("div")
            '    z.InnerText = "Datos introducidos con exito!"
            '    insertar.Controls.Add(z)
            'End If

        Next
    End Sub

End Class
