<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Plantilla2.aspx.vb" Inherits="GestionTurnos.Plantilla2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA</title>
</head>
<body>
    <style>
        body {background: #eeeeee;font-weight: normal;font-family: 'Open Sans', Arial, Helvetica, sans-serif;line-height: 20px;}
        .Taula1 { background-color: #ffffff;border-collapse: collapse;}
        .TipusTD1, .TipusTD2, .TipusTD3 {padding-left: 10px;padding-right: 10px;text-align: left;vertical-align: top;}
        .TipusTD2 {vertical-align: middle;height: 40px;max-width: 200px;width: 100%;}
        .TipusTD3 {font-size: 10px;line-height: 14px;}
    </style>
    <!-- Encabezado REFRESH -->
    <table width="600" style="display: block; margin-left: auto; margin-right: auto;">
        <tr>
            <td>
                <p style="text-align: center; font-size: 15px">Si no visualiza correctamente el Email por favor pulse <a href="#">aquí</a></p>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <table class="Taula1" width="600">
                    <tbody>
                        <tr>
                            <td align="center" style="border-bottom: 0px solid #685c4f;">
                                <img src="img/banner.jpg" alt="ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA" width="600" border="0" /></a>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-bottom: 0 px solid #685c4f;">
                                <table width="100%">
                                    <tbody>
                                        <tr>
                                            <td style="width: 20%">&nbsp;</td>
                                            <td><h4 style="text-align: center; font-size: 17px;">Bienvenido a la Reunión Anual de </td></h4>
                                            <td style="width: 20%">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 20%">&nbsp;</td>
                                            <td><h4 style="margin-top: -5%; text-align: center; font-size: 17px; margin-bottom: 5%;"><strong><u>ASUNTOS JURÍDICOS Y REGULATORIOS</u></strong></h4></td>
                                            <td style="width: 20%">&nbsp;</td>
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
                                                <p style="text-align: justify; font-size: 15px; width: 95%; display: block; margin-left: auto; margin-right: auto; padding: 10px; text-align: justify;">Muchas gracias por su confirmación de asistencia. La información de su registro se ha realizado correctamente para la Reunión Anual de ASUNTOS JURÍDICOS Y REGULATORIOS 2019.</p>
                                                <p>Puede descargarse la App haciendo click desde su smartphone en el siguiente link, o tecleando la dirección web en el navegador de su teléfono móvil (Valido para IOS & Android).</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="100%">
                                                    <tr>
                                                        <td style="width: 30%">&nbsp;</td>
                                                        <td height="100">
                                                            <a href="http:raa.femsa.com/app.htm" style="text-decoration: none; color: red; text-align: center; background-color: #7C0027; color: #fff; line-height: 25px">http:raa.femsa.com/app.htm</a>
                                                        </td>
                                                        <td style="width: 30%">&nbsp;</td>
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
                                                    <td style="width: 30%">&nbsp;</td>
                                                    <td style="border-bottom: 0px solid #685c4f; padding-bottom: 5px; padding-top: 7px; padding: 10px; margin-bottom: 2%; background-color: #FFD8D8; margin-top: 1.5%; height: auto;">
                                                        <p style="text-align: justify; font-size: 13.8px;">-User: <a href="#">jsmateo@towerplane.com</a></p>
                                                        <p style="text-align: justify; font-size: 15px;">-Password: <span style="font-weight: bold;">1111</span></p>
                                                    </td>
                                                    <td style="width: 30%">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 30%">&nbsp;</td>
                                                    <td align="center">
                                                        <img src="img/qr/A71PJ48M.jpg" title="A71PJ48M.jpg" style="box-shadow: 0px 0px 0px rgba(0, 0, 0, 0); width: 150px;" />
                                                        <p>A71PJ48M</p>
                                                    </td>
                                                    <td style="width: 30%">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
    <button type="button" id="Send_Mail" runat="server" onclick="Registre()">Enviar Email</button>
    <script type="text/javascript" src="../Script/ComunicacioAJAX.js"></script>
    <script type="text/javascript">   
        function Registre() {
            var Dades;

            var email, idferia, nombre, apellido;
            email = "jsmateo@towerplane.com";
            idferia = "210";
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
