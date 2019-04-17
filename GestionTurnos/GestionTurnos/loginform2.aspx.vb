Public Class loginform2
    Inherits System.Web.UI.Page


    Dim IDUser As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim clsGeneral As New ClaseGeneral
            clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)

            validar.Attributes.Add("onclick", "return Comprueba()")
            Email.Attributes.Add("Placeholder", "Introduzca su Email")
        Else
            If CompruebaMail(Trim(Email.Text)) Then
                Server.Transfer("Formulario2.aspx?IdUser=" & IDUser)
                'Response.Redirect("Formulario.aspx?IdUser=" & IDUser)
            Else
                ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Lo sentimos pero algo ha fallado, revise los campos email y contraseña para comprobar que son los correctos. Gracias!')", True)
            End If
        End If

    End Sub

    Private Function CompruebaMail(ByRef Email As String)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String
        Dim Rol As Integer

        DS = New DataSet
        VectorSQL(0) = "SELECT Auto AS userID ,idContacte AS Rol,idOrigen AS Agrupacion,idTipusContacte As Transporte, idAlta As Asiste, Nom As Nombre,Cognoms As Apellidos, Mobil AS Numero, Email, Carrec AS Region,NIT AS Siglas, Password, Procedencia As Origen, SectorInteres As Selas,NickTwitter As Alojamiento, NickFacebook As Alergias, WebPersonal As Observaciones, Blog As Especialidad, Data As consentimiento FROM eecontactes WHERE Email='" & clsBD.Cometes(Left(Email, 100)) & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1

                    IDUser = DS.Tables(0).Rows(i).Item("userID")
                    Rol = DS.Tables(0).Rows(i).Item("Rol")

                Next
            End If
        End If
        Return IDUser
    End Function
End Class