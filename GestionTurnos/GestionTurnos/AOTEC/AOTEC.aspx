<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AOTEC.aspx.vb" Inherits="GestionTurnos.AOTEC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Formulario Satisfacción AOTEC</title>
    <!-- CSS y distintas librerias -->

    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>

    <link rel="stylesheet" type="text/css" href="../Css/segment.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="../Script/segment.js"></script>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            position: relative;
        }

        #particles-js {
            background-color: #494949;
            height: 100vh;
            width: 100%;
            z-index: 0
        }

        /* Div para el logo*/
        .logo_aotec {
            height: 385px !important;
            max-width: 830px;
            width: 100%;
            left: 50%;
            margin-top: .9%;
            top: 20%;
            transform: translate(-50%, -50%);
            -webkit-transform: translate(-50%, -50%);
            height: auto;
            position: absolute;
            -webkit-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
            -moz-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
            box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);
        }

            .logo_aotec img {
                margin-left:-1%;
                width: 103%;
            }

        /* Div Principal donde dispondremos de los RadioButtons y de todo el contenido. */
        #principal {
            max-width: 800px;
            width: 100%;
            position: absolute;
            top: 49%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        /* Div servicios*/
        #tv,#internet{display:none;}

        /* segment like IOS library*/
        .ui-segment {width: 100% !important;}
        .ui-segment span.option {height: 45px;width: 25%;}
        .ui-segment span.option {padding-top: 10px;}


        .verde {
            border: green solid 2px;
        }

        .rojo {
            border: red solid 2px;
        }

        .azul {
            border: blue solid 2px;
        }
    </style>
    <!-- scripts -->
    <script src="../Script/particles.js"></script>
    <script src="../Script/App.js"></script>
    <script type="text/javascript" src="../Script/ComunicacioAJAX.js"></script>
    <script type="text/javascript">
        function comprueba_segmented() {
            var seleccion = document.getElementById('mis_servicios').value;
            
            alert(seleccion);

            switch(seleccion) {
                case tv:
                    document.getElementById('tv').style.display = 'Block';
                    break;
                case internet:
                    document.getElementById('tv').style.display = 'none';
                    document.getElementById('internet').style.display = 'block';
                    break;
                case fijo:
                    break;
                case movil:
                    break;
            }
        }

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

        addLoadEvent(comprueba_segmented); 
    </script>
</head>
<body id="particles-js">
    <div class="container-fluid logo_aotec" onclick="comprueba_segmented()">
        <img src="../img/aotec.jpg" />
    </div>
    <form id="form1" runat="server">
        <div id="principal" class="container-fluid azul">
            <div id="servicios" class="row">

                <select id="mis_servicios" class="segment-select" onchange="comprueba_segmented()">
                    <option value="tv">Televisión</option>
                    <option value="internet">Internet</option>
                    <option value="fijo">Telefonía Fija</option>
                    <option value="movil">Telefonía Móvil</option>
                </select>
            </div>
            <div id="tv" class="row rojo">
                Hola Me llamo Jose
            </div>
            <div id="internet" class="row azul">
                Hola Me llamo Jose
            </div>
        </div>
    </form>
    <script type="text/javascript">
        jQuery(function ($) {
            $(".segment-select").Segment();
        });
    </script>
    

</body>
</html>
