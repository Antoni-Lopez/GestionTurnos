<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Servicios.aspx.vb" Inherits="GestionTurnos.Servicios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- CSS y distintas librerias -->

    <asp:literal id="bootstrap_min_css" runat="server"></asp:literal>
    <asp:literal id="jquery_1_9_1_min_js" runat="server"></asp:literal>
    <asp:literal id="bootstrap_min_js" runat="server"></asp:literal>
    <asp:literal id="bootbox_min_js" runat="server"></asp:literal>


    <link href="Css/css_querys.css" rel="stylesheet" type="text/css" /> <!-- Css para las Media Querys -->    
    <link href="Css/servicios.css" rel="stylesheet" type="text/css" /> <!-- Css mio -->
    <title>Servicios disponibles.</title>
    <script type="text/javascript">
        function cuandoCargue() {

            //Aquí deberiamos de recibir a traves de la URL la información necesaria a mostrar.
            //Este tipo de información sería tal que: "Logo Compañia", "Direccion", "Telefono", etc.
            //Ahora lo dejo añadido por JavaScript para poder visualizar el efecto deseado.
            var container = document.getElementById('text_banner');
            var mensaje = "Cristo de la Epidemia, 52, Málaga";

            

            //ahora metemos la img en el div
            document.getElementById('imagen_banner').src = "img/PEINARTE-LOG0.png";
            container.innerHTML = mensaje;

            //También deberemos recibir por parametro un número que sea
            //el que nos diga como ordenaremos los contenedores.
            var numero = prompt("Dime un número entre 1 y 6");
            if (numero >= 7) {
                LanzaAviso("Lo sentimos, el número debe estar entre 1 y 6. Gracias!");
            }
            else {
                LanzaAviso(""+numero+"");                
                switch (numero) {                     
                    case 0:
                       LanzaAviso("Lo sentimos, el número debe estar entre 1 y 6. Gracias!");
                        break;
                    case 1:
                        break;
                    case 2:
                        LanzaAviso("estoy");
                        break;
                    case 3:
                         LanzaAviso("estoy");
                        break;
                    case 4:
                        break;
                    case 5:
                        breaK;                        
                    case 6:
                        break;

                }
            }
        }
        function LanzaAviso(Text) {
                bootbox.alert({ title: "Gestión de turnos", message: Text });
        }
        function enviar(url) {
            window.open(url);
        }
    </script>
    <style type="text/css">
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid container_principal">
            <div id="banner_header" class="row">
                <asp:Literal ID="logo_img" runat="server"></asp:Literal>
                <div  class="col-md-6" id="text_banner" runat="server"></div>
            </div>
            <div class="row centrarlo" id="OrdenFilas" runat="server">
            </div>
        </div>
    </form>
</body>
</html>
