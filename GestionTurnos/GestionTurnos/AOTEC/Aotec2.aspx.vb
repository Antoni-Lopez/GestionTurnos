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
            soflow.Attributes.Add("onchange", "mostrar_rellenar_select();")

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
        Dim guardado As String, long_guardado As String, separar_guardado() As String, comprobar As String, mivar As String, sep_mivar() As String, j As Integer, z As Integer
        Dim Ano As String, mes As String, day As String, Hora As String, min As String, seg As String, AnoBD As String, mesBD As String, dayBD As String, HoraBd As String

        VectorSQL(0) = "SELECT SectorInteres as Datos, Data as FechaLimite FROM eecontactes WHERE Email='" & clsBD.Cometes(Left(mail, 100)) & "' AND idFira='" & idferia & "'"
        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    guardado = DS.Tables(0).Rows(i).Item("Datos")
                    mivar = DS.Tables(0).Rows(i).Item("FechaLimite")
                Next
            Else
                'No tenemos ningún registro en la BD.
            End If

            separar_guardado = guardado.Split("¦")
            sep_mivar = mivar.Split("¦")

            long_guardado = separar_guardado.Length
            Dim comprobar2 As String
            comprobar2 = 0

            AnoBD = sep_mivar(0)
            mesBD = sep_mivar(1)
            dayBD = sep_mivar(2)
            HoraBd = sep_mivar(3)


            Ano = DateTime.Now.ToString("yyyy")
            mes = DateTime.Now.ToString("MM")
            day = DateTime.Now.ToString("dd")

            Dim fecha As String, sep_fecha() As String, mivar2 As String, VArray2() As String
            Hora = DateTime.Now.ToString("HH")

            If Ano >= AnoBD Then
                If mes >= mesBD Then
                    If day >= dayBD Then
                        If Hora >= HoraBd Then
                            ClientScript.RegisterStartupScript(Page.GetType(), "FechasIguales", "LanzaMensaje();", True)
                            cuadro_boton.Attributes.Add("style", "display:none;")
                        End If
                    End If
                End If
            End If

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
                            equipo_tv2.Value = comprobar
                        End If
                    Case 2
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            encriptar_tv2.Value = comprobar
                        End If
                    Case 3
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            mis_servicios.Value = comprobar
                        End If
                    Case 4
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            ott_provedor.Value = comprobar
                        End If
                    Case 5
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            otros_derechos.Value = comprobar
                        End If
                    Case 6
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            fibra_megas.Value = comprobar
                        End If
                    Case 7
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            radioenlace_megas.Value = comprobar
                        End If
                    Case 8
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            megas_caudal.Value = comprobar
                        End If
                    Case 9
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            proveedor_circuito.Value = comprobar
                        End If
                    Case 10
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            precio_circuito.Value = comprobar
                        End If
                    Case 11
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            proveedor_caudal.Value = comprobar
                        End If
                    Case 12
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            precio_caudal.Value = comprobar
                        End If
                    Case 13
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            subida_ofreces.Value = comprobar
                        End If
                    Case 14
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            bajada_ofreces.Value = comprobar
                        End If
                    Case 15
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            subida_ofreces2.Value = comprobar
                        End If
                    Case 16
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            bajada_ofreces2.Value = comprobar
                        End If
                    Case 17
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            subida_ofreces3.Value = comprobar
                        End If
                    Case 18
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            bajada_ofreces3.Value = comprobar
                        End If
                    Case 19
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            subida_ofreces4.Value = comprobar
                        End If
                    Case 20
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            bajada_ofreces4.Value = comprobar
                        End If
                    Case 21
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            subida_ofreces5.Value = comprobar
                        End If
                    Case 22
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            bajada_ofreces5.Value = comprobar
                        End If
                    Case 23
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            equipo_uso.Value = comprobar
                        End If
                    Case 24
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            marca_fabricante.Value = comprobar
                        End If
                    Case 25
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            suministra_telefonico.Value = comprobar
                        End If
                    Case 26
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            min_consumo_mensual.Value = comprobar
                        End If
                    Case 27
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            fijo_fijo.Value = comprobar
                        End If
                    Case 28
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            fijo_movil_min.Value = comprobar
                        End If
                    Case 29
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            precio_fijo_movil.Value = comprobar
                        End If
                    Case 30
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            cual_operador.Value = comprobar
                        End If
                    Case 31
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            cuantos_min_men_movilmovil.Value = comprobar
                        End If
                    Case 32
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            cuantos_min_men_movilfijo.Value = comprobar
                        End If
                    Case 33
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            cual_omv.Value = comprobar
                        End If
                    Case 34
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            min_facturas_omv_mens_movilmovil.Value = comprobar
                        End If
                    Case 35
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            min_facturas_omv_mens_movilfijo.Value = comprobar
                        End If
                    Case 36
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            consumo_datos_mens.Value = comprobar
                        End If
                    Case 37
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            facturacion_mensual.Value = comprobar
                        End If
                    Case 38
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            empresa_lleva_fact.Value = comprobar
                        End If
                    Case 39
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            pres_invirte_mes.Value = comprobar
                        End If
                    Case 40
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            pres_mensual_invierte.Value = comprobar
                        End If
                    Case 41
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            personas_forman_ingenieria.Value = comprobar
                        End If
                    Case 42
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            empresa_gestiona.Value = comprobar
                        End If
                    Case 43
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            hogares_pasados.Value = comprobar
                        End If
                    Case 44
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            abonados_TV.Value = comprobar
                        End If
                    Case 45
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            abonados_internet.Value = comprobar
                        End If
                    Case 46
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            abonados_tfija.Value = comprobar
                        End If
                    Case 47
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            abonados_tmovil.Value = comprobar
                        End If
                    Case 48
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            num_lineas_totales.Value = comprobar
                        End If
                    Case 49
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            num_trabajadores.Value = comprobar
                        End If
                    Case 50
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            ingresos.Value = comprobar
                        End If
                    Case 51
                        canalLocal_si.Checked = separar_guardado(p)
                    Case 52
                        canalLocal_no.Checked = separar_guardado(p)
                    Case 53
                        encriptacionPropia_si.Checked = separar_guardado(p)
                    Case 54
                        encriptacionPropia_no.Checked = separar_guardado(p)
                    Case 55
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            ClientScript.RegisterStartupScript(Page.GetType(), "miprueba66", "activar(6);", True)
                            PlataformaOTTPropia_si.Checked = True
                        End If
                    Case 56
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            ClientScript.RegisterStartupScript(Page.GetType(), "miprueba77", "activar(7);", True)
                            PlataformaOTTPropia_no.Checked = True
                        End If
                    Case 57
                        SGAE.Checked = separar_guardado(p)
                    Case 58
                        EGEDA.Checked = separar_guardado(p)
                    Case 59
                        AGEDI.Checked = separar_guardado(p)
                    Case 60
                        Autonomo_si.Checked = separar_guardado(p)
                    Case 61
                        Autonomo_no.Checked = separar_guardado(p)
                    Case 62
                        fibra.Checked = separar_guardado(p)
                    Case 63
                        radioenlace.Checked = separar_guardado(p)
                    Case 64
                        operadorNumPropia_si.Checked = separar_guardado(p)
                    Case 65
                        operadorNumPropia_no.Checked = separar_guardado(p)
                    Case 66
                        TarifaPplana_si.Checked = separar_guardado(p)
                    Case 67
                        TarifaPplana_no.Checked = separar_guardado(p)
                    Case 68
                        MantenimientoLinea_si.Checked = separar_guardado(p)
                    Case 69
                        MantenimientoLinea_no.Checked = separar_guardado(p)
                    Case 70
                        FacturacionPropia_si.Checked = separar_guardado(p)
                    Case 71
                        FacturacionPropia_no.Checked = separar_guardado(p)
                    Case 72
                        OfrecesTarifaPlana_si.Checked = separar_guardado(p)
                    Case 73
                        OfrecesTarifaPlana_no.Checked = separar_guardado(p)
                    Case 74
                        OfrecesTarifaPlanaCualomv_si.Checked = separar_guardado(p)
                    Case 75
                        OfrecesTarifaPlanaCualomv_no.Checked = separar_guardado(p)
                    Case 76
                        SistFactuPropio_si.Checked = separar_guardado(p)
                    Case 77

                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            ClientScript.RegisterStartupScript(Page.GetType(), "miprueba55", "activar(8);", True)
                            SistFactuPropio_no.Checked = separar_guardado(p)
                        Else
                            SistFactuPropio_no.Checked = separar_guardado(p)
                        End If
                    Case 78
                        MarketingPropio_si.Checked = separar_guardado(p)
                    Case 79
                        MarketingPropio_no.Checked = separar_guardado(p)
                    Case 80
                        DepartamentoJuridico_si.Checked = separar_guardado(p)
                    Case 81
                        DepartamentoJuridico_no.Checked = separar_guardado(p)
                    Case 82
                        DepartamentoIngenieria_si.Checked = separar_guardado(p)
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            ClientScript.RegisterStartupScript(Page.GetType(), "miprueba33", "activar(3);", True)
                        End If
                    Case 83
                        DepartamentoIngenieria_no.Checked = separar_guardado(p)
                        comprobar = separar_guardado(p)
                        If comprobar = True Then
                            ClientScript.RegisterStartupScript(Page.GetType(), "miprueba44", "activar(4);", True)
                        End If
                    Case 84
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            soflow.Items.Add(New ListItem(comprobar, comprobar))  'Añadimos otra opcion.
                        End If
                    Case 87
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            soflow.Items.Add(New ListItem(comprobar, comprobar))  'Añadimos otra opcion.
                        End If
                    Case 90
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            soflow.Items.Add(New ListItem(comprobar, comprobar))  'Añadimos otra opcion.
                        End If
                    Case 93
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            soflow.Items.Add(New ListItem(comprobar, comprobar))  'Añadimos otra opcion.
                        End If
                    Case 96
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            soflow.Items.Add(New ListItem(comprobar, comprobar))  'Añadimos otra opcion.
                        End If
                    Case 99
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            soflow.Items.Add(New ListItem(comprobar, comprobar))  'Añadimos otra opcion.
                        End If
                    Case 102
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            soflow.Items.Add(New ListItem(comprobar, comprobar))  'Añadimos otra opcion.
                        End If
                    Case 105
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            soflow.Items.Add(New ListItem(comprobar, comprobar))  'Añadimos otra opcion.
                        End If
                    Case 108
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            soflow.Items.Add(New ListItem(comprobar, comprobar))  'Añadimos otra opcion.
                        End If
                    Case 111
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            soflow.Items.Add(New ListItem(comprobar, comprobar))  'Añadimos otra opcion.
                        End If
                    Case 114
                        comprobar = separar_guardado(p)
                        If comprobar <> comprobar2 Then
                            soflow.Items.Add(New ListItem(comprobar, comprobar))  'Añadimos otra opcion.
                        End If
                End Select
            Next

            Dim sep_guardado() As String, checkear As String
            DS.Reset()

            VectorSQL(0) = "SELECT WebPersonal as Datos FROM eecontactes WHERE Email='" & clsBD.Cometes(Left(mail, 100)) & "' AND idFira='" & idferia & "'"
            If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
            Else
                If DS.Tables(0).Rows.Count > 0 Then
                    For i = 0 To DS.Tables(0).Rows.Count - 1
                        guardado = DS.Tables(0).Rows(i).Item("Datos")
                    Next
                Else
                    'No tenemos ningún registro en la BD.
                End If

                'Movistar¦125¦0.08¦Lemovial¦12¦0.03

                sep_guardado = guardado.Split("¦")
                For z = 0 To UBound(sep_guardado)
                    checkear = sep_guardado(z)
                    If IsNumeric(checkear) Then

                    Else
                        soflow.Items.Add(New ListItem(checkear, checkear))  'Añadimos otra opcion.
                    End If

                Next
            End If
        End If
    End Function

End Class