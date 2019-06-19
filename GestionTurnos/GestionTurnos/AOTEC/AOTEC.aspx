﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Aotec.aspx.vb" Inherits="GestionTurnos.Aotec" %>

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
        body {margin: 0;padding: 0;box-sizing: border-box;position: relative;background-image: url("img/Aotec.jpg");background-size: cover;}


        /* Div para el logo*/
        .logo_aotec {height: 385px !important;max-width: 830px;width: 100%;margin: auto;margin-top:2%;-webkit-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);-moz-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);}

        .logo_aotec img {margin-left:-1%;width: 103%;}

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

        #anadir_more{-moz-box-shadow:inset 0px 0px 23px -50px #fff6af;
	-webkit-box-shadow:inset 0px 0px 23px -50px #fff6af;
	box-shadow:inset 0px 0px 23px -50px #fff6af;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffec64), color-stop(1, #fec007));
	background:-moz-linear-gradient(top, #ffec64 5%, #fec007 100%);
	background:-webkit-linear-gradient(top, #ffec64 5%, #fec007 100%);
	background:-o-linear-gradient(top, #ffec64 5%, #fec007 100%);
	background:-ms-linear-gradient(top, #ffec64 5%, #fec007 100%);
	background:linear-gradient(to bottom, #ffec64 5%, #fec007 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffec64', endColorstr='#fec007',GradientType=0);
	background-color:#ffec64;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	border:2px solid #ffaa22;
	display:inline-block;
	cursor:pointer;
	color:#333333;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:10px 30px;
	text-decoration:none;
	text-shadow:0px 0px 0px #ffee66;}


#anadir_more:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #fec007), color-stop(1, #ffec64));
	background:-moz-linear-gradient(top, #fec007 5%, #ffec64 100%);
	background:-webkit-linear-gradient(top, #fec007 5%, #ffec64 100%);
	background:-o-linear-gradient(top, #fec007 5%, #ffec64 100%);
	background:-ms-linear-gradient(top, #fec007 5%, #ffec64 100%);
	background:linear-gradient(to bottom, #fec007 5%, #ffec64 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fec007', endColorstr='#ffec64',GradientType=0);
	background-color:#fec007;
}
#anadir_more:active {
	position:relative;
	top:1px;
}



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
    </script>


</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid logo_aotec" onclick="crear_newdiv()">
            <img src="img/aotec_img.jpg" />
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

            <%--<select id="mis_servicios" class="segment-select" runat="server">
                    <option class="prueba" value='1'>Televisión</option>
                    <option class="prueba" value='2'>Internet</option>
                    <option class="prueba" value='3'>Telefonía Fija</option>
                    <option class="prueba" value='4'>Telefonía Móvil</option>
                </select>--%>
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
                        <input type="text" class="form-control" id="aaa" placeholder="Introduzca el nombre de su fabricante." />
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
            <div id="fijo2" class="row verde">
                
            </div>
            <div id="movil2" class="row azul">
                Hola Me llamo Jose
            </div>
            <div id="another2" class="row verde">
                Hola Me llamo Jose
            </div>
        </div>
        <input type="text" class="form-control" style="margin-left:5% !important;width:95% !important;" id="oculto" placeholder="Número Mbs." />
    </form>
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






            //$("#anadir_more").click(function () {
                
            //    var cont = 1;

                

                
            //        //$('body').append('<div class="divBody">¡Felicidades! Has insertado un nuevo DIV en el BODY</div>');
            //        //<div class="row" style="margin-left:0;width:100%;margin-top:5%;">
            //        //    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="padding:10px;text-align:center;padding-left:.5%;"> Subida (Mbps) </div>
            //        //    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="padding:1px">
            //        //        <input type="text" class="form-control inputs_especiales" id="subida_velocity" placeholder="Número Mbs." />
            //        //    </div>
            //        //    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="padding:10px;text-align:center;padding-left:.5%;"> Bajada (Mbps) </div>
            //        //    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="padding:1px;">
            //        //        <input type="text" class="form-control inputs_especiales" style="padding:10px !important;" id="bajada_velocity" placeholder="Número Mbs." />
            //        //    </div>
            //        //</div>
               
            //});

            
        }); 
    </script>
</body>
</html>
