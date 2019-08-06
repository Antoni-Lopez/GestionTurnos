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
            Dim email As String, email_bd As String, idferia As String, registrado As String, idioma As String, Password As String, Password_DB As String, Pass_visible As String, ramdom_code As String

            email = Input_Email.Value
            idioma = oculto.Value
            idferia = "210" 'La ponemos a martillo para identificar bien el evento.
            Password = Input_Password.Value
            Pass_visible = oculto2.Value

            DS.Reset()
            VectorSQL(0) = "SELECT Email,Carrec As registrado,Password,SectorInteres FROM EEContactes WHERE Email='" & clsBD.Cometes(Left(email, 100)) & "'AND idFira ='" & idferia & "'"

            If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
            Else
                If DS.Tables(0).Rows.Count > 0 Then
                    For i = 0 To DS.Tables(0).Rows.Count - 1
                        email_bd = DS.Tables(0).Rows(i).Item("Email")
                        registrado = DS.Tables(0).Rows(i).Item("registrado")
                        Password_DB = DS.Tables(0).Rows(i).Item("Password")
                        ramdom_code = DS.Tables(0).Rows(i).Item("SectorInteres")
                    Next
                End If
            End If

            If email = "" Or email = Nothing Then 'Campo email vacio
                If idioma = "es" Then
                    ClientScript.RegisterStartupScript(Page.GetType(), "no_pass10", "mensajes(9)", True) 'mostramos mensa no mail español
                Else
                    ClientScript.RegisterStartupScript(Page.GetType(), "no_pass11", "mensajes(10)", True) 'mostramos mensa no mail ingles
                End If
            Else
                If email = email_bd Then 'Email introducido x user y el de DB coinciden.
                    If registrado = "false" Then
                        Server.Transfer("index.aspx?Email=" & email & "&registrado=" & registrado & "&idioma=" & idioma) 'Redireccionamos para que se registre por primera vez.
                    Else
                        If Pass_visible <> 0 Then 'Campo contraseña esta visible
                            If Password = Password_DB Then 'Pass del input y de la Db coinciden.
                                Server.Transfer("index.aspx?Email=" & email & "&registrado=" & registrado & "&idioma=" & idioma)
                                'Response.Redirect("index.aspx?id='" & ramdom_code & "&registrado=" & registrado & "&idioma=" & idioma)
                            Else
                                If Password = "" Or Password = Nothing Then 'Campo contraseña vacio.
                                    If idioma = "es" Then
                                        ClientScript.RegisterStartupScript(Page.GetType(), "no_pass", "mensajes(5)", True) 'mostramos mensa no pass español
                                    Else
                                        ClientScript.RegisterStartupScript(Page.GetType(), "no_pass2", "mensajes(6)", True) 'mostramos mensa no pass ingles
                                    End If
                                Else
                                    If Password = Password_DB Then 'Contraseña user y contraseña Bd iguales
                                        Server.Transfer("index.aspx?Email=" & email & "&registrado=" & registrado & "&idioma=" & idioma)
                                    Else
                                        If idioma = "es" Then
                                            ClientScript.RegisterStartupScript(Page.GetType(), "no_pass3", "mensajes(7)", True) 'mostramos mensa pass distinta español
                                        Else
                                            ClientScript.RegisterStartupScript(Page.GetType(), "no_pass4", "mensajes(8)", True) 'mostramos mensa pass distinta ingles
                                        End If
                                    End If

                                End If
                            End If
                        Else 'Campo contraseña no esta visible
                            If idioma = "es" Then
                                ClientScript.RegisterStartupScript(Page.GetType(), "no_pass6", "mensajes(1)", True) 'mostramos mensa estas registrado en español y show input pass
                            Else
                                ClientScript.RegisterStartupScript(Page.GetType(), "no_pass7", "mensajes(2)", True) 'mostramos mensa estas registrado en english y show input pass
                            End If
                        End If
                    End If
                Else 'Email no coincide y soltamos mensaje.
                    If idioma = "es" Then
                        ClientScript.RegisterStartupScript(Page.GetType(), "no_pass8", "mensajes(3)", True) 'mostramos mensa no email español
                    Else
                        ClientScript.RegisterStartupScript(Page.GetType(), "no_pass9", "mensajes(4)", True) 'mostramos mensa no email ingles
                    End If
                End If
            End If



        End If
    End Sub
End Class