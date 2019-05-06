Public Class RecepcionAJAX
    Inherits System.Web.UI.Page
    Dim clsBD As New ClaseAccesoBD
    Dim DS As DataSet
    Dim VectorSQL(0) As String

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim clsBD As New ClaseAccesoBD
        Dim Descripcio As String, Dades As String, Data As String, GuardaAccio As Boolean
        Dim VectorSQL() As String
        ReDim VectorSQL(0)
        Try
            If Request.Form("form2") Then
                'If Request.Form("c") <> "" And Request.Form("d") <> "" And Request.Form("sid") <> "" Then
                Dim IDFira As Integer
                Select Case Request.Form("form2")
                    Case 1 'Eliminar un medico.

                        'IDUser = paso_datos2.Text


                        VectorSQL(0) = "DELETE FROM eecontactes WHERE Auto = '" & IDUser & "'"
                        If Not clsBD.BaseDades(2, VectorSQL) Then
                            'Problema
                            ClientScript.RegisterStartupScript(Page.GetType(), "Delete_Medic_Fail", "LanzaAviso('Ha ocurrido un problema y no hemos podido eliminar ese registro.');", True)
                        Else
                            'Correcto
                            ClientScript.RegisterStartupScript(Page.GetType(), "Delete_Medic_OK", "LanzaAviso('Eliminación de 1 medico de la BD sin problemas!');", True)
                        End If



                        Dim clsGestio As New ClaseGeneral
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