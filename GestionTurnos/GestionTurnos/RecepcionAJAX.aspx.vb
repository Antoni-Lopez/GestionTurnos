Public Class RecepcionAJAX
    Inherits System.Web.UI.Page

    Dim clsBD As New ClaseAccesoBD
    Dim DS As DataSet
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
                VDades = CStr(Request.Form("d")).Split("¦")

                Select Case Request.Form("c")
                    Case 1 'Actualizar delegado en BD.

                        'Declaramos las variables que recibimos del formulario anterior
                        Dim IdUser As String, Name As String, Apellidos As String, email As String, numero As String, numero_delegado As String, Region As String, siglas As String
                        Dim Asiste As Integer, Origen As String, Transporte As Integer, Alojamiento As Integer
                        Dim Alergia As String, Observacion As String

                        Dim phone_check As String, phone_check1 As String, Long_Region As String, Regio As String
                        Dim SiglaDe As String, SiglaGer As String, SiglaDe_Long As String, SiglaGer_Long As String

                        IdUser = VDades(0).Replace("undefined", " ")

                        Name = VDades(1)
                        Apellidos = VDades(2) + "¦" + VDades(3)
                        email = VDades(4)
                        numero_delegado = VDades(5)
                        SiglaDe = VDades(6)
                        SiglaGer = VDades(7)

                        Asiste = VDades(8)
                        Alojamiento = VDades(9)
                        Transporte = VDades(10)
                        Origen = VDades(11)
                        Alergia = VDades(12)
                        Observacion = VDades(13)
                        Regio = VDades(14)

                        phone_check = Len(numero_delegado)
                        phone_check1 = numero_delegado.Substring(0, 1)

                        Long_Region = Len(Regio)
                        SiglaDe_Long = Len(SiglaDe)
                        SiglaGer_Long = Len(SiglaGer)

                        If Long_Region <= 0 Or phone_check <= 0 Or SiglaDe_Long <= 0 Or SiglaGer_Long <= 0 Then
                            Descripcio = "KO1"
                        Else
                            Descripcio = "OK1"
                            siglas = VDades(6) + "¦" + VDades(7)
                            Region = Regio
                        End If

                        If phone_check1 = 6 Or phone_check1 = 7 Then
                            numero = numero_delegado
                        Else
                            Descripcio = "KO2"
                        End If

                        If Asiste <> 1 Then
                            Asiste = 0
                        Else
                            Asiste = 1
                        End If

                        If Alojamiento <> 1 Then
                            Alojamiento = 0
                        Else
                            Alojamiento = 1
                        End If

                        If Transporte <> 1 Then
                            Transporte = 0
                        Else
                            Transporte = 1
                        End If

                        'Realizamos la consulta, en este caso, la update de la BD.
                        VectorSQL(0) = "UPDATE eecontactes SET Nom = '" & clsBD.Cometes(Left(Name, 100)) & "', Cognoms = '" & clsBD.Cometes(Left(Apellidos, 100)) & "', Email= '" & clsBD.Cometes(Left(email, 100)) & "', Mobil= '" & clsBD.Cometes(Left(numero, 100)) & "', Carrec = '" & clsBD.Cometes(Left(Region, 100)) & "', NIT= '" & clsBD.Cometes(Left(siglas, 100)) & "', idAlta= '" & clsBD.Cometes(Left(Asiste, 100)) & "', idTipusContacte= '" & clsBD.Cometes(Left(Transporte, 100)) & "',Procedencia='" & clsBD.Cometes(Left(Origen, 100)) & "', NickTwitter='" & clsBD.Cometes(Left(Alojamiento, 100)) & "',NickFacebook= '" & clsBD.Cometes(Left(Alergia, 100)) & "',WebPersonal='" & clsBD.Cometes(Left(Observacion, 100)) & "' WHERE Auto = '" & IdUser & "' AND Nom = '" & Name & "'"

                        If Not clsBD.BaseDades(2, VectorSQL) Then
                            'Problema
                            ClientScript.RegisterStartupScript(Page.GetType(), "Fail_UpdateDB_Delegado", "LanzaAviso('Error al actualizar los datos!')", True)
                        Else
                            'Correcto
                            ClientScript.RegisterStartupScript(Page.GetType(), "OK_UpdateDB_Delegado", "LanzaAviso('Actualización perfecta en la BD (-; ')", True)
                        End If










                        'Dim clsGestio As New ClaseGeneral
                        'Dim Codi As String, IDCentre As Integer, LimitProfessors As Integer, LimitAlumnes As Integer, TotalProfessors As Integer
                        'Dim NomCentre As String, DiaVisita As String, TotalAlumnes As Integer, CPCentre As String = "", VDades() As String
                        'Dim EsProfessor As Boolean
                        'IDFira = 195
                        'VDades = CStr(Request.Form("d")).Split("¦")
                        'EsProfessor = Right(Codi, 1) = "P"
                        'Codi = Left(Codi, 9)
                        'If Not clsGestio.TornaDadesCodi(IDFira, Codi, IDCentre, LimitProfessors, LimitAlumnes, NomCentre, DiaVisita, CPCentre) Then
                        'Descripcio = "KO4"
                        'ElseIf Not clsGestio.TornaRegistratsCentre(IDFira, IDCentre, TotalProfessors, TotalAlumnes) Then
                        'Descripcio = "KO1"
                        'Else
                        'If EsProfessor And TotalProfessors >= LimitProfessors Then
                        'Descripcio = "KO2"
                        'ElseIf Not EsProfessor And TotalAlumnes >= LimitAlumnes Then
                        'Descripcio = "KO3"
                        'Else
                        'Descripcio = "OK" & IIf(EsProfessor, "2", "1") & NomCentre & "¦" & DiaVisita & " de diciembre" & "¦" & CPCentre
                        'End If

                    Case 2 'Eliminar un medico.
                        Dim IdUser As String, Name As String, Apellidos As String, email As String, numero_delegado As String, siglas As String
                        Dim Asiste_si As Integer, Transporte_si As Integer, Alojamiento_si As Integer
                        Dim Alegria As String, Observacion As String

                        IdUser = VDades(0).Replace("undefined", " ")
                        Name = VDades(1)
                        Apellidos = VDades(2) + " " + VDades(3)
                        email = VDades(4)
                        numero_delegado = VDades(5)
                        siglas = VDades(6) + "¦" + VDades(7)
                        Asiste_si = VDades(8)

                        'ClientScript.RegisterStartupScript(Page.GetType(), "prueba_mia", "miprueba(" & IdUser & ")", True)
                        'VectorSQL(0) = "DELETE FROM eecontactes WHERE Auto = '" & IDUser & "'"
                        'If Not clsBD.BaseDades(2, VectorSQL) Then
                        'Problema
                        'ClientScript.RegisterStartupScript(Page.GetType(), "Delete_Medic_Fail", "LanzaAviso('Ha ocurrido un problema y no hemos podido eliminar ese registro.');", True)
                        'Else
                        'Correcto
                        'ClientScript.RegisterStartupScript(Page.GetType(), "Delete_Medic_OK", "LanzaAviso('Eliminación de 1 medico de la BD sin problemas!');", True)
                        'End If
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

End Class