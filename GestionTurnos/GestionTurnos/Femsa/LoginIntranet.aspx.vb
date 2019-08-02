Public Class LoginIntranet
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim clsGeneral As New ClaseGeneral
        clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String
        DS = New DataSet

        If Not IsPostBack Then

        Else
            Dim email As String, email_bd As String, idferia As String, Password As String, Password_DB As String

            ClientScript.RegisterStartupScript(Page.GetType(), "put_loading", "loader_gif(1);", True)

            idferia = "211" 'La ponemos a martillo para identificar bien el evento.
            email = input_mail.Value
            Password = input_password.Value

            If email = "" Or email Is Nothing Or email.Length = 0 Or Password = "" Or Password Is Nothing Or Password.Length = 0 Then
                ClientScript.RegisterStartupScript(Page.GetType(), "campos_vacios", "mensaje();", True)
                ClientScript.RegisterStartupScript(Page.GetType(), "delete_loading", "loader_gif(3);", True)
                GoTo Final
            End If

            VectorSQL(0) = "SELECT Email,Password FROM EEContactes WHERE Email='" & clsBD.Cometes(Left(email, 100)) & "'AND idFira ='" & idferia & "'"

            If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
            Else
                If DS.Tables(0).Rows.Count > 0 Then
                    For i = 0 To DS.Tables(0).Rows.Count - 1
                        email_bd = DS.Tables(0).Rows(i).Item("Email")
                        Password_DB = DS.Tables(0).Rows(i).Item("Password")
                    Next
                End If
            End If

            If email_bd = email Then
                If Password_DB = Password Then
                    Dim codigo As String
                    codigo = ramdon(email)

                    If codigo <> "0" Then
                        ClientScript.RegisterStartupScript(Page.GetType(), "delete_loading", "loader_gif(2);", True)
                        Response.Redirect("indexIntranet.aspx?id='" & codigo & "'&idferia='" & idferia & "'")
                    End If
                End If
            End If
        End If

Final:
    End Sub

    Private Function ramdon(ByRef email)
        Dim N1 As String, myRamdon As String
        Dim randomN As New Random
        Dim alphabet As String = "abcdefghijklmnopqrstuvwxyz"

        Dim idferia As String

        idferia = "211"
        myRamdon = ""

        While (myRamdon.Length < 6)
            N1 = randomN.Next(0, 9)
            myRamdon += N1 + alphabet.Substring(N1, 1)
        End While

        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String
        DS = New DataSet

        Dim ramdon_codigo As String, ramdon_codigo_BD As String
        'DS.Reset()

        VectorSQL(0) = "SELECT Procedencia FROM EEContactes WHERE Email='" & clsBD.Cometes(Left(email, 100)) & "'AND idFira ='" & idferia & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    ramdon_codigo_BD = DS.Tables(0).Rows(i).Item("Procedencia")
                Next
            End If

            If ramdon_codigo_BD.Length < 6 Then 'no ay ningún cod. ramdon y por ello lo insertamos mediante un update.

                'DS.Reset()

                'VectorSQL(0) = "UPDATE eecontactes SET idTipusContacte='" & clsBD.Cometes(Left(myRamdon, 100)) & "' WHERE Email = '" & clsBD.Cometes(Left(email, 100)) & "'And idFeria = '" & idferia & "'"
                VectorSQL(0) = "UPDATE EEContactes SET Procedencia = '" & myRamdon & "' WHERE Email= '" & clsBD.Cometes(Left(email, 100)) & "'and idFira='" & idferia & "'"


                If Not clsBD.BaseDades(2, VectorSQL) Then
                    'Problema
                    Return 0
                    GoTo Final
                Else
                    Return myRamdon
                    GoTo Final
                End If
            Else 'si que lo hay y no hacemos nada salvo redireccionarlo a la Intranet.
                Return myRamdon
                GoTo Final
            End If
        End If
Final:
    End Function
End Class