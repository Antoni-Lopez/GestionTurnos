<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="GestionTurnos.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Reunión Anual de ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA</title>
    <!-- CSS y distintas librerias -->
    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>

    <link rel="stylesheet" href="../Css/Segment.css" />

    <style type="text/css">

        /* banner cabecera */
        .img_banner{max-width:600px;display:block; margin-left:auto;margin-right:auto;box-shadow: 0px 0px 25px rgba(0, 0, 0, 1);margin-top:1.5%}
        .img_banner img{max-width:600px;width:102.7%;}

        /* confi de segment */
        .misegment{max-width:500px;width:100%;display:block; margin-left:auto;margin-right:auto;margin-top:2%;}

        /* cuadros ingles/español */
        #espanish{display:block; margin-left:auto;margin-right:auto;max-width:350px;width:100%;margin-top:2.5%;border:#333 solid 1px;}        
        #inglish{display:none; margin-left:auto;margin-right:auto;max-width:350px;width:100%;margin-top:2.5%;border:#333 solid 1px;}

        .cont_principal{display:block; margin-left:auto;margin-right:auto;max-width:350px;width:100%;margin-top:2.5%;border:#333 solid 1px;}
        
        .cabecera{text-align:justify;background-color:#202020; color:#fff;padding:10px;}

        .recuadro{margin-top:2%;}
        .cuadros{background-color:#EFEFEF;padding:15px;}

        .mi_input{height:22px !important;font-size:13px;margin-top:-2%; margin-left:-3%;}

        .centrado {margin-left: 0;width: 100%;}
        label[for=texto]{padding-left: 15%;font-size: 20px;}
        label[for=texto] span{color:red;font-weight:bold;}

        /* Tabla email y Pass */
        .mi_tabla{display:table;height:100px;padding:10px;}
        .mi_tabla tbody tr{vertical-align: middle;}
        .mi_tabla tbody tr td{width:50%;background-color:#EFEFEF;}


        /* Boton envio de datos */
        .btn-Espa {background-color: #7C0027;border-color: #c6c6c6;color:#FFFFFF;display:block;margin-left:auto;margin-right:auto;}
        .btn-Espa:hover,.btn-Espa:focus,.btn-Espa:active,.btn-Espa.active {background-color:#FFFFFF;border-color: #202020;color:#7C0027;}
        .btn-Espa.disabled:hover,.btn-Espa.disabled:focus,.btn-Espa.disabled:active,.btn-Espa.disabled.active,.btn-Espa[disabled]:hover,.btn-Espa[disabled]:focus,.btn-Espa[disabled]:active,.btn-Espa[disabled].active,fieldset[disabled] .btn-Espa:hover,fieldset[disabled] .btn-Espa:focus,fieldset[disabled] .btn-Espa:active,fieldset[disabled] .btn-Espa.active {background-color: #EEEEEE;border-color: #e1e1e1;color:#FFFFFF;}

        /* Ventana Modal LanzaAviso */
        .modal-open .modal{display: flex;justify-content: center;align-items: center;}

        .verde{border:1px solid green;}
        .azul{border:1px solid blue;}
        .amarillo{border:1px solid yellow;}
        .rojo{border:1px solid red;}
    </style>
    <script type="text/javascript">
        function addLoadEvent(func) {
            var oldonload = window.onload;
            if (typeof window.onload != 'function') {
                window.onload = func;
            }
            else {
                window.onload = function () {
                    oldonload();
                    func();
                }
            }
        }

        addLoadEvent(inicio);

        function inicio() {

            if ((document.getElementById("oculto").value == null) || (document.getElementById("oculto").value == "")) {
                document.getElementById("oculto").value = "es";
            }
        }

        function LanzaAviso(Text) {
            bootbox.alert({ title: "ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA", message: Text, size: 'large' });

        }
        function cambiar_idioma(x) {
            switch (x) {
                case 1:
                    document.getElementById("oculto").value = "es";
                    document.getElementById("espanol").checked = true;
                    document.getElementById("identificacion").innerHTML = "IDENTIFICACIÓN";
                    document.getElementById("Vali").innerHTML = "Validación";
                    break;
                case 2:
                    document.getElementById("english").checked = true;
                    document.getElementById("oculto").value = "en";
                    document.getElementById("identificacion").innerHTML = "IDENTIFICATION";
                    document.getElementById("Vali").innerHTML = "Validation";                    
                    break;
            }
        }

        //Funcion para añadir animación al boton de guardado.
        function loading_gif() {
            var x = document.getElementById("oculto").value;

            if (x == "es") {
                identificacion.innerHTML = "";
                var texto = "Comprobando los datos! <img src='img/ajax-loader.gif' alt='loading' />";
                $('#identificacion').html(texto);
            }
            else {
                identificacion.innerHTML = "";
                var texto = "Cheking your data! <img src='img/ajax-loader.gif' alt='loading' />";
                $('#identificacion').html(texto);
            }


            //switch (x) {
            //    case 1:
            //        identificacion.innerHTML = "";
            //        var texto = "Comprobando los datos! <img src='img/ajax-loader.gif' alt='loading' />";
            //        $('#identificacion').html(texto);
            //        break;
            //    case 2:
            //        identification.innerHTML = "";
            //        var texto = "Cheking your data! <img src='img/ajax-loader.gif' alt='loading' />";
            //        $('#identification').html(texto);
            //        break;
            //}
            
        }


        function mensajes(x) {
            switch (x) {
                case 1:
                    LanzaAviso("<p>Hemos detectado que ya estas registrado en nuestra BD.<br/>Por ello, por favor introduzca la contraseña que le enviemos al email. Gracias!</p>");
                    document.getElementById("oculto2").value = 1;     
                    document.getElementById("show_password").style.display = "table-row";
                    cambiar_idioma(1);
                    break;
                case 2:
                    LanzaAviso("<p>We have detected that you are already registered in our DataBase.<br/>So, please enter the password that we send to your email. Thank you!</p>");
                    document.getElementById("oculto2").value = 1;
                    document.getElementById("show_password").style.display = "table-row";
                    cambiar_idioma(2);
                    break;
                case 3:
                    LanzaAviso("<p>Lo sentimos pero dicho email no está en nuestra Base de Datos.<br/>Por favor introduzca un email valido. Gracias!</p>");
                    break;
                case 4:
                    LanzaAviso("<p>We are sorry but this email is not in our Database. <br/> Please enter a valid email. Thank you!</p>");
                    cambiar_idioma(2);
                    break;
                case 5:
                    LanzaAviso("<p>Lo sentimos pero el campo contraseña es obligatorio y no puede estar vacio.<br/>Por favor introduzca una contraseña valido. Gracias!</p>");
                    document.getElementById("show_password").style.display = "table-row";
                    break;
                case 6:
                    LanzaAviso("<p>We are sorry but the password field is mandatory and can not be empty. <br/> Please enter a valid password. Thank you!</p>");
                    document.getElementById("show_password").style.display = "table-row";
                    cambiar_idioma(2);
                    break;
                case 7:
                    LanzaAviso("<p>Lo sentimos pero dicha contraseña no está en nuestra Base de Datos.<br/>Por favor introduzca una contraseña valida. Gracias!</p>");
                    document.getElementById("show_password").style.display = "table-row";
                    break;
                case 8:
                    LanzaAviso("<p>We are sorry but this password is not in our Database. <br/> Please enter a valid password. Thank you!</p>");
                    document.getElementById("show_password").style.display = "table-row";
                    cambiar_idioma(2);
                    break;
                case 9:
                    LanzaAviso("<p>Lo sentimos pero el campo Email es obligatorio y no puede estar vacio.<br/>Por favor introduzca un Email valido. Gracias!</p>");
                    break;
                case 10:
                    LanzaAviso("<p>Sorry, the Email field is mandatory and can not be empty. <br/> Please enter a valid Email. Thank you!</p>");
                    cambiar_idioma(2);
                    break;
            }            
        }

        function michorra() {
            var x = 1;
            if (x == 1) {
                alert("Entramossssss");
            }
            else {
                alert("No entramos ;-(");
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid img_banner" onclick="michorra()">
            <img src="img/banner.jpg" />
        </div>
        <div class="row misegment">
            <div class="segmented-control sc-fade">
                <div class="segmented-control-btn">
                  <input type="radio" id="espanol" name="frameworkJs" value="react" checked="checked" onclick="cambiar_idioma(1)"/>
                  <label for="espanol">Español</label>
                </div>
                <div class="segmented-control-btn">
                  <input type="radio" id="english" name="frameworkJs" value="angular" onclick="cambiar_idioma(2)"/>
                  <label for="english">English</label>
                </div>
            </div>
        </div>
        <div class="cont_principal">
            <div id="Vali" class="row centrado cabecera">
                Validación
            </div>
            <div class="row centrado">
                <table class="mi_tabla">
                    <tbody>
                        <tr>
                            <td><label for="texto">Email <span>*</span></label></td>
                            <td><input type="text" class="form-control mi_input" id="Input_Email" runat="server"  /></td>
                        </tr>
                        <tr id="show_password" style="display:none;">
                            <td><label for="texto">Password <span>*</span></label></td>
                            <td><input type="password" class="form-control mi_input" id="Input_Password" value="" runat="server"  /></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="row centrado cuadros" style="margin-left:1px;width:99.5%;">
                    <button id="identificacion" type="submit" class="btn-Espa" onclick="loading_gif()" runat="server">IDENTIFICACIÓN</button>
            </div>
        </div>
        <div class="row centrado">
            <input type="text" class="form-control mi_input" style="display:none;"  id="oculto" runat="server"  />            
        </div>
        <div class="row centrado">
            <input type="text" class="form-control centrado mi_input" style="margin-top:10%;display:none;" value="0"  id="oculto2" runat="server"  />           
        </div>
    </form>    
</body>
</html>
