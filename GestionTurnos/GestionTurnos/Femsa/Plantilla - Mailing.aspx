<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Plantilla - Mailing.aspx.vb" Inherits="GestionTurnos.Plantilla___Mailing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Plantilla Mailing</title>

    <!-- CSS y distintas librerias -->
    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>

    <style type="text/css">
        /* Contenedor principal e IMG cabecera */
        .banner_img {display: block;margin-right: auto;margin-left: auto;margin-top: 1.5%;max-width: 600px;width: 100%;padding:10px;height: auto;border:#892132 solid 1px;margin-bottom:5%;}
        .banner_img img {max-width: 600px;width:100%;box-shadow: 0px 0px 25px rgba(0, 0, 0, 1);}

        .centrado {margin-left: 0;width: 100%;}
        .centrado p{padding:15px;font-family:Arial;text-align:justify;}

        .link_app{max-width:200px;width:100%; display:block; margin-left:auto;margin-right:auto; background-color: #7C0027; color:#fff;padding:10px;margin-top:-5%;}
        .link_app a{text-decoration:none;color:#fff;}

        .datos_app{max-width:250px;width:100%;display:block;margin-left:auto;margin-right:auto;padding:10px;text-align:center;height:75px;margin-bottom:2%;background-color:#FFD8D8;}
        /* Titulo cabecera */
        .cabecera{font-size:16px;padding:10px;margin-top:5%;font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;text-align:center;}
        .cabecera span{color:#892132;font-size:13px;font-weight:bold;text-decoration:underline;}


        .cuadro {height: 300px;}
        .verde {border: green solid 2px;}
        .azul {border: blue solid 2px;}
        .rojo {border: red solid 2px;}
        .amarillo {border: yellow solid 2px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid banner_img">
            <img src="img/banner.jpg" />
            <div class="row centrado">
                <h4 class="cabecera">Bienvenido a la Reunión Anual de: <span>ASUNTOS JURÍDICOS Y REGULATORIOS 2019</span></h4>
            </div>
            <div class="row centrado">
                <p>
                    Muchas gracias por su confirmación de asistencia. La información de su registro
                    se ha realizado correctamente para la <span>Reunión Anual de ASUNTOS JURÍDICOS Y REGULATORIOS 2019</span>.
                </p>
                <p style="margin-top:-5%;">
                    Puede descargarse la App haciendo click desde su smartphone en el siguiente link,
                    o tecleando la dirección web en el navegador de su teléfono móvil (Valido para IOS & Android).
                </p>
                <div class="row centrado link_app">
                    <a href="http:raa.femsa.com/app.htm">http:raa.femsa.com/app.htm</a>
                </div>
                <p>
                    Una vez descargada, debe identificarse usando las mismas claves que utilizó para el registro,
                    así como también se desea modificar su registro.
                </p>
                <div class="row centrado datos_app">
                    <div class="row">
                        <p style="margin-top:-5%;">-User: <a href="#">jsmateo@towerplane.com</a></p> 
                    </div>
                    <div class="row" style="margin-top:-15%;">
                        <p>-Password: 1111</p>
                    </div>
                    
                </div>
            </div>
        </div>
    </form>
</body>
</html>
