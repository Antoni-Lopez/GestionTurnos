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
            Dim comprobar2 As String
            comprobar2 = 0

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
                    Case 5
                        comprobar = separar_guardado(p)
                        If comprobar <> 0 Then
                            horas_produccion.Value = comprobar
                        End If
                    Case 6
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            nombre_proveedor.Value = comprobar
                        End If
                    Case 7
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            ncanales_contratados.Value = comprobar
                        End If
                    Case 8
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            precio_paquete.Value = comprobar
                        End If
                    Case 9
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            equipo_tv2.Value = comprobar
                        End If
                    Case 10
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            encriptar_tv2.Value = comprobar
                        End If
                    Case 11
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            SGAE.Checked = True
                        End If
                    Case 12
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            EGEDA.Checked = True
                        End If
                    Case 13
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            AGEDI.Checked = True
                        End If
                    Case 14
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            otros_derechos.Value = comprobar
                        End If
                    Case 15
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            Autonomo_si.Checked = True
                        End If
                    Case 16
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            Autonomo_no.Checked = True
                        End If
                    Case 17
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            fibra.Checked = True
                        End If
                    Case 18
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            radioenlace.Checked = True
                        End If
                    Case 19
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            fibra_megas.Value = comprobar
                        End If
                    Case 20
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            radioenlace_megas.Value = comprobar
                        End If
                    Case 21
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            megas_caudal.Value = comprobar
                        End If
                    Case 22
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            proveedor_circuito.Value = comprobar
                        End If
                    Case 23
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            precio_circuito.Value = comprobar
                        End If
                    Case 24
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            proveedor_caudal.Value = comprobar
                        End If
                    Case 25
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            precio_caudal.Value = comprobar
                        End If
                    Case 26
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            subida_ofreces.Value = comprobar
                        End If
                    Case 27
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            subida_ofreces2.Value = comprobar
                        End If
                    Case 28
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            subida_ofreces3.Value = comprobar
                        End If
                    Case 29
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            subida_ofreces4.Value = comprobar
                        End If
                    Case 30
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            subida_ofreces5.Value = comprobar
                        End If
                    Case 31
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            bajada_ofreces.Value = comprobar
                        End If
                    Case 32
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            bajada_ofreces2.Value = comprobar
                        End If
                    Case 33
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            bajada_ofreces3.Value = comprobar
                        End If
                    Case 34
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            bajada_ofreces4.Value = comprobar
                        End If
                    Case 35
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            bajada_ofreces5.Value = comprobar
                        End If
                    Case 36
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            equipo_uso.Value = comprobar
                        End If
                    Case 37
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            marca_fabricante.Value = comprobar
                        End If
                    Case 38
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            operador_num_propia_si.Checked = True
                        End If
                    Case 39
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            operador_num_propia_no.Checked = True
                        End If
                    Case 40
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            tarifa_plana_si.Checked = True
                        End If
                    Case 41
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            tarifa_plana_no.Checked = True
                        End If
                    Case 42
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            mantenimiento_linea_si.Checked = True
                        End If
                    Case 43
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            mantenimiento_linea_no.Checked = True
                        End If
                    Case 44
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            facturacion_propia_si.Checked = True
                        End If
                    Case 45
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            facturacion_propia_no.Checked = True
                        End If
                    Case 46
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            facturacion_ajena.Value = comprobar
                        End If
                    Case 47
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            suministra_telefonico.Value = comprobar
                        End If
                    Case 48
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            min_consumo_mensual.Value = comprobar
                        End If
                    Case 49
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            fijo_fijo.Value = comprobar
                        End If
                    Case 50
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            fijo_movil_min.Value = comprobar
                        End If
                    Case 51
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            precio_fijo_movil.Value = comprobar
                        End If
                    Case 52
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            cual_operador.Value = comprobar
                        End If
                    Case 53
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            ofreces_tarifa_plana_si.Checked = True
                        End If
                    Case 54
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            ofreces_tarifa_plana_no.Checked = True
                        End If
                    Case 55
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            cuantos_min_men_movilmovil.Value = comprobar
                        End If
                    Case 56
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            cuantos_min_men_movilfijo.Value = comprobar
                        End If
                    Case 57
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            cual_omv.Value = comprobar
                        End If
                    Case 58

                        'ofreces_tarifa_plana_cualomv_si.Checked = separar_guardado(p)


                        'comprobar = separar_guardado(p)
                        'If comprobar = True Then
                        '    ofreces_tarifa_plana_cualomv_si.Checked = True
                        'End If
                    Case 59
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            ofreces_tarifa_plana_cualomv_no.Checked = True
                        End If
                    Case 60
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            min_facturas_omv_mens_movilmovil.Value = comprobar
                        End If
                    Case 61
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            min_facturas_omv_mens_movilfijo.Value = comprobar
                        End If
                    Case 62
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            consumo_datos_mens.Value = comprobar
                        End If
                    Case 63
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            facturacion_mensual.Value = comprobar
                        End If
                    Case 64
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            sist_factu_propio_si.Checked = True
                        End If
                    Case 65
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            sist_factu_propio_no.Checked = True
                        End If
                    Case 66
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            empresa_lleva_fact.Value = comprobar
                        End If
                    Case 67
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            marketing_propio_si.Checked = True
                        End If
                    Case 68
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            marketing_propio_no.Checked = True
                        End If
                    Case 69
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            pres_invirte_mes.Value = comprobar
                        End If
                    Case 70
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            departamento_juridico_si.Checked = True
                        End If
                    Case 71
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            departamento_juridico_no.Checked = True
                        End If
                    Case 72
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> 1 Then
                            pres_mensual_invierte.Value = comprobar
                        End If
                    Case 73
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            departamento_ingenieria_si.Checked = True
                            ClientScript.RegisterStartupScript(Page.GetType(), "miprueba33", "activar(3);", True)
                        End If
                    Case 74
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            departamento_ingenieria_no.Checked = True
                            ClientScript.RegisterStartupScript(Page.GetType(), "miprueba44", "activar(4);", True)
                        End If
                    Case 75
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            personas_forman_ingenieria.Value = comprobar
                        End If

                    Case 76
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            empresa_gestiona.Value = comprobar
                        End If
                    Case 77
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            hogares_pasados.Value = comprobar
                        End If
                    Case 78
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            abonados_TV.Value = comprobar
                        End If
                    Case 79
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            abonados_internet.Value = comprobar
                        End If
                    Case 80
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            abonados_tfija.Value = comprobar
                        End If
                    Case 81
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            abonados_tmovil.Value = comprobar
                        End If
                    Case 82
                        comprobar = separar_guardado(p)
                        If comprobar.Length <> comprobar2 Then
                            num_lineas_totales.Value = comprobar
                        End If
                    Case 83
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            num_trabajadores.Value = comprobar
                        End If
                    Case 84
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            ingresos.Value = comprobar
                        End If
                End Select
            Next




        End If
    End Function

End Class