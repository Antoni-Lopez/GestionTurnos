Public Class Index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim clsGeneral As New ClaseGeneral
        clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String
        DS = New DataSet

        Dim mail As String, idferia As Integer, registrado As String, idioma As String, oculto As String
        'Recogemos el mail del usuario que esta oculto.
        mail = Request.QueryString("Email")
        registrado = Request.QueryString("registrado")
        idioma = Request.QueryString("idioma")
        idferia = "210"

        If idioma = "" Or idioma = Nothing Then
            oculto = 1
            oculto2.Value = oculto
        Else
            If idioma = "es" Then
                oculto = 1
                oculto2.Value = oculto
            Else
                oculto = 2
                oculto2.Value = oculto
            End If
        End If

        If mail = "" Or mail = Nothing Then 'Email vacio.
            If idioma = "" Or idioma = Nothing Then
                form1.Attributes.Add(“style”, ” display:none;”)
                mensaje_es.Attributes.Add(“style”, ” display:Block;”)
            Else
                If idioma = "es" Then
                    form1.Attributes.Add(“style”, ” display:none;”)
                    mensaje_es.Attributes.Add(“style”, ” display:Block;”)
                Else
                    form1.Attributes.Add(“style”, ” display:none;”)
                    mensaje_en.Attributes.Add(“style”, ” display:Block;”)
                End If
            End If
            'Response.Redirect("login.aspx")
        Else
            Dim name_comp As String, email As String
            Dim nombre As String, ape As String, apellidos() As String, full_name2 As String, pass As String, datos_personales As String, datos_personales2() As String, vuelo_monte As String, vuelito_monte() As String
            Dim vuelo_regreso As String, vuelito_regreso() As String, radiobuttons As String, radios() As String

            VectorSQL(0) = "SELECT Nom,Cognoms, Password, NickTwitter, NickFacebook, NIT FROM EEContactes WHERE Email='" & clsBD.Cometes(Left(mail, 100)) & "'AND idFira ='" & idferia & "'"

            If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
            Else
                If DS.Tables(0).Rows.Count > 0 Then
                    For i = 0 To DS.Tables(0).Rows.Count - 1
                        nombre = DS.Tables(0).Rows(i).Item("Nom")
                        ape = DS.Tables(0).Rows(i).Item("Cognoms")
                        pass = DS.Tables(0).Rows(i).Item("Password")
                        datos_personales = DS.Tables(0).Rows(i).Item("NickTwitter")
                        vuelo_monte = DS.Tables(0).Rows(i).Item("NickFacebook")
                        radiobuttons = DS.Tables(0).Rows(i).Item("NIT")
                    Next
                End If
            End If

            If idioma = "en" Then
                'Primero vaciamos los textos que ya hubiesen.
                full_name.InnerText = ""
                pass_for_app.InnerText = ""
                p_cuadro_info.InnerText = ""
                personal_data2.InnerText = ""
                puesto.InnerText = ""
                unit_negocio.InnerText = ""
                adreees.InnerText = ""
                city.InnerText = ""
                country.InnerText = ""
                mobil.InnerText = ""
                phone.InnerText = ""
                monterrey_fly.InnerText = ""
                day_arrive.InnerText = ""
                time_arrive.InnerText = ""
                number_fly.InnerText = ""
                aerolinea.InnerText = ""
                p_vuelo_regreso.InnerText = ""
                day_exit.InnerText = ""
                time_exit.InnerText = ""
                number_fly_back.InnerText = ""
                aerolinea2.InnerText = ""
                itinerario.InnerText = ""
                itinerario_warning.InnerText = ""
                hotel.InnerText = ""
                warning_hotel2.InnerText = ""
                Fecha_chekin.InnerText = ""
                Fecha_chekout.InnerText = ""
                prefer.InnerText = ""
                confe.InnerText = ""





                'Ahora los rellenamos traducidos al inglés
                full_name.InnerText = "Full Name"
                pass_for_app.InnerText = "App Password"
                p_cuadro_info.InnerHtml = "<p class='vertical' id='p_cuadro_info' runat='server'><i class='fas fa-exclamation-circle'></i><span>Atention: </span> This Password will be used to access the RAA 2019 App</p>"
                personal_data2.InnerText = "Personal Data"
                puesto.InnerHtml = "Personal Data"
                unit_negocio.InnerHtml = "Business Unit <span>*</span>"
                adreees.InnerHtml = "Address <span>*</span>"
                city.InnerHtml = "City <span>*</span>"
                country.InnerHtml = "Country <span>*</span>"
                mobil.InnerHtml = "Mobil <span>*</span>"
                phone.InnerHtml = "Personal Phone <span>*</span>"
                monterrey_fly.InnerHtml = "Monterrey Fly"
                day_arrive.InnerHtml = "Day of arrival"
                time_arrive.InnerHtml = "Check In"
                number_fly.InnerHtml = "Fly Number"
                aerolinea.InnerHtml = "Airline"
                p_vuelo_regreso.InnerHtml = "Flight Return"
                day_exit.InnerHtml = "Day of Exit"
                time_exit.InnerHtml = "Time of Exit"
                number_fly_back.InnerHtml = "Nº Fly"
                aerolinea2.InnerHtml = "Airline"
                itinerario.InnerHtml = "Itinerary"
                itinerario_warning.InnerHtml = "<i class='fas fa-exclamation-circle'></i> <span> Note :  </span> The file will be saved when you register.</p>"
                hotel.InnerHtml = "Hosting / Hotel"
                warning_hotel2.InnerHtml = "· The hotel reservation will be made by Karina Flores, please indicate the number of nights required. <br />· Lodging expenses will be settled by the participant upon check-out"
                Fecha_chekin.InnerHtml = "Check-in Date"
                Fecha_chekout.InnerHtml = "Check-out Date"
                prefer.InnerHtml = "Dinner preference August 28."
                futbol.InnerHtml = "Soccer game Rayados vs Pumas and dinner (August 29)."
                confe.InnerHtml = "There will be a conference in English, please confirm if you require hearing aids for the translation in Spanish."
                radio_pollo.InnerHtml = "<input type='radio' class='radio-inline inputs_nuevos' name='radios' value='' id='Pollo' /><span class='outside'><span class='inside'></span></span>Chicken"
                radio_pescado.InnerHtml = "<input type='radio' class='radio-inline inputs_nuevos' name='radios' value='' id='Pescado' /><span class='outside'><span class='inside'></span></span>Meat"
                radio_noasiste.InnerHtml = "<input type='radio' class='radio-inline inputs_nuevos' name='radios' value='' id='no_asiste' /><span class='outside'><span class='inside'></span></span>I will not attend"
                futbol_si.InnerHtml = "<input type='radio' class='radio-inline inputs_nuevos' name='radio_futbol' value='' id='asiste_radio_si'><span class='outside'><span class='inside'></span></span>I will attend"
                futbol_no.InnerHtml = "<input type='radio' class='radio-inline inputs_nuevos' name='radios_futbol' value='' id='asiste_radio_no'><span class='outside'><span class='inside'></span></span>I will not attend"
                conferencia_si.InnerHtml = "<input type='radio' class='radio-inline inputs_nuevos' name='confe_radios' value='' id='radio_sisi'><span class='outside'><span class='inside'></span></span>Yes"



                'ponemos el input oculto a valor 2.
                oculto2.Value = "2"

                principal.Attributes.Add("onclick", "mensajes(3);")
                password_blocked.Attributes.Add("onclick", "mensajes(4);")

            Else
                oculto2.Value = "1"
                principal.Attributes.Add("onclick", "mensajes(1);")
                password_blocked.Attributes.Add("onclick", "mensajes(2);")
            End If

            apellidos = ape.Split("¦")
            ape = apellidos(0) + " "
            ape += apellidos(1)

            Input_Nombre.Value = nombre + " " + ape
            Input_Email.Value = mail
            Input_Password2.Value = pass

            datos_personales2 = datos_personales.Split("¦")
            vuelito_monte = vuelo_monte.Split("¦")
            radios = radiobuttons.Split("¦")

            For i = 0 To 6
                Select Case i
                    Case 0
                        Input_Puesto.Value = datos_personales2(i)
                    Case 1
                        Input_Negocio.Value = datos_personales2(i)
                    Case 2
                        Input_direccion.Value = datos_personales2(i)
                    Case 3
                        Input_city.Value = datos_personales2(i)
                    Case 4
                        Input_country.Value = datos_personales2(i)
                    Case 5
                        Input_movil.Value = datos_personales2(i)
                    Case 6
                        Input_oficina.Value = datos_personales2(i)
                End Select
            Next

            For i = 0 To 9
                Select Case i
                    Case 0
                        If vuelito_monte(i) Is Nothing Then
                            datetimepicker1.Value = ""
                        Else
                            datetimepicker1.Value = vuelito_monte(i)
                        End If
                    Case 1
                        If vuelito_monte(i) Is Nothing Then
                            datetimepicker2.Value = ""
                        Else
                            datetimepicker2.Value = vuelito_monte(i)
                        End If
                    Case 2
                        If vuelito_monte(i) Is Nothing Then
                            Input_NumeroVuelo.Value = ""
                        Else
                            Input_NumeroVuelo.Value = vuelito_monte(i)
                        End If
                    Case 3
                        If vuelito_monte(i) Is Nothing Then
                            Input_aerolinea.Value = ""
                        Else
                            Input_aerolinea.Value = vuelito_monte(i)
                        End If
                    Case 4
                        If vuelito_monte(i) Is "0" Then
                            datetimepicker3.Value = ""
                        Else
                            datetimepicker3.Value = vuelito_monte(i)
                        End If
                    Case 5
                        If vuelito_monte(i) Is "0" Then
                            datetimepicker4.Value = ""
                        Else
                            datetimepicker4.Value = vuelito_monte(i)
                        End If
                    Case 6
                        If vuelito_monte(i) Is "0" Then
                            Num_Vuelito.Value = ""
                        Else
                            Num_Vuelito.Value = vuelito_monte(i)
                        End If
                    Case 7
                        If vuelito_monte(i) Is "0" Then
                            aerolinea02.Value = ""
                        Else
                            aerolinea02.Value = vuelito_monte(i)
                        End If
                    Case 8
                        If vuelito_monte(i) Is "0" Then
                            datetimepicker5.Value = ""
                        Else
                            datetimepicker5.Value = vuelito_monte(i)
                        End If
                    Case 9
                        If vuelito_monte(i) Is "0" Then
                            datetimepicker6.Value = ""
                        Else
                            datetimepicker6.Value = vuelito_monte(i)
                        End If
                End Select
            Next

            For m = 0 To 6
                Select Case m
                    Case 0
                        If radios(m).Length <> 1 Then
                            If radios(m) = "true" Then
                                Pollo.Checked = True
                            End If
                        End If
                    Case 1
                        If radios(m).Length <> 1 Then
                            If radios(m) = "true" Then
                                Pescado.Checked = True
                            End If
                        End If
                    Case 2
                        If radios(m).Length <> 1 Then
                            If radios(m) = "true" Then
                                no_asiste.Checked = True
                            End If
                        End If
                    Case 3
                        If radios(m).Length <> 1 Then
                            If radios(m) = "true" Then
                                asiste_radio_si.Checked = True
                            End If
                        End If
                    Case 4
                        If radios(m).Length <> 1 Then
                            If radios(m) = "true" Then
                                asiste_radio_no.Checked = True
                            End If
                        End If
                    Case 5
                        If radios(m).Length <> 1 Then
                            If radios(m) = "true" Then
                                radio_sisi.Checked = True
                            End If
                        End If
                    Case 6
                        If radios(m).Length <> 1 Then
                            If radios(m) = "true" Then
                                radio_nono.Checked = True
                            End If
                        End If
                End Select
            Next

        End If



    End Sub

End Class