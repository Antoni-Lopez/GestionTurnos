<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Plantilla3.aspx.vb" Inherits="GestionTurnos.Plantilla3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Reserve la fecha, EDM - Seminario Institucional 10 de Octubre</title>
</head>
<body>
    <style>
    body {
        background: #fff;
        font-weight: normal;
        font-family: 'Open Sans', Arial, Helvetica, sans-serif;
        line-height: 20px;
    }
</style>
    <form id="form1" runat="server">        
        <!-- Encabezado REFRESH -->
        <table width="100%">
            <tr>
                <td align="center" valign="top">
                    <img src="img/RESERVEDM.jpg" />
                </td>
            </tr>
            <tr>
                <td>
                    <table width="600" align="center"  style=" padding:10px;text-align:justify;color:#00ccff;font-size:12px;">
                        <div style="margin-left: 0; width: 100%; background-color: #fff; text-align: center; padding: 10px;">
                            <p>Si no visualiza correctamente el Email por favor  <a href="http://towerplane.com/" style="color:#808080;"> pulse aquí</a></p>
                        </div>
                        <tr>
                            <td>
                                <div style="color:#0080ff;line-height:15px;">
                                    Este mensaje es privado y confidencial y solamente para su destinatario. Si usted ha recibido este mensaje por error, no debe revelar, copiar, distribuir o usarlo en ningún sentido. Le rogamos lo comunique al remitente y borre dicho mensaje y cualquier documento adjunto que pudiera contener. No hay renuncia a la confidencialidad ni a ningún privilegio por causa de transmisión errónea o mal funcionamiento. Los correos electrónicos no son seguros, no garantizan la confidencialidad ni la correcta recepción de los mismos, dado que pueden ser interceptados, manipulados, destruidos, llegar con demora, incompletos, o con virus. La empresa no se hace responsable de las alteraciones que pudieran hacerse al mensaje una vez enviado.
                                    Le informamos de que sus datos serán tratados bajo la responsabilidad de <span style="font-weight:bold;">RPA EVENTS S.L.</span> para el envío de comunicaciones propias de la relación contractual existente y se conservarán mientras que exista un mutuo interés para ello. Si no desea seguir recibiendo comunicaciones a través de esta vía o si desea retirar su consentimiento, ejercitar sus derechos de acceso, rectificación, portabilidad, supresión, limitación u oposición o presentar una reclamación ante la Autoridad de control (agpd.es) si considera que el tratamiento no se ajusta a la normativa vigente, puede hacerlo enviando una solicitud por escrito a <span style="font-weight:bold;">RPA EVENTS S.L. Calle de Claudio Coello, 41, 28001 Madrid</span> o a través de correo electrónico <span style="font-weight:bold;">rpa@rpacomunicacion.com</span>, junto con prueba válida en derecho, como fotocopia del D.N.I. e indicando en el asunto <span style="font-weight:bold;">'PROTECCIÓN DE DATOS'.</span>
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
            idferia = "211";

            Send_Mail.innerHTML = "<img src='img/ajax-loader.gif' alt='loading' /> Enviando Email";

            Dades = idferia;

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
