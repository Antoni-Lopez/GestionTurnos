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
                        Dim Rol As String, Rol_long As String, Agrupacion As String, Agrupa_long As String


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
                        Rol = Extraer_Rol(Idusuario)
                        Agrupacion = Extraer_Agrupacion(Idusuario)

                        VectorSQL(0) = "UPDATE eecontactes SET idContacte = '" & Rol & "', idOrigen='" & Agrupacion & "', idTipusContacte='" & Transporte & "', Nom='" & clsBD.Cometes(Left(Name, 100)) & "', Cognoms='" & clsBD.Cometes(Left(Apellidos, 100)) & "', Email='" & clsBD.Cometes(Left(email, 100)) & "', Procedencia='" & Origen_city & "', SectorInteres='" & numero_selas & "', NickTwitter='" & Alojamiento & "', NickFacebook='" & clsBD.Cometes(Left(Alergia, 100)) & "', WebPersonal='" & clsBD.Cometes(Left(Observa, 100)) & "',Blog='" & especialidad & "',Data='" & Consentimiento & "' WHERE Auto = '" & Idusuario & "'"
                        If Not clsBD.BaseDades(2, VectorSQL) Then
                            'Problema
                            Descripcio = "KO2"
                        Else
                            'Correcto
                            Descripcio = "OK2"
                        End If


                        GoTo Resposta

                    Case 3
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
                            'Extraer_Datos(Idusuario)
                            'Extaer_Datos_Combo(Idusuario, Rol, Agrupacion)
                        End If
                        GoTo Resposta
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

    Public Function Extraer_Rol(ByRef Idusuario)

        Dim DS As New DataSet
        Dim Rol As Integer
        VectorSQL(0) = "SELECT idContacte FROM eecontactes WHERE Auto = '" & Idusuario & "'"
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

    Private Function Extraer_Agrupacion(ByVal IdUser)
        Dim DS As New DataSet
        Dim Agrupacion As String
        VectorSQL(0) = "SELECT idOrigen FROM EEContactes WHERE Auto ='" & clsBD.Cometes(Left(IdUser, 100)) & "'"

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
End Class