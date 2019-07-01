Public Class Aotec2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim clsGeneral As New ClaseGeneral
        clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)

        If Not IsPostBack Then
            'Declaramos el combotext para que nos mande a una accion con javascript.
            'mis_servicios.Attributes.Add("onchange", "ShowSelected();")

            Dim mail As String, idferia As Integer, opciones As String
            'Recogemos el mail del usuario que esta oculto.
            mail = Request.QueryString("mail")
            datos_user.Text = mail
            idferia = "201"


            Dim clsBD As New ClaseAccesoBD
            Dim DS As DataSet
            Dim VectorSQL(0) As String
            DS = New DataSet

            VectorSQL(0) = "SELECT Procedencia as chk_seleccionados FROM eecontactes WHERE Email='" & clsBD.Cometes(Left(mail, 100)) & "' AND idFira='" & idferia & "'"

            If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
            Else
                If DS.Tables(0).Rows.Count > 0 Then
                    For i = 0 To DS.Tables(0).Rows.Count - 1
                        opciones = DS.Tables(0).Rows(i).Item("chk_seleccionados")
                    Next
                End If
            End If

            Dim separar_opc() As String, variable As String

            separar_opc = opciones.Split("¦")



            For i = 0 To 4
                variable = separar_opc(i)

                If variable.Length <= 0 Then
                    variable = 0
                End If

                Select Case i
                    Case 0
                        If variable = 1 Then
                            tele.Checked = True
                            tv1.Attributes.Add("style", "display:block;")
                        End If
                    Case 1
                        If variable = 1 Then
                            internet.Checked = True
                            interne1.Attributes.Add("style", "display:block;")
                        End If
                    Case 2
                        If variable = 1 Then
                            tefija.Checked = True
                            tfija1.Attributes.Add("style", "display:block;")
                        End If
                    Case 3
                        If variable = 1 Then
                            temovil.Checked = True
                            tmovil1.Attributes.Add("style", "display:block;")
                        End If
                    Case 4
                        If variable = 1 Then
                            another.Checked = True
                            otros1.Attributes.Add("style", "display:block;")
                        End If
                End Select



            Next
            extraer_data(mail, idferia)
        End If
    End Sub

    Private Function extraer_data(ByRef mail, ByVal idferia)

        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String
        DS = New DataSet
        Dim guardado As String, long_guardado As String, separar_guardado() As String, comprobar As String, mivar As String

        VectorSQL(0) = "SELECT SectorInteres FROM eecontactes WHERE Email='" & clsBD.Cometes(Left(mail, 100)) & "' AND idFira='" & idferia & "'"
        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    guardado = DS.Tables(0).Rows(i).Item("SectorInteres")
                Next
            Else
                'No tenemos ningún registro en la BD.

            End If

            separar_guardado = guardado.Split("¦")

            long_guardado = separar_guardado.Length

            For p = 0 To UBound(separar_guardado)
                Select Case p
                    Case 0
                        comprobar = separar_guardado(p)
                        If comprobar = 1 Then
                            success.Checked = True
                        Else
                            danger.Checked = True
                        End If
                    Case 1
                        comprobar = separar_guardado(p)
                        If comprobar = 1 Then
                            success_encriptacion.Checked = True
                        Else
                            danger_encriptacion.Checked = True
                        End If
                    Case 2
                        comprobar = separar_guardado(p)
                        If comprobar.Length > 1 Then
                            mis_servicios.Value = comprobar
                            ClientScript.RegisterStartupScript(Page.GetType(), "miprueba", "activar(1);", True)
                        Else

                        End If
                    Case 3
                        comprobar = separar_guardado(p)
                        If comprobar = 1 Then
                            success_OTT.Checked = True
                        Else
                            danger_OTT.Checked = True
                        End If
                    Case 4
                        comprobar = separar_guardado(p)
                        If comprobar.Length > 1 Then
                            ott_provedor.Value = comprobar
                            ClientScript.RegisterStartupScript(Page.GetType(), "miprueba22", "activar(2);", True)
                        End If
                End Select
            Next




        End If
    End Function

End Class