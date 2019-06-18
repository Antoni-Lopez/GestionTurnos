Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim clsGeneral As New ClaseGeneral
        clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)
        If Not IsPostBack Then
            miButton.Attributes.Add("onclick", "return comprueba_data();")
            input_mail.Attributes.Add("Placeholder", "Introduzca su Email")
            input_pass.Attributes.Add("Placeholder", "Introduzca su Contraseña")
        Else
            Dim email As String, email_BD As String, Pass As String, Pass_BD As String, nombre As String

            Dim clsBD As New ClaseAccesoBD
            Dim DS As DataSet
            Dim VectorSQL(0) As String
            DS = New DataSet

            email = input_mail.Text
            Pass = input_pass.Text

            VectorSQL(0) = "SELECT Email,Password,Nom FROM eecontactes WHERE Email='" & clsBD.Cometes(Left(email, 100)) & "' AND Password='" & Pass & "'"

            If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
            Else
                If DS.Tables(0).Rows.Count > 0 Then
                    For i = 0 To DS.Tables(0).Rows.Count - 1
                        email_BD = DS.Tables(0).Rows(i).Item("Email")
                        Pass_BD = DS.Tables(0).Rows(i).Item("Password")
                        nombre = DS.Tables(0).Rows(i).Item("Nom")
                    Next
                End If
            End If

            If Pass = Pass_BD And email = email_BD Then
                Dim mensaje As String

                input_oculto.Text = nombre
                mensaje = ""

                ClientScript.RegisterStartupScript(Page.GetType(), "loginOk", "LanzaAviso('<h4>Sus datos de acceso son correctos. Enseguida le re-direccionamos, Gracias <span>" & nombre & "</span> !')", True)
                Server.Transfer("/AOTEC/Aotec.aspx?mail=" & email_BD)
                'Response.Redirect("/AOTEC/Aotec.aspx?mail=" & email_BD & "")
            Else
                Dim mensaje2 As String
                mensaje2 = ""
                ClientScript.RegisterStartupScript(Page.GetType(), "loginKo", "LanzaAviso('<h4>Sus datos de acceso no son correctos. Por favor compruebe su Email ( <span>" & email & "</span> ) y su Contraseña ( <span>" & Pass & "</span> ) para estar seguro de que son correctas. Gracias! ')", True)
            End If
        End If
    End Sub


End Class