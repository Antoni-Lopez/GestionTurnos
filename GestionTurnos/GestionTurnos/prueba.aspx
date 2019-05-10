<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="prueba.aspx.vb" Inherits="GestionTurnos.prueba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Impresión ticket de Persona</title>
    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>
    <style>
        /* Formateamos el body para que se apliquen nuestros stilos perfect (-;*/
        body{margin: 0;padding: 0;box-sizing:border-box;}

        /* Principal Style */
        .mi_container{padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;}
        .principal{max-width: 300px;width: 100%;margin:auto; margin-top: 1%;height:320px;background-color: #fff;}
        .principal h3,.principal h4,.principal p{text-align: center;}
        .principal h3{margin-top: .5%;}
        #poner_name{font-weight:bold;}
        .principal h3{margin-top:20px;}
        .codigo_qr{width: 125px; height: 125px; display:block;margin:auto;margin-top: 10px;}
    </style>
    <script type="text/javascript">        
         //funcion que nos realiza la acción que queramos en la carga de la web.
        function addLoadEvent(func) {
            var oldonload = window.onload;
            if (typeof window.onload != 'function') {
                window.onload = func;
            }
            else {
                window.onload = function () {
                    oldonload();
                    func();
                }
            }
        }
        addLoadEvent(cuandocargamos);


        //Funcion para la impresión del codigo Qr cuando el Delegado pulse sobre el boton imprimir ticket
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


        //Cuando cargamos la pagina, con esta funcion le damos 2 ordenes
        //Al sistema, 1º, recuperá los valores pasados por QueryStream
        //Y la 2º, sería pasar a la ventana modal de chrome de imprimir.
        function cuandocargamos() {
            recuperar_valores_querystream();
            PrintWindow();
        }
        //Recuperamos los valores pasados por QueryStream
        function getUrlParameter(name) {
            name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
            var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
            var results = regex.exec(location.search);
            return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
        };

        function recuperar_valores_querystream() {
            var nombre, apellidos, especialiti;
            nombre = getUrlParameter('name');
            apellidos = getUrlParameter('ape');
            especialiti = getUrlParameter('opt_select');

            document.getElementById("poner_name").innerHTML = nombre
            document.getElementById("poner_apes").innerHTML = apellidos
            document.getElementById("category").innerHTML = especialiti

            //poner_name.Text = nombre
        }
    </script>
</head>
<body> 
    <div class="mi_container principal">
        <h3><span id="poner_name"></span><br />
        <span id="poner_apes"></span></h3>
        <h3 id="category">Medicina Interna</h3>
        <img class="codigo_qr" src="img/Qr_Generado.jpg" />
    </div>
</body>
</html>


