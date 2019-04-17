<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="loginform2.aspx.vb" Inherits="GestionTurnos.loginform2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <!-- CSS y distintas librerias -->

    <asp:literal id="bootstrap_min_css" runat="server"></asp:literal>
    <asp:literal id="jquery_1_9_1_min_js" runat="server"></asp:literal>
    <asp:literal id="bootstrap_min_js" runat="server"></asp:literal>
    <asp:literal id="bootbox_min_js" runat="server"></asp:literal>
    <style>
        /* Colores para ver visualmente que realiza cada nomenclatura de BootStrap.*/
        .verde {border: 2px solid green;}
        .rojo {border: 2px solid red;}
        .amarillo {border: 2px solid yellow;}
        .azul {border: 2px solid blue;}
        .rosa {border: 2px solid pink;}

        /* Cuadro para el banner */
        .banner{max-width: 810px;margin:auto;margin-top: 2.5%;border: 1px solid black;padding: 10px;height: 391px;background-color: #fff;box-shadow: 0px 0px 25px 1px rgba(0,0,0,0.75);}
        .my_img{width: 103%;margin-left:-1.3%;margin-top:-1.3%;height: 391px;}

        /* Instrucciones para el login */
        .cabecera{margin-top: 3.5% !important;border-radius: 6px;background-color: #E07C1A;color: #fff;font-size: 22px;padding-left: 20px;}
        .panel{margin-top: .2% !important;background-color: #D4D4D4;font-size: 16px;}
        .cabecera,.panel{max-width: 560px;width: 100%;padding: 10px;margin: auto;border: 2px solid black;}
        .text-muted{color: #C80C1B;font-weight: bold;font-size: 78%;}

        /* Checkbox personalizado */
        .bg {height: 100%;display: flex;align-items: center;justify-content: center;flex-direction: column;}
        .span_pseudo, .chiller_cb span:before, .chiller_cb span:after {content: "";display: inline-block;background: #fff;width: 0;height: 0.2rem;position: absolute;transform-origin: 0% 0%;}
        .chiller_cb {position: relative;height: 2rem;display: flex;align-items: center;}
        .chiller_cb input {display: none;}
        .chiller_cb input:checked ~ span {background: #E07C1A;border-color: #E07C1A;}
        .chiller_cb input:checked ~ span:before {width: 1rem;height: 0.15rem;transition: width 0.1s;transition-delay: 0.3s;}
        .chiller_cb input:checked ~ span:after {width: 0.4rem;height: 0.15rem;transition: width 0.1s;transition-delay: 0.2s;}
        .chiller_cb input:disabled ~ span {background: #ececec;border-color: #dcdcdc;}
        .chiller_cb input:disabled ~ label {color: #dcdcdc;}
        .chiller_cb input:disabled ~ label:hover {cursor: default;}
        .chiller_cb label {padding-left: 2rem;position: relative;z-index: 2;cursor: pointer;margin-bottom:0;}
        .chiller_cb span {display: inline-block;width: 1.2rem;height: 1.2rem;border: 2px solid #ccc;position: absolute;left: 0;transition: all 0.2s;z-index: 1;box-sizing: content-box;}
        .chiller_cb span:before {transform: rotate(-55deg);top: 1rem;left: 0.37rem;}
        .chiller_cb span:after {transform: rotate(35deg);bottom: 0.35rem;left: 0.2rem;}

        /* Boton envio */
        .enviar{
            margin-left: 42%;
            margin-top: 4%;
        }

        /* Media Querys para diseño Responsive.*/
        @media (max-width: 810px) {
            .cabecera,.panel{max-width: 360px;width: 100%;}
        }
    </style>
     <script type="text/javascript">
         
         function ComprobarEmail(Email) {
            //Comprobamos que el Email introducido por el usuario tenga el formato correcto. Ej: prueba@prueba.com
            return (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(Email))
         }
        function LanzaAviso(Text) {
            bootbox.alert({ title: "Gestión de turnos", message: Text });
        }
        function enviar(url) {
            window.open(url);
         }
        //Funcion que hace la comprobación del Email y Password introducidos por el usuario, si hay algún error, nos lo indica a traves de LanzarAviso().
        function Comprueba() {
            if (!ComprobarEmail(document.getElementById('Email').value)) {
                LanzaAviso("Por favor, comprueba el email.");
                return False;
            }
            else {
                return True;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row banner">
            <img src="img/banner_novonordisk.jpg" class="my_img" />
        </div>
        <div class="row cabecera">Login de acceso</div>
        <div class="panel verde">
                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>                    
                    <asp:TextBox ID="Email" runat="server" CssClass="form-control input_mail"></asp:TextBox>
                    <small id="emailHelp" class="form-text text-muted">Nosotros nunca compartiremos tu email con nadie más.</small>
                </div>
                <div class="chiller_cb">
                    <input id="myCheckbox2" type="checkbox" runat="server" />
                    <label for="myCheckbox2">Recordar Email</label>
                    <span></span>
                </div>
                <asp:Button ID="validar" runat="server" class="btn btn-primary mb-2 enviar" Text="Validar" />                
        </div>
    </form>
</body>
</html>
