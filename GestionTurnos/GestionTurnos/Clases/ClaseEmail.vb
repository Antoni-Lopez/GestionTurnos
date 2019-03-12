Imports System.Net.Mail

Public Class ClaseEmail

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

End Class
