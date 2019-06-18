<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="GestionTurnos.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login AOTEC</title>

    <!-- CSS y distintas librerias -->

    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>

    <!-- style -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat|Rubik&display=swap" rel="stylesheet">
    
    <style>
        /* Cuerpo del Website */
        body{margin:auto;padding:0;box-sizing:border-box;background-image: url("img/Aotec.jpg");background-size: cover;}

        /* Logotipo de la Organización */
        .logo_img{border: groove solid 1.2px;max-width:830px;width:100%;margin:auto;margin-top:2.5%;-webkit-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);-moz-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);}
        .logo_img img{margin:0;padding:0;box-sizing:border-box;margin-left: -1.7%;width:103.6%;}

        /* Contenedor Principal */
        #div_principal{max-width:700px;width:100%;border:Black solid 2px;border-radius:5px;background-color:#e9e9e9;margin:auto;margin-top:1%;height: 25vh;}

        .header_principal{border-bottom:#DA9734 solid 3.2px;width:104.6%;padding:10px;text-align:justify;font-family: 'Montserrat', sans-serif;}
        .header_principal h2 b{margin-left: 5%;}

        .login_centrar{width:100%;}
        .login_centrar2{width:100%;}
        .login_centrar,.login_centrar2,login_centrar3{padding:10px;}

        .label_texto{width:40%;padding:5px;}
        .label_texto label[for=staticEmail],.label_texto label[for=staticPass]{padding: 7px;width: 100%;font-family: 'Rubik', sans-serif;font-size:20px}
        .div_inputs{width:60%;padding:5px;}

        .boton_validate{text-decoration: none;padding: 10px;font-weight: 600;font-size: 20px;color: #ffffff;background-color: #DB9832;border-radius: 6px;border: 2px solid #D9D9D9;max-width:150px;width:100%;display:block;margin-left:auto;margin-right:auto;margin-top:2.5%;}
        .boton_validate:hover{color: #DB9832;background-color: #ffffff;}

        /* LanzaAviso */
        .modal-lg{position: absolute;top:50%;left: 50%;transform: translate(-50%,-50%) !important;max-width: 50%;}

        /* Div Oculto */       
        #input_oculto{display:none;}

        /* Media Querys */
        @media (max-width: 1920px) {          
          #div_principal{height:35vh !important;}
        }
    </style>

    <script type="text/javascript">
        //$(document).ready(function() {    
        //    $('#miButton').on('click', function(){
        //        //Añadimos la imagen de carga en el contenedor
        //        $('#miButton').html('Validando <img src="img/ajax-loader.gif" alt="loading" /><br/>');
        //        Registre();

        //        //$.ajax({
        //        //    type: "POST",
        //        //    url: "ajax.php",
        //        //    success: function(data) {
        //        //        //Cargamos finalmente el contenido deseado
        //        //        $('#mIprueba').fadeIn(1000).html(data);
        //        //    }
        //        //});
        //        //return false;
        //    });              
        //    });    

        function LanzaAviso(Text) {
            bootbox.alert({ title: "AOTEC 2019", message: Text, size: 'large' });

        }

        function loader_gif() {
            var texto = "<h4 style='text-align:center;'>Validando <img src='img/ajax-loader2.gif' alt='loading' /><br/>"
            //LanzaAviso(texto);
            setTimeout(LanzaAviso(texto), 3000);
            //$('#miButton').html('Validando <img src="img/ajax-loader.gif" alt="loading" /><br/>');
            //setTimeout($('#miButton').html('Validando <img src="img/ajax-loader.gif" alt="loading" /><br/>'), 2000);        
        }
        function comprueba_data() {
            email = document.getElementById("input_mail").value;
            password = document.getElementById("input_pass").value;

            long_mail = email.length;
            long_pass = password.length;

            if ((long_mail == 0) || (long_pass == 0)) {  //Comprobamos que ninguno de los inputs (tanto el de tipo mail, como el de password) esten vacios. Como son OBLIGATORIOS, no pueden star vacios.
                LanzaAviso("<h4>Lo sentimos pero ambos campos son <span style='color:red;'>OBLIGATORIOS</span> y no puedes dejar ninguno vacio.</h4>");
                return false;
            }
            else {
                if (ComprobarEmail(email) == false) { //Comprobamos que el Email este en un formato correcto.
                    LanzaAviso("<h4>Lo sentimos pero el campo email debe estar en el formato correcto: <span style='color:red;'>prueba@towerplane.com</span>.</h4>");
                    return false;
                }
                else {
                    if (long_pass <= 3) { //comprobamos que la pass tenga una longitud mínima de 4.
                        LanzaAviso("<h4>Lo sentimos pero el campo contraseña debe contener al menos <span style='color:red;'>4 caracteres</span>.</h4>");
                        return false;
                    }
                    else {
                        var texto = "<h4 style='text-align:center;'>Validando <img src='img/ajax-loader2.gif' alt='loading' /><br/>"
                        LanzaAviso(texto);
                    }
                }
            }
        }

        function ComprobarEmail(Email) {
            //Comprobamos que el Email introducido por el usuario tenga el formato correcto. Ej: prueba@prueba.com
            return (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(Email))
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid logo_img" onclick="comprueba_data();">
            <img src="img/aotec_img.jpg" />
        </div>
        <div id="div_principal" class="container-fluid principal">
            <div class="row header_principal">
                <h2><b>Login de Acceso</b></h2>
            </div>
            <div class="row login_centrar">
                <div class="col-xs-6 col-md-4 label_texto">
                     <label for="staticEmail" class="col-sm-2 col-form-label">Email <span style="color:red;">*</span></label>
                </div>
                <div class="col-xs-6 col-md-4 div_inputs">
                    <%--<input id="input_mail" class="form-control form-control-sm" type="text" placeholder="Introduzca su Email " runat="server">--%>
                    <asp:TextBox ID="input_mail" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row login_centrar2">
                <div class="col-xs-6 col-md-4 label_texto">
                     <label for="staticPass" class="col-sm-2 col-form-label">Password <span style="color:red;">*</span></label>
                </div>
                <div class="col-xs-6 col-md-4 div_inputs">
                    <%--<input id="input_pass" class="form-control form-control-sm" type="password" placeholder="Introduzca su Contraseña " runat="server">--%>
                    <asp:TextBox ID="input_pass" CssClass="form-control form-control-sm" TextMode="Password" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row pos_buton">
                <%--<input type="button" class="boton_validate" id="miButton" onclick="Registre()" value="Validar" />--%>
                <%--<button class="boton_validate" id="miButton" onclick="Registre()" type="button" runat="server">Validar</button>--%>
                <asp:Button CssClass="boton_validate" ID="miButton" Text="Validar" runat="server" />
            </div>
        </div>
        <asp:TextBox ID="input_oculto" ReadOnly="false" runat="server" CssClass="form-control  "></asp:TextBox>
    </form>
</body>
</html>
