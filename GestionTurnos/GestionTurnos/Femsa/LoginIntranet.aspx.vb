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
            Dim email As String, email_bd As String, idferia As String, Password As String, Password_DB As String, code_ramdon_Bd As String

            ClientScript.RegisterStartupScript(Page.GetType(), "put_loading", "loader_gif(1);", True)

            idferia = "211" 'La ponemos a martillo para identificar bien el evento.
            email = input_mail.Value
            Password = input_password.Value

            If email = "" Or email Is Nothing Or email.Length = 0 Or Password = "" Or Password Is Nothing Or Password.Length = 0 Then
                ClientScript.RegisterStartupScript(Page.GetType(), "campos_vacios", "mensaje();", True)
                ClientScript.RegisterStartupScript(Page.GetType(), "delete_loading", "loader_gif(3);", True)
                GoTo Final
            End If

            VectorSQL(0) = "SELECT Email, Password, SectorInteres FROM EEContactes WHERE Email='" & clsBD.Cometes(Left(email, 100)) & "'AND idFira ='" & idferia & "'"

            If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
            Else
                If DS.Tables(0).Rows.Count > 0 Then
                    For i = 0 To DS.Tables(0).Rows.Count - 1
                        email_bd = DS.Tables(0).Rows(i).Item("Email")
                        Password_DB = DS.Tables(0).Rows(i).Item("Password")
                        code_ramdon_Bd = DS.Tables(0).Rows(i).Item("SectorInteres")
                    Next
                End If
            End If

            If email_bd = email Then
                If Password_DB = Password Then
                    Dim codigo As String
                    If code_ramdon_Bd.Length < 1 Then 'comprobamos si existe el codigo, sino existe, llamamos a la funcion ramdon para crearlo e insertarlo en la Bd.
                        codigo = ramdon(email)
                    Else 'si existe ese codigo es el id de dicho usuario
                        codigo = code_ramdon_Bd
                    End If

                    '1b6g0a

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