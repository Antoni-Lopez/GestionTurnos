Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.IO

Public Class Importación_MailingRPA
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim clsGeneral As New ClaseGeneral
        clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)

        'Dim data = File.ReadAllText(Server.MapPath("Importacion/insertar_emails.txt"))


        Dim data = File.ReadAllText(Server.MapPath("Importacion/importar.csv"))
        Dim prueba() As String
        Dim idferia As String, Rol As String, agrupacion As String, transporte As String, asiste As String, name As String, apellido As String, numero As String
        Dim mail As String, region As String, nit As String, nitactivat As String, Password As String, especialidad As String, alojamiento As String, origen As String, alergia As String, observaciones As String
        Dim NSelas As String, Consentimiento As String, accion As String
        Dim div As New HtmlGenericControl("div")
        div.InnerHtml = ""


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

            Dim churro() As String, name_imp As String, ape_imp As String, mail_imp As String, registro_imp As String, nameQr_imp As String, pass_imp As String
            Dim clsBD As New ClaseAccesoBD
            Dim DS As DataSet
            Dim VectorSQL(0) As String
            DS = New DataSet
            Dim Ultimo As Integer = 0

            Dim name_BD As String, apellidos_BD As String, registrado_BD As String, idioma As String
            Dim error_churro As Boolean
            error_churro = False

            churro = prueba(i).Split(";")

            For z = 0 To 5
                If (churro(z) Is "") Then
                    'ClientScript.RegisterStartupScript(Page.GetType(), "error_linea_empty", "LanzaAviso('Error! hay algún campo vacio.')", True)
                    div.InnerHtml += "<p id='error" & z & "' style='margin: 1.5% auto 1.5% auto;padding:10px;color:#B20016;'>Ha ocurrido un error, faltán datos en la:  Fila: (<span>'" & i + 1 & "'</span>) y en la columna: (<span>'" & z + 1 & "'</span>)</p>"
                    error_churro = True
                End If
            Next

            If error_churro = False Then
                name_imp = churro(0)
                ape_imp = churro(1)
                mail_imp = churro(2)
                registro_imp = churro(3)
                idferia = churro(4)
                idioma = churro(5)


                'Jose;Sanchez¦Mateo;jsmateo@towerplane.com;210;False;es

                DS.Reset()

                'Buscamos si el User está o no en la BD.
                VectorSQL(0) = "SELECT Nom,Cognoms,Carrec, Procedencia FROM eecontactes WHERE Email='" & clsBD.Cometes(Left(mail_imp, 100)) & "' AND idFira='" & idferia & "'"

                If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                    'Problema.
                Else
                    If DS.Tables(0).Rows.Count > 0 Then 'El Usuario ya esta en la BD.

                        DS.Reset()

                        'Procedemos a actualizar los datos guardados del usuario.
                        VectorSQL(0) = "UPDATE eecontactes SET Nom = '" & clsBD.Cometes(Left(name_imp, 100)) & "',Cognoms='" & clsBD.Cometes(Left(ape_imp, 100)) & "',Carrec='" & registro_imp & "',Password='" & pass_imp & "',Procedencia='" & nameQr_imp & "',WebPersonal='" & idioma & "' WHERE Email = '" & clsBD.Cometes(Left(mail_imp, 100)) & "' And idFira ='" & idferia & "'"

                        If Not clsBD.BaseDades(2, VectorSQL) Then
                            'Problema
                        Else
                            'Correcto
                        End If


                    Else 'No encontramos al user en la tabla eecontactes, por ello, insertamos un nuevo registro en la BD.

                        DS.Reset()

                        VectorSQL(0) = "INSERT INTO eecontactes (idFira, idContacte, idOrigen, idTipusContacte, idAlta, Nom, Cognoms, Mobil, Email, Carrec, Nit, NITactivat, Password, Blog, SectorInteres, Data, NickTwitter, Procedencia, NickFacebook, WebPersonal) " &
                                                    "VALUES(" & idferia & "," & Rol & "," & agrupacion & "," & transporte & "," & asiste & ",'" & clsBD.Cometes(Left(name_imp, 100)) & "','" & clsBD.Cometes(Left(ape_imp, 100)) & "'," &
                                                    "'" & numero & "','" & clsBD.Cometes(Left(mail_imp, 100)) & "','" & registro_imp & "','" & nit & "'," & nitactivat & ",'" & clsBD.Cometes(Left(pass_imp, 100)) & "','" & clsBD.Cometes(Left(especialidad, 100)) & "','" & clsBD.Cometes(Left(NSelas, 100)) & "','" & Consentimiento & "'," &
                                                    "" & alojamiento & ",'" & nameQr_imp & "','" & clsBD.Cometes(Left(alergia, 100)) & "','" & clsBD.Cometes(Left(idioma, 100)) & "')"

                        If Not clsBD.BaseDades(2, VectorSQL, , Ultimo) Then
                            'Problema

                        Else
                            'La variable Ultimo tendrá el último ID autonumérico

                            'insertar.Controls.Add(p)
                        End If
                    End If
                End If
            Else

            End If
        Next
        If div.InnerHtml = "" Then
            div.InnerText = "Importación realizada con exito!"
        End If

        insertar.Controls.Add(div)
    End Sub

End Class