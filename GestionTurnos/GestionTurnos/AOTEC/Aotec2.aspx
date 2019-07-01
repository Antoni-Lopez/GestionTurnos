<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Aotec2.aspx.vb" Inherits="GestionTurnos.Aotec2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Formulario Multi Niveles AOTEC</title>
    <!-- CSS y distintas librerias -->

    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>

    <link href="https://fonts.googleapis.com/css?family=Mali|Montserrat|Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">


    <style type="text/css">
        body {margin: 0;padding: 0;box-sizing: border-box;position: relative;background: url("img/Aotec.jpg") no-repeat center center fixed ;}

        /* Div para el logo*/
        .logo_aotec {height: 301px !important;max-width: 723px;width: 100%;margin: auto;margin-top:2%;-webkit-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);-moz-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);}
        .logo_aotec img {width: 103%;height: 302px;}

        /* Chk menus */
        .options_menu{display: block; margin-left:auto;margin-right: auto;max-width: 800px;width: 100%;margin-top:.5%;background-color: #FEC007; color: #fff;font-family: 'Mali', cursive;}

        /* Chk customized*/
        /* Hiding the checkbox, but allowing it to be focused */
        .badgebox{opacity: 0;}
        .badgebox + .badge{/* Move the check mark away when unchecked */text-indent: -999999px;/* Makes the badge's width stay the same checked and unchecked */width: 27px;}
        .badgebox:focus + .badge{/* Set something to make the badge looks focused *//* This really depends on the application, in my case it was: *//* Adding a light border */box-shadow: inset 0px 0px 5px;/* Taking the difference out of the padding */}
        .badgebox:checked + .badge{/* Move the check mark back when checked */text-indent: 0;}
        .form-groupu {display: block;margin-bottom: 15px;margin-left: 5%;font-size: 20px;}
        .form-groupu input {padding: 0;height: initial;width: initial;margin-bottom: 0;display: none;cursor: pointer;}
        .form-groupu label {position: relative;cursor: pointer;}
        .form-groupu label:before {content:'';-webkit-appearance: none;background-color: transparent;border: 2px solid Black;box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px rgba(0, 0, 0, 0.05);padding: 12px;display: inline-block;position: relative;vertical-align: text-top;cursor: pointer;margin-right: 5px;}
        .form-groupu input:checked + label:after {content: '';display: block;position: absolute;top: 6px;left: 8px;width: 11px;height: 14px;border: solid #fff;border-width: 0 2px 2px 0;transform: rotate(45deg);}
        .margen_izq{margin-top:5%;}

        /* Centrar los divs ,textos e inputs */
        .centrado{margin-left:0;width:100%;}
        label[for=textos]{margin-left: 10%;font-size: 16px;padding: 10px;font-family: 'Mali', cursive;margin-top:10px;/*font-family: 'Roboto', sans-serif;*/}
        .input_style{padding:18px;}

        /* Desplegables submenus */
        .desplegables{background-color:#FEC007;color:#fff;border: 1.5px solid black;margin-top:.5%;}
        label[for=textos_desple]{font-family: 'Mali', cursive;margin-left:5%;padding:10px;margin-top: 1%;font-size:22px;}

        /* Chk derechos autor */
        .form-groupu input:checked + label:after {border-color: #4068C1;}

        /* Televisión */
        .tv1{display: none; margin-left:auto;margin-right: auto;max-width: 750px;width: 100%;margin-top:.1%;border:Black solid 2px;border-radius:5px;background-color:#e9e9e9;padding:4px;}

        /* Botón de Guardado */
        .boton_save{display: block; margin-left:auto;margin-right: auto;max-width: 800px;width: 100%;margin-top:.5%; color: Black;}
        .guardar{display: block; margin-left:auto;margin-right: auto;width:35%;width: 30%;font-size: 20px;margin-bottom:5%;}


        /* Div Oculto*/
        #datos_user,#submenu_tv1,#submenu_tv2,#submenu_tv3,#submenu_tv4,#submenu_tv5,#submenu_tv3_2,#submenu_tv4_2,#submenu_interne1{display:none;}

        .azul{border:blue solid 2px;}
        .verde{border:green solid 2px;}
        .rojo{border:red solid 2px;}

        .btn.active span.nonCheckBoxAllow {
  display: none;
}

.btn.active span.checkBoxAllow {
  display: inline;
}

.btn span.nonCheckBoxAllow {
  display: inline;
}

.btn span.checkBoxAllow {
  display: none;
}
    </style>
    <script type="text/javascript">
        

        function loader_gif() {
            guardar_data.innerHTML = "";
            var texto = "<h4 style='text-align:center;'>Guardando los datos <img src='img/ajax-loader.gif' alt='loading' /><br/>";
            $('#guardar_data').html(texto);
            Registre();
        }

        function LanzaAviso(Text) {
            bootbox.alert({ title: "AOTEC 2019", message: Text, size: 'large' });

        }

        //Funcion para comprobar todo el sub-menu de TV
        function comprobar_submenu_tv() {
            //Guardamos elección radio button de canal local.
            var chk_canal_si, chk_canal_no, chk_canal;
            chk_canal_si = document.getElementById("success").checked;
            chk_canal_no = document.getElementById("danger").checked;

            if (chk_canal_si == false && chk_canal_no == false) {
                LanzaAviso("Lo sentimos pero en la pregunta de: ¿Dispone de Canal local?, necesita contestar si o no. Gracias!");
            }
            else {
                if (chk_canal_si == true) {
                    chk_canal = 1; //Variable que pasaremos por AJAX.
                    var total = chk_canal;
                }
                else {
                    chk_canal = 0; //Variable que pasaremos por AJAX.
                    var total = chk_canal;
                }
            }

            //Guardamos elección radio button de Encriptación.
            var chk_encripta_si, chk_encripta_no, chk_encripta,empresa;  
            chk_encripta_si = document.getElementById("success_encriptacion").checked;
            chk_encripta_no = document.getElementById("danger_encriptacion").checked;

            if (chk_encripta_si == false && chk_encripta_no == false) {
                LanzaAviso("Lo sentimos pero en la pregunta de: ¿Dispone de Sist. de Encriptación Propia?, necesita contestar si o no. Gracias!");
            }
            else {
                if (chk_encripta_si == true) {
                    chk_encripta = 1;
                    empresa = document.getElementById("mis_servicios").value;
                    var total = total + "¦" + chk_encripta + "¦" + empresa;
                }
                else {
                    chk_encripta = 0;
                    empresa = 0;
                    var total = total + "¦" + chk_encripta + "¦" + empresa;
                }
            }

            //Guardamos elección radio button de OTT.
            var chk_ott_si, chk_ott_no, chk_OTT, proveedor_ott;
            chk_ott_si = document.getElementById("success_OTT").checked;
            chk_ott_no = document.getElementById("danger_OTT").checked;

            if (chk_ott_si == false && chk_ott_no == false) {
                LanzaAviso("Lo sentimos pero en la pregunta de: ¿Dispone de Plataforma OTT Propia?, necesita contestar si o no. Gracias!");
            }
            else {
                if (chk_ott_si == true) {
                    chk_OTT = 1;
                    proveedor_ott = document.getElementById("ott_provedor").value;
                    var total = total + "¦" + chk_OTT + "¦" + proveedor_ott;
                }
                else {
                    chk_OTT = 0;
                    proveedor_ott = 0;
                    var total =  total + "¦" + chk_OTT + "¦" + proveedor_ott;
                }
            }          

            alert(total);

            //Guardamos los demas valores de TV.
            //primero comprobamos si están vacios y si lo están, le ponemos valor 0.
            var horas_produccion = document.getElementById("horas_produccion").value;

            if (horas_produccion == null || horas_produccion == "") {
                horas_produccion = 0;
                total = total + "¦" + horas_produccion;
            }
            else {
                total = total + "¦" + horas_produccion;
            }

            //Nombre del Proveedor.
            var name = document.getElementById("nombre_proveedor").value;
            if (name == null || name == "") {
                name = 0;
                total = total + "¦" + name;
            }
            else {
                total = total + "¦" + name;
            }

            //Canales Contratados.
            var canales_contratados = document.getElementById("ncanales_contratados").value;
            if (canales_contratados == null || canales_contratados == "") {
                canales_contratados = 0;
                total = total + "¦" + canales_contratados;
            }
            else {
                total = total + "¦" + canales_contratados;
            }

            //Precio Paquete.
            var precio_paquete = document.getElementById("precio_paquete").value;
            if (precio_paquete == null || precio_paquete == "") {
                precio_paquete = 0;
                total = total + "¦" + precio_paquete;
            }
            else {
                total = total + "¦" + precio_paquete;
            }

            //Equipo/Uso.
            var equipo_tv2 = document.getElementById("equipo_tv2").value;
            if (equipo_tv2 == null || equipo_tv2 == "") {
                equipo_tv2 = 0;
                total = total + "¦" + equipo_tv2;
            }
            else {
                total = total + "¦" + equipo_tv2;
            }

            //Empresa encargada encriptar.
            var encriptar_tv2 = document.getElementById("encriptar_tv2").value;
            if (encriptar_tv2 == null || encriptar_tv2 == "") {
                encriptar_tv2 = 0;
                total = total + "¦" + encriptar_tv2;
            }
            else {
                total = total + "¦" + encriptar_tv2;
            }

            //Derechos autor
            var contrato_con = document.getElementById("SGAE").checked;
            var contrato_con2 = document.getElementById("EGEDA").checked;
            var contrato_con3 = document.getElementById("AGEDI").checked;
            var contrato_con4 = document.getElementById("otros_derechos").value;

            if (contrato_con4 == null || contrato_con4 == "") {
                contrato_con4 = 0;
            }
            total = total + "¦" + contrato_con + "¦" + contrato_con2 + "¦" + contrato_con3 + "¦" + contrato_con4;

            alert(total);
            return total;
        }

        function activar(x) {
            switch (x) {
                case 1:                    
                    $('#submenu_tv3').toggle("slide");
                    $('#submenu_tv3_2').toggle("slide");
                    break;
                case 2:
                    $('#submenu_tv4').toggle("slide");
                    $('#submenu_tv4_2').toggle("slide");                    
                    break;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid logo_aotec" onclick="chorra()">
            <img src="img/logo_aotec.png" />
        </div>
        <div id="tv" class="container-fluid options_menu" runat="server">
            <div class="form-groupu">
                <input type="checkbox" id="tele" onclick="comprobar_chk()" runat="server" />
                <label for="tele" class="margen_izq">Televisión</label>
            </div>            
        </div>
        <div class="tv1" id="tv1" runat="server">
            <div class="row centrado">
                <div class="col-xs-6">
                    <label for="textos">¿Dispone de Canal local?</label>
                </div>
                <div class="col-xs-6" style="margin-top:10px;">
                    <label for="success" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="success" class="badgebox" onclick="dispo_canal()" runat="server" /><span class="badge">&check;</span></label>
                    <label for="danger" class="btn btn-danger">No <input type="checkbox" id="danger" class="badgebox" onclick="dispo_canal()" runat="server" /><span class="badge">&check;</span></label>
                </div>
            </div>
            <div class="row centrado">
                <div class="col-xs-6">
                    <label for="textos">Número de horas de producción propias. ¿Anual?</label>                    
                </div>
                <div class="col-xs-6 input_style">
                    <input type="text" class="form-control" id="horas_produccion" placeholder="Introduzca el número de horas de Producción." runat="server"  />
                </div>
            </div>
            <div id="desplegar_prove" class="row centrado desplegables">
                <label for="textos_desple">Proveedores de Canales</label> <span style="float:right; margin-right:10%;margin-top: 3.5%;color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>"
            </div>
            <div id="submenu_tv1" class="row centrado">
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">Nombre</label>                    
                    </div>
                    <div class="col-xs-6 input_style">
                        <input type="text" class="form-control" id="nombre_proveedor" runat="server" placeholder="Introduzca el nombre de su Proovedor." />
                    </div>  
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">Número Canales Contratado</label>                    
                    </div>
                    <div class="col-xs-6 input_style">
                        <input type="text" class="form-control" id="ncanales_contratados" runat="server" placeholder="Introduzca el número de canales contratados." />
                    </div>  
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">Precio / Paquete ( € )</label>                    
                    </div>
                    <div class="col-xs-6 input_style">
                        <input type="text" class="form-control" id="precio_paquete" runat="server" placeholder="Introduzca el precio del paquete." />
                    </div>  
                </div>
            </div>
            <div id="desplegar_equipa" class="row centrado desplegables">
                <label for="textos_desple">Equipamiento Cabecera</label> <span style="float:right; margin-right:10%;margin-top: 3.5%;color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>
            </div>
            <div id="submenu_tv2" class="row centrado">
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">Equipo / Uso</label>                    
                    </div>
                    <div class="col-xs-6 input_style">
                        <input type="text" class="form-control" id="equipo_tv2" runat="server" placeholder="Introduzca el uso que le da a su equipo." />
                    </div>  
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">Empresa encargada de Encriptar la señal</label>                    
                    </div>
                    <div class="col-xs-6 input_style">
                        <input type="text" class="form-control" id="encriptar_tv2" runat="server" placeholder="Introduzca el nombre de la empresa encargada." />
                    </div>  
                </div>
            </div>
            <div id="desplegar_encripta" class="row centrado desplegables">
                <label for="textos_desple">Encriptación</label> <span style="float:right; margin-right:10%;margin-top: 3.5%; color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>
            </div>
            <div id="submenu_tv3" class="row centrado">
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Dispone de Sist. de Encriptación Propio?</label>                    
                    </div>
                    <div class="col-xs-6" style="margin-top:10px;">
                        <label for="success_encriptacion" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="success_encriptacion" class="badgebox" runat="server" /><span class="badge">&check;</span></label>
                        <label for="danger_encriptacion" class="btn btn-danger">No <input type="checkbox" id="danger_encriptacion" class="badgebox" runat="server" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div id="submenu_tv3_2" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-6 texto_izq">
                         <label for="textos">Empresa encargada de encriptar la señal: </label>
                    </div>
                    <div class="col-xs-6 input_style">
                        <select id="mis_servicios" class="mdb-select md-form" runat="server">
                            <option class="prueba" value='xtra'>XTRA TELECOM</option>
                            <option class="prueba" value='safe'>SAFEVIEW</option>
                            <option class="prueba" value='otra'>OTRA...</option>
                        </select>
                    </div>
                </div>
            </div>
            <div id="desplegar_ott" class="row centrado desplegables">
                <label for="textos_desple">OTT</label> <span style="float:right; margin-right:10%;margin-top: 3.5%; color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>
            </div>
            <div id="submenu_tv4" class="row centrado">
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Dispone de Plataforma OTT propia?</label>                    
                    </div>
                    <div class="col-xs-6" style="margin-top:10px;">
                        <label for="success_OTT" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="success_OTT" class="badgebox" runat="server" /><span class="badge">&check;</span></label>
                        <label for="danger_OTT" class="btn btn-danger">No <input type="checkbox" id="danger_OTT" class="badgebox" runat="server" /><span class="badge">&check;</span></label>
                    </div>
                </div>
            </div>
            <div id="submenu_tv4_2" class="row" style="margin-left:0;width:100%;">
                    <div class="col-xs-6 texto_izq">
                        <label for="textos">Proveedor </label>
                    </div>
                    <div class="col-xs-6 input_style">
                        <input type="text" class="form-control" id="ott_provedor" runat="server" placeholder="Introduzca el nombre de su Proveedor." runat="server" />
                    </div>
                </div>
            <div id="desplegar_autor" class="row centrado desplegables">
                <label for="textos_desple">Derechos de autor </label> <span style="float:right; margin-right:10%;margin-top: 3.5%; color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>
            </div>
            <div id="submenu_tv5" class="row centrado">
                <div class="row centrado">
                    <div class="col-xs-12" style="margin-bottom:2%;font-size:24px;text-align:justify;margin-left:5%;">
                        Tienes contrato con: 
                    </div>
                    <div class="col-xs-12" style="width:100%;">
                        <div class="form-groupu chk_contrato">
                            <input type="checkbox" id="SGAE" runat="server"  />
                            <label for="SGAE" class="margen_izq">SGAE</label>
                        </div>
                        <div class="form-groupu chk_contrato">
                            <input type="checkbox" id="EGEDA" runat="server" />
                            <label for="EGEDA" class="margen_izq">EGEDA</label>
                        </div>
                        <div class="form-groupu chk_contrato">
                            <input type="checkbox" id="AGEDI" runat="server" />
                            <label for="AGEDI" class="margen_izq">AGEDI</label>
                        </div>
                        <label for="otros_derechos" style="margin-left:5%;">Otros...</label><input type="text" class="form-control" id="otros_derechos" runat="server" style="margin-left: 5% !important;width: 94.5% !important;margin-bottom: 2.5%;margin-top: 2%;" placeholder="Introduzca algo." />
                    </div>  
                </div>
            </div>
        </div>
        <div id="interne" class="container-fluid options_menu" runat="server">
            <div class="form-groupu">
                <input type="checkbox" id="internet"  runat="server" />
                <label for="internet" class="margen_izq">Internet</label>
            </div>            
        </div>
        <div class="tv1" id="interne1" runat="server">
            <div id="desplegar_caudal" class="row centrado desplegables">
                <label for="textos_desple">Caudal</label> <span style="float:right; margin-right:10%;margin-top: 3.5%;color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>"
            </div>
            <div id="submenu_interne1" class="row centrado">
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Eres AS Autonomo?</label>
                    </div>
                    <div class="col-xs-6" style="margin-top:10px;">
                        <label for="Autonomo_si" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="Autonomo_si" class="badgebox" onclick="dispo_canal()" runat="server" /><span class="badge">&check;</span></label>
                        <label for="Autonomo_no" class="btn btn-danger">No <input type="checkbox" id="Autonomo_no" class="badgebox" onclick="dispo_canal()" runat="server" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-3 verde">
                        <div class="btn-group" data-toggle="buttons">
                            <label class="btn btn-success active" style="width: 56px">
                                <span class="checkBoxAllow fas fa-check"></span>
                                <span class="nonCheckBoxAllow fas fa-times"></span>
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-3 rojo">
                      <label for="textos">¿Recibo canal por radioenlace.?</label>
                    </div>
                    <div class="col-xs-3 azul">
                      One of three columns
                    </div>
                    <div class="col-xs-3 verde">
                      One of three columns
                    </div>
                    <%--<div class="col-6 col-md-4">
                        <div class="form-groupu chk_contrato">
                            <input type="checkbox" id="fibra" runat="server" />
                            <label for="fibra" class="margen_izq">Recibo canal por Fibra Óptica</label>
                        </div>
                    </div>
                    <div class="col-6 col-md-4">
                        <label for="textos">¿Cuántos Megas?</label>    
                    </div>
                    <div class="col-6 col-md-4">
                        <input type="text" class="form-control" id="cuantos_megas" runat="server" placeholder="Introduzca el número de megas." />
                    </div>--%>
                </div>
            </div>
            <div id="desplegar_equipamiento" class="row centrado desplegables">
                <label for="textos_desple">Equipamiento</label> <span style="float:right; margin-right:10%;margin-top: 3.5%;color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>"
            </div>
        </div>
        <div id="tfija" class="container-fluid options_menu" runat="server">
            <div class="form-groupu">
                <input type="checkbox" id="tefija" runat="server" />
                <label for="tefija" class="margen_izq">Telefonia Fija</label>
            </div>            
        </div>
        <div class="tv1" id="tfija1" runat="server">
            Holaaaa
        </div>
        <div id="tmovil" class="container-fluid options_menu" runat="server">
            <div class="form-groupu">
                <input type="checkbox" id="temovil" runat="server"  />
                <label for="temovil" class="margen_izq">Telefonia Móvil</label>
            </div>            
        </div>
        <div class="tv1" id="tmovil1" runat="server">
            <div id="desplegar_OMV" class="row centrado desplegables">
                <label for="textos_desple">Si eres OMV</label> <span style="float:right; margin-right:10%;margin-top: 3.5%;color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>"
            </div>
            <div id="desplegar_comercializas_OMV" class="row centrado desplegables">
                <label for="textos_desple">Si comercializas el servicio de un OMV</label> <span style="float:right; margin-right:10%;margin-top: 3.5%;color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>"
            </div>
        </div>
        <div id="otros" class="container-fluid options_menu" runat="server">
            <div class="form-groupu">
                <input type="checkbox" id="another" runat="server" />
                <label for="another" class="margen_izq">Otros..</label>
            </div>            
        </div>
        <div class="tv1" id="otros1" runat="server">
            <div id="desplegar_marketing" class="row centrado desplegables">
                <label for="textos_desple">Marketing</label> <span style="float:right; margin-right:10%;margin-top: 3.5%;color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>"
            </div>
            <div id="desplegar_juridico" class="row centrado desplegables">
                <label for="textos_desple">Jurídico</label> <span style="float:right; margin-right:10%;margin-top: 3.5%;color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>"
            </div>
            <div id="desplegar_ingenieria" class="row centrado desplegables">
                <label for="textos_desple">Ingeniería</label> <span style="float:right; margin-right:10%;margin-top: 3.5%;color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>"
            </div>
        </div>
        <div class="row boton_save">
            <button id="guardar_data" type="button" class="btn btn-warning guardar" onclick="loader_gif();">Guardar Datos</button>
        </div>
        <div class="row">
            <asp:TextBox class="form-control" id="datos_user" runat="server" />
        </div>
    </form>
    <script type="text/javascript" src="../Script/ComunicacioAJAX.js"></script> 
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tv').click(function () {
                if ($("#tele").is(':checked')) {
                    $("#tele").attr('checked', true);
                    $('#tv1').toggle("slide");
                }
                else {
                    $("#tele").attr('checked', false);
                }
                
                
            });
            $('#interne').click(function () {
                if ($("#internet").is(':checked')) {
                    $("#internet").attr('checked', true);
                    $('#interne1').toggle("slide");
                }
                else {
                    $("#internet").attr('checked', false);
                }
                
                
            });
            $('#tfija').click(function () {
                if ($("#tefija").is(':checked')) {
                    $("#tefija").attr('checked', true);
                    $('#tfija1').toggle("slide");
                }
                else {
                    $("#tefija").attr('checked', false);
                }
                
                
            });
            $('#tmovil').click(function () {
                if ($("#temovil").is(':checked')) {
                    $("#temovil").attr('checked', true);
                    $('#tmovil1').toggle("slide");
                }
                else {
                    $("#temovil").attr('checked', false);
                }
                
                
            });
            $('#otros').click(function () {
                if ($("#another").is(':checked')) {
                    $("#another").attr('checked', true);
                    $('#otros1').toggle("slide");                    
                }
                else {
                    $("#another").attr('checked', false);
                }
                
                
            });

            //Desplegar los SubMenus.
            $('#desplegar_prove').click(function () {
                $('#submenu_tv1').toggle("slide");                
            });
            $('#desplegar_equipa').click(function () {
                $('#submenu_tv2').toggle("slide");                
            });
            $('#desplegar_encripta').click(function () {
                $('#submenu_tv3').toggle("slide");                
            });
            $('#desplegar_ott').click(function () {
                $('#submenu_tv4').toggle("slide"); 
                $('#submenu_tv4_2').toggle("slide"); 
                
            });
            $('#desplegar_autor').click(function () {
                $('#submenu_tv5').toggle("slide");                
            });
            $('#desplegar_caudal').click(function () {
                $('#submenu_interne1').toggle("slide");                
            });


            //función para radio button de dispone canal
            $("#success").click(function () {
                if ($("#success").is(':checked')) {
                    $("#danger").attr('checked', false);
                    $("#success").attr('checked', true);                    
                    
                } else {
                    $("#danger").attr('checked', true);
                    $("#success").attr('checked', false);
                }
            });
            $("#danger").click(function () {
                if ($("#danger").is(':checked')) {
                    $("#success").attr('checked', false);
                    $("#danger").attr('checked', true);                    
                    
                } else {
                    $("#success").attr('checked', true);
                    $("#danger").attr('checked', false);
                }
            });

            //función para radio button de sist. encriptación
            $("#success_encriptacion").click(function () {
                if ($("#success_encriptacion").is(':checked')) {
                    $("#danger_encriptacion").attr('checked', false);
                    $("#success_encriptacion").attr('checked', true);                    
                    $('#submenu_tv3_2').toggle("slide");
                } else {
                    $("#danger_encriptacion").attr('checked', true);
                    $("#success_encriptacion").attr('checked', false);
                    $('#submenu_tv3_2').toggle("slide");
                }
            });
            $("#danger_encriptacion").click(function () {
                if ($("#danger_encriptacion").is(':checked')) {
                    $("#success_encriptacion").attr('checked', false);
                    $("#danger_encriptacion").attr('checked', true);    
                    $('#submenu_tv3_2').toggle("slide");
                    
                } else {
                    $("#success_encriptacion").attr('checked', true);
                    $("#danger_encriptacion").attr('checked', false);
                }
            });

            //función para radio button de sist. OTT
            $("#success_OTT").click(function () {
                if ($("#success_OTT").is(':checked')) {
                    $("#danger_OTT").attr('checked', false);
                    $("#success_OTT").attr('checked', true);                    
                    $('#submenu_tv4_2').toggle("slide");
                } else {
                    $("#danger_OTT").attr('checked', true);
                    $("#success_OTT").attr('checked', false);
                    $('#submenu_tv4_2').toggle("slide");
                }
            });
            $("#danger_OTT").click(function () {
                if ($("#danger_OTT").is(':checked')) {
                    $("#success_OTT").attr('checked', false);
                    $("#danger_OTT").attr('checked', true);    
                    $('#submenu_tv4_2').toggle("slide");
                    
                } else {
                    $("#success_encriptacion").attr('checked', true);
                    $("#danger_encriptacion").attr('checked', false);
                }
            });

        });

        function Registre() {
            var Dades; 
            var chk1, chk2, chk3, chk4, chk5;
            chk1 = document.getElementById("tele").checked;
            chk2 = document.getElementById("internet").checked;
            chk3 = document.getElementById("tefija").checked;
            chk4 = document.getElementById("temovil").checked;
            chk5 = document.getElementById("another").checked;

            if (chk1 == true) {
                chk1 = 1;
            }
            else {
                chk1 = 0;
            }

            if (chk2 == true) {
                chk2 = 1;
            }
            else {
                chk2 = 0;
            }

            if (chk3 == true) {
                chk3 = 1;
            }
            else {
                chk3 = 0;
            }

            if (chk4 == true) {
                chk4 = 1;
            }
            else {
                chk4 = 0;
            }

            if (chk5 == true) {
                chk5 = 1;
            }
            else {
                chk5 = 0;
            }

            var comprobacion_tv;
            comprobacion_tv = comprobar_submenu_tv();


            Dades = document.getElementById("datos_user").value + "¦" + chk1 + "¦" + chk2 + "¦" + chk3 + "¦" + chk4 + "¦" + chk5 + "¦" + comprobacion_tv;
            
            setTimeout("InformacioAJAX(9,\"" + Dades.replace(/"/g, "'").replace(/\n/g, "\\n") + "\", 'Registre_Tornada', '../RecepcionAJAX.aspx')", 1000);
        }          


        function Registre_Tornada(Dades) {
            //alert(Dades);
            if (Dades.substr(0, 2) == "OK") {
                if (Dades.substr(2, 1) == "9") {
                    LanzaAviso("Hemos actualizado correctacmente sus preferencias en nuestra Base de Datos. Recuerde que tiene hasta el día 25 para terminar el cuestionario. Gracias!");
                    guardar_data.innerHTML = "";
                    var texto = "<h4 style='text-align:center;'>Datos Guardados con exito!<br/>";
                    setTimeout($('#guardar_data').html(texto), 1000);
                }
                else if (Dades.substr(2, 1) == "8") {
                    LanzaAviso("Hemos ingresado su elección correctacmente en nuestra Base de Datos. Gracias!");
                }
            }
            else {
                if (Dades.substr(2, 1) == "9") {
                    LanzaAviso("Ha ocurrido un error actualizando sus datos en la Base de Datos. Vuelva a repetir el proceso por favor!");
                    guardar_data.innerHTML = "";
                    var texto = "<h4 style='text-align:center;'>ERROR al Guardar Datos!<br/>";
                    $('#guardar_data').html(texto);
                }
                if (Dades.substr(2, 1) == "8") {
                    LanzaAviso("Ha ocurrido un error actualizando sus datos en la Base de Datos. Vuelva a repetir el proceso por favor!");
                }
            }
        }

    </script>
</body>
</html>
