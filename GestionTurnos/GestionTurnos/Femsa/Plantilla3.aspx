<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Plantilla3.aspx.vb" Inherits="GestionTurnos.Plantilla3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Pruebas</title>
</head>
<body>
    <style>
    body {
        background: #eeeeee;
        font-weight: normal;
        font-family: 'Open Sans', Arial, Helvetica, sans-serif;
        line-height: 20px;
    }

    .tabla1 {
        background-color: #ffffff;
        border-collapse: collapse;
    }
    .tabla3 {margin:-1.9% 0 0 .4%;}
</style>
    <form id="form1" runat="server">
        <div style="margin-left: 0; width: 100%; background-color: #fff; text-align: center; padding: 10px;">
            <p>Si no visualiza correctamente el Email por favor pulse <a href="#"></a></p>
        </div>
        <!-- Encabezado REFRESH -->
        <table width="100%">
            <tr>
                <td align="center" valign="top">
                    <table class="tabla1" width="600px">
                        <tr>
                            <td>
                                <img src="img/femsa1.png" alt="ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA" width="610" border="0">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="margin-top:-1.9%;">
                                    <tr>
                                        <td>
                                            <img src="img/femsa2.png" alt="ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA" width="305" border="0" />
                                        </td>
                                        <td>
                                            <a href="towerplane.com" style="margin-left:-2%"><img src="img/femsa3.png" alt="ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA" width="305" height="65.44px" border="0" /></a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>

                                <div class="tabla3">
                                    <img src="img/femsa4.png" alt="ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA" width="607.5" border="0">
                                </div>                                     
                            </td>
                        </tr>
                    </table>
                    </td>
                </tr>
        </table>
        <button type="button" id="Send_Mail" style="display: block; margin-left: auto; margin-right: auto;" onclick="Registre()">Enviar Email</button>
    </form>
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

            setTimeout("InformacioAJAX(14,\"" + Dades.replace(/"/g, "'").replace(/\n/g, "\\n") + "\", 'Registre_Tornada', '../RecepcionAJAX.aspx')", 1000);
        }

        function Registre_Tornada(Dades) {
            if (Dades.substr(0, 2) == "OK") {
                if (Dades.substr(2, 2) == "14") {
                    Send_Mail.innerHTML = "<h4 style='text-align:center;'>Email enviado!<br/>";
                }
            }
            else {
                if (Dades.substr(2, 2) == "14") {
                    Send_Mail.innerHTML = "<h4 style='text-align:center;'>ERROR al Enviar el Email!<br/>";
                }
            }
        }
    </script>
</body>
</html>
