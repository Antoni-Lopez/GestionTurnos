Public Class Login1
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
            Dim email As String, email_bd As String, idferia As String, registrado As String, idioma As String

            email = Input_Email.Value
            idioma = oculto.Value
            idferia = "202" 'La ponemos a martillo para identificar bien el evento.

            DS.Reset()
            VectorSQL(0) = "SELECT Email,Carrec As registrado FROM EEContactes WHERE Email='" & clsBD.Cometes(Left(email, 100)) & "'AND idFira ='" & idferia & "'"

            If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
            Else
                If DS.Tables(0).Rows.Count > 0 Then
                    For i = 0 To DS.Tables(0).Rows.Count - 1
                        email_bd = DS.Tables(0).Rows(i).Item("Email")
                        registrado = DS.Tables(0).Rows(i).Item("registrado")
                    Next
                End If
            End If


            If email = email_bd Then
                If registrado = "false" Then
                    Server.Transfer("index.aspx?Email=" & email & "?registrado=" & registrado & "?idioma=" & idioma)
                Else
                    If idioma = "es" Then
                        'ClientScript.RegisterStartupScript(Page.GetType(), "enseñar_pass", "showPass(1)", True)
                    Else
                        'ClientScript.RegisterStartupScript(Page.GetType(), "show_pass", "showPass(2)", True)
                    End If

                    'Server.Transfer("index.aspx?Email=" & email & "?registrado=" & registrado & "?idioma=" & idioma)
                End If
            End If
        End If

    End Sub



End Class