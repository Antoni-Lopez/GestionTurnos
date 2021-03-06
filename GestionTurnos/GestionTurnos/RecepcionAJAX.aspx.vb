﻿Public Class RecepcionAJAX
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
                        destinatario = "jsmateo@towerplane.com" 'VDades(4)

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
                        PasswordSMTP = "Rp8qHKdTxc" '"yjiumnvpgD"
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
                        Dim Puerto As Integer, envio As Boolean, FitxerAdjunt As String
                        Dim estado_envio As String, estado_envio_BD As String

                        Dim nombre As String, Apellido As String, idFeria As Integer, pass As String, name_qr As String

                        VDades = CStr(Request.Form("d")).Split("¦")

                        ' Ponemos los datos a martillo.
                        'destinatario = "Sanchez069@gmail.com" ' esto es el mail de la persona que se lo vamos a enviar.
                        'destinatario = "jsmateo@towerplane.com" ' esto es el mail de la persona que se lo vamos a enviar.
                        idFeria = VDades(0)
                        estado_envio = "false"

                        Dim DS As New DataSet

                        'La consulta.
                        VectorSQL(0) = "SELECT Procedencia , Password, Carrec, Email FROM EEContactes WHERE idFira='" & idFeria & "'AND  Carrec='" & estado_envio & "'"

                        If clsBD.BaseDades(1, VectorSQL, DS) Then
                            Dim almacenar_DS As String

                            almacenar_DS = DS.Tables(0).Rows.Count
                            If almacenar_DS > 0 Then
                                For i = 0 To almacenar_DS - 1

                                    pass = DS.Tables(0).Rows(i).Item("Password")
                                    name_qr = DS.Tables(0).Rows(i).Item("Procedencia")
                                    estado_envio_BD = DS.Tables(0).Rows(i).Item("Carrec")
                                    destinatario = DS.Tables(0).Rows(i).Item("Email")

                                    Dim separar_qr As String

                                    separar_qr = name_qr.Replace(".jpg", "")


                                    If estado_envio_BD = "false" Then
                                        Cabecera = "Test Mailing Jose"

                                        Cuerpo = "<!DOCTYPE html PUBLIC ' -// W3C // DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'><html xmlns='http://www.w3.org/1999/xhtml'><head><meta http-equiv='Content-Type' content='text/html; charset=windows-1252'>
                                                  <title>ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA</title></head><body><style>body {background: #eeeeee;font-weight: normal;font-family: 'Open Sans', Arial, Helvetica, sans-serif;line-height: 20px;}
                                                  .Taula1 { background-color: #ffffff;border-collapse: collapse;}.TipusTD1, .TipusTD2, .TipusTD3 {padding-left: 10px;padding-right: 10px;text-align: left;vertical-align: top;}
                                                  .TipusTD2 {vertical-align: middle;height: 40px;max-width: 200px;width: 100%;}.TipusTD3 {font-size: 10px;line-height: 14px;}</style><!-- Encabezado REFRESH --><table width='600' style='display: block; margin-left: auto; margin-right: auto;'>
                                                  <tr><td><p style='text-align: center; font-size: 15px'>Si no visualiza correctamente el Email por favor pulse <a href='http://towerplane.com/prueba.aspx?val=" & separar_qr & "'>aquí</a></p></td></tr>
                                                  <tr><td align='center' valign='top'><table class='Taula1' width='600'><tbody><tr><td align='center'><img src='file:///D:/sancheado/GestionTurnos/GestionTurnos/GestionTurnos/GestionTurnos/Femsa/img/banner.jpg' title='ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA' width='600' border='0' />
                                                  </td></tr><tr><td style='border-bottom: 0 px solid #685c4f;'><table width='100%'><tbody><tr><td style='width: 20%'>&nbsp;</td><td><h4 style='text-align: center; font-size: 17px;'>Bienvenido a la Reunión Anual de </td></h4>
                                                  <td style='width: 20%'>&nbsp;</td></tr><tr><td style='width: 20%'>&nbsp;</td><td><h4 style='text-align: center; font-size: 17px;'><strong><u>ASUNTOS JURÍDICOS Y REGULATORIOS</u></strong></h4></td>
                                                  <td style='width: 20%'>&nbsp;</td></tr>                                              
                                                  </tbody></table></td></tr><tr><td><table width='100%'><tbody><tr><td class='TipusTD1' style='padding-top: 5px;margin-bottom:2.5%;'><p>Muchas gracias por su confirmación de asistencia. La información de su registro se ha realizado correctamente para la Reunión Anual de ASUNTOS JURÍDICOS Y REGULATORIOS 2019.</p>
                                                  <p>Puede descargarse la App haciendo click desde su smartphone en el siguiente link, o tecleando la dirección web en el navegador de su teléfono móvil (Válido para IOS & Android).</p>
                                                  </td></tr><tr><td><table width='100%'><tr><td style='width: 30%'>&nbsp;</td><td style='padding-bottom: 5px; padding-top: 7px; padding: 10px; margin-bottom: 2%; margin-top: 2.5%; height: auto;text-decoration: none; color: #fff; text-align: center; background-color: #7C0027; line-height: 18px'><p><a href='http://raa.femsa.com/app.htm' style='color: #fff;'>http//:raa.femsa.com/app.htm</a></p>
                                                  </td><td style='width: 30%'>&nbsp;</td></tr></table></td></tr><tr><td class='TipusTD1'><p class='textos'>Una vez descargada, debe identificarse usando las mismas claves que utilizó para el registro, así como también se desea modificar su registro.</p>
                                                  </td></tr><tr><table width='100%'><tr><td style='width: 30%'>&nbsp;</td><td style='padding-bottom: 5px; padding-top: 7px; padding: 10px; margin-bottom: 2%; background-color: #FFD8D8; margin-top: 2.5%; height: auto;'>
                                                  <p style='text-align: justify; font-size: 13.8px;'>-User: <a href='mailto:" & destinatario & "'>" & destinatario & "</a></p><p style='text-align: justify; font-size: 15px;'>-Password: <span style='font-weight: bold;'>" & pass & "</span></p>
                                                  </td><td style='width: 30%'>&nbsp;</td></tr><tr><td style='width: 30%'>&nbsp;</td><td align='center'>
                                                  <img src='file:///D:/sancheado/GestionTurnos/GestionTurnos/GestionTurnos/GestionTurnos/Femsa/img/qr/" & name_qr & "' title=" & name_qr & " style='box-shadow: 0px 0px 0px rgba(0, 0, 0, 0); width: 150px;' />
                                                  <div style='margin-top:-2%;'><strong>" & separar_qr & "</strong></div></td><td style='width: 30%'>&nbsp;</td></tr></table></tr></tbody></table></td></tr></tbody></table></td></tr></table></body></html>"

                                        'height='100' 
                                        '<h4 style='text-align: center; font-size: 17px; margin-bottom: 5%;'>Bienvenido a la Reunión Anual de:</h4><h4 style='margin-top: 10%; text-align: center; font-size: 17px; margin-bottom: 5%;'><strong><u>ASUNTOS JURÍDICOS Y REGULATORIOS</u></strong></h4>
                                                  '</tr>
                                        'Cuerpo = "<!DOCTYPE html PUBLIC ' -// W3C // DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'><html xmlns='http://www.w3.org/1999/xhtml'><head><meta http-equiv='Content-Type' content='text/html; charset=windows-1252'>
                                        '          <style>body {background: #eeeeee;font-weight: normal;font-family: 'Open Sans', Arial, Helvetica, sans-serif;line-height: 20px;}.Taula1 {background-color: #ffffff;border-collapse: collapse;}
                                        '          .TipusTD1, .TipusTD2, .TipusTD3 {padding-left: 10px;padding-right: 10px;text-align: left;vertical-align: top;}                                                  
                                        '          .TipusTD2 {vertical-align: middle;height: 40px;max-width: 200px;width: 100%;display: block;margin-left: auto;margin-right: auto;background-color: #7C0027;color: #fff;padding: 10px;}.cuadro_app{display: block;margin-left: auto;margin-right: auto;background-color: #7C0027;color: #fff;padding: 10px;}.TipusTD3 {font-size: 10px;line-height: 14px;}
                                        '          </style></head><body><div style='display:block;margin-left:auto;margin-right:auto;width:600px;text-align:center;padding:5px;'><p>Si no visualiza correctamente el Email por favor pulse <a href='towerplane.com/" & separar_qr & "'>aquí</a></p>
                                        '          </div><!-- Encabezado REFRESH --><table width='600' style='display:block;margin-left:auto;margin-right:auto;'><tr><td align='center' valign='top'><table class='Taula1' width='600'><tbody><tr>
                                        '          <td align='center' style='border-bottom 0px solid #685c4f; padding: 0px;'><img src='file:///D:/sancheado/GestionTurnos/GestionTurnos/GestionTurnos/GestionTurnos/Femsa/img/banner.jpg' title='ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA' width='600' border='0'></a></td>
                                        '          </tr><tr><td style='border-bottom: 0 px solid #685c4f;'><table width='100%'>
                                        '          <tbody><tr><td style='margin-top:25px;'><h4 style='margin-top: 10%; text-align: center; font-size: 17px; margin-bottom: 5%;'>Bienvenido a la Reunión Anual de: <strong><u>ASUNTOS JURÍDICOS Y REGULATORIOS</u></strong></h4>
                                        '          </td></tr></tbody></table></td></tr><tr><td><table width='100%'><tbody><tr><td class='TipusTD1' style='padding-top: 5px;'><p style='text-align: justify;font-size: 15px;width: 95%;display: block;margin-left: auto;margin-right: auto;padding: 10px;text-align: justify; font-size: 16px'>Muchas gracias por su confirmación de asistencia. La información de su registro se ha realizado correctamente para la Reunión Anual de ASUNTOS JURÍDICOS Y REGULATORIOS 2019.</p>
                                        '          <p style='text-align: justify;font-size: 15px;width: 95%;display: block;margin-left: auto;margin-right: auto;padding: 10px;text-align: justify; font-size: 16px;margin-bottom:25px;'>Puede descargarse la App haciendo click desde su smartphone en el siguiente link, o tecleando la dirección web en el navegador de su teléfono móvil (Valido para IOS & Android).</p>
                                        '          </td></tr><table width='100%'><tr><td style='width:30%'>&nbsp;</td><td><a href='http:raa.femsa.com/app.htm' style='padding: 10px 25px;text-decoration: none; text-align:center;background-color: #7C0027;color: #fff;'>http:raa.femsa.com/app.htm</a>
                                        '          </td><td style='width:30%'> &nbsp;</td></tr></table><tr><td class='TipusTD1'><p class='textos' style='margin-top:25px;margin-bottom:25px;'>Una vez descargada, debe identificarse usando las mismas claves que utilizó para el registro, así como también se desea modificar su registro.</p>
                                        '          </td></tr><tr><table width='100%'><tr><td style='width:30%'>&nbsp;</td><td style='padding-bottom: 5px; padding-top: 7px;padding: 10px;margin-bottom: 2%;background-color: #FFD8D8;margin-top: 1.5%;height: auto;'>
                                        '          <p style='text-align: justify; font-size: 13.8px;'>-User: <a href='mailto:" & destinatario & "'>" & destinatario & "</a></p><p style='text-align: justify; font-size: 15px;'>-Password: <span style='font-weight: bold;'>" & pass & "</span></p></td><td style='width:30%'> &nbsp;</td></tr>
                                        '          <tr><td style='width:30%'>&nbsp;</td><td align='center'><img src='file:///D:/sancheado/GestionTurnos/GestionTurnos/GestionTurnos/GestionTurnos/Femsa/img/qr/" & name_qr & "' title='" & name_qr & "' style='box-shadow: 0px 0px 0px rgba(0, 0, 0, 0); width: 150px;' />
                                        '          <p>" & name_qr & "</p></td><td style='width:30%'> &nbsp;</td></tr></table></tr></tbody></table></td></tr></tbody></table></body></html>"

                                        From = "test@towerplane.com"
                                        ServidorSMTP = "smtp.towerplane.com"
                                        UsuariSMTP = "jsmateo@towerplane.com"
                                        PasswordSMTP = "Rp8qHKdTxc" '"yjiumnvpgD"
                                        Puerto = "25"
                                        FitxerAdjunt = ""

                                        envio = send_mail.EnviarEmail_System_Web_Mail_BO(destinatario, From, Cabecera, Cuerpo, , ServidorSMTP,, UsuariSMTP, PasswordSMTP,,,,,)
                                        If envio Then

                                            'DS.Reset()

                                            estado_envio = "true" 'cambiamos el estado de email_enviado a true y añadimos fecha de envio.
                                            Dim Ano As String, mes As String, day As String, hora As String, min As String, segundo As String, fecha As String

                                            Ano = DateTime.Now.ToString("yyyy")
                                            mes = DateTime.Now.ToString("MM")
                                            day = DateTime.Now.ToString("dd")
                                            hora = DateTime.Now.ToString("HH")
                                            min = DateTime.Now.ToString("mm")
                                            segundo = DateTime.Now.ToString("ss")



                                            fecha = Ano + mes + day + hora + min + segundo

                                            VectorSQL(0) = "UPDATE eecontactes SET Carrec = '" & clsBD.Cometes(Left(estado_envio, 100)) & "',Data='" & clsBD.Cometes(Left(fecha, 100)) & "' WHERE Email= '" & destinatario & "'"

                                            If Not clsBD.BaseDades(2, VectorSQL) Then
                                                'Problema
                                            Else
                                                'Correcto
                                                Descripcio = "OK12"
                                            End If
                                        Else
                                            Descripcio = "KO12"
                                        End If
                                    Else
                                        Descripcio = "KO13"
                                    End If

                                Next
                            End If
                        End If

                        GoTo Resposta

                    Case 13 'Guardar datos en Bd FEMSA

                        VDades = CStr(Request.Form("d")).Split("¦")

                        Dim puesto As String, negocio As String, direccion As String, city As String, country As String, movil As String, oficina As String, email As String, idferia As String
                        Dim h_salida As String, h_llegada As String, nVuelo As String, aerolinea As String
                        Dim h_salida2 As String, h_llegada2 As String, nVuelo2 As String, aerolinea2 As String
                        Dim h_salid3 As String, h_llegada3 As String
                        Dim preferencia As String, preferencia2 As String, preferencia3 As String, futbol As String, futbol2 As String, confe As String, confe2 As String, documento As String

                        For i = 0 To 25
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
                                Case 18
                                    preferencia = VDades(i)
                                Case 19
                                    preferencia2 = VDades(i)
                                Case 20
                                    preferencia3 = VDades(i)
                                Case 21
                                    futbol = VDades(i)
                                Case 22
                                    futbol2 = VDades(i)
                                Case 23
                                    confe = VDades(i)
                                Case 24
                                    confe2 = VDades(i)
                                Case 25
                                    documento = VDades(i)

                            End Select
                        Next

                        Dim total As String, total2 As String, total3 As String

                        total = puesto + "¦" + negocio + "¦" + direccion + "¦" + city + "¦" + country + "¦" + movil + "¦" + oficina + "¦" + documento
                        total2 = h_salida + "¦" + h_llegada + "¦" + nVuelo + "¦" + aerolinea + "¦" + h_salida2 + "¦" + h_llegada2 + "¦" + nVuelo2 + "¦" + aerolinea2 + "¦" + h_salid3 + "¦" + h_llegada3
                        total3 = preferencia + "¦" + preferencia2 + "¦" + preferencia3 + "¦" + futbol + "¦" + futbol2 + "¦" + confe + "¦" + confe2
                        Dim Ds As New DataSet

                        idferia = "210"

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
                            'Descripcio = "OK13"
                            'GoTo Resposta
                        End If

                        Ds.Reset()

                        VectorSQL(0) = "UPDATE eecontactes SET NIT = '" & total3 & "' WHERE Email = '" & email & "'and idFira='" & idferia & "'"

                        If Not clsBD.BaseDades(2, VectorSQL) Then
                            'Problema
                            Descripcio = "KO13"
                            GoTo Resposta
                        Else
                            'Correcto

                            'Para simular la alta en la App, primero debemos de realizar un select para obtener ciertos datos.
                            Dim name As String, apellidos As String, password As String, qr_code As String
                            Ds.Reset()
                            VectorSQL(0) = "SELECT Nom,Cognoms, Password, Procedencia FROM EEContactes WHERE Email='" & clsBD.Cometes(Left(email, 100)) & "'AND idFira ='" & idferia & "'"

                            If Not clsBD.BaseDades(1, VectorSQL, Ds) Then
                                ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
                            Else
                                If Ds.Tables(0).Rows.Count > 0 Then
                                    For i = 0 To Ds.Tables(0).Rows.Count - 1
                                        name = Ds.Tables(0).Rows(i).Item("Nom")
                                        apellidos = Ds.Tables(0).Rows(i).Item("Cognoms")
                                        password = Ds.Tables(0).Rows(i).Item("Password")
                                        qr_code = Ds.Tables(0).Rows(i).Item("Procedencia")
                                    Next
                                End If
                            End If
                            'simulamos la alta en la App
                            If Alta_App(name, apellidos, email, password, qr_code, idferia) Then
                                Descripcio = "OK13"
                                GoTo Resposta
                            Else
                                Descripcio = "KO23"
                                GoTo Resposta
                            End If

                        End If

                    Case 14
                        'Datos necesarios para el envio de mails.
                        Dim send_mail As New ClaseEmail
                        Dim destinatario As String, Cabecera As String, Cuerpo As String, From As String
                        Dim ServidorSMTP As String, UsuariSMTP As String, PasswordSMTP As String
                        Dim Puerto As Integer, envio As Boolean, FitxerAdjunt As String
                        Dim nombre As String, ape() As String, Apellido As String, idFeria As Integer, email As String, enviado As String, idioma As String

                        VDades = CStr(Request.Form("d")).Split("¦")

                        ' Ponemos los datos a martillo.
                        'destinatario = "jsmateo@towerplane.com" ' esto es el mail de la persona que se lo vamos a enviar.

                        idFeria = VDades(0)

                        '

                        Dim DS As New DataSet

                        'La consulta.
                        VectorSQL(0) = "SELECT Nom, Cognoms, Email, Carrec, WebPersonal FROM EEContactes WHERE idFira ='" & idFeria & "'"

                        If clsBD.BaseDades(1, VectorSQL, DS) Then
                            Dim almacenar_DS As String

                            almacenar_DS = DS.Tables(0).Rows.Count
                            If almacenar_DS > 0 Then
                                For i = 0 To almacenar_DS - 1
                                    nombre = DS.Tables(0).Rows(i).Item("Nom")
                                    Apellido = DS.Tables(0).Rows(i).Item("Cognoms")
                                    email = DS.Tables(0).Rows(i).Item("Email")
                                    enviado = DS.Tables(0).Rows(i).Item("Carrec")
                                    idioma = DS.Tables(0).Rows(i).Item("WebPersonal")

                                    destinatario = email

                                    If enviado = "false" Then
                                        If idioma = "es" Then
                                            Cabecera = "Reserve la fecha, EDM - Seminario Institucional 10 de Octubre"
                                            Cuerpo = "<!DOCTYPE html PUBLIC ' -// W3C // DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'><html xmlns='http://www.w3.org/1999/xhtml'><head><meta http-equiv='Content-Type' content='text/html; charset=windows-1252'>
                                          <title>Reserve la fecha, EDM - Seminario Institucional 10 de Octubre</title></head><body><style>body {background: #fff;font-weight: normal;font-family: 'Open Sans', Arial, Helvetica, sans-serif;line-height: 20px;}
                                          </style><form id='form1'><!-- Encabezado REFRESH --><table width='100%'><tr><td align='center' valign='top'><img src='file:///D:/sancheado/GestionTurnos/GestionTurnos/GestionTurnos/GestionTurnos/Femsa/img/RESERVEDM.jpg' /></td></tr><tr><td><table width='600' align='center'  style='padding:10px;text-align:justify;font-size:12px;'>
                                          <tr><td><div style='margin-left: 0; width: 100%; text-align: center; padding: 10px;color:#808080;'><p>Si no visualiza correctamente el Email por favor <a href='http://towerplane.com/' style='color:#0080ff;'>pulse aquí</a></p></td></tr>
                                          </div></td></tr><tr><td><div style='line-height:15px;color:#808080;'>Este mensaje es privado y confidencial y solamente para su destinatario. Si usted ha recibido este mensaje por error, no debe revelar, copiar, distribuir o usarlo en ningún sentido. Le rogamos lo comunique al remitente y borre dicho mensaje y cualquier documento adjunto que pudiera contener.
                                          No hay renuncia a la confidencialidad ni a ningún privilegio por causa de transmisión errónea o mal funcionamiento. Los correos electrónicos no son seguros, no garantizan la confidencialidad ni la correcta recepción de los mismos, dado que pueden ser interceptados, manipulados, destruidos, llegar con demora, incompletos, o con virus. 
                                          La empresa no se hace responsable de las alteraciones que pudieran hacerse al mensaje una vez enviado.</div></td></tr><tr><td><div style='line-height:15px;color:#808080;margin-top:-1%;'>Le informamos de que sus datos serán tratados bajo la responsabilidad de RPA EVENTS S.L. para el envío de comunicaciones propias de la relación 
                                          contractual existente y se conservarán mientras que exista un mutuo interés para ello. Si no desea seguir recibiendo comunicaciones a través de esta vía o si desea retirar su consentimiento, ejercitar sus derechos de acceso, rectificación, portabilidad, supresión, limitación u oposición o presentar una reclamación ante la Autoridad de control (agpd.es) si considera que el tratamiento no se ajusta a la normativa vigente, puede hacerlo enviando una solicitud 
                                          por escrito a RPA EVENTS S.L. Calle de Claudio Coello, 41, 28001 Madrid o a través de correo electrónico <a href='mailto:rpa@rpacomunicacion.com' style='color:#0080ff;'>rpa@rpacomunicacion.com</a>, junto con prueba válida en derecho, como fotocopia del D.N.I. e indicando en el asunto 'PROTECCIÓN DE DATOS'.
                                          </div></td></tr></table></td></tr></table></form></body></html>"
                                        Else
                                            Cabecera = "Save the Date, EDM- Institutional Seminar, October 10th, 2019"
                                            Cuerpo = "<!DOCTYPE html PUBLIC ' -// W3C // DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'><html xmlns='http://www.w3.org/1999/xhtml'><head><meta http-equiv='Content-Type' content='text/html; charset=windows-1252'>
                                          <title>Save the Date, EDM- Institutional Seminar, October 10th, 2019</title></head><body><style>body {background: #fff;font-weight: normal;font-family: 'Open Sans', Arial, Helvetica, sans-serif;line-height: 20px;}
                                          </style><form id='form1'><!-- Encabezado REFRESH --><table width='100%'><tr><td align='center' valign='top'><img src='file:///D:/sancheado/GestionTurnos/GestionTurnos/GestionTurnos/GestionTurnos/Femsa/img/RESERVEDM_EN.jpg' /></td></tr><tr><td><table width='600' align='center'  style='padding:10px;text-align:justify;color:Black;font-size:12px;'>
                                          <tr><td><div style='margin-left: 0; width: 100%; background-color: #fff; text-align: center; padding: 10px;'><p>If you do not display the email correctly <a href='http://towerplane.com/' style='color:#0080ff;'>press here</a></p>
                                          </div></td></tr><tr><td><div style='line-height:15px;color:#808080;margin-top:1.5%;'>This message is private and confidential and only for its recipient. If you have received this message in error, you must not disclose, copy, distribute or use it in any way.
                                          Please notify the sender and delete that message and any attached documents that it may contain. There is no waiver of confidentiality or any privilege due to erroneous transmission or malfunction. Emails are not secure, they do not guarantee confidentiality or the correct reception of them, 
                                          since they can be intercepted, manipulated, destroyed, arrive late, incomplete, or with viruses. The company is not responsible for the alterations that could be made to the message once sent.</div></td></tr><tr><td><div style='line-height:15px;color:#808080;margin-top:-1%;'>
                                          We inform you that your data will be treated under the responsibility of RPA EVENTS S.L. for sending communications of the existing contractual relationship and will be preserved while there is a mutual interest for it. If you do not wish to continue receiving 
                                          communications through this channel or if you wish to withdraw your consent, exercise your rights of access, rectification, portability, deletion, limitation or opposition or file a claim with the Control Authority (agpd.es) if you consider that The treatment does not comply with current regulations, 
                                          you can do so by sending a written request to RPA EVENTS S.L. Calle de Claudio Coello, 41, 28001 Madrid or via email <a href='mailto:rpa@rpacomunicacion.com' style='color:#0080ff;'>rpa@rpacomunicacion.com</a>, 
                                          together with proof valid in law, as a photocopy of the D.N.I. and indicating in the subject 'DATA PROTECTION'.</div></td></tr></table></td></tr></table>
                                          </form></body></html>"
                                        End If

                                        From = "jsmateo@towerplane.com"
                                        ServidorSMTP = "smtp.towerplane.com"
                                        UsuariSMTP = "jsmateo@towerplane.com"
                                        PasswordSMTP = "Rp8qHKdTxc"
                                        Puerto = "25"
                                        FitxerAdjunt = ""

                                        envio = send_mail.EnviarEmail_System_Web_Mail_BO(destinatario, From, Cabecera, Cuerpo, , ServidorSMTP,, UsuariSMTP, PasswordSMTP,,,,,)

                                        If envio Then

                                            enviado = "true"
                                            'DS.Reset()

                                            Dim Ano As String, mes As String, day As String, hora As String, min As String, segundo As String, fecha As String

                                            Ano = DateTime.Now.ToString("yyyy")
                                            mes = DateTime.Now.ToString("MM")
                                            day = DateTime.Now.ToString("dd")
                                            hora = DateTime.Now.ToString("HH")
                                            min = DateTime.Now.ToString("mm")
                                            segundo = DateTime.Now.ToString("ss")



                                            fecha = Ano + mes + day + hora + min + segundo


                                            'Realizamos un Update de la Bd poniendo en true el envio y la fecha de cuando se ha enviado.
                                            VectorSQL(0) = "UPDATE eecontactes SET Carrec = '" & enviado & "',Data='" & fecha & "' WHERE Email= '" & clsBD.Cometes(Left(destinatario, 100)) & "'and idFira='" & idFeria & "'"

                                            If Not clsBD.BaseDades(2, VectorSQL) Then
                                                'Problema
                                                Descripcio = "KO14"
                                                'GoTo Resposta
                                            Else
                                                'Correcto
                                                Descripcio = "OK14"
                                                'GoTo Resposta
                                            End If
                                        Else
                                            Descripcio = "KO14"
                                            GoTo Resposta
                                        End If
                                    End If
                                Next
                            End If
                        End If
                    Case 15 'Intranet de Femsa

                        VDades = CStr(Request.Form("d")).Split("¦")

                        Dim idferia As String, id_ramdon As String, nombre As String, email As String, pass As String, datos() As String, mydata As String

                        idferia = VDades(0)
                        id_ramdon = VDades(1)

                        Dim DS As New DataSet

                        'La consulta.
                        VectorSQL(0) = "SELECT Nom, Email, Password, NickTwitter FROM EEContactes WHERE SectorInteres ='" & id_ramdon & "'"

                        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                            ClientScript.RegisterStartupScript(Page.GetType(), "id", "LanzaAviso('Error al buscar datos de email en la BD.')", True)
                        Else
                            Dim total As String

                            If DS.Tables(0).Rows.Count > 0 Then
                                For i = 0 To DS.Tables(0).Rows.Count - 1
                                    nombre = DS.Tables(0).Rows(i).Item("Nom")
                                    email = DS.Tables(0).Rows(i).Item("Email")
                                    pass = DS.Tables(0).Rows(i).Item("Password")
                                    mydata = DS.Tables(0).Rows(i).Item("NickTwitter")
                                Next
                                If mydata.Length <= 1 Then
                                    total = nombre + "¦" + email + "¦" + pass
                                    Descripcio = "OK15" + "¦" + total
                                    GoTo Resposta
                                Else
                                    datos = mydata.Split("¦")
                                    'Analista, Desarrollador¦Informatica¦Carlota Pasaron¦Alicante¦España¦649682140¦966741427
                                    Dim cargo As String, empresa As String, dire As String, city As String, country As String, mobil As String, fijo As String
                                    cargo = datos(0)
                                    empresa = datos(1)
                                    dire = datos(2)
                                    city = datos(3)
                                    country = datos(4)
                                    mobil = datos(5)
                                    fijo = datos(6)

                                    total = nombre + "¦" + email + "¦" + pass + "¦" + cargo + "¦" + empresa + "¦" + dire + "¦" + city + "¦" + country + "¦" + mobil + "¦" + fijo
                                    Descripcio = "OK15" + "¦" + total
                                    GoTo Resposta
                                End If
                            Else
                                Descripcio = "KO15"
                                GoTo Resposta
                            End If
                        End If
                        GoTo Resposta
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
        Dim Descripcio As String


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


    'Alta simulada en App
    Private Function Alta_App(ByRef nombre, ByRef apellidos, ByRef email, ByVal password, ByVal qr_code, ByVal idferia)

        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String, aforo As String, ins As String
        DS = New DataSet

        Dim Rol As String, agrupacion As String, transporte As String, asiste As String, numero As String, region As String, nit As String, nitactivat As Integer, especialidad As String, nselas As String, consentimiento As String
        Dim alojamiento As String, origen As String, alergia As String, observaciones As String

        VectorSQL(0) = "INSERT INTO eecontactes (idFira, idContacte, idOrigen, idTipusContacte, idAlta, Nom, Cognoms, Mobil, Email, Carrec, Nit, NITactivat, Password, Blog, SectorInteres, Data, NickTwitter, Procedencia, NickFacebook, WebPersonal) " &
                        "VALUES(" & idferia & "," & Rol & "," & agrupacion & "," & transporte & "," & asiste & ",'" & clsBD.Cometes(Left(nombre, 100)) & "','" & clsBD.Cometes(Left(apellidos, 100)) & "'," &
                        "'" & numero & "','" & clsBD.Cometes(Left(email, 100)) & "','" & Region & "','" & Nit & "'," & NITactivat & ",'" & clsBD.Cometes(Left(password, 100)) & "','" & clsBD.Cometes(Left(Especialidad, 100)) & "','" & clsBD.Cometes(Left(NSelas, 100)) & "','" & Consentimiento & "'," &
                        "" & Alojamiento & ",'" & clsBD.Cometes(Left(Origen, 100)) & "','" & clsBD.Cometes(Left(Alergia, 100)) & "','" & clsBD.Cometes(Left(Observaciones, 100)) & "')"

        Dim N1 As String, myRamdon As String
        Dim randomN As New Random, estado As String

        myRamdon = ""

        While (myRamdon.Length < 2)
            N1 = randomN.Next(0, 9)
            myRamdon += N1
        End While

        If myRamdon > 4 Then
            estado = "true"
        Else
            estado = "false"
        End If

        Return estado
    End Function
End Class