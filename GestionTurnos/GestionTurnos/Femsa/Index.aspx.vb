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
        idferia = "202"

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
                hotel.InnerText = ""
                warning_hotel2.InnerText = ""
                Fecha_chekin.InnerText = ""
                Fecha_chekout.InnerText = ""





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
                hotel.InnerHtml = "Hosting / Hotel"
                warning_hotel2.InnerHtml = "· The hotel reservation will be made by Karina Flores, please indicate the number of nights required. <br />· Lodging expenses will be settled by the participant upon check-out"
                Fecha_chekin.InnerHtml = "Check-in Date"
                Fecha_chekout.InnerHtml = "Check-out Date"

                Dim nombre As String, ape As String, apellidos() As String, full_name2 As String, pass As String

                VectorSQL(0) = "SELECT Nom,Cognoms, Password FROM EEContactes WHERE Email='" & clsBD.Cometes(Left(mail, 100)) & "'AND idFira ='" & idferia & "'"

                If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                    ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
                Else
                    If DS.Tables(0).Rows.Count > 0 Then
                        For i = 0 To DS.Tables(0).Rows.Count - 1
                            nombre = DS.Tables(0).Rows(i).Item("Nom")
                            ape = DS.Tables(0).Rows(i).Item("Cognoms")
                            pass = DS.Tables(0).Rows(i).Item("Password")
                        Next
                    End If
                End If

                apellidos = ape.Split("¦")
                ape = apellidos(0)
                ape += "" + apellidos(1)

                Input_Nombre.Value = nombre + " " + ape
                Input_Email.Value = mail
                Input_Password2.Value = pass
            End If
        End If



    End Sub

End Class