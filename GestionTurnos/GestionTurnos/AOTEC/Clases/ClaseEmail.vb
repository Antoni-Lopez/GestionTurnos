Imports System.Net.Mail

Public Class ClaseEmail

    Friend Function EnviarEmail_System_Web_Mail_BO(ByVal To_ As String, ByVal From As String, ByVal Subject As String, ByVal _Body As String, Optional ByVal FitxerAdjunt As String = "", Optional ByVal ServidorSMTP As String = "", Optional ByVal NoToquemImatges As Boolean = False, Optional ByVal UsuariSMTP As String = "", Optional ByVal PasswordSMTP As String = "", Optional ByVal IncloureNotificacioLectura As Boolean = False, Optional ByVal VLlistatFitxersAdjunts() As String = Nothing, Optional ByVal PortServidor As Integer = 25, Optional ByVal EsBDMySQL As Boolean = False, Optional ByVal EsConnexioSSL As Boolean = False) As Boolean
        Try
            Dim objCDO As New CDO.Message
            Dim objBP As CDO.IBodyPart
            Dim i As Integer, URL As String, Tros As String, Tros2 As String, CamiImatge As String
            Dim Paraula As String, Imatge As String, JaComprovat As Boolean, CompteFromNet As String, ClauSMTP As String
            objCDO.MimeFormatted = True
            objCDO.To = To_
            objCDO.From = From
            objCDO.Subject = Subject
            If FitxerAdjunt <> "" Then objCDO.AddAttachment(FitxerAdjunt)
            If Not IsNothing(VLlistatFitxersAdjunts) Then
                For i = 0 To VLlistatFitxersAdjunts.Length - 1
                    objCDO.AddAttachment(VLlistatFitxersAdjunts(i))
                Next
            End If
            objCDO.AutoGenerateTextBody = False
            If Not NoToquemImatges And (InStr(LCase(_Body), "src='") <> 0 Or InStr(LCase(_Body), "src ='") <> 0 Or InStr(LCase(_Body), "src= '") <> 0 Or InStr(LCase(_Body), "src = '") <> 0 _
                    Or InStr(LCase(_Body), "background='") <> 0 Or InStr(LCase(_Body), "background ='") <> 0 Or InStr(LCase(_Body), "background= '") <> 0 Or InStr(LCase(_Body), "background = '") <> 0) Then
                Tros2 = _Body
                Do While InStr(LCase(Tros2), "src ='") <> 0 Or InStr(LCase(Tros2), "src= '") <> 0 Or InStr(LCase(Tros2), "src = '") <> 0 _
                         Or InStr(LCase(Tros2), "background ='") <> 0 Or InStr(LCase(Tros2), "background= '") <> 0 Or InStr(LCase(Tros2), "background = '") <> 0
                    If InStr(LCase(Tros2), "src ='") <> 0 Then
                        Tros2 = Left(Tros2, InStr(LCase(Tros2), "src ='") + 2) & Right(Tros2, Len(Tros2) - InStr(LCase(Tros2), "src ='") - 3)
                    ElseIf InStr(LCase(Tros2), "src= '") <> 0 Then
                        Tros2 = Left(Tros2, InStr(LCase(Tros2), "src= '") + 3) & Right(Tros2, Len(Tros2) - InStr(LCase(Tros2), "src= '") - 4)
                    ElseIf InStr(LCase(Tros2), "src = '") <> 0 Then
                        Tros2 = Left(Tros2, InStr(LCase(Tros2), "src = '") + 2) & "=" & Right(Tros2, Len(Tros2) - InStr(LCase(Tros2), "src = '") - 5)
                    ElseIf InStr(LCase(Tros2), "background ='") <> 0 Then
                        Tros2 = Left(Tros2, InStr(LCase(Tros2), "background ='") + 9) & Right(Tros2, Len(Tros2) - InStr(LCase(Tros2), "background ='") - 10)
                    ElseIf InStr(LCase(Tros2), "background= '") <> 0 Then
                        Tros2 = Left(Tros2, InStr(LCase(Tros2), "background= '") + 10) & Right(Tros2, Len(Tros2) - InStr(LCase(Tros2), "background= '") - 11)
                    ElseIf InStr(LCase(Tros2), "background = '") <> 0 Then
                        Tros2 = Left(Tros2, InStr(LCase(Tros2), "background = '") + 9) & "=" & Right(Tros2, Len(Tros2) - InStr(LCase(Tros2), "background = '") - 12)
                    End If
                Loop
                Paraula = "src='"
AltraParaula:
                Do While InStr(LCase(Tros2), Paraula) <> 0
                    Tros = Tros & Left(Tros2, InStr(LCase(Tros2), Paraula) + Len(Paraula) - 1)
                    Tros2 = Right(Tros2, Len(Tros2) - InStr(LCase(Tros2), Paraula) - Len(Paraula) + 1)
                    CamiImatge = Left(Tros2, InStr(Tros2, "'") - 1).Replace("\", "/")

                    Imatge = Right(CamiImatge, Len(CamiImatge) - InStrRev(CamiImatge, "/"))
                    Tros2 = Right(Tros2, Len(Tros2) - InStr(Tros2, "'") + 1)
                    Tros = Tros & "cid:" & Imatge
                    objBP = objCDO.AddRelatedBodyPart(CamiImatge, Imatge, CDO.CdoReferenceType.cdoRefTypeLocation)
                    objBP.Fields.Item("urn:schemas:mailheader:Content-ID").Value = "<" & Imatge & ">"
                    objBP.Fields.Update()
                    'If TornaImatgeEnBase64(CamiImatge) Then
                    '    Tros2 = Right(Tros2, Len(Tros2) - InStr(Tros2, "'") + 1)
                    '    Tros = Tros & CamiImatge
                    'End If
                Loop
                Tros = Tros & Tros2
                If Not JaComprovat Then
                    JaComprovat = True
                    Tros2 = Tros
                    Tros = ""
                    Paraula = "background='"
                    GoTo AltraParaula
                End If
                objCDO.HTMLBody = CanviarAccents(True, Tros)
            Else
                objCDO.HTMLBody = CanviarAccents(True, _Body)
            End If
            ' Nota: Si "cdoRefTypeLocation" no funciona, provar "cdoRefTypeId"
            Dim objCDOSysCon As Object
            objCDOSysCon = CreateObject("CDO.Configuration")
            With objCDOSysCon
                .Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = IIf(ServidorSMTP = "" Or ServidorSMTP = "EntradaElectronica", "smtp.entradaelectronica.com", ServidorSMTP)
                .Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
                .Fields("http://schemas.microsoft.com/cdo/configuration/sendusername") = IIf(UsuariSMTP = "", CompteFromNet, UsuariSMTP) 'IIf(UsuariSMTP = "", "smtpuser", UsuariSMTP)
                .Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword") = IIf(PasswordSMTP = "", ClauSMTP, PasswordSMTP) 'IIf(PasswordSMTP = "", "smtp007", PasswordSMTP)
                .Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = PortServidor
                .Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
                .Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
                If EsConnexioSSL Then .Fields("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = 1

                '.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 1 'cdoSendUsingPickup   
                '.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory") = "c:\Inetpub\mailroot\pickup"

                .Fields.Update()
            End With
            '0=Baixa, 1=Normal, 2=Alta
            objCDO.Fields.Item("urn:schemas:httpmail:importance").Value = 2
            If IncloureNotificacioLectura Then
                Dim NetejaEmail As String
                NetejaEmail = From
                If InStr(NetejaEmail, "<") > 0 And InStr(NetejaEmail, ">") > 0 Then
                    NetejaEmail = Left(NetejaEmail, InStr(NetejaEmail, ">") - 1)
                    NetejaEmail = Right(NetejaEmail, Len(NetejaEmail) - InStr(NetejaEmail, "<"))
                End If
                objCDO.Fields.Item("urn:schemas:mailheader:Disposition-Notification-To").Value = NetejaEmail
                objCDO.Fields.Update()
            End If
            objCDO.Configuration = objCDOSysCon
            objCDO.Send()
            GC.Collect()
            GC.WaitForPendingFinalizers()
            objCDOSysCon = Nothing
            objCDO = Nothing
            objBP = Nothing
            Return True
        Catch ex As Exception
            Dim VectorSQL(0), Data As String
            Data = Year(Now) & Format(Month(Now), "0#") & Format(Day(Now), "0#") & Format(Hour(Now), "0#") & Format(Minute(Now), "0#") & Format(Second(Now), "0#")
            If EsBDMySQL Then
                'Dim clsBDMySQL As New ClasseMySQL
                'VectorSQL(0) = "INSERT INTO Problemes(idUsuari,NumeroSistema,MissatgeSistema,Info1,Info2,Data) VALUES(100,0,'" & clsBDMySQL.Cometes(ex.Message) & "','Error enviant email via EnviarEmail_System_Web_Mail. " & clsBDMySQL.Cometes("To:" & To_ & ";From:" & From & ";Subject:" & Subject & ";Body:" & _Body & ";FitxerAdjunt:" & FitxerAdjunt) & "','S''ha intentat enviar un email i ha hagut problemes','" & Data & "')"
                'clsBDMySQL.BaseDades(2, VectorSQL)
            Else
                Dim clsBD As New ClaseAccesoBD
                VectorSQL(0) = "INSERT INTO Problemes(idUsuari,NumeroSistema,MissatgeSistema,Info1,Info2,Data) VALUES(100,0,'" & clsBD.Cometes(ex.Message) & "','Error enviant email via EnviarEmail_System_Web_Mail. " & clsBD.Cometes("To:" & To_ & ";From:" & From & ";Subject:" & Subject & ";Body:" & _Body & ";FitxerAdjunt:" & FitxerAdjunt) & "','S''ha intentat enviar un email i ha hagut problemes','" & Data & "')"
                clsBD.BaseDades(2, VectorSQL)
            End If
        End Try
    End Function

    Public Function EnviarCorreo(ByVal Destinatario As String, ByVal Cabecera As String, ByVal Cuerpo As String, ByVal From As String, ByVal ServidorSMTP As String, ByVal UsuarioSMTP As String, ByVal PasswordSMTP As String, ByVal Puerto As Integer, Optional ByVal EsTLS As Boolean = True) As Boolean
        Try
            Dim mMailMessage As New MailMessage()
            mMailMessage.From = New MailAddress(From)
            mMailMessage.To.Add(New MailAddress(Destinatario))
            mMailMessage.Subject = Cabecera
            mMailMessage.Body = Cuerpo
            mMailMessage.IsBodyHtml = True
            mMailMessage.Priority = MailPriority.Normal
            Dim mSmtpClient As New SmtpClient()
            mSmtpClient.Host = ServidorSMTP
            mSmtpClient.Credentials = New System.Net.NetworkCredential(UsuarioSMTP, PasswordSMTP)
            mSmtpClient.Port = Puerto
            mSmtpClient.EnableSsl = EsTLS
            mSmtpClient.Send(mMailMessage)
            Return True
        Catch ex As Exception
            Dim clsBD As New ClaseAccesoBD
            'clsBD.INSERIR_TAULA_PROBLEMES(0, "Problemas en la función EnviarCorreo. Email: " & Destinatario, ex)
        End Try
        Return False
    End Function

    Friend Function CanviarAccents(ByVal Modifiquem As Boolean, ByVal MeuText As String, Optional ByVal SMS As Boolean = False) As String
        Dim Cadena As String

        'Modifiquem = true implica que 'à' la passaríem a '&agrave;'
        'Modifiquem = false implica que 'à' passa a ser 'a'.
        Cadena = MeuText
        Cadena = Replace(Cadena, "à", IIf(Modifiquem, "&agrave;", "a"))
        Cadena = Replace(Cadena, "À", IIf(Modifiquem, "&Agrave;", "A"))
        Cadena = Replace(Cadena, "è", IIf(Modifiquem, "&egrave;", "e"))
        Cadena = Replace(Cadena, "È", IIf(Modifiquem, "&Egrave;", "E"))
        Cadena = Replace(Cadena, "ò", IIf(Modifiquem, "&ograve;", "o"))
        Cadena = Replace(Cadena, "Ò", IIf(Modifiquem, "&Ograve;", "O"))
        Cadena = Replace(Cadena, "á", IIf(Modifiquem, "&aacute;", "a"))
        Cadena = Replace(Cadena, "Á", IIf(Modifiquem, "&Aacute;", "A"))
        Cadena = Replace(Cadena, "é", IIf(Modifiquem, "&eacute;", "e"))
        Cadena = Replace(Cadena, "É", IIf(Modifiquem, "&Eacute;", "E"))
        Cadena = Replace(Cadena, "í", IIf(Modifiquem, "&iacute;", "i"))
        Cadena = Replace(Cadena, "Í", IIf(Modifiquem, "&Iacute;", "I"))
        Cadena = Replace(Cadena, "ï", IIf(Modifiquem, "&iuml;", "i")) 'exemple: distribuïdor
        Cadena = Replace(Cadena, "Ï", IIf(Modifiquem, "&Iuml;", "I"))
        Cadena = Replace(Cadena, "ó", IIf(Modifiquem, "&oacute;", "o"))
        Cadena = Replace(Cadena, "Ó", IIf(Modifiquem, "&Oacute;", "O"))
        Cadena = Replace(Cadena, "ú", IIf(Modifiquem, "&uacute;", "u"))
        Cadena = Replace(Cadena, "Ú", IIf(Modifiquem, "&Uacute;", "U"))
        Cadena = Replace(Cadena, "ü", IIf(Modifiquem, "&uuml;", "u")) 'exemple: llengües, vergüenza
        Cadena = Replace(Cadena, "Ü", IIf(Modifiquem, "&Uuml;", "U"))
        Cadena = Replace(Cadena, "ñ", IIf(Modifiquem, "&ntilde;", IIf(SMS, "ñ", "n")))
        Cadena = Replace(Cadena, "Ñ", IIf(Modifiquem, "&Ntilde;", IIf(SMS, "Ñ", "N")))
        Cadena = Replace(Cadena, "ç", IIf(Modifiquem, "&ccedil;", "c"))
        Cadena = Replace(Cadena, "Ç", IIf(Modifiquem, "&Ccedil;", "C"))
        CanviarAccents = Cadena
    End Function

End Class
