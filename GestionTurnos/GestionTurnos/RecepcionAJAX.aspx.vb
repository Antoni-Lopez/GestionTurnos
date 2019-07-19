Public Class RecepcionAJAX
    Inherits System.Web.UI.Page

    Dim clsBD As New ClaseAccesoBD
    Dim VectorSQL(0) As String

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim clsBD As New ClaseAccesoBD
        Dim Descripcio As String, Dades As String, Data As String, GuardaAccio As Boolean
        Dim VectorSQL() As String, nuevo As String
        ReDim VectorSQL(0)

        Try
            If Request.Form("c") <> "" And Request.Form("d") <> "" And Request.Form("sid") <> "" Then
                Dim IDFira As Integer
                Dim VDades() As String


                Select Case Request.Form("c")
                    Case 1 'Actualizar delegado en BD.

                        VDades = CStr(Request.Form("d")).Split("¦")

                        'Declaramos las variables que recibimos del formulario anterior
                        Dim IdUser As String, Name As String, Apellidos As String, email As String, numero As String, Region As String, siglas As String
                        Dim Asiste As Integer, Origen As String, Transporte As Integer, Alojamiento As Integer
                        Dim Alergia As String, Observacion As String

                        IdUser = VDades(0)
                        Name = VDades(1)
                        Apellidos = VDades(2) + "¦" + VDades(3)
                        email = VDades(4)
                        numero = VDades(5)
                        siglas = VDades(6) + "¦" + VDades(7)
                        Asiste = VDades(8)
                        Alojamiento = VDades(9)
                        Transporte = VDades(10)
                        Origen = VDades(11)
                        Alergia = VDades(12)
                        Observacion = VDades(13)
                        Region = VDades(14)

                        'Realizamos la consulta, en este caso, la update de la BD.
                        VectorSQL(0) = "UPDATE eecontactes SET Nom = '" & clsBD.Cometes(Left(Name, 100)) & "', Cognoms = '" & clsBD.Cometes(Left(Apellidos, 100)) & "', Email= '" & clsBD.Cometes(Left(email, 100)) & "', Mobil= '" & clsBD.Cometes(Left(numero, 100)) & "', Carrec = '" & clsBD.Cometes(Left(Region, 100)) & "', NIT= '" & clsBD.Cometes(Left(siglas, 100)) & "', idAlta= '" & clsBD.Cometes(Left(Asiste, 100)) & "', idTipusContacte= '" & clsBD.Cometes(Left(Transporte, 100)) & "',Procedencia='" & clsBD.Cometes(Left(Origen, 100)) & "', NickTwitter='" & clsBD.Cometes(Left(Alojamiento, 100)) & "',NickFacebook= '" & clsBD.Cometes(Left(Alergia, 100)) & "',WebPersonal='" & clsBD.Cometes(Left(Observacion, 100)) & "' WHERE Auto = '" & IdUser & "' AND Nom = '" & Name & "'"

                        If Not clsBD.BaseDades(2, VectorSQL) Then
                            'Problema
                            Descripcio = "KO1"
                        Else
                            'Correcto
                            Descripcio = "OK1"
                        End If
                        GoTo Resposta


                    Case 2 'Update medico.
                        Dim Idusuario As Integer, Name As String, Apellidos As String, email As String, especialidad As Integer
                        Dim numero_selas As String, Consentimiento As Integer, Alojamiento As Integer, Transporte As Integer
                        Dim Origen_city As String, Alergia As String, Observa As String
                        Dim Rol As String, Agrupacion As Integer, Rol_Y_Agrupacion() As String


                        VDades = CStr(Request.Form("d")).Split("¦")

                        Idusuario = VDades(0)
                        Name = VDades(1)
                        Apellidos = VDades(2) + "¦" + VDades(3)
                        email = VDades(4)
                        especialidad = VDades(5)
                        numero_selas = VDades(6)
                        Consentimiento = VDades(7)
                        Alojamiento = VDades(8)
                        Transporte = VDades(9)
                        Origen_city = VDades(10)
                        Alergia = VDades(11)
                        Observa = VDades(12)
                        Rol_Y_Agrupacion = Extraer_Agrupacion_Y_Rol(Idusuario).Split("¦")

                        Rol = Rol_Y_Agrupacion(0)
                        Agrupacion = Rol_Y_Agrupacion(1)


                        'Rol = Extraer_Rol(Idusuario)
                        'Agrupacion = Extraer_Agrupacion(Idusuario)

                        VectorSQL(0) = "UPDATE eecontactes SET idContacte = '" & Rol & "', idOrigen='" & Agrupacion & "', idTipusContacte='" & Transporte & "', Nom='" & clsBD.Cometes(Left(Name, 100)) & "', Cognoms='" & clsBD.Cometes(Left(Apellidos, 100)) & "', Email='" & clsBD.Cometes(Left(email, 100)) & "', Procedencia='" & Origen_city & "', SectorInteres='" & numero_selas & "', NickTwitter='" & Alojamiento & "', NickFacebook='" & clsBD.Cometes(Left(Alergia, 100)) & "', WebPersonal='" & clsBD.Cometes(Left(Observa, 100)) & "',Blog='" & especialidad & "',Data='" & Consentimiento & "' WHERE Auto = '" & Idusuario & "'"
                        If Not clsBD.BaseDades(2, VectorSQL) Then
                            'Problema
                            Descripcio = "KO2"
                        Else
                            'Correcto
                            Descripcio = "OK2" + "¦"
                            Descripcio += RellenarSelect(Agrupacion)
                        End If


                        GoTo Resposta

                    Case 3 'Delete Medico
                        Dim Idusuario As Integer, Agrupacion As Integer
                        VDades = CStr(Request.Form("d")).Split("¦")
                        Idusuario = VDades(0)
                        Agrupacion = VDades(1)

                        VectorSQL(0) = "DELETE FROM eecontactes WHERE Auto = '" & Idusuario & "'"
                        If Not clsBD.BaseDades(2, VectorSQL) Then
                            'Problema
                            Descripcio = "KO3"
                        Else
                            'Correcto
                            Descripcio = "OK3" + "¦"
                            Descripcio += RellenarSelect(Agrupacion)
                        End If
                        GoTo Resposta

                    Case 4 'Insert New Medico

                        Dim DS As New DataSet
                        Dim i As Integer, Ultimo As Integer = 0

                        VDades = CStr(Request.Form("d")).Split("¦")

                        Dim Name As String, Apellido As String, email As String, IdFeria As Integer, Mail As String, Especialidad As String, NSelas As String
                        Dim Consentimiento As Integer, Transporte As Integer, Alojamiento As Integer, Alergia As String, Observaciones As String, Password As String
                        Dim Rol As Integer, Agrupacion As Integer, Asiste As Integer, numero As String, Region As String, Origen As String, Nit As Integer, NITactivat As Integer

                        Name = VDades(0)
                        Apellido = VDades(1) + "¦" + VDades(2)
                        Mail = VDades(3)
                        If Buscar_Email(Mail) Then
                            Descripcio = "KO4"
                            GoTo Resposta
                        Else
                            Especialidad = VDades(4)
                            NSelas = VDades(5)
                            Consentimiento = VDades(6)
                            Transporte = VDades(7)
                            Alojamiento = VDades(8)
                            Origen = VDades(9)
                            Alergia = VDades(10)
                            Observaciones = VDades(11)

                            Rol = 1 ' Ponemos el Rol a "Martillo" porque estamos insertando un Medico y siempre va a tener el Rol de Medico.
                            IdFeria = 195 'También lo ponemos a martillo.
                            Agrupacion = VDades(12)

                            numero = 0
                            Password = ""
                            Region = ""
                            Nit = 0
                            Asiste = 0
                            NITactivat = 1

                            VectorSQL(0) = "INSERT INTO eecontactes (idFira, idContacte, idOrigen, idTipusContacte, idAlta, Nom, Cognoms, Mobil, Email, Carrec, Nit, NITactivat, Password, Blog, SectorInteres, Data, NickTwitter, Procedencia, NickFacebook, WebPersonal) " &
                                        "VALUES(" & IdFeria & "," & Rol & "," & Agrupacion & "," & Transporte & "," & Asiste & ",'" & clsBD.Cometes(Left(Name, 100)) & "','" & clsBD.Cometes(Left(Apellido, 100)) & "'," &
                                        "'" & numero & "','" & clsBD.Cometes(Left(Mail, 100)) & "','" & Region & "','" & Nit & "'," & NITactivat & ",'" & clsBD.Cometes(Left(Password, 100)) & "','" & clsBD.Cometes(Left(Especialidad, 100)) & "','" & clsBD.Cometes(Left(NSelas, 100)) & "','" & Consentimiento & "'," &
                                        "" & Alojamiento & ",'" & clsBD.Cometes(Left(Origen, 100)) & "','" & clsBD.Cometes(Left(Alergia, 100)) & "','" & clsBD.Cometes(Left(Observaciones, 100)) & "')"

                            If Not clsBD.BaseDades(2, VectorSQL, , Ultimo) Then
                                'Problema
                                Descripcio = "KO5"
                            Else
                                'La variable Ultimo tendrá el último ID autonumérico
                                Descripcio = "OK4" + "¦"
                                Descripcio += RellenarSelect(Agrupacion)
                            End If
                        End If
                        GoTo Resposta
                    Case 5 'Actualizar el ComboBox/Select 
                        Dim DS As New DataSet
                        Dim UserID As String, Rol As Integer, Agrupa As Integer, Descripcio1 As String, Descripcio2 As String, Descripcio3 As String, Descripcio4 As String, Descripcio5 As String
                        Dim pasar_data As String, prueba As String

                        VDades = CStr(Request.Form("d")).Split("¦")
                        Descripcio = "OK5" + "¦"
                        Descripcio += RellenarSelect(VDades(0))

                        GoTo Resposta
                    Case 6 'Enviar Email a el Delegado
                        'Datos necesarios para el envio de mails.
                        Dim send_mail As New ClaseEmail
                        Dim destinatario As String, Cabecera As String, Cuerpo As String, From As String
                        Dim ServidorSMTP As String, UsuariSMTP As String, PasswordSMTP As String
                        Dim Puerto As Integer, envio As Boolean, FitxerAdjunt As String, nombre As String, Ape1 As String, Rol As Integer, Agrupacion As Integer

                        VDades = CStr(Request.Form("d")).Split("¦")

                        Rol = 1 ' Lo ponemos a martillo porque queremos que nos busque los datos de los medicos solo.
                        Agrupacion = VDades(1)
                        nombre = VDades(2)
                        Ape1 = VDades(3)
                        destinatario = VDades(4)

                        Dim DS As New DataSet

                        'La consulta.
                        VectorSQL(0) = "SELECT Auto , Nom, Cognoms, Email, idOrigen FROM EEContactes WHERE idContacte='" & Rol & "'AND idOrigen ='" & Agrupacion & "'ORDER BY Auto"

                        Cabecera = "Probando Mails de Novonordisk"
                        Cuerpo = "<!DOCTYPE html><html xmlns='http://www.w3.org/1999/xhtml'><head runat='server'><meta http-equiv='Content-Type' content='text/html; charset=utf-8'/>
                                <title></title><asp:literal id='bootstrap_min_css' runat='server'></asp:literal><asp:literal id='jquery_1_9_1_min_js' runat='server'></asp:literal>
                                <asp:literal id='bootstrap_min_js' runat='server'></asp:literal><asp:literal id='bootbox_min_js' runat='server'></asp:literal><style>
                                body{margin: 0;padding: 0;box-sizing:border-box;}.padd{padding:10px;}.principal{max-width:650px;width:100%;border: 2px solid black;height: auto;margin-top: 2%;background-color: #efefef;}
                                .img_logo img{width: 100%;}.contenido{margin-top:2.5%!important;margin:auto;max-width:500px;width:100%;margin-bottom: 2.5% !important;}/* Style para la Tabla*/
                                table{text-align:center;}.header_tabla{background-color: #20032F !important;color:#fff !important;text-align:center;}tr:nth-child(odd) {background-color:#F0174C !important;color: #fff;}
                                tr:nth-child(even) {background-color: #f2f2f2   !important;}/* Media Querys para diseño Responsive.*/@media (max-width: 660px) {
                                .principal{max-width: 450px; width: 100%;}}</style></head><body><div class='container-fluid principal verde'>
                                <div class='row img_logo'><img src='file:///D:/sancheado/GestionTurnos/GestionTurnos/GestionTurnos/GestionTurnos/img/banner_novonordisk.jpg'/></div>
                                <div class='row contenido padd'><h3>Bienvenido " & nombre & " " & Ape1 & " </h3><p> A continuación vamos a detallarle los datos de los medicos<br />
                                que usted tiene a su cargo:</p><table class='table table-responsive table-striped'><thead><tr class='header_tabla'><th class='header_tabla'>Nombre</th>
                                <th class='header_tabla'>Apellidos</th><th class='header_tabla'>Email</th></tr></thead><tbody>"

                        If clsBD.BaseDades(1, VectorSQL, DS) Then
                            If DS.Tables(0).Rows.Count > 0 Then
                                For i = 0 To DS.Tables(0).Rows.Count - 1
                                    'Nombre_medic = DS.Tables(0).Rows(i).Item("Nom")
                                    'Apellidos_medics = DS.Tables(0).Rows(i).Item("Cognoms").Replace("¦", " ")
                                    'Mail_medic = DS.Tables(0).Rows(i).Item("Email")
                                    Cuerpo += "<tr><td>" & DS.Tables(0).Rows(i).Item("Nom") & "</td><td>" & DS.Tables(0).Rows(i).Item("Cognoms").Replace("¦", " ") & "</td><td>" & DS.Tables(0).Rows(i).Item("Email") & "</td></tr>"
                                Next
                            End If
                        End If

                        Cuerpo += "</tbody></table></div></div></body></html>"

                        From = "administrator@novonordisk.com"
                        ServidorSMTP = "smtp.towerplane.com"
                        UsuariSMTP = "jsmateo@towerplane.com"
                        PasswordSMTP = "yjiumnvpgD"
                        Puerto = "25"
                        FitxerAdjunt = ""

                        envio = send_mail.EnviarEmail_System_Web_Mail_BO(destinatario, From, Cabecera, Cuerpo, , ServidorSMTP,, UsuariSMTP, PasswordSMTP,,,,,)
                        If envio Then
                            Descripcio = "KO6"
                        Else
                            Descripcio = "OK6"
                        End If
                        GoTo Resposta
                    Case 7 'Siguiente proyecto PORCELANOSA.
                        Dim DS As New DataSet
                        Dim i As Integer, j As Integer, long_dades As String, idusuario As Integer, chk As String, id_chk As String, chk2 As String, guardar As String, caso As Integer
                        Dim idenlace As Integer, iduser As Integer, idsesiones As String, activo As String, user_esta As Boolean

                        VDades = CStr(Request.Form("d")).Split("¦")
                        long_dades = VDades.Length
                        idusuario = VDades(0)
                        guardar = ""

                        '1º comprobamos si el usuario esta en la tabla enlace que es la que lo relaciona todo.
                        VectorSQL(0) = "SELECT idenlace , idusuario, idsesiones FROM enlace WHERE idusuario = '" & idusuario & "'"

                        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                            'Problema.
                        Else
                            If DS.Tables(0).Rows.Count > 0 Then 'Como si lo encontramos, almacenamos los datos que ya tenia.
                                For j = 0 To DS.Tables(0).Rows.Count - 1
                                    idenlace = DS.Tables(0).Rows(j).Item("idenlace")
                                    iduser = DS.Tables(0).Rows(j).Item("idusuario")
                                    idsesiones = DS.Tables(0).Rows(j).Item("idsesiones")
                                Next
                                user_esta = True
                            Else
                                'No encontramos al user en la tabla enlaces, por ello, insertamos un nuevo registro en la BD, en la tabla enlace para poder relacionarlo todo.
                                user_esta = False
                            End If
                        End If

                        '2º Si "user_esta" es true el usuario esta 
                        If user_esta Then
                            If comprobar_sesiones_usuario(idusuario) Then 'Comprobamos si el usuario tenia algún chk marcado o no. True si / False no
                                For i = 1 To long_dades - 1
                                    chk = VDades(i)
                                    id_chk = chk.Replace("chk", " ")
                                    If Comprobar_aforo(id_chk) Then 'Sí es true, tenemos plaza para inscribir a la people y sumamos 1 a dicha sesion.
                                        If i = long_dades - 1 Then
                                            guardar += id_chk 'Como es el ultimo chk a almacenar, lo guardamos tal cual, sin el ¦
                                        Else
                                            guardar += id_chk + "¦" 'Almacenamos los chk marcados para almazenarlos en la BD.
                                            'caso = 1
                                        End If
                                    Else
                                        GoTo Resposta 'Terminamos la ejecución porque no quedan plazas y aun asi hemos elegido un chk.
                                    End If
                                Next

                                'Una vez terminada comprobacion de plazas, hemos sumado 1 a la sesion que ha marcado el usuario. procedemos a guardar la seleccion del user en la tabla enlace.
                                VectorSQL(0) = "UPDATE enlace SET idsesiones = '" & guardar & "',idusuario='" & idusuario & "',idenlace='" & idenlace & "' WHERE idusuario = '" & idusuario & "'"

                                If Not clsBD.BaseDades(2, VectorSQL) Then
                                    'Problema
                                    Descripcio = "KO7"
                                    GoTo Resposta
                                Else
                                    'Correcto
                                    Descripcio = "OK7"
                                    GoTo Resposta
                                End If

                            Else 'User no tenia ningún chk marcado. Almacenamos los que nos ha marcado
                                For i = 1 To long_dades - 1
                                    chk = VDades(i)
                                    id_chk = chk.Replace("chk", " ")
                                    If Comprobar_aforo(id_chk) Then 'Sí es true, tenemos plaza para inscribir a la people y sumamos 1 a dicha sesion.
                                        If i = long_dades - 1 Then
                                            guardar += id_chk 'Como es el ultimo chk a almacenar, lo guardamos tal cual, sin el ¦
                                        Else
                                            guardar += id_chk + "¦" 'Almacenamos los chk marcados para almazenarlos en la BD.
                                            'caso = 1
                                        End If
                                    Else 'No quedan plazas para inscribir a mas personas en esa sesion, terminamos ejecución.
                                        GoTo Resposta
                                    End If
                                Next

                                'Una vez echo todas las comprobaciones, guardamos mediante un UPDATE los valores marcados.
                                VectorSQL(0) = "UPDATE enlace SET idsesiones = '" & guardar & "',idusuario='" & idusuario & "',idenlace='" & idenlace & "' WHERE idusuario = '" & idusuario & "'"

                                If Not clsBD.BaseDades(2, VectorSQL) Then
                                    'Problema
                                    Descripcio = "KO7"
                                    GoTo Resposta
                                Else
                                    'Correcto
                                    Descripcio = "OK7"
                                    GoTo Resposta
                                End If
                            End If
                        Else 'Como el usuario, no existe en la tabla enlace, nos disponemos a crearlo.
                            Dim activ As String, ultimo As Integer
                            activ = ""

                            For i = 1 To long_dades - 1
                                chk = VDades(i)
                                id_chk = chk.Replace("chk", " ")
                                If Comprobar_aforo(id_chk) Then 'Sí es true, tenemos plaza para inscribir a la people y sumamos 1 a dicha sesion.
                                    If i = long_dades - 1 Then
                                        guardar += id_chk 'Como es el ultimo chk a almacenar, lo guardamos tal cual, sin el ¦
                                    Else
                                        guardar += id_chk + "¦" 'Almacenamos los chk marcados para almazenarlos en la BD.
                                        'caso = 1
                                    End If
                                Else 'No quedan plazas para inscribir a mas personas en esa sesion, terminamos ejecución.
                                    GoTo Resposta
                                End If
                            Next



                            VectorSQL(0) = "INSERT INTO enlace(idusuario,idsesiones,disponible)" &
                                        "VALUES('" & clsBD.Cometes(Left(idusuario, 100)) & "','" & clsBD.Cometes(Left(guardar, 100)) & "','" & clsBD.Cometes(Left(activ, 100)) & "')"

                            If Not clsBD.BaseDades(2, VectorSQL, , ultimo) Then
                                'Problema
                                Descripcio = "KO8"
                                GoTo Resposta
                            Else
                                'La variable Ultimo tendrá el último ID autonumérico
                                Descripcio = "OK8"
                                GoTo Resposta
                            End If
                        End If

                    Case 8 'Prueba mia para aplicar el particles.js y el efecto loading.
                        Dim DS As New DataSet
                        Dim email As String, email_BD As String, Pass As String, Pass_BD As String, nombre As String

                        VDades = CStr(Request.Form("d")).Split("¦")

                        email = VDades(0)
                        Pass = VDades(1)

                        VectorSQL(0) = "SELECT Email,Password,Nom FROM eecontactes WHERE Email='" & clsBD.Cometes(Left(email, 100)) & "' AND Password='" & clsBD.Cometes(Left(Pass, 100)) & "'"

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
                            Descripcio = "OK9" + "¦" + nombre
                            GoTo Resposta
                        Else
                            Descripcio = "KO9"
                            GoTo Resposta
                        End If

                    Case 9 ' Nuevo proyecto AOTEC
                        Dim Ds As New DataSet
                        Dim email As String, chk As String, long_dades As String, actualizar As String, idFeria As String, i As Integer

                        VDades = CStr(Request.Form("d")).Split("¦")
                        long_dades = VDades.Length



                        email = VDades(0)
                        idFeria = "201"
                        actualizar = ""

                        For i = 1 To 6
                            chk = VDades(i)

                            If i = 5 Then
                                actualizar += chk
                                GoTo Continuamos
                            Else
                                actualizar += chk + "¦"
                            End If
                        Next

Continuamos:

                        'Una vez echo todas las comprobaciones, guardamos mediante un UPDATE los valores marcados.
                        VectorSQL(0) = "UPDATE eecontactes SET Procedencia = '" & actualizar & "' WHERE Email = '" & email & "'and idFira='" & idFeria & "'"

                        If Not clsBD.BaseDades(2, VectorSQL) Then
                            'Problema
                            Descripcio = "KO9"
                            GoTo Resposta
                        Else
                            'Correcto

                            Dim datos_bd As String

                            datos_bd = ""

                            For p = 6 To UBound(VDades)
                                If p = VDades.Length - 1 Then
                                    datos_bd += VDades(p)
                                Else
                                    datos_bd += VDades(p) + "¦"
                                End If
                            Next

                            Dim volumen_total As String, limite As String

                            volumen_total = datos_bd.Length
                            limite = 400


                            If volumen_total > limite Then
                                ClientScript.RegisterStartupScript(Page.GetType(), "excedemos_consulta", "LanzaAviso('Error la consulta SQL superá los 1500 caracteres y no se puede guardar en la BD.')", True)
                                Descripcio = "KO9"
                                GoTo Resposta
                            Else
                                'Procedemos a actulizar los datos mediante un UPDATE de los valores marcados por el usuario.
                                VectorSQL(0) = "UPDATE eecontactes SET SectorInteres = '" & datos_bd & "' WHERE Email = '" & email & "'and idFira='" & idFeria & "'"
                            End If

                            If Not clsBD.BaseDades(2, VectorSQL) Then
                                'Problema
                                Descripcio = "KO9"
                                GoTo Resposta
                            Else 'Correcto
                                Descripcio = "OK9"
                                GoTo Resposta
                            End If
                        End If

                    Case 10 'Rellenar los inputs con los datos de la BD al seleccionar cualquier proveedor.
                        Dim Ds As New DataSet, email As String, datos As String, datos_bd As String, long_datosbd As String
                        Dim mostrar As String, idferia As Integer, i As Integer, MiVector() As String
                        Dim canales As String, precio As String

                        VDades = CStr(Request.Form("d")).Split("¦")

                        email = VDades(0)
                        datos = VDades(1)
                        idferia = "201"

                        VectorSQL(0) = "SELECT WebPersonal FROM eecontactes  WHERE Email = '" & email & "'and idFira='" & idferia & "'"

                        If Not clsBD.BaseDades(1, VectorSQL, Ds) Then
                            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
                        Else
                            If Ds.Tables(0).Rows.Count > 0 Then
                                For i = 0 To Ds.Tables(0).Rows.Count - 1
                                    datos_bd = Ds.Tables(0).Rows(i).Item("WebPersonal")
                                Next
                            End If
                        End If

                        MiVector = datos_bd.Split("¦")
                        long_datosbd = MiVector.Length

                        For i = 0 To UBound(MiVector)
                            long_datosbd = MiVector(i)
                            If long_datosbd = datos Then

                                Descripcio = "OK10"
                                canales = MiVector(i + 1)
                                precio = MiVector(i + 2)
                                Descripcio = Descripcio + "¦" + long_datosbd + "¦" + canales + "¦" + precio

                                GoTo Resposta
                            End If
                            i += "2"
                        Next

                    Case 11 'Guardar nuevo proveedor.
                        Dim Ds As New DataSet, email As String, idferia As String, nombre As String, numero As String, precio As String, datos_BD As String, MiArray() As String, mi_comprobar As String

                        VDades = CStr(Request.Form("d")).Split("¦")
                        idferia = "201"

                        email = VDades(0)
                        nombre = VDades(1)
                        numero = VDades(2)
                        precio = VDades(3)

                        VectorSQL(0) = "SELECT WebPersonal FROM eecontactes  WHERE Email = '" & email & "'and idFira='" & idferia & "'"
                        If Not clsBD.BaseDades(1, VectorSQL, Ds) Then
                            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
                        Else
                            If Ds.Tables(0).Rows.Count > 0 Then
                                For i = 0 To Ds.Tables(0).Rows.Count - 1
                                    datos_BD = Ds.Tables(0).Rows(i).Item("WebPersonal")
                                Next
                            End If
                        End If

                        MiArray = datos_BD.Split("¦")

                        mi_comprobar = MiArray(0)
                        If mi_comprobar = "0" Then
                            datos_BD = nombre + "¦" + numero + "¦" + precio
                        Else
                            datos_BD += "¦" + nombre + "¦" + numero + "¦" + precio
                        End If




                        Ds.Reset()

                        'Una vez echo todas las comprobaciones, guardamos mediante un UPDATE los valores marcados.
                        VectorSQL(0) = "UPDATE eecontactes SET WebPersonal = '" & datos_BD & "' WHERE Email = '" & email & "'and idFira='" & idferia & "'"

                        If Not clsBD.BaseDades(2, VectorSQL) Then
                            'Problema
                            Descripcio = "KO11" + "¦" + nombre
                            GoTo Resposta
                        Else
                            'Correcto
                            Descripcio = "OK11" + "¦" + nombre
                            GoTo Resposta
                        End If

                    Case 12 'Envio de Mail de Femsa.
                        'Datos necesarios para el envio de mails.
                        Dim send_mail As New ClaseEmail
                        Dim destinatario As String, Cabecera As String, Cuerpo As String, From As String
                        Dim ServidorSMTP As String, UsuariSMTP As String, PasswordSMTP As String
                        Dim Puerto As Integer, envio As Boolean, FitxerAdjunt As String, nombre As String, Ape1 As String, Rol As Integer, Agrupacion As Integer

                        VDades = CStr(Request.Form("d")).Split("¦")

                        Rol = 1 ' Lo ponemos a martillo porque queremos que nos busque los datos de los medicos solo.
                        Agrupacion = VDades(1)
                        nombre = VDades(2)
                        Ape1 = VDades(3)
                        destinatario = VDades(4)

                        Dim DS As New DataSet

                        'La consulta.
                        VectorSQL(0) = "SELECT Auto , Nom, Cognoms, Email, idOrigen FROM EEContactes WHERE idContacte='" & Rol & "'AND idOrigen ='" & Agrupacion & "'ORDER BY Auto"

                        Cabecera = "Probando Mails de Novonordisk"
                        Cuerpo = "<!DOCTYPE html><html xmlns='http://www.w3.org/1999/xhtml'><head runat='server'><meta http-equiv='Content-Type' content='text/html; charset=utf-8'/>
                                <title></title><asp:literal id='bootstrap_min_css' runat='server'></asp:literal><asp:literal id='jquery_1_9_1_min_js' runat='server'></asp:literal>
                                <asp:literal id='bootstrap_min_js' runat='server'></asp:literal><asp:literal id='bootbox_min_js' runat='server'></asp:literal><style>
                                body{margin: 0;padding: 0;box-sizing:border-box;}.padd{padding:10px;}.principal{max-width:650px;width:100%;border: 2px solid black;height: auto;margin-top: 2%;background-color: #efefef;}
                                .img_logo img{width: 100%;}.contenido{margin-top:2.5%!important;margin:auto;max-width:500px;width:100%;margin-bottom: 2.5% !important;}/* Style para la Tabla*/
                                table{text-align:center;}.header_tabla{background-color: #20032F !important;color:#fff !important;text-align:center;}tr:nth-child(odd) {background-color:#F0174C !important;color: #fff;}
                                tr:nth-child(even) {background-color: #f2f2f2   !important;}/* Media Querys para diseño Responsive.*/@media (max-width: 660px) {
                                .principal{max-width: 450px; width: 100%;}}</style></head><body><div class='container-fluid principal verde'>
                                <div class='row img_logo'><img src='file:///D:/sancheado/GestionTurnos/GestionTurnos/GestionTurnos/GestionTurnos/img/banner_novonordisk.jpg'/></div>
                                <div class='row contenido padd'><h3>Bienvenido " & nombre & " " & Ape1 & " </h3><p> A continuación vamos a detallarle los datos de los medicos<br />
                                que usted tiene a su cargo:</p><table class='table table-responsive table-striped'><thead><tr class='header_tabla'><th class='header_tabla'>Nombre</th>
                                <th class='header_tabla'>Apellidos</th><th class='header_tabla'>Email</th></tr></thead><tbody>"

                        If clsBD.BaseDades(1, VectorSQL, DS) Then
                            If DS.Tables(0).Rows.Count > 0 Then
                                For i = 0 To DS.Tables(0).Rows.Count - 1
                                    'Nombre_medic = DS.Tables(0).Rows(i).Item("Nom")
                                    'Apellidos_medics = DS.Tables(0).Rows(i).Item("Cognoms").Replace("¦", " ")
                                    'Mail_medic = DS.Tables(0).Rows(i).Item("Email")
                                    Cuerpo += "<tr><td>" & DS.Tables(0).Rows(i).Item("Nom") & "</td><td>" & DS.Tables(0).Rows(i).Item("Cognoms").Replace("¦", " ") & "</td><td>" & DS.Tables(0).Rows(i).Item("Email") & "</td></tr>"
                                Next
                            End If
                        End If

                        Cuerpo += "</tbody></table></div></div></body></html>"

                        From = "administrator@novonordisk.com"
                        ServidorSMTP = "smtp.towerplane.com"
                        UsuariSMTP = "jsmateo@towerplane.com"
                        PasswordSMTP = "yjiumnvpgD"
                        Puerto = "25"
                        FitxerAdjunt = ""

                        envio = send_mail.EnviarEmail_System_Web_Mail_BO(destinatario, From, Cabecera, Cuerpo, , ServidorSMTP,, UsuariSMTP, PasswordSMTP,,,,,)
                        If envio Then
                            Descripcio = "KO6"
                        Else
                            Descripcio = "OK6"
                        End If
                        GoTo Resposta

                    Case 13 'Guardar datos en Bd FEMSA

                        VDades = CStr(Request.Form("d")).Split("¦")

                        Dim puesto As String, negocio As String, direccion As String, city As String, country As String, movil As String, oficina As String, email As String, idferia As String
                        Dim h_salida As String, h_llegada As String, nVuelo As String, aerolinea As String, total2 As String
                        Dim h_salida2 As String, h_llegada2 As String, nVuelo2 As String, aerolinea2 As String
                        Dim h_salid3 As String, h_llegada3 As String

                        For i = 0 To 17
                            Select Case i
                                Case 0
                                    email = VDades(i)
                                Case 1
                                    puesto = VDades(i)
                                Case 2
                                    negocio = VDades(i)
                                Case 3
                                    direccion = VDades(i)
                                Case 4
                                    city = VDades(i)
                                Case 5
                                    country = VDades(i)
                                Case 6
                                    movil = VDades(i)
                                Case 7
                                    oficina = VDades(i)
                                Case 8
                                    h_salida = VDades(i)
                                Case 9
                                    h_llegada = VDades(i)
                                Case 10
                                    nVuelo = VDades(i)
                                Case 11
                                    aerolinea = VDades(i)
                                Case 12
                                    h_salida2 = VDades(i)
                                Case 13
                                    h_llegada2 = VDades(i)
                                Case 14
                                    nVuelo2 = VDades(i)
                                Case 15
                                    aerolinea2 = VDades(i)
                                Case 16
                                    h_salid3 = VDades(i)
                                Case 17
                                    h_llegada3 = VDades(i)

                            End Select
                        Next

                        Dim total As String

                        total = puesto + "¦" + negocio + "¦" + direccion + "¦" + city + "¦" + country + "¦" + movil + "¦" + oficina
                        total2 = h_salida + "¦" + h_llegada + "¦" + nVuelo + "¦" + aerolinea + "¦" + h_salida2 + "¦" + h_llegada2 + "¦" + nVuelo2 + "¦" + aerolinea2 + "¦" + h_salid3 + "¦" + h_llegada3
                        Dim Ds As New DataSet

                        idferia = "202"

                        'Una vez echo todas las comprobaciones, guardamos mediante un UPDATE los valores marcados.
                        VectorSQL(0) = "UPDATE eecontactes SET NickTwitter = '" & total & "' WHERE Email = '" & email & "'and idFira='" & idferia & "'"

                        If Not clsBD.BaseDades(2, VectorSQL) Then
                            'Problema
                            Descripcio = "KO13"
                            GoTo Resposta
                        Else
                            'Correcto
                            'Descripcio = "OK13"
                            'GoTo Resposta
                        End If

                        Ds.Reset()

                        VectorSQL(0) = "UPDATE eecontactes SET NickFacebook = '" & total2 & "' WHERE Email = '" & email & "'and idFira='" & idferia & "'"

                        If Not clsBD.BaseDades(2, VectorSQL) Then
                            'Problema
                            Descripcio = "KO13"
                            GoTo Resposta
                        Else
                            'Correcto
                            Descripcio = "OK13"
                            GoTo Resposta
                        End If


                End Select
            End If
        Catch ex As Exception
            Descripcio = "KO0_Problema verificando la información. Error: " & ex.Message
            GuardaAccio = True
            GoTo Resposta
        End Try
        Exit Sub



Resposta:
        Response.Write(Descripcio)
        If GuardaAccio Then
            Data = Year(Now) & Format(Month(Now), "0#") & Format(Day(Now), "0#") & Format(Hour(Now), "0#") & Format(Minute(Now), "0#") & Format(Second(Now), "0#")
            ReDim Preserve VectorSQL(0)
            VectorSQL(0) = "INSERT INTO Problemes(IDUsuari,NumeroSistema,MissatgeSistema,Info1,Info2,Data) VALUES(100,0,'','','Problema executant Page_Load de la plana RecepcionAJAX.aspx per a EntradaE. Les dades eren: VectorSQL(0): " & clsBD.Cometes(VectorSQL(0)) & ", Problema: " & clsBD.Cometes(Descripcio) & ", c: " & clsBD.Cometes(Request.Form("c")) & ", d: " & clsBD.Cometes(Request.Form("d")) & "','" & Data & "')"
            clsBD.BaseDades(2, VectorSQL)
        End If
    End Sub

    Private Function Extraer_Agrupacion_Y_Rol(ByVal IdUser)
        Dim DS As New DataSet
        Dim Agrupacion As String, Rol As String, Rol_Y_Agrupacion As String, prueba As Integer, cosas_mias As String
        VectorSQL(0) = "SELECT idContacte, idOrigen FROM EEContactes WHERE Auto ='" & clsBD.Cometes(Left(IdUser, 100)) & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            'Problema
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    Rol = DS.Tables(0).Rows(i).Item("idContacte")
                    Agrupacion = DS.Tables(0).Rows(i).Item("idOrigen")
                Next
                Rol_Y_Agrupacion = Rol + "¦" + Agrupacion
            Else
                'No nos devuelve valores
            End If
        End If
        Return Rol_Y_Agrupacion
    End Function

    Private Function Buscar_Email(ByVal email)
        Dim DS As New DataSet
        Dim Dato1 As String

        VectorSQL(0) = "SELECT Email FROM EEContactes WHERE Email ='" & clsBD.Cometes(Left(email, 100)) & "'"
        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            'Problema
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    Dato1 = DS.Tables(0).Rows(i).Item("Email")
                Next
                Return True
            Else
                'No nos devuelve valores
                Return False
            End If
        End If
    End Function

    Private Function Ingresar_Chk(ByRef idusuario, ByVal chk)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String, aforo As String, ins As String, Descripcio As String
        DS = New DataSet

        VectorSQL(0) = "UPDATE enlace SET idsesiones='" & chk & "' WHERE idusuario = '" & idusuario & "'"
        If Not clsBD.BaseDades(2, VectorSQL) Then
            'Problema
            Descripcio = "KO12"
            Return False
        Else
            'Correcto
            'Descripcio = "OK12"
            Ingresar_Chk_enlace(idusuario, chk)
        End If
        Return True
    End Function

    Private Function Comprobar_aforo(ByRef idsesion)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String
        DS = New DataSet

        Dim aforo As String, ins As String, Rol As Integer, Descripcion As String, hora As String, evento As Integer, fecha_inicio As String, fecha_fin As String, idsesiones As Integer

        VectorSQL(0) = "SELECT idsesiones,evento,fecha_inicio,fecha_fin,hora,Descripción,Aforo,Rol,inscritos FROM sesiones WHERE idsesiones='" & clsBD.Cometes(Left(idsesion, 100)) & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "aforo_full", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    idsesiones = DS.Tables(0).Rows(i).Item("idsesiones")
                    evento = DS.Tables(0).Rows(i).Item("evento")
                    fecha_inicio = DS.Tables(0).Rows(i).Item("fecha_inicio")
                    fecha_fin = DS.Tables(0).Rows(i).Item("fecha_fin")
                    hora = DS.Tables(0).Rows(i).Item("hora")
                    Descripcion = DS.Tables(0).Rows(i).Item("Descripción")
                    aforo = DS.Tables(0).Rows(i).Item("Aforo")
                    Rol = DS.Tables(0).Rows(i).Item("Rol")
                    ins = DS.Tables(0).Rows(i).Item("inscritos")
                Next

                If aforo < ins Then
                    ClientScript.RegisterStartupScript(Page.GetType(), "aforo_lleno", "LanzaAviso('Lo sentimos pero el aforo ya esta lleno.')", True)
                    Return False
                Else ' Como si queda aforo. Ahora deberiamos de comprobar 

                    'le sumamos 1 a los inscritos y actualizamos la BD de sesiones.
                    ins += 1
                    VectorSQL(0) = "UPDATE sesiones SET evento = '" & evento & "',fecha_inicio='" & fecha_inicio & "',fecha_fin='" & fecha_fin & "',hora='" & hora & "',Descripción='" & Descripcion & "',aforo='" & aforo & "',Rol='" & Rol & "',inscritos='" & ins & "' WHERE idsesiones = '" & idsesiones & "'"

                    If Not clsBD.BaseDades(2, VectorSQL) Then
                        'Problema
                        Return False
                    Else
                        'Correcto
                        Return True
                    End If
                End If
                'Else
                '    Return False
            End If
        End If

    End Function

    Private Function comprobar_sesiones_usuario(ByRef idusuario As String)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String
        DS = New DataSet

        Dim idsesiones As String, long_idsesion As Integer, sesiones_separadas() As String, var_restar As String

        'Para decidir que hacemos primero consultamos en la BD si el usuario tenia algun chk seleccionado o no.
        'La consulta
        VectorSQL(0) = "SELECT idusuario,idsesiones FROM enlace WHERE idusuario='" & clsBD.Cometes(Left(idusuario, 100)) & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "fail_Bd", "LanzaAviso('Error al buscar los datos en la BD. Intentelo de nuevo. Gracias!')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    idsesiones = Convert.ToString(DS.Tables(0).Rows(0).Item("idsesiones")) 'Aquí ya tenemos las opciones seleccionadas por el usuario si tenia.
                Next

                sesiones_separadas = idsesiones.Split("¦")

                long_idsesion = sesiones_separadas.Length

                'Ahora comprobamos si el usuario tenia marcado algo o no.
                If long_idsesion = 0 Then
                    'Como el usuario no tenía ninguna selección, no hace falta que restemos 1 a los inscritos.
                    Return False
                Else
                    'Aqui estamos en el caso de, que el usuario si tiene seleccionados.
                    'Por ello procedemos a restar 1 al campo incremento de la tabla sesiones, filtrado por el chk q previamente tenia el user
                    For x = 0 To UBound(sesiones_separadas) 'Separamos el array que nos vendra tal que así (1,3,8)
                        var_restar = sesiones_separadas(x)
                        restar_incremento(var_restar)
                    Next
                    Return True
                End If
            Else
                Return False
            End If
        End If
    End Function

    Private Function restar_incremento(ByRef chk)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String
        DS = New DataSet

        Dim aforo As String, ins As String, Rol As Integer, Descripcion As String, hora As String, evento As Integer, fecha_inicio As String, fecha_fin As String, idsesiones As Integer

        VectorSQL(0) = "SELECT idsesiones,evento,fecha_inicio,fecha_fin,hora,Descripción,Aforo,Rol,inscritos FROM sesiones WHERE idsesiones='" & clsBD.Cometes(Left(chk, 100)) & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            ClientScript.RegisterStartupScript(Page.GetType(), "aforo_full", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    idsesiones = DS.Tables(0).Rows(i).Item("idsesiones")
                    evento = DS.Tables(0).Rows(i).Item("evento")
                    fecha_inicio = DS.Tables(0).Rows(i).Item("fecha_inicio")
                    fecha_fin = DS.Tables(0).Rows(i).Item("fecha_fin")
                    hora = DS.Tables(0).Rows(i).Item("hora")
                    Descripcion = DS.Tables(0).Rows(i).Item("Descripción")
                    aforo = DS.Tables(0).Rows(i).Item("Aforo")
                    Rol = DS.Tables(0).Rows(i).Item("Rol")
                    ins = DS.Tables(0).Rows(i).Item("inscritos")

                    If ins > 0 Then
                        'le restamos 1 a los inscritos y actualizamos la BD de sesiones.
                        ins -= 1
                        Exit For
                    End If
                Next
            End If
        End If

        'La consulta para actualizar el nuevo valor de los inscritos.
        VectorSQL(0) = "UPDATE sesiones SET evento = '" & evento & "',fecha_inicio='" & fecha_inicio & "',fecha_fin='" & fecha_fin & "',hora='" & hora & "',Descripción='" & Descripcion & "',aforo='" & aforo & "',Rol='" & Rol & "',inscritos='" & ins & "' WHERE idsesiones = '" & idsesiones & "'"

        If Not clsBD.BaseDades(2, VectorSQL) Then
            'Problema
            Return False
        Else
            'Correcto
            Return True
        End If
    End Function



    Private Function Ingresar_Chk_enlace(ByRef idusuario, ByVal sesion)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String, aforo As String, ins As String
        DS = New DataSet

        'VectorSQL(0) = "INSERT INTO eecontactes (idFira, idContacte, idOrigen, idTipusContacte, idAlta, Nom, Cognoms, Mobil, Email, Carrec, Nit, NITactivat, Password, Blog, SectorInteres, Data, NickTwitter, Procedencia, NickFacebook, WebPersonal) " &
        '                "VALUES(" & idFeria & "," & Rol & "," & Agrupacion & "," & Transporte & "," & Asiste & ",'" & clsBD.Cometes(Left(Name, 100)) & "','" & clsBD.Cometes(Left(Apellido, 100)) & "'," &
        '                "'" & numero & "','" & clsBD.Cometes(Left(Mail, 100)) & "','" & Region & "','" & Nit & "'," & NITactivat & ",'" & clsBD.Cometes(Left(Password, 100)) & "','" & clsBD.Cometes(Left(Especialidad, 100)) & "','" & clsBD.Cometes(Left(NSelas, 100)) & "','" & Consentimiento & "'," &
        '                "" & Alojamiento & ",'" & clsBD.Cometes(Left(Origen, 100)) & "','" & clsBD.Cometes(Left(Alergia, 100)) & "','" & clsBD.Cometes(Left(Observaciones, 100)) & "')"
    End Function


    Private Function RellenarSelect(ByRef VDades)
        Dim clsBD As New ClaseAccesoBD
        Dim VectorSQL(0) As String
        Dim DS As New DataSet
        Dim UserID As String, Rol As Integer, Agrupa As Integer, Descripcio1 As String, Descripcio2 As String, Descripcio3 As String, Descripcio4 As String, Descripcio5 As String
        Dim Descripcio As String, VDatos As String


        Rol = 1 ' Lo ponemos a "martillo" porque vamos a mostrar todos los medicos asociados a un delegado, por ello, el rol que buscamos es solo de medicos ó =1
        Agrupa = VDades

        VectorSQL(0) = "SELECT Auto , Nom, Cognoms, idOrigen FROM EEContactes WHERE idContacte='" & Rol & "'AND idOrigen ='" & Agrupa & "'ORDER BY Cognoms, Nom"
        If clsBD.BaseDades(1, VectorSQL, DS) Then
            If DS.Tables(0).Rows.Count > 0 Then
                'Descripcio1 = "OK5"
                'Descripcio5 = Descripcio1 + "¦"

                For i = 0 To DS.Tables(0).Rows.Count - 1
                    Descripcio2 = DS.Tables(0).Rows(i).Item("Auto")
                    Descripcio3 = DS.Tables(0).Rows(i).Item("Cognoms").Replace("¦", " ")
                    Descripcio4 = DS.Tables(0).Rows(i).Item("Nom")
                    'UserID = DS.Tables(0).Rows(i).Item("Auto")
                    'soflow.Items.Add(New ListItem(DS.Tables(0).Rows(i).Item("Cognoms").Replace("¦", " ") & ", " & DS.Tables(0).Rows(i).Item("Nom"), UserID))
                    If i = DS.Tables(0).Rows.Count - 1 Then
                        Descripcio5 += Descripcio2 + "¦" + Descripcio3 + "¦" + Descripcio4
                    Else
                        Descripcio5 += Descripcio2 + "¦" + Descripcio3 + "¦" + Descripcio4 + "¦"
                    End If

                Next
            End If
            Descripcio = Descripcio5
        End If
        Return Descripcio
    End Function

End Class