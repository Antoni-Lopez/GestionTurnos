<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Plantilla2.aspx.vb" Inherits="GestionTurnos.Plantilla2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA</title>
</head>
<body>
    <style>
        body {
            background: #eeeeee;
            font-weight: normal;
            font-family: 'Open Sans', Arial, Helvetica, sans-serif;
            line-height: 20px;
        }

        .Taula1 {
            background-color: #ffffff;
            border-collapse: collapse;
        }

        .Link1, .Link2, .Link3, .Link4 {
            color: #d95900;
            font-weight: bold;
            font-size: 11px;
            text-decoration: none;
        }

            .Link1:hover, .Link2:hover, .Link3, .Link4:hover {
                color: #333;
                text-decoration: none;
            }

        .Link2 {
            font-size: 18px;
            font-weight: 400;
            line-height: 24px;
        }

        .Link3 {
            font-size: 10px;
        }

        .Link4 {
            font-size: 12px;
        }

        .Estil1 {
            color: #685c4f;
            font-size: 16px;
        }

        .Estil2 {
            color: #666;
            font-size: 12px;
        }

        .Estil3 {
            color: #685c4f;
            font-size: 12px;
        }

        .TipusTD1, .TipusTD2, .TipusTD3 {
            padding-left: 10px;
            padding-right: 10px;
            text-align: left;
            vertical-align: top;
        }

        .datos_user {
            max-width: 250px;
            width: 100%;
            display: block;
            margin-left: auto;
            margin-right: auto;
            padding: 10px;
            text-align: center;
            height: 75px;
            margin-bottom: 2%;
            background-color: #FFD8D8;
            margin-top: 1.5%;
            height: auto;
        }

        .qr {
            display: block;
            margin-left: auto;
            margin-right: auto;
            max-width: 150px;
            width: 100%;
            max-height: 150px;
        }
        .textos{text-align: justify;font-size: 15px;width: 95%;display: block;margin-left: auto;margin-right: auto;padding: 10px;text-align: justify; font-size: 16px;}
        .TipusTD2 {
            vertical-align: middle;
            height: 40px;
            max-width: 200px;
            width: 100%;            
        }
        .cuadro_app{display: block;margin-left: auto;margin-right: auto;background-color: #7C0027;color: #fff;padding: 10px;width:35%}

        .TipusTD3 {
            font-size: 10px;
            line-height: 14px;
        }
    </style>

    </head>

	<body>
        <div style="margin-left:0;width:100%;background-color:#fff;text-align:center;padding:10px;">
            <p>Si no visualiza correctamente el Email por favor pulse <a href="#"></a></p>
        </div>
        <!-- Encabezado REFRESH -->
        <table width="100%">
            <tr>
                <td align="center" valign="top">
                    <table class="Taula1" width="600">
                        <tbody>
                            <tr>
                                <%--<td align="center" style="border-bottom: 0px solid #685c4f; padding: 0px;">
                                    <img src="img/banner.jpg" alt="ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA" width="600" height="250" border="0"></a>
                                </td>--%>
                                <td>
                                    <img src="img/test1.jpg" title="ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA" width="600" border="0">
                                </td>
                            </tr>
                            <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <img src="img/test2.jpg" title="ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA" width="300"  border="0" style="margin-top: -5%;margin-left: .4%;" />
                                        </td>
                                        <td>
                                            <a href="http://raa.femsa.com/"><img src="img/test3.jpg" title="ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA" width="300"  border="0" style="margin-top: -5%;margin-left: -2.2%;" /></a>
                                        </td>
                                    </tr>
                                </table>    
                            </td>                            
                        </tr>
                        <tr>
                            <td>
                                <img src="img/test4.jpg" title="ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA" width="600" border="0" style="margin-top: -2%;" />
                            </td>
                        </tr>


                            <tr>
                                <td style="border-bottom: 0 px solid #685c4f;">
                                    <table width="100%">
                                        <tbody>
                                            <tr>
                                                <h4 style="margin-top: 10%; text-align: center; font-size: 17px; margin-bottom: 5%;">Bienvenido a la Reunión Anual de: <strong><u>ASUNTOS JURÍDICOS Y REGULATORIOS</u></strong></h4>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%">
                                        <tbody>
                                            <tr>
                                                <td class="TipusTD1" style="padding-top: 5px;">
                                                    <p style="text-align: justify;font-size: 15px;width: 95%;display: block;margin-left: auto;margin-right: auto;padding: 10px;text-align: justify; font-size: 16px;color:red">Muchas gracias por su confirmación de asistencia. La información de su registro se ha realizado correctamente para la Reunión Anual de ASUNTOS JURÍDICOS Y REGULATORIOS 2019.</p>
                                                    <p class="textos">Puede descargarse la App haciendo click desde su smartphone en el siguiente link, o tecleando la dirección web en el navegador de su teléfono móvil (Valido para IOS & Android).</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table width="100%">
                                                        <tr>
                                                            <td style="width:30%">&nbsp;</td>
                                                            <td>
                                                                <a href="http:raa.femsa.com/app.htm" style="text-decoration: none; color: red; text-align:center;background-color: #7C0027;color: #fff;line-height:25px">http:raa.femsa.com/app.htm</a>
                                                            </td>
                                                            <td style="width:30%"> &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </td>                                                
                                            </tr>
                                            <tr>
                                                <td class="TipusTD1">
                                                    <p class="textos">Una vez descargada, debe identificarse usando las mismas claves que utilizó para el registro, así como también se desea modificar su registro.</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <table width="100%">
                                                        <tr>
                                                            <td style="width:30%">&nbsp;</td>
                                                            <td style="border-bottom: 0px solid #685c4f; padding-bottom: 5px; padding-top: 7px;padding: 10px;margin-bottom: 2%;background-color: #FFD8D8;margin-top: 1.5%;height: auto;">
                                                                <p style="text-align: justify; font-size: 13.8px;">-User: <a href="#">jsmateo@towerplane.com</a></p>
                                                                <p style="text-align: justify; font-size: 15px;">-Password: <span style="font-weight: bold;">1111</span></p>
                                                            </td>
                                                            <td style="width:30%"> &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:30%">&nbsp;</td>
                                                            <td align="center">
                                                                <img src="img/qr/A71PJ48M.jpg" title="A71PJ48M.jpg" style="box-shadow: 0px 0px 0px rgba(0, 0, 0, 0); width: 150px;" />
                                                                <p>A71PJ48M</p>
                                                            </td>
                                                            <td style="width:30%"> &nbsp;</td>
                                                        </tr>
                                                </table>
                                            </tr>
                                            <%--<tr>   
                                                <%--<td align="center">
                                                    <img src="img/qr/A71PJ48M.jpg" style="box-shadow: 0px 0px 0px rgba(0, 0, 0, 0); width: 150px;" />
                                                </td>
                                            </tr>--%>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
<button type="button" id="Send_Mail" runat="server" onclick="Registre()">Enviar Email</button>
<script type="text/javascript" src="../Script/ComunicacioAJAX.js"></script>
<script type="text/javascript">   
    function Registre() {
        var Dades;

        var email, idferia, nombre, apellido;
        email = "jsmateo@towerplane.com";
        idferia = "202";
        nombre = "Jose";
        Apellido = "Sánchez Mateo";


        Send_Mail.innerHTML = "<img src='img/ajax-loader.gif' alt='loading' /> Enviando Email";

        Dades = email + "¦" + idferia + "¦" + nombre + "¦" + Apellido;

        setTimeout("InformacioAJAX(12,\"" + Dades.replace(/"/g, "'").replace(/\n/g, "\\n") + "\", 'Registre_Tornada', '../RecepcionAJAX.aspx')", 1000);
    }

    function Registre_Tornada(Dades) {
        if (Dades.substr(0, 2) == "OK") {
            if (Dades.substr(2, 2) == "12") {
                Send_Mail.innerHTML = "<h4 style='text-align:center;'>Email enviado!<br/>";
            }
        }
        else {
            if (Dades.substr(2, 2) == "12") {
                Send_Mail.innerHTML = "<h4 style='text-align:center;'>ERROR al Enviar el Email!<br/>";
            }
        }
    }
</script>
</body>
</html>
