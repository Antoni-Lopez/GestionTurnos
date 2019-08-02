<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="LoginIntranet.aspx.vb" Inherits="GestionTurnos.LoginIntranet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login Intranet</title>
    <!-- CSS y distintas librerias -->
    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>
    <style type="text/css">
        body{margin:0;padding:0;box-sizing:border-box;width:100%;}

        /* Cuadro e imagen de Banner*/
        .logotipo{max-width:600px;width:100%;display:block;margin-left:auto;margin-right:auto;margin-top:1.5%}
        .logotipo img{max-width:600px; width:100%;max-height:293px;box-shadow: 0px 0px 25px rgba(0, 0, 0, 1);}

        /* Cuadro login */
        .login{display:block;max-width:600px;margin:2.5% auto 2.5% auto;border:.5px solid black;padding:10px;background-color:#eee;color:#891625}
        label[for=gestion]{color:#891625;margin:.5% 0 .5% -1%;text-decoration:underline;text-decoration-color:black}
        label[for=textos]{color:#891625;}


        /* Boton de login */
        .button {position: relative;padding: 1em 1.5em;border: none;background-color: transparent;cursor: pointer;outline: none;font-size: 18px;margin: 0em 0.8em;}
        .button.type1 {color:#891625;}
        .button.type1.type1::after, .button.type1.type1::before {content: "";display: block;position: absolute;width: 20%;height: 20%;border: 2px solid;transition: all 0.6s ease;border-radius: 2px;}
        .button.type1.type1::after {bottom: 0;right: 0;border-top-color: transparent;border-left-color: transparent;border-bottom-color: #891625;border-right-color: #891625;}
        .button.type1.type1::before {top: 0;left: 0;border-bottom-color: transparent;border-right-color: transparent;border-top-color:#891625 ; /*#566473*/border-left-color: #891625;}
        .button.type1.type1:hover:after, .button.type1.type1:hover:before {width: 100%;height: 100%;}
        

        /* Ventana Modal LanzaAviso */
        .modal-open .modal{display: flex;justify-content: center;align-items: center;}


        .rojo{border:red solid 1px;}
        
        @media (max-width: 1920px){
            .cuadro_princi2{height:5.5vh}
        }
        @media (max-width: 1920px){
            .cuadro_princi2{height:5.5vh}
        }
    </style>
    <script type="text/javascript">

        function LanzaAviso(Text) {
            bootbox.alert({ title: "ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA", message: Text, size: 'large' });
        }

        //Funcion que nos comprueba si los inputs están vacios y sino lo están, comprobamos los datos en la bD.
        function comprobar_campos_vacios() {

            var comprueba = document.getElementById("input_mail").value;
            var comprueba2 = document.getElementById("input_password").value;

            if ((comprueba == "") || (comprueba == null) || (comprueba.Lenght == 0) || (comprueba2 == "") || (comprueba2 == null) || (comprueba2.Lenght == 0)) {
                LanzaAviso("Por favor compruebe los datos ya que, no pueden estar <span style='color:red'>vacios</span>. Gracias!");
            }
            else {
                if (ComprobarEmail(comprueba)) {
                    preformateo(comprueba);
                    preformateo(comprueba2);
                    loader_gif();
                    //__doPostBack();
                    setTimeout(prueba(), 3000);
                }
            }
        }

        //funcion que nos comprueba el mail.
        function ComprobarEmail(Email) {
            //Comprobamos que el Email introducido por el usuario tenga el formato correcto. Ej: prueba@prueba.com
            return (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(Email))
        }

        //funcion que nos preformatea el string que le pasemos dejandolo sin espacios blanco a izq. y der.
        function preformateo(x) {
            if (typeof String.prototype.trim !== 'function') {
                String.prototype.trim = function() {
                    return this.replace(/^\s+|\s+$/g, '');
                }
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

        function mensaje() {
            LanzaAviso("Por favor compruebe los datos ya que, no pueden estar <span style='color:red'>vacios</span>. Gracias!");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
       <div class="container-fluid logotipo">
           <img src="img/banner.jpg"  />
       </div>
       <div class="container-fluid login">
           <div class="col-xs-12">
               <label for="gestion">Gestión de la Intranet</label>
           </div>           
           <div class="col-xs-6" style="padding:10px;color:#eee">
               <label for="textos">Email: </label>
               <input type="text" class="form-control inputs_login" placeholder="Introduzca su Email" id="input_mail" runat="server" />
           </div>
           <div class="col-xs-6" style="padding:10px;color:#eee">
               <label for="textos">Contraseña: </label>
               <input type="password" class="form-control inputs_login" id="input_password" placeholder="Introduzca su Contraseña" runat="server" />
           </div>
           <div class="col-xs-12" style="padding:10px;">
              <button type="submit" id="login_intranet" style="display: block; margin-left: auto; margin-right: auto;" class="button type1" onclick="">Login</button>
           </div>
       </div>
    </form>
</body>
</html>
