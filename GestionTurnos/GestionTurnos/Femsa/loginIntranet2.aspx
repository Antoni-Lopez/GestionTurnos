<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="loginIntranet2.aspx.vb" Inherits="GestionTurnos.loginIntranet2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login Intranet</title>
    <!-- CSS y distintas librerias -->
    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous" />

    <style type="text/css">
        /* Imagen de Banner */
        .banner{max-height:293px;display:block;margin:1% auto 1% auto;max-width:800px;}
        .banner img{border:.8px solid black;box-shadow: 0px 0px 25px rgba(0, 0, 0, 1);}
        /* Cuadro login */
        .login{display:block;max-width:600px;margin:5% auto 2.5% auto;border:.5px solid black;padding:10px;background-color:#eee;color:#891625}

        /* Label Email*/
        .campos{margin-top:8%;margin-left: -10px;width: 103%;}
        #email{width:20%;margin: 0 0.5% 0 4%;font-size:20px;margin-left: 1.9%;}
        #password{width:20%;margin: 0 0.5% 0 1.5%;font-size:20px;}
        #email span, #password span{color: red;margin-left: 1%;vertical-align: sub;}

        /* campos obligatorios */
        .obligatoris_camps{margin-left:0;width:100%;padding:10px;margin-top:2.5%;background-color:#FFCC00;height: 50px;}
        .obligatoris_camps p{font-size:16px;text-align:justify;margin-left:1%;margin-top:1%}
        .info_obligatoria{vertical-align: middle;}


        /* Inputs */
        #input_pass,#input_mail{border:#8D1926 solid 1.5px;height:30px;padding:5px;}

        /* Div Boton y boton */
        .boton{width:100%;margin: 1.5% auto 0 auto;display:block;padding:10px}
        .button {position: relative;padding: .5em 1em;border: none;background-color: transparent;cursor: pointer;outline: none;font-size: 18px;margin: 0em 0.8em;}
        .button.type1 {color:#891625;}
        .button.type1.type1::after, .button.type1.type1::before {content: "";display: block;position: absolute;width: 20%;height: 20%;border: 2px solid;transition: all 0.6s ease;border-radius: 2px;}
        .button.type1.type1::after {bottom: 0;right: 0;border-top-color: transparent;border-left-color: transparent;border-bottom-color: #891625;border-right-color: #891625;}
        .button.type1.type1::before {top: 0;left: 0;border-bottom-color: transparent;border-right-color: transparent;border-top-color:#891625 ; /*#566473*/border-left-color: #891625;}
        .button.type1.type1:hover:after, .button.type1.type1:hover:before {width: 100%;height: 100%;}

        /* Ventana Modal LanzaAviso */
        .modal-open .modal{display: flex;justify-content: center;align-items: center;}
    </style>
    <script type="text/javascript">

        function LanzaAviso(Text) {
            bootbox.alert({ title: "INTRANET - ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA", message: Text, size: 'medium' });
        }

        function mensajes(x) {
            switch (x) {
                case 1:
                    LanzaAviso("<p>Lo siento pero el campo de <span style='font-weight:bold;color:red'>Email</span> es <span style='font-weight:bold'>obligatorio</span> y necesita contener un <span style='font-weight:bold'>Email valido.</span></p>");
                    break;
                case 2:
                    LanzaAviso("<p>Lo siento pero el campo de <span style='font-weight:bold;color:red'>Password</span> es <span style='font-weight:bold'>obligatorio</span> y necesita contener una <span style='font-weight:bold'>Contraseña valida.</span></p>");
                    break;
                case 3:
                    LanzaAviso("<p>Lo siento pero el <span style='font-weight:bold;color:red'>Email</span> que has introducido no es <span style='font-weight:bold'>correcto</span>. Introduzca un <span style='font-weight:bold:color:green;'>Email valido.</span></p>");
                    break;
                case 4:
                    LanzaAviso("<p>Lo siento pero la <span style='font-weight:bold;color:red'>Contraseña</span> que has introducido no es <span style='font-weight:bold'>correcta</span>. Introduzca una <span style='font-weight:bold:color:green;'>Contraseña valida.</span></p>");
                    break;
            }
        }

        //función que nos añade un loading al button.
        function loader_gif(x) {
            switch (x) {
                case 1:
                    $('#login_intranet').html("<img src='img/ajax-loader.gif' alt='loading' /><h4 style='text-align:center;'>Validando datos.<br/>");
                    break;
                case 2:
                    $('#login_intranet').html("<h4 style='text-align:center;'>Datos Validados.<br/>");
                    break;
                case 3:
                    $('#login_intranet').html("<h4 style='text-align:center;'>Ups! Algo salió mal.<br/>");
                    break;

            }
                  
        }

        function comprobarEmail(email) {
            //Comprobamos que el Email introducido por el usuario tenga el formato correcto. Ej: prueba@prueba.com
            return (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(email))
        }
        function compruebaPass() {
            var espacios = false;
            var cont = 0;
            var pass = document.getElementById("input_mail").value; input_pass


            while (!espacios && (cont < pass.length)) {
                if (pass.charAt(cont) == " ")
                    espacios = true;
                    cont++;
            }
            //Comprobamos que el password introducido por el usuario no tenga espacios en blanco.
            if (espacios) {
                LanzaAviso("La contraseña no puede contener espacios en blanco");
                return false;
            }
            else {
                if (comprobarEmail(email)){
                    return true;
                    enviarFormulario();                      
                }
                else {
                    return false;
                }
                
            }
        }

        function enviarFormulario() {
           var theform;
           if (window.navigator.appName.toLowerCase().indexOf("microsoft") > -1) theform = document.form1;
           else theform = document.forms["form1"];
           theform.submit();
       }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="banner">
            <asp:Image ID="Image1" ImageUrl="img/banner.jpg" runat="server" Width="800px" CssClass="banner_img"/>
            <div class="container-fluid login">
                <div class="row campos">
                    <asp:Label ID="email" runat="server">Email <span>*</span></asp:Label>
                    <asp:TextBox ID="input_mail" runat="server"></asp:TextBox>
                    <asp:Label ID="password" runat="server">Password<span>*</span></asp:Label>
                    <asp:TextBox ID="input_pass" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                
                <div class="row obligatoris_camps">
                    <p><i class="fas fa-exclamation-circle info_obligatoria" style="font-size: 29px;margin-right:1.5%;"></i>Los campos con <span style="color:red;">*</span> son de caracter obligatorio
                    y no pueden estar vacios.</p>
                </div>
                <div class="row boton">
                    <button type="button" id="login_intranet" style="display: block; margin-left: auto; margin-right: auto;" class="button type1" onclick="enviarFormulario()">Login</button>
                </div>
            </div>
            <br />
            <br />
        </div>
    </form>
        
    </body>
</html>
