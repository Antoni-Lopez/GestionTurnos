<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Printer.aspx.vb" Inherits="GestionTurnos.Printer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- CSS y distintas librerias -->

    <asp:literal id="bootstrap_min_css" runat="server"></asp:literal>
    <asp:literal id="jquery_1_9_1_min_js" runat="server"></asp:literal>
    <asp:literal id="bootstrap_min_js" runat="server"></asp:literal>
    <asp:literal id="bootbox_min_js" runat="server"></asp:literal>

    <title></title>
    <script type="text/javascript">

        function addLoadEvent(func) { 
                var oldonload = window.onload; 
                if (typeof window.onload != 'function') { 
                    window.onload = func; 
                } 
                else { 
                    window.onload = function() { 
                        oldonload(); 
                        func(); 
                    } 
                } 
            } 
            addLoadEvent(PrintWindow); 
        function PrintWindow() {

            var isIE11 = !!navigator.userAgent.match(/Trident.*rv[ :]*11\./);
            if (navigator.appName == "Microsoft Internet Explorer" || isIE11== true) {

                var PrintCommand = '<OBJECT ID="PrintCommandObject" WIDTH=0 HEIGHT=0 ';
                PrintCommand += 'CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
                document.body.insertAdjacentHTML('beforeEnd', PrintCommand);
                PrintCommandObject.ExecWB(6, 2); PrintCommandObject.outerHTML = "";
                window.close();

            }

            else {
                  window.print();
            }

          }
</script>
    <style type="text/css">
        /*
        .cont_principal{margin: -10px 1% 0 -20px;max-width: 600px;height: auto;}
        .img_logo{margin:auto;width:65%;margin-left: 23.5px;margin-top: -10px;}
        .img_qr{margin-top: 5%;z-index: 1;width:25%;margin-left: 23.5px;}
        .direccion{margin-left: 35px; width: 50%;height: 50px;}
        .dire{font-size: 14px;margin-left: -7.5px;}
        .ciudad{margin-top: 5px;}
        .fecha_hora{padding: 10px;margin-left: -44px;margin-top: -10px;}
        .servicio{margin-left: -44px;}
        .mensa_servicio, .servicio{padding: 10px;}
        .mensa_servicio{ text-align: right;}
        .su_turno{margin-top: 2.5%;}
        .ciudad,.direccion,.fecha,.hora,.su_turno,.servicio,.texto_descarga,.fecha_hora,.mensa_servicio{font-size: 18px;}
        .direccion,.fecha,.hora,.su_turno,.texto_descarga,.vista_turno,.fecha_hora,.servicio{text-align: center;}
        .cuadro{position:absolute; margin: 2px 25% 2px 40px; width: 50%;height: 100px; border: 2px solid black;}
        .vista_turno{font-size: 120px;padding: 10px; margin-left: 35px; width: 50%;margin-top: 1.3%;  font-weight: bold;}
        .texto_descarga{margin-top: 15px; z-index: 3;position:fixed; margin-left: 48px;}

        */
        
        /* Bordes para yo aclararme.*/
        .verde {border: 2px solid green;}
        .rojo {border: 2px solid red;}
        .amarillo {border: 2px solid yellow;}
        .azul {border: 2px solid blue;}
        .rosa {border: 2px solid pink;}

        .mi_tabla{
            margin: -10px 1% 0 0;max-width: 600px;height: auto; 
        }
        td{text-align: center;}
        .img_logo{width:100%;margin-top: -17px;} /*margin-left: 23.5px*/
        .dire{font-size: 12px;}
        .servicio{font-weight:bold;}
        .vista_turno{font-size: 100px; font-weight:bold;}
        .ciudad,.fecha_hora_ticket,.servicio{font-size: 14px;}
        .img_qr{width: 60%; margin-top:2px;z-index: -2;margin-bottom: 35px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="table mi_tabla">
            <thead>
                <tr>
                    <th scope="col" class="img_logo"><asp:Literal ID="logo_banner" runat="server"></asp:Literal></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div id="adres" class="dire" runat="server">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="location" class="ciudad" runat="server">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="row fecha_hora" id="fecha_hora_ticket" runat="server"></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="row servicio" id="servicio_mostrar" runat="server"></div> 
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="row vista_turno" id="mostrar_turno" runat="server">88</div>
                    </td>
                </tr>
                <tr>
                    <td style="z-index:2;font-size: 12px;">Prueba nuestra App</td>
                </tr>
                <tr>
                    <td>
                        <asp:Literal ID="qr_img" runat="server"></asp:Literal>
                    </td>
                </tr>
            </tbody>
        </table>
        <!--
        <div id="miprueba" class="container-fluid cont_principal verde" runat="server">
            <asp:Literal ID="logo1_banner" runat="server"></asp:Literal>
            <label class="row direccion">
                <div id="adres1" class="dire" runat="server"></div>
                <div id="location1" class="ciudad" runat="server"></div>
            </label>
            
            <div class="row fecha_hora" id="fecha_hora_ticket1" runat="server">
            </div>            
            <div class="row servicio" id="servicio_mostrar1" runat="server">
            </div>          
            <div class="row vista_turno" id="mostrar_turno1" runat="server">88</div>
            <p class="row texto_descarga ">Descarga nuestra App</p>
            <asp:Literal ID="qr_img1" runat="server"></asp:Literal>
                    </div>
            -->
    </form>
</body>
</html>
