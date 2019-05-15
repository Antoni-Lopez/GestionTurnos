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
                            Descripcio = "OK2"
                        End If


                        GoTo Resposta

                    Case 3 'Delete Medico
                        Dim Idusuario As Integer
                        VDades = CStr(Request.Form("d")).Split("¦")
                        Idusuario = VDades(0)
                        VectorSQL(0) = "DELETE FROM eecontactes WHERE Auto = '" & Idusuario & "'"
                        If Not clsBD.BaseDades(2, VectorSQL) Then
                            'Problema
                            Descripcio = "KO3"
                        Else
                            'Correcto
                            Descripcio = "OK3"
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
                                Descripcio = "OK4"
                            End If
                        End If
                        GoTo Resposta
                    Case 5 'Siguiente proyecto PORCELANOSA.
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
End Class