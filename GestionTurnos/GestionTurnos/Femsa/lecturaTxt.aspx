<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="lecturaTxt.aspx.vb" Inherits="GestionTurnos.lecturaTxt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Eleccion de Txt y almacenar en BD</title>
    <!-- CSS y distintas librerias -->
    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>

    <style>
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #eeeeee;
        }

        .principal {
            display: block;
            margin: 1.5% auto 1.5% auto;
            max-width: 700px;
            background-color: #fff;
            color: brown;
        }
    </style>
</head>
<body>
    <div id="insertar" runat="server" style="max-width:800px;display:block;margin-left:auto;margin-right:auto;background-color:#fff;color:black;">

    </div>

    <button type="button" id="insert_bd" style="display:block;margin-left:auto;margin-right:auto;">Insertar en BD</button>
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
