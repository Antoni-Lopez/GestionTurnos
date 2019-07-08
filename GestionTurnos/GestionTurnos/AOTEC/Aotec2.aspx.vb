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

            'Inputs de TV.
            '1800¦Orange¦15¦0.10¦100¦Orange¦xtra¦0¦Towerplane
            For p = 0 To UBound(separar_guardado)
                Select Case p
                    Case 0
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            horas_produccion.Value = comprobar
                        End If
                    Case 1
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            nombre_proveedor.Value = comprobar
                        End If
                    Case 2
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            ncanales_contratados.Value = comprobar
                        End If
                    Case 3
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            precio_paquete.Value = comprobar
                        End If
                    Case 4
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            equipo_tv2.Value = comprobar
                        End If
                    Case 5
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            encriptar_tv2.Value = comprobar
                        End If
                    Case 6
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            mis_servicios.Value = comprobar
                        End If
                    Case 7
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            ott_provedor.Value = comprobar
                        End If
                    Case 8
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            otros_derechos.Value = comprobar
                        End If

                        'inputs de Internet.
                        '600¦0¦250¦Orange¦0.10¦Orange¦0.5¦600¦600¦300¦300¦100¦100¦50¦50¦0¦0¦160¦Dell

                    Case 9
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            fibra_megas.Value = comprobar
                        End If
                    Case 10
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            radioenlace_megas.Value = comprobar
                        End If
                    Case 11
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            megas_caudal.Value = comprobar
                        End If
                    Case 12
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            proveedor_circuito.Value = comprobar
                        End If
                    Case 13
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            precio_circuito.Value = comprobar
                        End If
                    Case 14
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            proveedor_caudal.Value = comprobar
                        End If
                    Case 15
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            precio_caudal.Value = comprobar
                        End If
                    Case 16
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            subida_ofreces.Value = comprobar
                        End If
                    Case 17
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            bajada_ofreces.Value = comprobar
                        End If
                    Case 18
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            subida_ofreces2.Value = comprobar
                        End If
                    Case 19
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            bajada_ofreces2.Value = comprobar
                        End If
                    Case 20
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            subida_ofreces3.Value = comprobar
                        End If
                    Case 21
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            bajada_ofreces3.Value = comprobar
                        End If
                    Case 22
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            subida_ofreces4.Value = comprobar
                        End If
                    Case 23
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            bajada_ofreces4.Value = comprobar
                        End If
                    Case 24
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            subida_ofreces5.Value = comprobar
                        End If
                    Case 25
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            bajada_ofreces5.Value = comprobar
                        End If
                    Case 26
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            equipo_uso.Value = comprobar
                        End If
                    Case 27
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            marca_fabricante.Value = comprobar
                        End If

                        'Inputs Telefonia Fija.
                        'Orange¦200¦0.03¦500¦0.08
                        'Orange¦200¦0.03¦500¦0.08

                    Case 28
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            suministra_telefonico.Value = comprobar
                        End If
                    Case 29
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            min_consumo_mensual.Value = comprobar
                        End If
                    Case 30
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            fijo_fijo.Value = comprobar
                        End If
                    Case 31
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            fijo_movil_min.Value = comprobar
                        End If
                    Case 32
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            precio_fijo_movil.Value = comprobar
                        End If

                        'Inputs Telefonía Móvil
                        'Orange¦300¦100¦Orange¦12000¦12000¦250¦150¦Vomistar

                    Case 33
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            cual_operador.Value = comprobar
                        End If
                    Case 34
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            cuantos_min_men_movilmovil.Value = comprobar
                        End If
                    Case 35
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            cuantos_min_men_movilfijo.Value = comprobar
                        End If
                    Case 36
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            cual_omv.Value = comprobar
                        End If
                    Case 37
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            min_facturas_omv_mens_movilmovil.Value = comprobar
                        End If
                    Case 38
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            min_facturas_omv_mens_movilfijo.Value = comprobar
                        End If
                    Case 39
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            consumo_datos_mens.Value = comprobar
                        End If
                    Case 40
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            facturacion_mensual.Value = comprobar
                        End If
                    Case 41
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            empresa_lleva_fact.Value = comprobar
                        End If

                        'Inputs OTROSS.
                        '3200¦1500¦1500¦3000¦1500¦500¦3000¦Orange¦800¦25¦2100


                    Case 42
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            pres_invirte_mes.Value = comprobar
                        End If
                    Case 43
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            pres_mensual_invierte.Value = comprobar
                        End If
                    Case 44
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            personas_forman_ingenieria.Value = comprobar
                        End If
                    Case 45
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            empresa_gestiona.Value = comprobar
                        End If
                    Case 46
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            hogares_pasados.Value = comprobar
                        End If
                    Case 47
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            abonados_TV.Value = comprobar
                        End If
                    Case 48
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            abonados_internet.Value = comprobar
                        End If
                    Case 49
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            abonados_tfija.Value = comprobar
                        End If
                    Case 50
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            abonados_tmovil.Value = comprobar
                        End If
                    Case 51
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            num_lineas_totales.Value = comprobar
                        End If
                    Case 52
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            num_trabajadores.Value = comprobar
                        End If
                    Case 53
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            ingresos.Value = comprobar
                        End If


                        'A partir de aquí empiezan los chk. Aqui ván los de TV
                        'True¦False¦True¦False¦False¦True¦False¦True¦True¦ 

                        'False¦True¦True¦False¦True¦False¦True¦False¦True¦True¦False¦True¦False¦True¦False¦True¦True¦False¦True¦False¦True¦False¦True¦False
                    Case 54
                        success.Checked = separar_guardado(p)
                    Case 55
                        danger.Checked = separar_guardado(p)
                    Case 56
                        encriptacionPropia_si.Checked = separar_guardado(p)
                    Case 57
                        encriptacionPropia_no.Checked = separar_guardado(p)
                    Case 58
                        PlataformaOTTPropia_si.Checked = separar_guardado(p)
                    Case 59
                        PlataformaOTTPropia_no.Checked = separar_guardado(p)
                    Case 60
                        SGAE.Checked = separar_guardado(p)
                    Case 61
                        EGEDA.Checked = separar_guardado(p)
                    Case 62
                        AGEDI.Checked = separar_guardado(p)
                    Case 63
                        Autonomo_si.Checked = separar_guardado(p)
                    Case 64
                        Autonomo_no.Checked = separar_guardado(p)
                    Case 65
                        fibra.Checked = separar_guardado(p)
                    Case 66
                        radioenlace.Checked = separar_guardado(p)
                    Case 67
                        operadorNumPropia_si.Checked = separar_guardado(p)
                    Case 68
                        operadorNumPropia_no.Checked = separar_guardado(p)
                    Case 69
                        TarifaPplana_si.Checked = separar_guardado(p)
                    Case 70
                        TarifaPplana_no.Checked = separar_guardado(p)
                    Case 71
                        FacturacionPropia_si.Checked = separar_guardado(p)
                    Case 72
                        FacturacionPropia_no.Checked = separar_guardado(p)
                    Case 73
                        MantenimientoLinea_si.Checked = separar_guardado(p)
                    Case 74
                        MantenimientoLinea_no.Checked = separar_guardado(p)
                    Case 75
                        OfrecesTarifaPlana_si.Checked = separar_guardado(p)
                    Case 76
                        OfrecesTarifaPlana_no.Checked = separar_guardado(p)
                    Case 77
                        OfrecesTarifaPlanaCualomv_si.Checked = separar_guardado(p)
                    Case 78
                        OfrecesTarifaPlanaCualomv_no.Checked = separar_guardado(p)
                    Case 79
                        SistFactuPropio_si.Checked = separar_guardado(p)
                    Case 80
                        SistFactuPropio_no.Checked = separar_guardado(p)
                    Case 81
                        MarketingPropio_si.Checked = separar_guardado(p)
                    Case 82
                        MarketingPropio_no.Checked = separar_guardado(p)
                    Case 83
                        DepartamentoJuridico_si.Checked = separar_guardado(p)
                    Case 84
                        DepartamentoJuridico_no.Checked = separar_guardado(p)
                    Case 85
                        DepartamentoIngenieria_si.Checked = separar_guardado(p)
                        ClientScript.RegisterStartupScript(Page.GetType(), "miprueba33", "activar(3);", True)
                    Case 86
                        DepartamentoIngenieria_no.Checked = separar_guardado(p)
                        ClientScript.RegisterStartupScript(Page.GetType(), "miprueba44", "activar(4);", True)
                    Case 87
                    Case 88

                End Select
            Next




        End If
    End Function

End Class