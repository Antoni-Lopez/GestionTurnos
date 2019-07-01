<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Aotec.aspx.vb" Inherits="GestionTurnos.Aotec" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Formulario Multi Niveles AOTEC</title>
    <!-- CSS y distintas librerias -->

    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>

    <link rel="stylesheet" type="text/css" href="../Css/segment.css" />
    <link href="https://fonts.googleapis.com/css?family=Mali|Montserrat|Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/segmented-control-css/dist/segmented-control.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="../Script/segment.js"></script>
    

    <style type="text/css">
        body {margin: 0;padding: 0;box-sizing: border-box;position: relative;background: url("img/Aotec.jpg") no-repeat center center fixed ;}

        /* Div para el logo*/
        .logo_aotec {height: 385px !important;max-width: 723px;width: 100%;margin: auto;margin-top:2%;-webkit-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);-moz-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);}

        .logo_aotec img {margin-left: -15px;width: 105%;}

        /* Div Principal donde dispondremos de los RadioButtons y de todo el contenido. */
        #principal {max-width: 830px;width: 100%;margin:auto;margin-top:2%;border:Black solid 2px;border-radius:5px;background-color:#e9e9e9;margin-bottom:5%;}

        /* segment like IOS library*/
        .segmented-control{margin-left:-2%;width:103.8%;height: 6vh;}

        /* Div servicios*/
        .texto_izq{padding:10px;text-align:justify;padding-left: 3%;}
        .inputs_der{padding: 10px;padding-left: 15%;}

        label[for=texto]{font-family: 'Roboto', sans-serif;padding-top:2%;font-size:16px;margin-left: 10%;}

        .desplegar{width:95.5%;margin-left:0;margin-top:2%;margin-bottom:2%;font-family: 'Mali', cursive;float:left;padding-left:5% !important;font-size:20px;padding:15px;background-color:#FEC007;color:#fff;border: 1.5px solid black;margin-left: 2.5%;}
        .icono_desplegar{color:#fff;float: right !important;margin-right:10%;font-weight:bold;}

        .margen_izq {margin-left:5% !important;}

        #show_provedores,#show_provedores2,#show_provedores3,#equipa,#equipa2,#encripta2,#encripta3,#ott3,#oculto{width:100%;margin-left:0;display:none;}

        .inputs_dinamics{margin-left: -26px !important;width: 110% !important;}
        .input_izquierdos{width: 110% !important;margin-left: -5% !important;}



        /* Div Internet */
        .autonomo{margin-left: 15%;}
        label[for=fibra],label[for=radioenlace]{margin-top: 2%;margin-left: 15%;}

        /*inputs type text/number/etc...*/
        .form-control {margin-left:-42% !important; width: 142% !important;}
        .megas_mes{margin-left:0 !important;width:100%!important;}

        .inputs_especiales{margin-left:0 !important; width:100% !important}

        .btn-success {margin-left: -10%;}
        .btn-danger {margin-left: 27% !important;}

        #anadir_more{-moz-box-shadow:inset 0px 0px 23px -50px #fff6af;-webkit-box-shadow:inset 0px 0px 23px -50px #fff6af;box-shadow:inset 0px 0px 23px -50px #fff6af;background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffec64), color-stop(1, #fec007));
	    background:-moz-linear-gradient(top, #ffec64 5%, #fec007 100%);background:-webkit-linear-gradient(top, #ffec64 5%, #fec007 100%);background:-o-linear-gradient(top, #ffec64 5%, #fec007 100%);background:-ms-linear-gradient(top, #ffec64 5%, #fec007 100%);
	    background:linear-gradient(to bottom, #ffec64 5%, #fec007 100%);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffec64', endColorstr='#fec007',GradientType=0);background-color:#ffec64;-moz-border-radius:10px;
	    -webkit-border-radius:10px;border-radius:10px;border:2px solid #ffaa22;display:inline-block;cursor:pointer;color:#333333;font-family:Arial;font-size:15px;font-weight:bold;padding:10px 30px;text-decoration:none;text-shadow:0px 0px 0px #ffee66;}


        #anadir_more:hover {background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #fec007), color-stop(1, #ffec64));background:-moz-linear-gradient(top, #fec007 5%, #ffec64 100%);
	    background:-webkit-linear-gradient(top, #fec007 5%, #ffec64 100%);background:-o-linear-gradient(top, #fec007 5%, #ffec64 100%);background:-ms-linear-gradient(top, #fec007 5%, #ffec64 100%);background:linear-gradient(to bottom, #fec007 5%, #ffec64 100%);
	    filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fec007', endColorstr='#ffec64',GradientType=0);background-color:#fec007;}
        #anadir_more:active {position:relative;top:1px;}



        #tv,#internet2,#fijo2,#movil2,#another2,#ott2,#derechos2,#internet3,#internet4,#internet5,#internet6,#internet7,#internet8,#internet9,#internet10,#internet11,#equi1,#equi2{display:none;font-family: 'Montserrat', sans-serif;}

        

         /* LanzaAviso */
        .modal-lg{position: absolute;top:50%;left: 50%;transform: translate(-50%,-50%) !important;max-width: 50%;}
        


        /* Chk customized*/
        /* Hiding the checkbox, but allowing it to be focused */
        .badgebox{opacity: 0;}
        .badgebox + .badge{/* Move the check mark away when unchecked */text-indent: -999999px;/* Makes the badge's width stay the same checked and unchecked */width: 27px;}
        .badgebox:focus + .badge{/* Set something to make the badge looks focused *//* This really depends on the application, in my case it was: *//* Adding a light border */box-shadow: inset 0px 0px 5px;/* Taking the difference out of the padding */}
        .badgebox:checked + .badge{/* Move the check mark back when checked */text-indent: 0;}
        .form-groupu {display: block;margin-bottom: 15px;}
        .form-groupu input {padding: 0;height: initial;width: initial;margin-bottom: 0;display: none;cursor: pointer;}
        .form-groupu label {position: relative;cursor: pointer;}
        .form-groupu label:before {content:'';-webkit-appearance: none;background-color: transparent;border: 2px solid #FEC007;box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px rgba(0, 0, 0, 0.05);padding: 10px;display: inline-block;position: relative;vertical-align: middle;cursor: pointer;margin-right: 5px;}
        .form-groupu input:checked + label:after {content: '';display: block;position: absolute;top: 2px;left: 9px;width: 6px;height: 14px;border: solid #0079bf;border-width: 0 2px 2px 0;transform: rotate(45deg);}


        /* Telefonia Fija */
        .tele_fija{margin: 5px 0 5px 18% !important;}

        .Princi_fija {display: grid;grid-template-columns: 1fr 1fr;grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;grid-column-gap: 0px;grid-row-gap: 0px;}
        .div1 { grid-area: 1 / 1 / 2 / 2; } 
        .div2 { grid-area: 1 / 2 / 2 / 3; } 
        .div3 { grid-area: 2 / 1 / 3 / 2; } 
        .div4 { grid-area: 2 / 2 / 3 / 3; } 
        .div5 { grid-area: 3 / 1 / 4 / 2; } 
        .div6 { grid-area: 3 / 2 / 4 / 3; } 
        .div7 { grid-area: 4 / 1 / 5 / 2; } 
        .div8 { grid-area: 4 / 2 / 5 / 3; } 
        .div9 { grid-area: 5 / 1 / 6 / 2; } 
        .div10 { grid-area: 5 / 2 / 6 / 3; } 
        .div11 { grid-area: 6 / 1 / 7 / 2; } 
        .div12 { grid-area: 6 / 2 / 7 / 3; } 
        .div13 { grid-area: 7 / 1 / 8 / 2; } 
        .div14 { grid-area: 7 / 2 / 8 / 3; } 
        .div15 { grid-area: 8 / 1 / 9 / 2; } 
        .div16 { grid-area: 8 / 2 / 9 / 3; } 
        .div17 { grid-area: 9 / 1 / 10 / 2; } 
        .div18 { grid-area: 9 / 2 / 10 / 3; } 
        .div19 { grid-area: 10 / 1 / 11 / 2; } 
        .div20 { grid-area: 10 / 2 / 11 / 3; } 
        .Princi_fija,.div1,.div2,.div3,.div4,.div5,.div6,.div7,.div8,.div9,.div10,.div11,.div12,.div13,.div14,.div15,.div16,.div17,.div18,.div19,.div20{padding:10px;}

        /* Telefonia Movil */
        .princi_omv {display: grid;grid-template-columns: 1fr 1fr;grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;grid-column-gap: 0px;grid-row-gap: 0px;}
        .omv1 { grid-area: 1 / 1 / 2 / 2; } 
        .omv2 { grid-area: 1 / 2 / 2 / 3; } 
        .omv3 { grid-area: 2 / 1 / 3 / 2; } 
        .omv4 { grid-area: 2 / 2 / 3 / 3; } 
        .omv5 { grid-area: 3 / 1 / 4 / 2; } 
        .omv6 { grid-area: 3 / 2 / 4 / 3; } 
        .omv7 { grid-area: 4 / 1 / 5 / 2; } 
        .omv8 { grid-area: 4 / 2 / 5 / 3; } 


        /* Datos interes para negociaciones colectivas */
        .datos_interes {max-width: 830px;width: 100%;margin:auto;margin-top:-4%;display: grid;grid-template-columns: 1fr 1fr;grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;grid-column-gap: 0px;grid-row-gap: 0px;border:Black solid 2px;border-radius:5px;background-color:#e9e9e9;margin-bottom:1%;}
        .datos_interes1 { grid-area: 1 / 1 / 2 / 2; } 
        .datos_interes2 { grid-area: 1 / 2 / 2 / 3; } 
        .datos_interes3 { grid-area: 2 / 1 / 3 / 2; } 
        .datos_interes4 { grid-area: 2 / 2 / 3 / 3; } 
        .datos_interes5 { grid-area: 3 / 1 / 4 / 2; } 
        .datos_interes6 { grid-area: 3 / 2 / 4 / 3; } 
        .datos_interes7 { grid-area: 4 / 1 / 5 / 2; } 
        .datos_interes8 { grid-area: 4 / 2 / 5 / 3; } 
        .datos_interes9 { grid-area: 5 / 1 / 6 / 2; } 
        .datos_interes10 { grid-area: 5 / 2 / 6 / 3; } 
        .datos_interes11 { grid-area: 6 / 1 / 7 / 2; } 
        .datos_interes12 { grid-area: 6 / 2 / 7 / 3; } 
        .datos_interes13 { grid-area: 7 / 1 / 8 / 2; } 
        .datos_interes14 { grid-area: 7 / 2 / 8 / 3; } 
        .datos_interes15 { grid-area: 8 / 1 / 9 / 2; } 
        .datos_interes16 { grid-area: 8 / 2 / 9 / 3; } 

        .datos_interes1,.datos_interes2,.datos_interes3,.datos_interes4,.datos_interes5,.datos_interes6,.datos_interes7,.datos_interes8,.datos_interes9,.datos_interes10,.datos_interes11,.datos_interes12,.datos_interes13,.datos_interes14,.datos_interes15,.datos_interes16{padding:10px;}

        /* Cuadro botones */
        .botones{max-width: 830px;width: 100%;margin:auto;}
        .presentar{float:left;width: 25%;font-size: 19px;margin-left: 5%;}
        .guardar{float:right;width: 25%;font-size: 19px;margin-right: 5%;}



        .verde {border: green solid 2px;}

        .rojo {border: red solid 2px;}

        .azul {border: blue solid 2px;}

        @media (max-width: 1920px) {
            .desplegar {margin-top: .5%;margin-bottom: .5%;}
        }

    </style>

    <script type="text/javascript">

        //Acciones tras cargar la página
            //Primero nos creamos una función que se encargara 
            //De lanzar todas las funciones que queramos que se ejecuten al cargar la página.
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
            addLoadEvent(alternate_menu);

        function alternate_menu() {
            var pestaña, pestaña2, pestaña3, pestaña4, pestaña5;

            pestaña = document.getElementById("Tele").checked;
            pestaña2 = document.getElementById("inter").checked;
            pestaña3 = document.getElementById("fija").checked;
            pestaña4 = document.getElementById("movil").checked;
            pestaña5 = document.getElementById("another").checked;

            if (pestaña == true) {
                document.getElementById("tv").style.display = 'Block';
                document.getElementById("internet2").style.display = 'none';
                document.getElementById("fijo2").style.display = 'none';
                document.getElementById("movil2").style.display = 'none';
                document.getElementById("another2").style.display = 'none';
            }
            else if (pestaña2 == true) {
                document.getElementById("internet2").style.display = 'Block';
                document.getElementById("tv").style.display = 'none';
                document.getElementById("fijo2").style.display = 'none';
                document.getElementById("movil2").style.display = 'none';
                document.getElementById("another2").style.display = 'none';
            }
            else if (pestaña3 == true) {
                document.getElementById("fijo2").style.display = 'Block';
                document.getElementById("internet2").style.display = 'none';
                document.getElementById("tv").style.display = 'none';
                document.getElementById("movil2").style.display = 'none';
                document.getElementById("another2").style.display = 'none';
            }
            else if (pestaña4 == true) {
                document.getElementById("movil2").style.display = 'Block';
                document.getElementById("tv").style.display = 'none';
                document.getElementById("internet2").style.display = 'none';
                document.getElementById("fijo2").style.display = 'none';
                document.getElementById("another2").style.display = 'none';
            }
            else if (pestaña5 == true) {
                document.getElementById("another2").style.display = 'Block';
                document.getElementById("internet2").style.display = 'none';
                document.getElementById("tv").style.display = 'none';
                document.getElementById("fijo2").style.display = 'none';
                document.getElementById("movil2").style.display = 'none';
            }
        }

        function LanzaAviso(Text) {
            bootbox.alert({ title: "AOTEC 2019", message: Text, size: 'large' });

        }

        function contador() {
            var div_oculto = document.getElementById("oculto").value;

            if ((div_oculto == '') || (div_oculto.Lenght <= 0)) {
                crear_newdiv();
                var cont  = 2;               
                document.getElementById("oculto").value = cont;
            }
            else {
                var cont = document.getElementById("oculto").value;
                if (cont == 5) {
                    LanzaAviso("<h4>Ha llegado al máx de 5 opciones, ya no puede añadir ninguna más. Gracias!</h4>");
                    return false; 
                }
                else {                    
                    cont++;                  
                    document.getElementById("oculto").value = cont;   
                    crear_newdiv();
                }
            }
            
        }

        function crear_newdiv() {
            var midiv = document.createElement("div");
		    midiv.setAttribute("id","prueba");
		    midiv.setAttribute("class","row div_insertado");
		    midiv.setAttribute("style","margin-left:0;width:100%;margin-top:5%;");
            midiv.innerHTML = "<div class='col-lg-3 col-md-4 col-sm-6 col-xs-12' style='padding:10px;text-align:center;padding-left:.5%;'> Subida (Mbps) </div><div class='col-lg-3 col-md-4 col-sm-6 col-xs-12' style='padding:10px'><input type='text' class='form-control inputs_especiales input_izquierdos' id='subida_velocity' placeholder='Número Mbs.' /></div>";
            midiv.innerHTML += "<div class='col-lg-3 col-md-4 col-sm-6 col-xs-12' style='padding:10px;text-align:center;padding-left:.5%;'> Bajada (Mbps) </div>";
            midiv.innerHTML += "<div class='col-lg-3 col-md-4 col-sm-6 col-xs-12' style='padding:10px;'><input type='text' class='form-control inputs_especiales inputs_dinamics' id='subida_velocity' placeholder='Número Mbs.' /></div></div>";

            document.getElementById('internet11').appendChild(midiv); // Lo pones en "body", si quieres ponerlo dentro de algún id en concreto usas document.getElementById('internet11').appendChild(midiv);

        }

        function loader_gif(x) {           

            switch (x) {
                case 1:
                    presentar_data.innerHTML = "";
                    var texto = "<h4 style='text-align:center;'>Validando los datos <img src='img/ajax-loader.gif' alt='loading' /><br/>";
                    $('#presentar_data').html(texto);
                    break;
                case 2:
                    guardar_data.innerHTML = "";
                    var texto = "<h4 style='text-align:center;'>Guardando los datos <img src='img/ajax-loader.gif' alt='loading' /><br/>";
                    $('#guardar_data').html(texto);
                    comprobar();
                    break;
            }
            
            //LanzaAviso(texto);
            //setTimeout(LanzaAviso(texto), 3000);
            //$('#miButton').html('Validando <img src="img/ajax-loader.gif" alt="loading" /><br/>');
            //setTimeout($('#miButton').html('Validando <img src="img/ajax-loader.gif" alt="loading" /><br/>'), 2000);        
        }

        
    </script>


</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid logo_aotec" onclick="comprobar()">
            <img src="img/logo_aotec.png" />
        </div>
        <div id="principal" class="container-fluid azul">
            <div class="segmented-control sc-slide sc-amber">
                <div class="segmented-control-btn">
                    <input type="radio" id="Tele" name="frameworkJs" value="Tele" onclick="alternate_menu()" checked />
                    <label for="Tele">Televisión</label>
                </div>
                <div class="segmented-control-btn">
                    <input type="radio" id="inter" name="frameworkJs" onclick="alternate_menu()" value="inter" />
                    <label for="inter">Internet</label>
                </div>
                <div class="segmented-control-btn">
                    <input type="radio" id="fija" name="frameworkJs" onclick="alternate_menu()" value="fija" />
                    <label for="fija">Telefonía Fija</label>
                </div>
                <div class="segmented-control-btn">
                    <input type="radio" id="movil" name="frameworkJs" onclick="alternate_menu()" value="movil" />
                    <label for="movil">Telefonía Móvil</label>
                </div>
                <div class="segmented-control-btn">
                    <input type="radio" id="another" name="frameworkJs" onclick="alternate_menu()" value="another" />
                    <label for="another">Otros..</label>
                </div>
            </div>
            <div id="tv" class="row">
                <div class="col-xs-6 texto_izq">
                    <label for="texto">¿Dispone de Canal local?</label>
                </div>
                <div class="col-xs-6 inputs_der">
                     <label for="success" class="btn btn-success">Sí <input type="checkbox" id="success" class="badgebox" /><span class="badge">&check;</span></label>
                     <label for="danger" class="btn btn-danger">No <input type="checkbox" id="danger" class="badgebox" checked="checked" /><span class="badge">&check;</span></label>
                </div>
                <div class="col-xs-6 texto_izq">
                    <label for="texto">Número de horas de producción propias. ¿Anual?</label>
                </div>
                <div class="col-xs-6 inputs_der">
                    <input type="text" class="form-control" id="horas_produccion" placeholder="Introduzca el número de horas propias de Producción." />
                </div>
                <div id="desplegar_proveedores" class="row desplegar">
                    Proveedores de Canales <span class="icono_desplegar"><i class="fas fa-arrow-alt-circle-down"></i></span>
                </div>
                <div id="show_provedores" class="row">
                    <div class="col-xs-6 texto_izq">
                        <label for="texto">Nombre</label>
                    </div>
                    <div class="col-xs-6 inputs_der">
                        <input type="text" class="form-control" id="name_proveedor" placeholder="Introduzca el nombre de su proveedor." />
                    </div>
                </div>
                <div id="show_provedores2" class="row">
                    <div class="col-xs-6 texto_izq">
                        <label for="texto">Nº Canales Contratados</label>
                    </div>
                    <div class="col-xs-6 inputs_der">
                        <input type="number" class="form-control" id="number_chanels" placeholder="Introduzca el número de canales." />
                    </div>
                </div>
                <div id="show_provedores3" class="row">
                    <div class="col-xs-6 texto_izq">
                        <label for="texto">Precio / Paquete ( € )</label>
                    </div>
                    <div class="col-xs-6 inputs_der">
                        <input type="number" class="form-control" id="price_paquet" placeholder="Introduzca el Precio." />
                    </div>
                </div>   
                <div id="equipamiento" class="row desplegar">
                    Equipamiento cabecera <span class="icono_desplegar"><i class="fas fa-arrow-alt-circle-down"></i></span>
                </div>
                <div id="equipa" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-6 texto_izq">
                        <label for="texto">Equipo / Uso</label>
                    </div>
                    <div class="col-xs-6 inputs_der">
                        <input type="text" class="form-control" id="equipo_uso" placeholder="Introduzca el nombre de su equipo." />
                    </div>
                </div>
                <div id="equipa2" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-6 texto_izq">
                        <label for="texto">Empresa encargada de encriptar la señal</label>
                    </div>
                    <div class="col-xs-6 inputs_der">
                        <input type="text" class="form-control" id="empresa_encargada_encriptar" placeholder="Introduzca el nombre de la empresa." />
                    </div>
                </div>


                <div id="encripta" class="row desplegar">
                    Encriptación <span class="icono_desplegar"><i class="fas fa-arrow-alt-circle-down"></i></span>
                </div>
                <div id="encripta2" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-6 texto_izq">
                        <label for="texto">¿Sistema de encriptación propio?</label>
                    </div>
                    <div class="col-xs-6 inputs_der">
                        <label for="encriptacion_si" class="btn btn-success">Sí <input type="checkbox" id="encriptacion_si" class="badgebox" /><span class="badge">&check;</span></label>
                        <label for="encriptacion_no" class="btn btn-danger">No <input type="checkbox" id="encriptacion_no" class="badgebox" checked="checked" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div id="encripta3" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-6 texto_izq">
                         <label for="texto">Empresa encargada de encriptar la señal: </label>
                    </div>
                    <div class="col-xs-6 inputs_der">
                        <select id="mis_servicios" class="mdb-select md-form">
                            <option class="prueba" value='1'>XTRA TELECOM</option>
                            <option class="prueba" value='2'>SAFEVIEW</option>
                            <option class="prueba" value='3'>OTRA...</option>
                        </select>
                    </div>
                </div>


                <div id="ott" class="row desplegar">
                    OTT <span class="icono_desplegar"><i class="fas fa-arrow-alt-circle-down"></i></span>
                </div>
                <div id="ott2" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-6 texto_izq">
                        <label for="texto">¿Dispone de plataforma OTT?</label>
                    </div>
                    <div class="col-xs-6 inputs_der">
                        <label for="OTT_si" class="btn btn-success">Sí <input type="checkbox" id="OTT_si" class="badgebox" /><span class="badge">&check;</span></label>
                        <label for="OTT_no" class="btn btn-danger">No <input type="checkbox" id="OTT_no" class="badgebox" checked="checked" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div id="ott3" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-6 texto_izq">
                        <label for="texto">Proveedor </label>
                    </div>
                    <div class="col-xs-6 inputs_der">
                        <input type="text" class="form-control" id="ott_provedor" placeholder="Introduzca el nombre de su Proveedor." />
                    </div>
                </div>
                
                <div id="derechos" class="row desplegar">
                    Derechos de Autor <span class="icono_desplegar"><i class="fas fa-arrow-alt-circle-down"></i></span>
                </div>
                <div id="derechos2" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-12" style="margin-bottom:2%;font-size:24px;text-align:justify;margin-left:5%;">
                        Tienes contrato con: 
                    </div>
                    <div class="col-xs-12" style="width:100%;">
                        <div class="form-groupu">
                            <input type="checkbox" id="SGAE" />
                            <label for="SGAE" class="margen_izq">SGAE</label>
                        </div>
                        <div class="form-groupu">
                            <input type="checkbox" id="EGEDA" />
                            <label for="EGEDA" class="margen_izq">EGEDA</label>
                        </div>
                        <div class="form-groupu">
                            <input type="checkbox" id="AGEDI" />
                            <label for="AGEDI" class="margen_izq">AGEDI</label>
                        </div>
                        <label for="otros_derechos" style="margin-left:5%;">Otros...</label><input type="text" class="form-control" id="otros_derechos" style="margin-left: 5% !important;width: 94.5% !important;margin-bottom: 2.5%;margin-top: 2%;" placeholder="Introduzca algo." />
                    </div>
                </div>
            </div>
                            
            <div id="internet2" class="row">
                <div id="internet_desplegar" class="row desplegar" style="margin-top:1px;">
                    Caudal <span class="icono_desplegar"><i class="fas fa-arrow-alt-circle-down"></i></span>
                </div>
                <div id="internet3" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-6 texto_izq">
                        <label for="texto autonomo" style="margin-left: 2% !important;">¿Eres AS autónomo?</label>
                    </div>
                    <div class="col-xs-6 inputs_der">
                        <label for="autonomo_si" class="btn btn-success">Sí <input type="checkbox" id="autonomo_si" class="badgebox" /><span class="badge">&check;</span></label>
                        <label for="autonomo_no" class="btn btn-danger">No <input type="checkbox" id="autonomo_no" class="badgebox" checked="checked" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div id="internet4" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-6 texto_izq">
                        <div class="form-groupu">
                            <input type="checkbox" id="fibra" />
                            <label for="fibra" style="margin-top:2%;">Recibo canal por fibra óptica.</label>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="col-xs-6 texto_izq">
                            <label for="texto" style="text-align:center;margin-top:2%;margin-left:25%;">¿Cuántos Megas?</label>
                        </div>
                        <div class="col-xs-6 inputs_der">
                            <input type="text" class="form-control inputs_especiales" id="fibra_megas" placeholder="Número Mbs." />
                        </div>
                    </div>
                </div>  
                <div id="internet5" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-6 texto_izq">
                        <div class="form-groupu">
                            <input type="checkbox" id="radioenlace" />
                            <label for="radioenlace" style="margin-top:2%;">Recibo canal por radioenlace.</label>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="col-xs-6 texto_izq">
                            <label for="texto" style="text-align:center;margin-top:2%;margin-left:25%;">¿Cuántos Megas?</label>
                        </div>
                        <div class="col-xs-6 inputs_der">
                            <input type="text" class="form-control inputs_especiales" id="radioenlace_megas" placeholder="Número Mbs." />
                        </div>
                    </div>
                </div>
                <div id="internet6" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-6">
                        <label for="texto" style="text-align: center;margin-top: 2%;margin-left: 5.5%;">¿Cuántos megas de caudal consumes aproximadamente?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 15px;">
                        <input type="text" class="form-control megas_mes" id="megas_mensaules" placeholder="Número Mbs." />
                    </div>
                </div>
                <div id="internet7" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-6">
                        <label for="texto" style="text-align:center;margin-top:4%;margin-left:17%;">¿Quién es tu Proveedor de circuito?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 15px;">
                        <input type="text" class="form-control megas_mes" id="proveedor_megas" placeholder="Introduce el nombre de tu Proveedor." />
                    </div>
                </div>
                <div id="internet8" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-6">
                        <label for="texto" style="text-align:center;margin-top:5%;margin-left:18%;">Precio de su Circuito</label>
                    </div>
                    <div class="col-xs-6" style="padding: 15px;">
                        <input type="text" class="form-control megas_mes" id="precio_proveedor" placeholder="Introduce el Precio de tu Circuito." />
                    </div>
                </div>
                <div id="internet9" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-6">
                        <label for="texto" style="text-align:center;margin-top:4%;margin-left:17%;">¿Quién es tu proveedor de caudal?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 15px;">
                        <input type="text" class="form-control megas_mes" id="caudal_proveedor" placeholder="Introduce el Proveedor de tu Caudal." />
                    </div>
                </div>
                <div id="internet10" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-6">
                        <label for="texto" style="text-align:center;margin-top:4%;margin-left:18%;">Precio del caudal contratado</label>
                    </div>
                    <div class="col-xs-6" style="padding: 15px;">
                        <input type="text" class="form-control megas_mes" id="caudal_precio" placeholder="Introduce el precio de tu Caudal." />
                    </div>
                </div>
                <div id="internet11" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-12">
                        <div class="col-xs-8" style="margin-top:2%;">
                            <h4 style="padding:10px;text-align:justify;padding-left:1.5%;font-size: 16px !important;">Velocidad que ofreces actualmente a tus clientes (Máx=5) .</h4>
                        </div>
                        <div class="col-xs-4" style="padding:10px;">
                            <button id="anadir_more" type="button" style="margin:auto;max-width:250px; width:100%;padding:10px;text-align:center;font-size:25px;" onClick="contador()">Añadir +</button>
                        </div>

                        
                    </div>  
                    <div class="row" style="margin-left:0;width:100%;margin-top:5%;">
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="padding:10px;text-align:center;padding-left:.5%;"> Subida (Mbps) </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="padding:1px"> 
                             <input type="text" class="form-control inputs_especiales" id="subida_velocity" placeholder="Número Mbs." />
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="padding:10px;text-align:center;padding-left:-.5%;"> Bajada (Mbps) </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="padding:1px;">
                             <input type="text" class="form-control inputs_especiales" style="padding:10px !important;margin-left:-8% !important;" id="bajada_velocity" placeholder="Número Mbs." />
                        </div>
                    </div>
                </div>

                <div id="Equipamiento" class="row desplegar">
                    Equipamiento <span class="icono_desplegar"><i class="fas fa-arrow-alt-circle-down"></i></span>
                </div>
                <div id="equi1" class="col-xs-12">
                    <div class="col-xs-6">
                        <label for="texto">Equipo / Uso</label>
                    </div>
                    <div class="col-xs-6">
                        <input type="text" class="form-control" style="padding:10px !important;" id="equipo_uso" placeholder="Describa su equipo y el uso que le dá." />
                    </div>
                </div>
                <div id="equi2" class="col-xs-12">
                    <div class="col-xs-6">
                        <label for="texto">Marca / Fabricante</label>
                    </div>
                    <div class="col-xs-6">
                        <input type="text" class="form-control" style="padding:10px !important;margin-bottom: 2.5%;" id="marca_fabricante" placeholder="Describa su marca y el fabricante." />
                    </div>
                </div>
            </div>
            <div id="fijo2" class="row">
                <div class="Princi_fija">                                    
                    <div class="div1">
                        <label for="texto">¿Eres operador con numeración propia?</label>
                    </div>
                    <div class="div2">
                        <label for="operador_propio_si" class="btn btn-success tele_fija">Sí <input type="checkbox" id="operador_propio_si" class="badgebox" /><span class="badge">&check;</span></label>
                        <label for="operador_propio_no" class="btn btn-danger">No <input type="checkbox" id="operador_propio_no" class="badgebox" checked="checked" /><span class="badge">&check;</span></label>
                    </div>
                    <div class="div3">
                        <label for="texto">¿Tienes tarifa plana?</label>
                    </div>
                    <div class="div4">
                        <label for="tarifa_plana_si" class="btn btn-success tele_fija">Sí <input type="checkbox" id="tarifa_plana_si" class="badgebox" /><span class="badge">&check;</span></label>
                        <label for="tarifa_plana_no" class="btn btn-danger">No <input type="checkbox" id="tarifa_plana_no" class="badgebox" checked="checked" /><span class="badge">&check;</span></label>
                    </div>
                    <div class="div5">
                        <label for="texto">¿Tienes mantenimiento de línea?</label>
                    </div>
                    <div class="div6">
                        <label for="mantenimiento_si" class="btn btn-success tele_fija">Sí <input type="checkbox" id="mantenimiento_si" class="badgebox" /><span class="badge">&check;</span></label>
                        <label for="mantenimiento_no" class="btn btn-danger">No <input type="checkbox" id="mantenimiento_no" class="badgebox" checked="checked" /><span class="badge">&check;</span></label>
                    </div>
                    <div class="div7">
                        <label for="texto">¿Tienes sistema de facturación propio?</label>
                    </div>
                    <div class="div8">
                        <label for="facturacion_propia_si" class="btn btn-success tele_fija">Sí <input type="checkbox" id="facturacion_propia_si" class="badgebox" checked="checked" /><span class="badge">&check;</span></label>
                        <label for="facturacion_propia_no" class="btn btn-danger">No <input type="checkbox" id="facturacion_propia_no" class="badgebox" /><span class="badge">&check;</span></label>
                    </div>
                    <div id="telef_fija_hide" class="row div9" style="display:none;">
                        <label for="texto" style="margin-left: 13% !important;">¿Que empresa ajena te lleva la facturación?</label>
                    </div>
                    <div id="telef_fija_hide2" class="row div10" style="display:none;">
                        <input type="text" class="form-control" style="padding: 10px !important;margin-left: 14px !important;width: 93.5% !important;" id="quien_lleva_factu" placeholder="Describa que empresa es la encargada de su facturación." />
                    </div>
                    <div class="div11">
                        <label for="texto">¿Que empresa te suministra la telefonía?</label>
                    </div>
                    <div class="div12">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="quien_suministra_telef" placeholder="Describa quien le suministra la telefonía." />
                    </div>
                    <div class="div13">
                        <label for="texto">¿Cuantos minutos tienes de consumo mensualmente (aprox) de fijo a fijo?</label>
                    </div>
                    <div class="div14">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="min_consumo" placeholder="Describa cuantos minutos tiene mensualmente." />
                    </div>
                    <div class="div15">
                        <label for="texto">¿Precio del min de fijo a fijo?</label>
                    </div>
                    <div class="div16">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="precio_fijo_fijo" placeholder="Describa cual es precio de 1min de fijo a fijo." />
                    </div>
                    <div class="div17">
                        <label for="texto">¿Cuantos minutos tienes de consumo mensualmente (aprox) de fijo a móvil?</label>
                    </div>
                    <div class="div18">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="min_consumo_movil" placeholder="Describa cuantos minutos tiene mensualmente." />
                    </div>
                    <div class="div19">
                        <label for="texto">¿Precio del min de fijo a móvil?</label>
                    </div>
                    <div class="div20">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="precio_fijo_movil" placeholder="Describa cual es precio de 1min de fijo a móvil." />
                    </div>
                </div>
            </div>
            <div id="movil2" class="row">
                <div id="desplegar_omv" class="row desplegar" style="margin-top:.1%;padding:10px;">
                    Si eres OMV <span class="icono_desplegar"><i class="fas fa-arrow-alt-circle-down"></i></span>
                </div>
                <div id="omv_show1" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: 7.8%;">
                    <div class="col-xs-6" style="padding:10px;">
                        <label for="texto">¿Cuál es tu operador de red?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="operador_red" placeholder="Describa cual es su operador de red." />
                    </div>
                </div>
                <div id="omv_show2" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Ofreces tarifa plana?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <label for="ofreces_tarifa_plana_si" class="btn btn-success tele_fija">Sí <input type="checkbox" id="ofreces_tarifa_plana_si" class="badgebox" checked="checked" /><span class="badge">&check;</span></label>
                        <label for="ofreces_tarifa_plana_no" class="btn btn-danger">No <input type="checkbox" id="ofreces_tarifa_plana_no" class="badgebox" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div id="omv_show3" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Cuántos minutos tienes de consumo mensualmente (aprox) de móvil a móvil?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="min_consumo_movil_movil" placeholder="Describa cuantos mins tiene de consumo." />
                    </div>
                </div>
                <div id="omv_show4" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Cuántos minutos tienes de consumo mensualmente (aprox) de móvil a fijo?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="min_consumo_movil_fijo" placeholder="Describa cuantos mins tiene de consumo." />
                    </div>
                </div>
                <div id="desplegar_omv2" class="row desplegar" style="margin-top:.1%;padding:10px;">
                    Si comercializas el servicio de un OMV <span class="icono_desplegar"><i class="fas fa-arrow-alt-circle-down"></i></span>
                </div>
                <div id="omv_show5" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Cuál es tu OMV?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="tu_operador_omv" placeholder="Describa cual es su Operador OMV." />
                    </div>
                </div>
                <div id="omv_show6" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Ofrece tarifa plana?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <label for="ofre_tarifa_plana_si" class="btn btn-success tele_fija">Sí <input type="checkbox" id="ofre_tarifa_plana_si" class="badgebox" checked="checked" /><span class="badge">&check;</span></label>
                        <label for="ofre_tarifa_plana_no" class="btn btn-danger">No <input type="checkbox" id="ofre_tarifa_plana_no" class="badgebox" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div id="omv_show7" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Cuántos minutos facturas para tu OMV mensualmente (aprox) de móvil a móvil?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="minfacturas_movil_movil" placeholder="Describa cuantos minutos facturas para tu OMV mensualmente." />
                    </div>
                </div>
                <div id="omv_show8" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Cuántos minutos facturas para tu OMV mensualmente (aprox) de móvil a fijo?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="minfacturas_movil_fijo" placeholder="Describa cuantos minutos facturas para tu OMV mensualmente." />
                    </div>
                </div>
                <div id="omv_show9" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Que consumo de datos tienes mensualmente (aprox)?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="consumo_datos_mensual" placeholder="Describa cuantos datos consumes mensualmente." />
                    </div>
                </div>
                <div id="omv_show10" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Cuál es su facturación mensual/comisiones móvil?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="factu_mensual" placeholder="Describa su facturación mensual." />
                    </div>
                </div>
                <div id="omv_show11" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Tiene sistema de facturación propio?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <label for="sistema_propio_si" class="btn btn-success tele_fija">Sí <input type="checkbox" id="sistema_propio_si" class="badgebox" checked="checked"  /><span class="badge">&check;</span></label>
                        <label for="sistema_propio_no" class="btn btn-danger">No <input type="checkbox" id="sistema_propio_no" class="badgebox" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div id="omv_show12" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Qué empresa ajena te lleva la facturación?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="empre_factur" placeholder="Describa su facturación mensual." />
                    </div>
                </div>
            </div>
            <div id="another2" class="row">
                <div id="desplegar_otros" class="row desplegar" style="margin-top:.1%;padding:10px;">
                    Marketing <span class="icono_desplegar"><i class="fas fa-arrow-alt-circle-down"></i></span>
                </div>
                <div id="otro" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Dispone de departamento de marketing propio?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <label for="marketing_propio_si" class="btn btn-success tele_fija">Sí <input type="checkbox" id="marketing_propio_si" class="badgebox" /><span class="badge">&check;</span></label>
                        <label for="marketing_propio_no" class="btn btn-danger">No <input type="checkbox" id="marketing_propio_no" class="badgebox" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div id="otro2" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Cuántas personas lo componen?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="personas_total" placeholder="Cuántas personas dispone en marketing." />
                    </div>
                </div>
                <div id="otro3" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Qué empresa se lo gestiona?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="empresa_gestiona" placeholder="Describa qué empresa se lo gestiona." />
                    </div>
                </div>
                <div id="otro4" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Qué presupuesto mensual invierte (aprox)?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="presupuesto_mensual_invierte" placeholder="Describa cuanto presupuesto invierte al mes." />
                    </div>
                </div>
                <div id="desplegar_otros2" class="row desplegar" style="margin-top:.1%;padding:10px;">
                    Jurídico <span class="icono_desplegar"><i class="fas fa-arrow-alt-circle-down"></i></span>
                </div>
                <div id="otros2" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Dispone de departamento de jurídico propio?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <label for="jurídico_propio_si" class="btn btn-success tele_fija">Sí <input type="checkbox" id="jurídico_propio_si" class="badgebox"  /><span class="badge">&check;</span></label>
                        <label for="jurídico_propio_no" class="btn btn-danger">No <input type="checkbox" id="jurídico_propio_no" class="badgebox" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div id="otros3" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Cuántas personas lo componen?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="personas_total_juridico" placeholder="Cuántas personas dispone en marketing." />
                    </div>
                </div>
                <div id="otros4" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Qué empresa se lo gestiona?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="empresa_gestiona_juridico" placeholder="Describa qué empresa se lo gestiona." />
                    </div>
                </div>
                <div id="otros5" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Qué presupuesto mensual invierte (aprox)?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="presupuesto_mensual_invierte_juridico" placeholder="Describa cuanto presupuesto invierte al mes." />
                    </div>
                </div>
                <div id="desplegar_otros3" class="row desplegar" style="margin-top:.1%;padding:10px;">
                    Ingeniería <span class="icono_desplegar"><i class="fas fa-arrow-alt-circle-down"></i></span>
                </div>
                <div id="desplegar3" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Dispone de departamento de ingeniería propio?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <label for="ingeniería_propio_si" class="btn btn-success tele_fija">Sí <input type="checkbox" id="ingeniería_propio_si" class="badgebox"  /><span class="badge">&check;</span></label>
                        <label for="ingeniería_propio_no" class="btn btn-danger">No <input type="checkbox" id="ingeniería_propio_no" class="badgebox" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div id="desplegar4" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Cuántas personas lo componen?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="personas_total_ingenieria" placeholder="Cuántas personas dispone en marketing." />
                    </div>
                </div>
                <div id="desplegar5" class="row" style="display:none;margin-left: 2.5%;width: 95.5%;margin-top: .8%;">
                    <div class="col-xs-6" style="padding:10px;margin-top:.5%;">
                        <label for="texto">¿Qué empresa se lo gestiona?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" style="padding:10px !important;margin-left:0px !important;width:100% !important;" id="empresa_gestiona_ingenieria" placeholder="Describa qué empresa se lo gestiona." />
                    </div>
                </div>
            </div>
        </div>
        <input type="text" class="form-control" style="margin-left:5% !important;width:95% !important;" id="oculto" placeholder="Número Mbs." />
        <div class="datos_interes">
            <div class="datos_interes1">
                <label for="texto">Número total de hogares pasados: </label>
            </div>
            <div class="datos_interes2">
                <input type="number" class="form-control" style="margin-left:5% !important;width:95% !important;" id="total_hogares" placeholder="Número de hogares pasados." />
            </div>
            <div class="datos_interes3">
                <label for="texto">Número de abonados al servicio de TV: </label>
            </div>
            <div class="datos_interes4">
                <input type="number" class="form-control" style="margin-left:5% !important;width:95% !important;" id="total_abonados" placeholder="Número de abonados al servicio de TV." />
            </div>
            <div class="datos_interes5">
                <label for="texto">Número de abonados a Internet: </label>
            </div>
            <div class="datos_interes6">
                <input type="number" class="form-control" style="margin-left:5% !important;width:95% !important;" id="total_abonados_internet" placeholder="Número de abonados a Internet." />
            </div>
            <div class="datos_interes7">
                <label for="texto">Número de abonados a telefonía fija: </label>
            </div>
            <div class="datos_interes8">
                <input type="number" class="form-control" style="margin-left:5% !important;width:95% !important;" id="total_hogares_fija" placeholder="Número de abonados a telefonía fija." />
            </div>
            <div class="datos_interes9">
                <label for="texto">Número de abonados a telefonía móvil: </label>
            </div>
            <div class="datos_interes10">
                <input type="number" class="form-control" style="margin-left:5% !important;width:95% !important;" id="total_hogares_movil" placeholder="Número de abonados a telefonía móvil." />
            </div>
            <div class="datos_interes11">
                <label for="texto">Número de líneas totales: </label>
            </div>
            <div class="datos_interes12">
                <input type="number" class="form-control" style="margin-left:5% !important;width:95% !important;" id="total_lineas" placeholder="Número de líneas totales." />
            </div>
            <div class="datos_interes13">
                <label for="texto">Número de trabajadores en la empresa: </label>
            </div>
            <div class="datos_interes14">
                <input type="number" class="form-control" style="margin-left:5% !important;width:95% !important;" id="total_trabajadores" placeholder="Número de trabajadores en la empresa." />
            </div>
            <div class="datos_interes15">
                <label for="texto">Ingresos anuales de explotación: </label>
            </div>
            <div class="datos_interes16">
                <input type="number" class="form-control" style="margin-left:5% !important;width:95% !important;" id="total_ingresos" placeholder="Número de ingresos anuales de explotación." />
            </div>
        </div>
        <div class="row botones" style="padding:5px;margin-bottom:5%;">
            <button id="presentar_data" type="button" class="btn btn-warning presentar" onclick="loader_gif(1);">Presentar Datos</button>
            <button id="guardar_data" type="button" class="btn btn-warning guardar" onclick="loader_gif(2);">Guardar Datos</button>
        </div>
        <asp:TextBox class="form-control" style="margin-left:5% !important;width:95% !important;" id="data_user" runat="server" />
        <asp:TextBox class="form-control" style="margin-left:5% !important;width:95% !important;" id="data_user2" runat="server" />
    </form>
    <script type="text/javascript" src="../Script/ComunicacioAJAX.js"></script> 
    <script type="text/javascript">
        jQuery(function ($) {
            $(".segment-select").Segment();
        });

        $(document).ready(function(){
            $('#desplegar_proveedores').click(function() {
              $('#show_provedores').toggle("slide");
              $('#show_provedores2').toggle("slide");
              $('#show_provedores3').toggle("slide");
            });
            $('#equipamiento').click(function () {
              $('#equipa').toggle("slide");
              $('#equipa2').toggle("slide");
            });
            $('#encripta').click(function () {
              $('#encripta2').toggle("slide");
            });
            $('#ott').click(function () {
              $('#ott2').toggle("slide");
              //$('#show_provedores3').toggle("slide");
            });
            $('#derechos').click(function () {
              $('#derechos2').toggle("slide");
            });
            $('#internet_desplegar').click(function () {
              $('#internet3').toggle("slide");
              $('#internet4').toggle("slide");
              $('#internet5').toggle("slide");
              $('#internet6').toggle("slide");
              $('#internet7').toggle("slide");
              $('#internet8').toggle("slide");
              $('#internet9').toggle("slide");
              $('#internet10').toggle("slide");
              $('#internet11').toggle("slide");
            });

            $('#Equipamiento').click(function () {                
                $('#equi1').toggle("slide");
                $('#equi2').toggle("slide");
            });

            $('#desplegar_omv').click(function () {                
                $('#omv_show1').toggle("slide");
                $('#omv_show2').toggle("slide");
                $('#omv_show3').toggle("slide");
                $('#omv_show4').toggle("slide");
            });
            $('#desplegar_omv2').click(function () {                
                $('#omv_show5').toggle("slide");
                $('#omv_show6').toggle("slide");
                $('#omv_show7').toggle("slide");
                $('#omv_show8').toggle("slide");
                $('#omv_show9').toggle("slide");
                $('#omv_show10').toggle("slide");
                $('#omv_show11').toggle("slide");
            });

            $('#desplegar_otros').click(function () {                
                $('#otro').toggle("slide");
                $('#otro4').toggle("slide");
            });

            $('#desplegar_otros2').click(function () {                
                $('#otros2').toggle("slide");
                $('#otros5').toggle("slide");
            });
            $('#desplegar_otros3').click(function () {                
                $('#desplegar3').toggle("slide");
                //$('#otro4').toggle("slide");
            });

            //Comprobamos los radio buttons y ponemos false o true dependiendo lo que haga el usuario.
            $("#success").click(function () {
                if ($("#success").is(':checked')) {
                    $("#danger").attr('checked', false);                 
                } else {
                    $("#success").attr('checked', true);
                }
            });

            $("#danger").click(function () {
                if ($("#danger").is(':checked')) {
                    $("#success").attr('checked', false);                 
                } else {
                    $("#danger").attr('checked', true);
                }
            });


            $("#encriptacion_si").click(function () {
                if ($("#encriptacion_si").is(':checked')) {
                    $("#encriptacion_no").attr('checked', false);
                    $("#encriptacion_si").attr('checked', true);
                    $('#encripta3').toggle("slide");
                    
                } else {
                    $("#encriptacion_si").attr('checked', false);
                    $("#encriptacion_no").attr('checked', true);
                    $('#encripta3').toggle("slide");
                }
            });

            $("#encriptacion_no").click(function () {
                if ($("#encriptacion_no").is(':checked')) {
                    $("#encriptacion_si").attr('checked', false);
                    $("#encriptacion_no").attr('checked', true);
                    $('#encripta3').toggle("slide");
                    
                } else {
                    $("#encriptacion_si").attr('checked', true);
                    $("#encriptacion_no").attr('checked', false);
                    $('#encripta3').toggle("slide");
                }
            });

            $("#OTT_si").click(function () {
                if ($("#OTT_si").is(':checked')) {
                    $("#OTT_no").attr('checked', false);
                    $("#OTT_si").attr('checked', true);
                    $('#ott3').toggle("slide");
                    
                } else {
                    $("#OTT_si").attr('checked', true);
                    $("#OTT_no").attr('checked', false);
                    $('#ott3').toggle("slide");
                }
            });

            $("#OTT_no").click(function () {
                if ($("#OTT_no").is(':checked')) {
                    $("#OTT_si").attr('checked', false);
                    $("#OTT_no").attr('checked', true);
                    $('#ott3').toggle("slide");
                    
                } else {
                    $("#OTT_no").attr('checked', true);
                    $("#OTT_si").attr('checked', false);
                    $('#ott3').toggle("slide");
                }
            });

            $("#autonomo_si").click(function () {
                if ($("#autonomo_si").is(':checked')) {
                    $("#autonomo_no").attr('checked', false);
                    $("#autonomo_si").attr('checked', true);            
                    
                } else {
                    $("#autonomo_si").attr('checked', true);
                    $("#autonomo_no").attr('checked', false);
                }
            });

            $("#autonomo_no").click(function () {
                if ($("#autonomo_no").is(':checked')) {
                    $("#autonomo_si").attr('checked', false);
                    $("#autonomo_no").attr('checked', true);                    
                    
                } else {
                    $("#autonomo_no").attr('checked', true);
                    $("#autonomo_si").attr('checked', false);
                }
            });



            $("#operador_propio_si").click(function () {
                if ($("#operador_propio_si").is(':checked')) {
                    $("#operador_propio_no").attr('checked', false);
                    $("#operador_propio_si").attr('checked', true);                    
                    
                } else {
                    $("#operador_propio_no").attr('checked', true);
                    $("#operador_propio_si").attr('checked', false);
                }
            });
            $("#operador_propio_no").click(function () {
                if ($("#operador_propio_no").is(':checked')) {
                    $("#operador_propio_si").attr('checked', false);
                    $("#operador_propio_no").attr('checked', true);                    
                    
                } else {
                    $("#operador_propio_si").attr('checked', true);
                    $("#operador_propio_no").attr('checked', false);
                }
            });

            $("#tarifa_plana_si").click(function () {
                if ($("#tarifa_plana_si").is(':checked')) {
                    $("#tarifa_plana_no").attr('checked', false);
                    $("#tarifa_plana_si").attr('checked', true);                    
                    
                } else {
                    $("#tarifa_plana_no").attr('checked', true);
                    $("#tarifa_plana_si").attr('checked', false);
                }
            });
            $("#tarifa_plana_no").click(function () {
                if ($("#tarifa_plana_no").is(':checked')) {
                    $("#tarifa_plana_si").attr('checked', false);
                    $("#tarifa_plana_no").attr('checked', true);                    
                    
                } else {
                    $("#tarifa_plana_si").attr('checked', true);
                    $("#tarifa_plana_no").attr('checked', false);
                }
            });

            $("#mantenimiento_si").click(function () {
                if ($("#mantenimiento_si").is(':checked')) {
                    $("#mantenimiento_no").attr('checked', false);
                    $("#mantenimiento_si").attr('checked', true);                    
                    
                } else {
                    $("#mantenimiento_no").attr('checked', true);
                    $("#mantenimiento_si").attr('checked', false);
                }
            });
            $("#mantenimiento_no").click(function () {
                if ($("#mantenimiento_no").is(':checked')) {
                    $("#mantenimiento_si").attr('checked', false);
                    $("#mantenimiento_no").attr('checked', true);                    
                    
                } else {
                    $("#mantenimiento_si").attr('checked', true);
                    $("#mantenimiento_no").attr('checked', false);
                }
            });


            $("#facturacion_propia_si").click(function () {
                if ($("#facturacion_propia_si").is(':checked')) {
                    $("#facturacion_propia_no").attr('checked', false);
                    $("#facturacion_propia_si").attr('checked', true); 
                    $('#telef_fija_hide').toggle("slide");
                    $('#telef_fija_hide2').toggle("slide");
                    
                } else {
                    $("#facturacion_propia_no").attr('checked', true);
                    $("#facturacion_propia_si").attr('checked', false);
                    
                }
            });
            $("#facturacion_propia_no").click(function () {
                if ($("#facturacion_propia_no").is(':checked')) {
                    $("#facturacion_propia_si").attr('checked', false);
                    $("#facturacion_propia_no").attr('checked', true); 
                    $('#telef_fija_hide').toggle("slide");
                    $('#telef_fija_hide2').toggle("slide");
                    
                } else {
                    $("#facturacion_propia_si").attr('checked', true);
                    $("#facturacion_propia_no").attr('checked', false);
                    $('#telef_fija_hide').toggle("slide");
                    $('#telef_fija_hide2').toggle("slide");
                }
            });



            $("#sistema_propio_si").click(function () {
                if ($("#sistema_propio_si").is(':checked')) {
                    $("#sistema_propio_no").attr('checked', false);
                    $("#sistema_propio_si").attr('checked', true); 
                    $('#omv_show12').toggle("slide");
                    
                } else {
                    $("#sistema_propio_no").attr('checked', true);
                    $("#sistema_propio_si").attr('checked', false);
                    
                }
            });
            $("#sistema_propio_no").click(function () {
                if ($("#sistema_propio_no").is(':checked')) {
                    $("#sistema_propio_si").attr('checked', false);
                    $("#sistema_propio_no").attr('checked', true); 
                    $('#omv_show12').toggle("slide");
                } else {
                    $("#sistema_propio_si").attr('checked', true);
                    $("#sistema_propio_no").attr('checked', false);                    
                }
            });

            $("#marketing_propio_si").click(function () {
                if ($("#marketing_propio_si").is(':checked')) {
                    $("#marketing_propio_no").attr('checked', false);
                    $("#marketing_propio_si").attr('checked', true); 
                    $('#otro2').toggle("slide");                    
                    
                } else {
                    $("#marketing_propio_no").attr('checked', true);
                    $("#marketing_propio_si").attr('checked', false);
                    $('#otro2').toggle("slide");   
                }
            });
            $("#marketing_propio_no").click(function () {
                if ($("#marketing_propio_no").is(':checked')) {
                    $("#marketing_propio_si").attr('checked', false);
                    $("#marketing_propio_no").attr('checked', true); 
                    $('#otro3').toggle("slide");
                } else {
                    $("#marketing_propio_si").attr('checked', true);
                    $("#marketing_propio_no").attr('checked', false);  
                    $('#otro3').toggle("slide");
                }
            });

            $("#jurídico_propio_si").click(function () {
                if ($("#jurídico_propio_si").is(':checked')) {
                    $("#jurídico_propio_no").attr('checked', false);
                    $("#jurídico_propio_si").attr('checked', true); 
                    $('#otros3').toggle("slide");                    
                    
                } else {
                    $("#marketing_propio_no").attr('checked', true);
                    $("#marketing_propio_si").attr('checked', false);
                    $('#otros3').toggle("slide");   
                }
            });
            $("#jurídico_propio_no").click(function () {
                if ($("#jurídico_propio_no").is(':checked')) {
                    $("#jurídico_propio_si").attr('checked', false);
                    $("#jurídico_propio_no").attr('checked', true); 
                    $('#otros4').toggle("slide");
                } else {
                    $("#jurídico_propio_si").attr('checked', true);
                    $("#jurídico_propio_no").attr('checked', false);  
                    $('#otros4').toggle("slide");
                }
            });

            $("#ingeniería_propio_si").click(function () {
                if ($("#ingeniería_propio_si").is(':checked')) {
                    $("#ingeniería_propio_no").attr('checked', false);
                    $("#ingeniería_propio_si").attr('checked', true); 
                    $('#desplegar4').toggle("slide");                    
                    
                } else {
                    $("#ingeniería_propio_no").attr('checked', true);
                    $("#ingeniería_propio_si").attr('checked', false);
                    $('#desplegar4').toggle("slide");   
                }
            });
            $("#ingeniería_propio_no").click(function () {
                if ($("#ingeniería_propio_no").is(':checked')) {
                    $("#ingeniería_propio_si").attr('checked', false);
                    $("#ingeniería_propio_no").attr('checked', true); 
                    $('#desplegar5').toggle("slide");
                } else {
                    $("#ingeniería_propio_si").attr('checked', true);
                    $("#ingeniería_propio_no").attr('checked', false);  
                    $('#desplegar5').toggle("slide");
                }
            });

        });  

        function comprobar() {
            //declaramos las variables a guardar.
            var  all_options, all_options2, all_options3, all_options4, all_options5, all_options6, all_options7, all_options8;
            var canal_local_si, canal_local_no, encripta_propio_si, encripta_propio_no, plataforma_ott_si, plataforma_ott_no;
            var guardar, empresa_encargada, proveedor_ott;

            //Comprobamos los radiobuttons
            canal_local_si = document.getElementById("success").checked;
            canal_local_no = document.getElementById("danger").checked;
            encripta_propio_si = document.getElementById("encriptacion_si").checked;
            encripta_propio_no = document.getElementById("encriptacion_no").checked;
            plataforma_ott_si = document.getElementById("OTT_si").checked;
            plataforma_ott_no = document.getElementById("OTT_no").checked;

            //Capturamos los valores de los inputs texts de lo que se muestra en todos los menus.
            all_options = document.getElementById("total_hogares").value;
            all_options2 = document.getElementById("total_abonados").value;
            all_options3 = document.getElementById("total_abonados_internet").value;
            all_options4 = document.getElementById("total_hogares_fija").value;
            all_options5 = document.getElementById("total_hogares_movil").value;
            all_options6 = document.getElementById("total_lineas").value;
            all_options7 = document.getElementById("total_trabajadores").value;
            all_options8 = document.getElementById("total_ingresos").value;

            //capturamos los valores de TV
            var horas_produccion, provedor_name, n_canales_contra, precio_paquete, equipo_uso, contrato_con, otros;
            horas_produccion = document.getElementById("horas_produccion").value;
            provedor_name = document.getElementById("name_proveedor").value;
            n_canales_contra = document.getElementById("number_chanels").value;
            precio_paquete = document.getElementById("price_paquet").value;
            equipo_uso = document.getElementById("equipo_uso").value;
            contrato_con = document.getElementById("empresa_encargada_encriptar").value;
            otros = document.getElementById("mis_servicios").value;


            if (canal_local_si == false && canal_local_no == false && encripta_propio_si == false && encripta_propio_no == false && plataforma_ott_si == false && plataforma_ott_no == false) {
                LanzaAviso("<h4>Necesita marcar una opcion de si o no, por favor, compruebe que todas las opciones de si o no están seleccionadas. Gracias! ");
                return false;
            }
            else {
                
                if (all_options == null || all_options <= 0) {
                    all_options = 0;
                }
                if (all_options2 == null || all_options2 <= 0) {
                    all_options2 = 0;
                }
                if (all_options3 == null || all_options3 <= 0) {
                    all_options3 = 0;
                }
                if (all_options4 == null || all_options4 <= 0) {
                    all_options4 = 0;
                }
                if (all_options5 == null || all_options5 <= 0) {
                    all_options5 = 0;
                }
                if (all_options6 == null || all_options6 <= 0) {
                    all_options6 = 0;
                }
                if (all_options7 == null || all_options7 <= 0) {
                    all_options7 = 0;
                }
                if (all_options8 == null || all_options8 <= 0) {
                    all_options8 = 0;
                }

                if (encripta_propio_si == true) {
                    empresa_encargada = document.getElementById("").value;
                    if (empresa_encargada == null || empresa_encargada.Lenght <= 0) {
                        empresa_encargada = 0;
                    }
                }
                else {
                    empresa_encargada = 0;
                }
                if (plataforma_ott_si == true) {
                    proveedor_ott = document.getElementById("").value;
                    if (proveedor_ott == null || proveedor_ott.Lenght <= 0) {
                        proveedor_ott = 0;
                    }
                }
                else {
                    proveedor_ott = 0;
                }

                guardar = canal_local_si + "¦" + canal_local_no + "¦" + encripta_propio_si + "¦" + encripta_propio_no + "¦" + empresa_encargada + "¦" + plataforma_ott_si + "¦" + plataforma_ott_no + "¦" + proveedor_ott + "¦" + all_options + "¦" + all_options2 + "¦" +
                    all_options3 + "¦" + all_options4 + "¦" + all_options5 + "¦" + all_options6 + "¦" + all_options7 + "¦" + all_options8 + "¦" + horas_produccion + "¦" + provedor_name + "¦" + n_canales_contra + "¦" + precio_paquete + "¦" + equipo_uso + "¦" + contrato_con +
                    "¦" + otros;
                document.getElementById("data_user2").value = guardar;
                Registre();
            }
        }

        function Registre() {
            var Dades; 

            
             Dades = document.getElementById("data_user").value + "¦" + canal_local_si + "¦" + canal_local_no + "¦" + encripta_propio_si + "¦" + encripta_propio_no + "¦" + plataforma_ott_si +
                "¦" + plataforma_ott_no + "¦" + document.getElementById("total_hogares").value + "¦" + document.getElementById("total_abonados").value + "¦"
                + document.getElementById("total_abonados_internet").value + "¦" + document.getElementById("total_hogares_fija").value + "¦" + document.getElementById("total_hogares_movil").value + "¦"
                + document.getElementById("total_lineas").value + "¦" + document.getElementById("total_trabajadores").value + "" + document.getElementById("total_ingresos").value;
            
            
            setTimeout("InformacioAJAX(9,\"" + Dades.replace(/"/g, "'").replace(/\n/g, "\\n") + "\", 'Registre_Tornada', '../RecepcionAJAX.aspx')", 1000);
        }          


        function Registre_Tornada(Dades) {
            //alert(Dades);
            if (Dades.substr(0, 2) == "OK") {
                if (Dades.substr(2, 1) == "7") {
                    LanzaAviso("Hemos actualizado correctacmente sus preferencias en nuestra Base de Datos. Gracias!");
                }
                else if (Dades.substr(2, 1) == "8") {
                    LanzaAviso("Hemos ingresado su elección correctacmente en nuestra Base de Datos. Gracias!");
                }
            }
            else {
                if (Dades.substr(2, 1) == "7") {
                    LanzaAviso("Ha ocurrido un error actualizando sus datos en la Base de Datos. Vuelva a repetir el proceso por favor!");
                }
                if (Dades.substr(2, 1) == "8") {
                    LanzaAviso("Ha ocurrido un error actualizando sus datos en la Base de Datos. Vuelva a repetir el proceso por favor!");
                }
            }
        }

            
        
    </script>
</body>
</html>
