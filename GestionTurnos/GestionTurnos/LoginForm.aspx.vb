Public Class LoginForm
    Inherits System.Web.UI.Page

    Dim clsBD As New ClaseAccesoBD
    Dim DS As DataSet
    Dim VectorSQL(0) As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim clsGeneral As New ClaseGeneral
            clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)
            validar.Attributes.Add("onclick", "return Comprueba()")
            Email1.Attributes.Add("Placeholder", "Introduzca su Email")
            Password.Attributes.Add("Placeholder", "Contraseña")
            Response.Redirect("Formulario.aspx?IDUser=1")
        Else
            Dim IDUser As Integer
            If ChekeaEmail(Trim(Email1.Text), Trim(Password.Text), IDUser) Then
                Response.Redirect("Formulario.aspx?IDUser=" & IDUser)
            Else
                ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Lo sentimos pero algo ha fallado, revise los campos email y contraseña para comprobar que son los correctos. Gracias!')", True)
            End If
        End If
    End Sub

    Private Function ChekeaEmail(ByVal Email As String, ByVal Password As String, ByRef IDUser As Integer)

        'Realizamos la consulta para la BD
        VectorSQL(0) = "SELECT Auto,Email, Password FROM eecontactes WHERE Email='" & clsBD.Cometes(Left(Email, 100)) & "' AND Password='" & clsBD.Cometes(Password) & "'"
        DS = New DataSet

        Dim Dato1 As Integer, Dato2 As String, Dato3 As String

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email y password en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    Dato1 = DS.Tables(0).Rows(i).Item("Auto")
                    Dato2 = DS.Tables(0).Rows(i).Item("Email")
                    Dato3 = DS.Tables(0).Rows(i).Item("Password")
                Next

                If Email = Dato2 And Password = Dato3 Then
                    IDUser = Dato1
                    Return IDUser
                Else
                    'No nos devuelve valores

                End If
            End If
        End If

    End Function

    Public Function EjemplosBD()
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String
        Dim Dato1 As Integer, Dato2 As String, Dato3 As String, i As Integer, Ultimo As Integer = 0


        VectorSQL(0) = "SELECT Campo1 AS MiCampo1, Campo2, Campo3 FROM NombreTabla WHERE Campo1 > 0 ORDER BY Campo1"
        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            'Problema
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    Dato1 = DS.Tables(0).Rows(i).Item("MiCampo1")
                    Dato2 = DS.Tables(0).Rows(i).Item("Campo2")
                    Dato3 = DS.Tables(0).Rows(i).Item("Campo3")
                Next
            Else
                'No nos devuelve valores
            End If
        End If

        '****************************************************

        VectorSQL(0) = "INSERT INTO NombreTabla (Campo1, Campo2, Campo3) VALUES(Valor1, Valor2, Valor3)"
        If Not clsBD.BaseDades(2, VectorSQL, , Ultimo) Then
            'Problema
        Else
            'La variable Ultimo tendrá el último ID autonumérico
        End If

        '****************************************************

        VectorSQL(0) = "UPDATE NombreTabla SET Campo1 = Valor1, Campo2 = Valor2, Campo3 = Valor3 WHERE Campo1 = 1 AND Camp2 = '2'"
        If Not clsBD.BaseDades(2, VectorSQL) Then
            'Problema
        Else
            'Correcto
        End If

        '****************************************************

        VectorSQL(0) = "DELETE FROM NombreTabla WHERE Campo1 = 1 AND Camp2 = '2'"
        If Not clsBD.BaseDades(2, VectorSQL) Then
            'Problema
        Else
            'Correcto
        End If

    End Function
End Class