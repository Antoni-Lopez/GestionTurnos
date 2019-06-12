<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Probando_cositas.aspx.vb" Inherits="GestionTurnos.Probando_cositas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <!-- CSS y distintas librerias -->

    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>

    <script src="https://code.jquery.com/jquery-3.2.1.js"></script> <%--Jquery--%>

    <!-- style -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat|Rubik&display=swap" rel="stylesheet">
    <style>
        body{margin:0;padding:0;box-sizing:border-box;position: relative;}
        #particles-js{background-color: #494949;height:100vh;width:100%;z-index:0}

        .logo_img{border: groove solid 1.2px;position:absolute;max-width:830px;width:100%;left: 50%;
            top: 20%;transform: translate(-50%, -50%);-webkit-transform: translate(-50%, -50%);
            -webkit-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);-moz-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);}
        .logo_img img{margin:0;padding:0;box-sizing:border-box;margin-left: -1.7%;width:103.6%;}
        .principal{position:absolute;max-width:700px;width:100%;border:#fff solid 2px;background-color:#e9e9e9;
            display: flex;justify-content: center;align-items: center;left: 50%;top: 60%;transform: translate(-50%, -50%);
            -webkit-transform: translate(-50%, -50%);opacity: 0.9;height: 30vh;}
        .header_principal{position:absolute;top:0;left:2%;border-bottom:#DA9734 solid 3.2px;width:100.5%;padding:10px;text-align:justify;font-family: 'Montserrat', sans-serif;}
        .header_principal h2 b{margin-left: 5%;}

        .login_centrar{width:100%;}
        .login_centrar2{width:100%;margin-top: 15%;margin-left: -97.8%;}
        .login_centrar,.login_centrar2,login_centrar3{padding:10px;}

        .label_texto{width:40%;padding:5px;}
        .label_texto label[for=staticEmail],.label_texto label[for=staticPass]{padding: 7px;width: 100%;font-family: 'Rubik', sans-serif;font-size:20px}
        .div_inputs{width:60%;padding:5px;}

        .boton_validate{text-decoration: none;padding: 10px;font-weight: 600;font-size: 20px;color: #ffffff;background-color: #DB9832;border-radius: 6px;border: 2px solid #D9D9D9;position: absolute;top: 84%;left: 43%;}
        .boton_validate:hover{color: #DB9832;background-color: #ffffff;}

        /* LanzaAviso */
        .modal-lg{position: absolute !important;top: 50% !important;left: 50% !important;transform: translate(-50%, -50%) !important;}

        .verde{border:green 2px solid;}
        .rojo{border: red 2px solid;}

        #mIprueba{position: absolute;top: 104%;left: 43%;border: blue solid 2px;}

        @media (max-width: 1920px) {
          .logo_img{top: 25%;}
          .principal{top: 70%;height:35vh;}
        }

    </style>

    <!-- scripts -->
    <script src="Script/particles.js"></script>
    <script src="Script/app.js"></script>

    <script type="text/javascript">
    //$(document).ready(function() {    
    //    $('#miButton').on('click', function(){
    //        //Añadimos la imagen de carga en el contenedor
    //        $('#miButton').html('Validando <img src="img/ajax-loader.gif" alt="loading" /><br/>');
 
    //        $.ajax({
    //            type: "POST",
    //            url: "ajax.php",
    //            success: function(data) {
    //                //Cargamos finalmente el contenido deseado
    //                $('#mIprueba').fadeIn(1000).html(data);
    //            }
    //        });
    //        return false;
    //    });              
    //    });    

        function LanzaAviso(Text) {
            bootbox.alert({ title: "AOTEC 2019", message: Text , size: 'large' });
            
        }

        function prueba() {
            var miprueba = ["OK9¦Jose"];
            var long_miprueba,nom,nom2,nom3,nom4,nombre;

            nom = miprueba[0];
            nom2 = nom.length;
            nom3 = nom.split("¦");
            nom4 = nom3[1];
            //long_miprueba = miprueba.split("¦");
            //alert(long_miprueba);
            alert(nom);
            alert(nom2);
            alert(nom3);
            alert(nom4);
        }
    </script>

</head>
<body id="particles-js">
    <form id="form1" runat="server">
        <div class="container-fluid logo_img" onclick="Registre();">
            <img src="img/aotec.jpg" />
        </div>
        <div class="container-fluid principal">
            <div class="row header_principal">
                <h2><b>Login de Acceso</b></h2>
            </div>
            <div class="row login_centrar">
                <div class="col-xs-6 col-md-4 label_texto">
                     <label for="staticEmail" class="col-sm-2 col-form-label">Email <span style="color:red;">*</span></label>
                </div>
                <div class="col-xs-6 col-md-4 div_inputs">
                    <input id="input_mail" class="form-control form-control-sm" type="text" placeholder="Introduzca su Email " required>
                </div>
            </div>
            <div class="row login_centrar2">
                <div class="col-xs-6 col-md-4 label_texto">
                     <label for="staticPass" class="col-sm-2 col-form-label">Password <span style="color:red;">*</span></label>
                </div>
                <div class="col-xs-6 col-md-4 div_inputs">
                    <input id="input_pass" class="form-control form-control-sm" type="password" placeholder="Introduzca su Contraseña " required>
                </div>
            </div>
            <div class="row pos_buton">
                <%--<input type="button" class="boton_validate" id="miButton" onclick="Registre()" value="Validar" />--%>
                <button class="boton_validate" id="miButton" onclick="Registre()">Validar</button>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="Script/ComunicacioAJAX.js"></script>
    <script type="text/javascript">
            function Registre() {
                var Dades, email, long_mail, password, long_pass;

                email = document.getElementById("input_mail").value;
                password = document.getElementById("input_pass").value;

                long_mail = email.length;
                long_pass = password.length;

                if ((long_mail == 0) || (long_pass == 0)) {  //Comprobamos que ninguno de los inputs (tanto el de tipo mail, como el de password) esten vacios. Como son OBLIGATORIOS, no pueden star vacios.
                    LanzaAviso("<h4>Lo sentimos pero ambos campos son <span style='color:red;'>OBLIGATORIOS</span> y no puedes dejar ninguno vacio.</h4>");
                }
                else { //No estan vacios continuamos...
                    Dades = email + "¦" + password;                    
                    setTimeout("InformacioAJAX(8,\"" + Dades.replace(/"/g, "'").replace(/\n/g, "\\n") + "\", 'Registre_Tornada', 'RecepcionAJAX.aspx')", 2000);
                    $('#miButton').html('Validando <img src="img/ajax-loader.gif" alt="loading" /><br/>');
                }
            }           

        function Registre_Tornada(Dades) {
            alert(Dades);
            var nom,Dades2;
            Dades2 = Dades.split("¦");
            nom = Dades2[1];
            alert(nom);


            if (Dades.substr(0, 2) == "OK") {
                if (Dades.substr(2, 1) == "9") {                    
                   $('#miButton').html('Validado');
                    LanzaAviso("<h4>Hemos verificado sus datos. Gracias " + nom + "!</h4>");
                }
            }
            else {
                if (Dades.substr(2, 1) == "9") {
                    LanzaAviso("<h4>No hemos encontrado su Email o su Contraseña en nuestra Base de Datos. Vuelva a repetir el proceso por favor!</h4>");
                }
            }
        }
    </script>
</body>
</html>
