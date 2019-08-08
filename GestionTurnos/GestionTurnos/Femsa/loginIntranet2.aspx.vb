Public Class loginIntranet2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim clsGeneral As New ClaseGeneral
        clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)

        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String
        DS = New DataSet

        input_mail.Attributes.Add("Placeholder", "Introduzca su Email.")
        input_pass.Attributes.Add("Placeholder", "Introduzca su Contraseña.")

        If Not IsPostBack Then
        Else
            Dim email As String, password As String, email_bd As String, password_bd As String, idferia As String, code_ramdon_Bd As String

            email = input_mail.Text
            password = input_pass.Text
            idferia = "211"

            ClientScript.RegisterStartupScript(Page.GetType(), "put_loading", "loader_gif(1);", True)

            If email = "" Or email = Nothing Or email.Length < 1 Then
                ClientScript.RegisterStartupScript(Page.GetType(), "mensa_email", "mensajes(1);", True)
                GoTo Terminar
            End If
            If password = "" Or password = Nothing Or password.Length < 1 Then
                ClientScript.RegisterStartupScript(Page.GetType(), "mensa_pass", "mensajes(2);", True)
                GoTo Terminar
            End If


            VectorSQL(0) = "SELECT Email, Password, SectorInteres FROM EEContactes WHERE Email='" & clsBD.Cometes(Left(email, 100)) & "'AND idFira ='" & idferia & "'"

            If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
            Else
                If DS.Tables(0).Rows.Count > 0 Then
                    For i = 0 To DS.Tables(0).Rows.Count - 1
                        email_bd = DS.Tables(0).Rows(i).Item("Email")
                        password_bd = DS.Tables(0).Rows(i).Item("Password")
                        code_ramdon_Bd = DS.Tables(0).Rows(i).Item("SectorInteres")
                    Next
                End If
            End If

            If email_bd = email Then
                If password_bd = password Then
                    Dim codigo As String
                    If code_ramdon_Bd.Length < 1 Then 'comprobamos si existe el codigo, sino existe, llamamos a la funcion ramdon para crearlo e insertarlo en la Bd.
                        codigo = ramdon(email)
                    Else 'si existe ese codigo es el id de dicho usuario
                        codigo = code_ramdon_Bd
                    End If

                    If codigo <> "0" Then
                        ClientScript.RegisterStartupScript(Page.GetType(), "delete_loading", "loader_gif(2);", True)
                        Response.Redirect("indexIntranet2.aspx?id='" & codigo & "'&idferia='" & idferia & "'")
                    End If
                Else
                    ClientScript.RegisterStartupScript(Page.GetType(), "fail_loading2", "loader_gif(3);", True)
                    ClientScript.RegisterStartupScript(Page.GetType(), "fail_pass", "mensajes(4);", True)
                End If
            Else
                ClientScript.RegisterStartupScript(Page.GetType(), "fail_loading", "loader_gif(3);", True)
                ClientScript.RegisterStartupScript(Page.GetType(), "fail_email", "mensajes(3);", True)
            End If
        End If
Terminar:
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

        Dim code_ramdon_Bd As String

        'Primero comprobamos que no tengamos ningún id ramdon = que el que acabamos de generar.
        VectorSQL(0) = "SELECT SectorInteres FROM EEContactes WHERE idFira ='" & idferia & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    code_ramdon_Bd = DS.Tables(0).Rows(i).Item("SectorInteres")
                    If code_ramdon_Bd = myRamdon Then
                        Exit For
                    End If
                Next
            End If

            VectorSQL(0) = "UPDATE EEContactes SET SectorInteres = '" & myRamdon & "' WHERE Email= '" & clsBD.Cometes(Left(email, 100)) & "'and idFira='" & idferia & "'"

            'Operación de update
            If Not clsBD.BaseDades(2, VectorSQL) Then
                'Problema
                Return 0
                GoTo Final
            Else
                Return myRamdon
                GoTo Final
            End If


        End If
Final:
    End Function

End Class