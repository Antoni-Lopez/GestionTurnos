<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Importación_MailingRPA.aspx.vb" Inherits="GestionTurnos.Importación_MailingRPA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Reserve la fecha, EDM - Seminario Institucional 10 de Octubre</title>
    <!-- CSS y distintas librerias -->
    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>
</head>
<body>
    <style>
        body {
            background: #eeeeee;
            font-weight: normal;
            font-family: 'Open Sans', Arial, Helvetica, sans-serif;
            line-height: 20px;
        }
    </style>
    <form id="form1" runat="server">
        <style>
            body {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                background-color: #eeeeee;
            }

            #insertar {
                display: block;
                margin: 25% auto 1.5% auto;
                max-width: 700px;
                background-color: #fff;
                padding: 10px;
            }

            #insertar p {
                font-size: 20px;
                font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
                color: #B20016;
            }

            #insertar p span {
                font-weight: bold;
                font-size: 22.5px;
            }
        </style>
        <script type="text/javascript">
            function LanzaAviso(Text) {
                bootbox.alert({ title: "AOTEC 2019", message: Text, size: 'large' });

            }
            function enviar() {
                window.open('loginintranet.aspx','_self');
            }
        </script>
        </head>
        <body>
            <div id="insertar" runat="server" style="max-width: 800px; display: block; margin-left: auto; margin-right: auto; background-color: #fff; color: black;">
            </div>

            <button type="button" id="insert_bd" style="display: block; margin-left: auto; margin-right: auto;" onclick="enviar()">Acceder Intranet</button>
    </form>
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
