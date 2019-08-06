Imports System.Web
Imports System.Web.Services

Public Class FEFitxer
    Implements System.Web.IHttpHandler

    Dim clsBD As New ClaseAccesoBD
    Dim VectorSQL(0) As String

    Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest

        Dim files As HttpFileCollection = context.Request.Files
        Dim file As HttpPostedFile
        Dim Data As String, Parametre As String
        Try
            If context.Request.Files.Count > 0 Then
                Dim Cami As String, VDades() As String, VDades2() As String, NomFitxer As String, DataTemp As String, DimensioAmple As Integer, DimensioAlt As Integer, IDFira As Integer
                Dim fname As String
                Data = Year(Now) & Format(Month(Now), "0#") & Format(Day(Now), "0#") & Format(Hour(Now), "0#") & Format(Minute(Now), "0#") & Format(Second(Now), "0#")
                For i As Integer = 0 To files.Count - 1
                    file = files(i)
                    VDades = files.Keys(0).Split("¦")
                    IDFira = VDades(0)
                    Parametre = VDades(1)
                    If IDFira = "210" Then
                        NomFitxer = Parametre & Data & "_" & file.FileName
                        fname = context.Server.MapPath("~/Femsa/pdf/" & NomFitxer)
                        file.SaveAs(fname)
                        context.Response.Write("OK" & NomFitxer)
                    End If
                    context.Response.ContentType = "text/plain"
                Next
            End If
        Catch ex As Exception
            VectorSQL(0) = "INSERT INTO Problemes(IDUsuari,MissatgeSistema,Info1,Info2,Data) VALUES(100,'','','Problema executant la plana FEFitxer.ashx. Les dades eren: " & clsBD.Cometes(file.FileName) & ", Ex: " & clsBD.Cometes(ex.Message) & "','" & Data & "')"
            clsBD.BaseDades(2, VectorSQL)
        End Try

    End Sub

    ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class





