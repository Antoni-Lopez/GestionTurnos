Public Class RecepcionAJAX
    Inherits System.Web.UI.Page

    Dim clsBD As New ClaseAccesoBD
    Dim VectorSQL(0) As String

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim clsBD As New ClaseAccesoBD
        Dim Descripcio As String, Dades As String, Data As String, GuardaAccio As Boolean
        Dim VectorSQL() As String, nuevo As String
        ReDim VectorSQL(0)

        Try
            If Request.Form("c") <> "" And Request.Form("d") <> "" And Request.Form("sid") <> "" Then
                Dim IDFira As Integer
                Dim VDades() As String


                Select Case Request.Form("c")
                    Case 1 'Actualizar delegado en BD.

                        VDades = CStr(Request.Form("d")).Split("¦")

                        'Declaramos las variables que recibimos del formulario anterior
                        Dim IdUser As String, Name As String, Apellidos As String, email As String, numero As String, Region As String, siglas As String
                        Dim Asiste As Integer, Origen As String, Transporte As Integer, Alojamiento As Integer
                        Dim Alergia As String, Observacion As String

                        IdUser = VDades(0)
                        Name = VDades(1)
                        Apellidos = VDades(2) + "¦" + VDades(3)
                        email = VDades(4)
                        numero = VDades(5)
                        siglas = VDades(6) + "¦" + VDades(7)
                        Asiste = VDades(8)
                        Alojamiento = VDades(9)
                        Transporte = VDades(10)
                        Origen = VDades(11)
                        Alergia = VDades(12)
                        Observacion = VDades(13)
                        Region = VDades(14)

                        'Realizamos la consulta, en este caso, la update de la BD.
                        VectorSQL(0) = "UPDATE eecontactes SET Nom = '" & clsBD.Cometes(Left(Name, 100)) & "', Cognoms = '" & clsBD.Cometes(Left(Apellidos, 100)) & "', Email= '" & clsBD.Cometes(Left(email, 100)) & "', Mobil= '" & clsBD.Cometes(Left(numero, 100)) & "', Carrec = '" & clsBD.Cometes(Left(Region, 100)) & "', NIT= '" & clsBD.Cometes(Left(siglas, 100)) & "', idAlta= '" & clsBD.Cometes(Left(Asiste, 100)) & "', idTipusContacte= '" & clsBD.Cometes(Left(Transporte, 100)) & "',Procedencia='" & clsBD.Cometes(Left(Origen, 100)) & "', NickTwitter='" & clsBD.Cometes(Left(Alojamiento, 100)) & "',NickFacebook= '" & clsBD.Cometes(Left(Alergia, 100)) & "',WebPersonal='" & clsBD.Cometes(Left(Observacion, 100)) & "' WHERE Auto = '" & IdUser & "' AND Nom = '" & Name & "'"

                        If Not clsBD.BaseDades(2, VectorSQL) Then
                            'Problema
                            Descripcio = "KO1"
                        Else
                            'Correcto
                            Descripcio = "OK1"
                        End If
                        GoTo Resposta


                    Case 2 'Update medico.
                        Dim Idusuario As Integer, Name As String, Apellidos As String, email As String, especialidad As Integer
                        Dim numero_selas As String, Consentimiento As Integer, Alojamiento As Integer, Transporte As Integer
                        Dim Origen_city As String, Alergia As String, Observa As String
                        Dim Rol As String, Agrupacion As Integer, Rol_Y_Agrupacion() As String


                        VDades = CStr(Request.Form("d")).Split("¦")

                        Idusuario = VDades(0)
                        Name = VDades(1)
                        Apellidos = VDades(2) + "¦" + VDades(3)
                        email = VDades(4)
                        especialidad = VDades(5)
                        numero_selas = VDades(6)
                        Consentimiento = VDades(7)
                        Alojamiento = VDades(8)
                        Transporte = VDades(9)
                        Origen_city = VDades(10)
                        Alergia = VDades(11)
                        Observa = VDades(12)
                        Rol_Y_Agrupacion = Extraer_Agrupacion_Y_Rol(Idusuario).Split("¦")

                        Rol = Rol_Y_Agrupacion(0)
                        Agrupacion = Rol_Y_Agrupacion(1)


                        'Rol = Extraer_Rol(Idusuario)
                        'Agrupacion = Extraer_Agrupacion(Idusuario)

                        VectorSQL(0) = "UPDATE eecontactes SET idContacte = '" & Rol & "', idOrigen='" & Agrupacion & "', idTipusContacte='" & Transporte & "', Nom='" & clsBD.Cometes(Left(Name, 100)) & "', Cognoms='" & clsBD.Cometes(Left(Apellidos, 100)) & "', Email='" & clsBD.Cometes(Left(email, 100)) & "', Procedencia='" & Origen_city & "', SectorInteres='" & numero_selas & "', NickTwitter='" & Alojamiento & "', NickFacebook='" & clsBD.Cometes(Left(Alergia, 100)) & "', WebPersonal='" & clsBD.Cometes(Left(Observa, 100)) & "',Blog='" & especialidad & "',Data='" & Consentimiento & "' WHERE Auto = '" & Idusuario & "'"
                        If Not clsBD.BaseDades(2, VectorSQL) Then
                            'Problema
                            Descripcio = "KO2"
                        Else
                            'Correcto
                            Descripcio = "OK2" + "¦"
                            Descripcio += RellenarSelect(Agrupacion)
                        End If


                        GoTo Resposta

                    Case 3 'Delete Medico
                        Dim Idusuario As Integer, Agrupacion As Integer
                        VDades = CStr(Request.Form("d")).Split("¦")
                        Idusuario = VDades(0)
                        Agrupacion = VDades(1)

                        VectorSQL(0) = "DELETE FROM eecontactes WHERE Auto = '" & Idusuario & "'"
                        If Not clsBD.BaseDades(2, VectorSQL) Then
                            'Problema
                            Descripcio = "KO3"
                        Else
                            'Correcto
                            Descripcio = "OK3" + "¦"
                            Descripcio += RellenarSelect(Agrupacion)
                        End If
                        GoTo Resposta

                    Case 4 'Insert New Medico

                        Dim DS As New DataSet
                        Dim i As Integer, Ultimo As Integer = 0

                        VDades = CStr(Request.Form("d")).Split("¦")

                        Dim Name As String, Apellido As String, email As String, IdFeria As Integer, Mail As String, Especialidad As String, NSelas As String
                        Dim Consentimiento As Integer, Transporte As Integer, Alojamiento As Integer, Alergia As String, Observaciones As String, Password As String
                        Dim Rol As Integer, Agrupacion As Integer, Asiste As Integer, numero As String, Region As String, Origen As String, Nit As Integer, NITactivat As Integer

                        Name = VDades(0)
                        Apellido = VDades(1) + "¦" + VDades(2)
                        Mail = VDades(3)
                        If Buscar_Email(Mail) Then
                            Descripcio = "KO4"
                            GoTo Resposta
                        Else
                            Especialidad = VDades(4)
                            NSelas = VDades(5)
                            Consentimiento = VDades(6)
                            Transporte = VDades(7)
                            Alojamiento = VDades(8)
                            Origen = VDades(9)
                            Alergia = VDades(10)
                            Observaciones = VDades(11)

                            Rol = 1 ' Ponemos el Rol a "Martillo" porque estamos insertando un Medico y siempre va a tener el Rol de Medico.
                            IdFeria = 195 'También lo ponemos a martillo.
                            Agrupacion = VDades(12)

                            numero = 0
                            Password = ""
                            Region = ""
                            Nit = 0
                            Asiste = 0
                            NITactivat = 1

                            VectorSQL(0) = "INSERT INTO eecontactes (idFira, idContacte, idOrigen, idTipusContacte, idAlta, Nom, Cognoms, Mobil, Email, Carrec, Nit, NITactivat, Password, Blog, SectorInteres, Data, NickTwitter, Procedencia, NickFacebook, WebPersonal) " &
                                        "VALUES(" & IdFeria & "," & Rol & "," & Agrupacion & "," & Transporte & "," & Asiste & ",'" & clsBD.Cometes(Left(Name, 100)) & "','" & clsBD.Cometes(Left(Apellido, 100)) & "'," &
                                        "'" & numero & "','" & clsBD.Cometes(Left(Mail, 100)) & "','" & Region & "','" & Nit & "'," & NITactivat & ",'" & clsBD.Cometes(Left(Password, 100)) & "','" & clsBD.Cometes(Left(Especialidad, 100)) & "','" & clsBD.Cometes(Left(NSelas, 100)) & "','" & Consentimiento & "'," &
                                        "" & Alojamiento & ",'" & clsBD.Cometes(Left(Origen, 100)) & "','" & clsBD.Cometes(Left(Alergia, 100)) & "','" & clsBD.Cometes(Left(Observaciones, 100)) & "')"

                            If Not clsBD.BaseDades(2, VectorSQL, , Ultimo) Then
                                'Problema
                                Descripcio = "KO5"
                            Else
                                'La variable Ultimo tendrá el último ID autonumérico
                                Descripcio = "OK4" + "¦"
                                Descripcio += RellenarSelect(Agrupacion)
                            End If
                        End If
                        GoTo Resposta
                    Case 5 'Actualizar el ComboBox/Select 
                        Dim DS As New DataSet
                        Dim UserID As String, Rol As Integer, Agrupa As Integer, Descripcio1 As String, Descripcio2 As String, Descripcio3 As String, Descripcio4 As String, Descripcio5 As String
                        Dim pasar_data As String, prueba As String

                        VDades = CStr(Request.Form("d")).Split("¦")
                        Descripcio = "OK5" + "¦"
                        Descripcio += RellenarSelect(VDades(0))

                        GoTo Resposta
                    Case 6 'Enviar Email a el Delegado
                        'Datos necesarios para el envio de mails.
                        Dim send_mail As New ClaseEmail
                        Dim destinatario As String, Cabecera As String, Cuerpo As String, From As String
                        Dim ServidorSMTP As String, UsuariSMTP As String, PasswordSMTP As String
                        Dim Puerto As Integer, envio As Boolean, FitxerAdjunt As String, nombre As String, Ape1 As String, Rol As Integer, Agrupacion As Integer

                        VDades = CStr(Request.Form("d")).Split("¦")

                        Rol = 1 ' Lo ponemos a martillo porque queremos que nos busque los datos de los medicos solo.
                        Agrupacion = VDades(1)
                        nombre = VDades(2)
                        Ape1 = VDades(3)
                        destinatario = VDades(4)

                        Dim DS As New DataSet

                        'La consulta.
                        VectorSQL(0) = "SELECT Auto , Nom, Cognoms, Email, idOrigen FROM EEContactes WHERE idContacte='" & Rol & "'AND idOrigen ='" & Agrupacion & "'ORDER BY Auto"

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
                            Descripcio = "KO6"
                        Else
                            Descripcio = "OK6"
                        End If
                        GoTo Resposta
                    Case 7 'Siguiente proyecto PORCELANOSA.
                        Dim DS As New DataSet
                        Dim i As Integer, j As Integer, long_dades As String, idusuario As Integer, chk As String, id_chk As String, chk2 As String

                        VDades = CStr(Request.Form("d")).Split("¦")
                        long_dades = VDades.Length
                        For i = 0 To long_dades
                            If i = 0 Then
                                idusuario = VDades(0)
                            Else
                                chk = VDades(i)
                                id_chk = chk.Replace("chk", " ")
                                Comprobar_aforo(id_chk)
                            End If
                        Next
                        'Ingresar_Chk(idusuario, id_chk)
                        chk2 = VDades(1)
                        For i = 2 To long_dades
                            chk2 += VDades(i)
                        Next
                End Select
            End If
        Catch ex As Exception
            Descripcio = "KO0_Problema verificando la información. Error: " & ex.Message
            GuardaAccio = True
            GoTo Resposta
        End Try
        Exit Sub
Resposta:
        Response.Write(Descripcio)
        If GuardaAccio Then
            Data = Year(Now) & Format(Month(Now), "0#") & Format(Day(Now), "0#") & Format(Hour(Now), "0#") & Format(Minute(Now), "0#") & Format(Second(Now), "0#")
            ReDim Preserve VectorSQL(0)
            VectorSQL(0) = "INSERT INTO Problemes(IDUsuari,NumeroSistema,MissatgeSistema,Info1,Info2,Data) VALUES(100,0,'','','Problema executant Page_Load de la plana RecepcionAJAX.aspx per a EntradaE. Les dades eren: VectorSQL(0): " & clsBD.Cometes(VectorSQL(0)) & ", Problema: " & clsBD.Cometes(Descripcio) & ", c: " & clsBD.Cometes(Request.Form("c")) & ", d: " & clsBD.Cometes(Request.Form("d")) & "','" & Data & "')"
            clsBD.BaseDades(2, VectorSQL)
        End If
    End Sub

    Private Function Extraer_Agrupacion_Y_Rol(ByVal IdUser)
        Dim DS As New DataSet
        Dim Agrupacion As String, Rol As String, Rol_Y_Agrupacion As String, prueba As Integer, cosas_mias As String
        VectorSQL(0) = "SELECT idContacte, idOrigen FROM EEContactes WHERE Auto ='" & clsBD.Cometes(Left(IdUser, 100)) & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            'Problema
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    Rol = DS.Tables(0).Rows(i).Item("idContacte")
                    Agrupacion = DS.Tables(0).Rows(i).Item("idOrigen")
                Next
                Rol_Y_Agrupacion = Rol + "¦" + Agrupacion
            Else
                'No nos devuelve valores
            End If
        End If
        Return Rol_Y_Agrupacion
    End Function

    Private Function Buscar_Email(ByVal email)
        Dim DS As New DataSet
        Dim Dato1 As String

        VectorSQL(0) = "SELECT Email FROM EEContactes WHERE Email ='" & clsBD.Cometes(Left(email, 100)) & "'"
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

    Private Function Ingresar_Chk(ByRef idusuario, ByVal chk)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String, aforo As String, ins As String, Descripcio As String
        DS = New DataSet

        VectorSQL(0) = "UPDATE enlace SET idsesiones='" & chk & "' WHERE idusuario = '" & idusuario & "'"
        If Not clsBD.BaseDades(2, VectorSQL) Then
            'Problema
            Descripcio = "KO12"
            Return False
        Else
            'Correcto
            'Descripcio = "OK12"
            Ingresar_Chk_enlace(idusuario, chk)
        End If
        Return True
    End Function

    Private Function Comprobar_aforo(ByRef idsesion)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String, aforo As String, ins As String
        DS = New DataSet

        VectorSQL(0) = "SELECT Aforo,inscritos FROM sesiones WHERE idsesiones='" & clsBD.Cometes(Left(idsesion, 100)) & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "aforo_full", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    aforo = DS.Tables(0).Rows(i).Item("Aforo")
                    ins = DS.Tables(0).Rows(i).Item("inscritos")
                Next

                If aforo = ins Then
                    ClientScript.RegisterStartupScript(Page.GetType(), "aforo_lleno", "LanzaAviso('Lo sentimos pero el aforo ya esta lleno.')", True)
                    Return False
                End If
            End If
        End If
        Return True
    End Function
    Private Function Ingresar_Chk_enlace(ByRef idusuario, ByVal sesion)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String, aforo As String, ins As String
        DS = New DataSet

        'VectorSQL(0) = "INSERT INTO eecontactes (idFira, idContacte, idOrigen, idTipusContacte, idAlta, Nom, Cognoms, Mobil, Email, Carrec, Nit, NITactivat, Password, Blog, SectorInteres, Data, NickTwitter, Procedencia, NickFacebook, WebPersonal) " &
        '                "VALUES(" & idFeria & "," & Rol & "," & Agrupacion & "," & Transporte & "," & Asiste & ",'" & clsBD.Cometes(Left(Name, 100)) & "','" & clsBD.Cometes(Left(Apellido, 100)) & "'," &
        '                "'" & numero & "','" & clsBD.Cometes(Left(Mail, 100)) & "','" & Region & "','" & Nit & "'," & NITactivat & ",'" & clsBD.Cometes(Left(Password, 100)) & "','" & clsBD.Cometes(Left(Especialidad, 100)) & "','" & clsBD.Cometes(Left(NSelas, 100)) & "','" & Consentimiento & "'," &
        '                "" & Alojamiento & ",'" & clsBD.Cometes(Left(Origen, 100)) & "','" & clsBD.Cometes(Left(Alergia, 100)) & "','" & clsBD.Cometes(Left(Observaciones, 100)) & "')"
    End Function

    Private Function RellenarSelect(ByRef VDades)
        Dim clsBD As New ClaseAccesoBD
        Dim VectorSQL(0) As String
        Dim DS As New DataSet
        Dim UserID As String, Rol As Integer, Agrupa As Integer, Descripcio1 As String, Descripcio2 As String, Descripcio3 As String, Descripcio4 As String, Descripcio5 As String
        Dim Descripcio As String, VDatos As String


        Rol = 1 ' Lo ponemos a "martillo" porque vamos a mostrar todos los medicos asociados a un delegado, por ello, el rol que buscamos es solo de medicos ó =1
        Agrupa = VDades

        VectorSQL(0) = "SELECT Auto , Nom, Cognoms, idOrigen FROM EEContactes WHERE idContacte='" & Rol & "'AND idOrigen ='" & Agrupa & "'ORDER BY Cognoms, Nom"
        If clsBD.BaseDades(1, VectorSQL, DS) Then
            If DS.Tables(0).Rows.Count > 0 Then
                'Descripcio1 = "OK5"
                'Descripcio5 = Descripcio1 + "¦"

                For i = 0 To DS.Tables(0).Rows.Count - 1
                    Descripcio2 = DS.Tables(0).Rows(i).Item("Auto")
                    Descripcio3 = DS.Tables(0).Rows(i).Item("Cognoms").Replace("¦", " ")
                    Descripcio4 = DS.Tables(0).Rows(i).Item("Nom")
                    'UserID = DS.Tables(0).Rows(i).Item("Auto")
                    'soflow.Items.Add(New ListItem(DS.Tables(0).Rows(i).Item("Cognoms").Replace("¦", " ") & ", " & DS.Tables(0).Rows(i).Item("Nom"), UserID))
                    If i = DS.Tables(0).Rows.Count - 1 Then
                        Descripcio5 += Descripcio2 + "¦" + Descripcio3 + "¦" + Descripcio4
                    Else
                        Descripcio5 += Descripcio2 + "¦" + Descripcio3 + "¦" + Descripcio4 + "¦"
                    End If

                Next
            End If
            Descripcio = Descripcio5
        End If
        Return Descripcio
    End Function

End Class