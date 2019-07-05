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
        #datos_user,#submenu_tv1,#submenu_tv2,#submenu_tv3,#submenu_tv4,#submenu_tv5,#submenu_tv3_2,#submenu_tv4_2,#submenu_interne1,#submenu_interne2,#datos_ocultos,#tv1{display:none;}

        .azul{border:blue solid 2px;}
        .verde{border:green solid 2px;}
        .rojo{border:red solid 2px;}

        .btn.active span.nonCheckBoxAllow {display: none;}
        .btn.active span.checkBoxAllow {display: inline;}
        .btn span.nonCheckBoxAllow {display: inline;}
        .btn span.checkBoxAllow {display: none;}


        #fibra,#radioenlace{display:none;}
        #fibra + label,#radioenlace + label{cursor:pointer;margin-top: 10%;font-size: 11px;text-align: center;}
        #fibra + label:before, #radioenlace + label:before{background: #fff;height: 21px;border:1px solid #FEC007;content: " ";display: inline-block;width: 21px;vertical-align: middle;margin-right: 10px;position:relative;top:-1px;}
        #fibra:checked + label:before,#radioenlace:checked + label:before{content: "\2713";color: #FEC007;font-size: 24px;text-align: center;line-height: 21px;}

        .btn-orange-moon {background: #fc4a1a;background: -webkit-linear-gradient(to right, #f7b733, #fc4a1a);background: linear-gradient(to right, #f7b733, #fc4a1a);color: #fff;border: 3px solid #eee;margin-left: 34%;margin-top: 7%;}

        .oculto_contador{margin-left:5%;width:90%;}
    </style>
    <script type="text/javascript">
        
        //Funcion para añadir animación al boton de guardado.
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
            chk_encripta_si = document.getElementById("encriptacionPropia_si").checked;
            chk_encripta_no = document.getElementById("encriptacionPropia_no").checked;

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
            chk_ott_si = document.getElementById("PlataformaOTTPropia_si").checked;
            chk_ott_no = document.getElementById("PlataformaOTTPropia_no").checked;

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

            return total;
        }

        //Funcion para comprobar todo el sub-menu de Internet
        function comprobar_submenu_internet() {
            //Guardamos como true o false el checkeo del radio button de as autonomo. 
            var auto_si, auto_no;
            auto_si = document.getElementById("Autonomo_si").checked;
            auto_no = document.getElementById("Autonomo_no").checked;

            var total = auto_si + "¦" + auto_no;

            

            //Ahora procedemos a guardar los 2 checkboxs y sus inputs textos.
            var chk_fibra, chk_radioenlace, cuantos_fibra, cuantos_radioenlace, cuantos1,cuantos2;
            chk_fibra = document.getElementById("fibra").checked;
            chk_radioenlace = document.getElementById("radioenlace").checked;
            cuantos_fibra = document.getElementById("fibra_megas").value;
            cuantos_radioenlace = document.getElementById("radioenlace_megas").value;

            if ((cuantos_fibra == null) || (cuantos_fibra == "")) {
                cuantos1 = 0;
            }
            else {
                cuantos1 = cuantos_fibra;
            }
            if ((cuantos_radioenlace == null) || (cuantos_radioenlace == "")) {
                cuantos2 = 0;
            }
            else {
                cuantos2 = cuantos_radioenlace;
            }

            total = total + "¦" + chk_fibra + "¦" + chk_radioenlace + "¦" + cuantos1 + "¦" + cuantos2;

            

            //Procedemos a guardar los inputs.
            var megas_caudal, proveedor_circuito, precio_circuito, proveedor_caudal, precio_caudal,pasar,pasar2,pasar3,pasar4,pasar5;
            megas_caudal = document.getElementById("megas_caudal").value;
            proveedor_circuito = document.getElementById("proveedor_circuito").value;
            precio_circuito = document.getElementById("precio_circuito").value;
            proveedor_caudal = document.getElementById("proveedor_caudal").value;
            precio_caudal = document.getElementById("precio_caudal").value;



            if ((megas_caudal == null) || (megas_caudal == "")) {
                pasar = 0;
            }
            else {
                pasar = megas_caudal;
            }

            if ((proveedor_circuito == null) || (proveedor_circuito == "")) {
                pasar2 = 0;
            }
            else {
                pasar2 = proveedor_circuito;
            }

            if ((precio_circuito == null) || (precio_circuito == "")) {
                pasar3 = 0;
            }
            else {
                pasar3 = precio_circuito;
            }

            if ((proveedor_caudal == null) || (proveedor_caudal == "")) {
                pasar4 = 0;
            }
            else {
                pasar4 = proveedor_caudal;
            }

            if ((precio_caudal == null) || (precio_caudal == "")) {
                pasar5 = 0;
            }
            else {
                pasar5 = precio_caudal;
            }

            total = total + "¦" + pasar + "¦" + pasar2 + "¦" + pasar3 + "¦" + pasar4 + "¦" + pasar5;

            

            //Ahora vamos a capturar la velocidad que ofrece.
            var subida, subida2, subida3, subida4, subida5, bajada, bajada2, bajada3, bajada4, bajada5;

            //Subida y Bajada 1.
            if (document.getElementById("subida_ofreces").value == null || document.getElementById("subida_ofreces").value == "") {
                subida = 0;
            }
            else {
                subida = document.getElementById("subida_ofreces").value;
            }
            if (document.getElementById("bajada_ofreces").value == null || document.getElementById("bajada_ofreces").value == "") {
                bajada = 0;
            }
            else {
                bajada = document.getElementById("bajada_ofreces").value;
            }

            //Subida y Bajada 2.                
            if (document.getElementById("subida_ofreces2").value == null || document.getElementById("subida_ofreces2").value == "") {
                subida2 = 0;
            }
            else {
                subida2 = document.getElementById("subida_ofreces2").value;
            }                
            if (document.getElementById("bajada_ofreces2").value == null || document.getElementById("bajada_ofreces2").value == "") {
                bajada2 = 0;
            }
            else {
                bajada2 = document.getElementById("bajada_ofreces2").value;
            }

            //Subida y Bajada 3.
            if (document.getElementById("subida_ofreces3").value == null || document.getElementById("subida_ofreces3").value == "") {
                subida3 = 0;
            }
            else {
                subida3 = document.getElementById("subida_ofreces3").value;
            }

            if (document.getElementById("bajada_ofreces3").value == null || document.getElementById("bajada_ofreces3").value == "") {
                bajada3 = 0;
            }
            else {
                bajada3 = document.getElementById("bajada_ofreces3").value;
            }

            //Subida y Bajada 4.
            if (document.getElementById("subida_ofreces4").value == null || document.getElementById("subida_ofreces4").value == "") {
                subida4 = 0;
            }
            else {
                subida4 = document.getElementById("subida_ofreces4").value;
            }
            if (document.getElementById("bajada_ofreces4").value == null || document.getElementById("bajada_ofreces4").value == "") {
                bajada4 = 0;
            }
            else {
                bajada4 = document.getElementById("bajada_ofreces4").value;
            }

            //Subida y Bajada 5.
            if (document.getElementById("subida_ofreces5").value == null || document.getElementById("subida_ofreces5").value == "") {
                subida5 = 0;
            }
            else {
                subida5 = document.getElementById("subida_ofreces5").value;
            }
            if (document.getElementById("bajada_ofreces5").value == null || document.getElementById("bajada_ofreces5").value == "") {
                bajada5 = 0;
            }
            else {
                bajada5 = document.getElementById("bajada_ofreces5").value;
            }             
            
            var datos_velocidad = subida + "¦" + subida2 + "¦" + subida3 + "¦" + subida4 + "¦" + subida5;
            var datos_velocidad = datos_velocidad + "¦" + bajada + "¦" + bajada2 + "¦" + bajada3 + "¦" + bajada4 + "¦" + bajada5;

                
                       

            total = total + "¦" + datos_velocidad; 
            

            //Ahora capturamos los datos de equipamiento.
            var equip_us = document.getElementById("equipo_uso").value;
            var brand = document.getElementById("marca_fabricante").value;

            if ((equip_us == null) || (equip_us == "")) {
                equip_us = 0;
            }

            if ((brand == null) || (brand == "")) {
                brand = 0;
            }

            total += "¦" + equip_us + "¦" + brand;

            return total;
            }

        //Funcion para comprobar todo el sub-menu de Internet
        function comprobar_submenu_tfija() {
            var operador_num_propia_si, operador_num_propia_no, tarifa_plana_si, tarifa_plana_no, mantenimiento_linea_si, mantenimiento_linea_no, sist_facturacion_propio_si, sist_facturacion_propio_no;

            operador_num_propia_si = document.getElementById("operadorNumPropia_si").checked;
            operador_num_propia_no = document.getElementById("operadorNumPropia_no").checked;
            tarifa_plana_si = document.getElementById("TarifaPplana_si").checked;
            tarifa_plana_no = document.getElementById("TarifaPplana_no").checked;
            mantenimiento_linea_si = document.getElementById("mantenimiento_linea_si").checked;
            mantenimiento_linea_no = document.getElementById("mantenimiento_linea_no").checked;
            sist_facturacion_propio_si = document.getElementById("FacturacionPropia_si").checked;
            sist_facturacion_propio_no = document.getElementById("FacturacionPropia_no").checked;

            var factu_ajena;

            if (sist_facturacion_propio_no == true) {
                factu_ajena = document.getElementById("facturacion_ajena").value;
            }
            else {
                factu_ajena = 0;
            }
            var total = operador_num_propia_si + "¦" + operador_num_propia_no + "¦" + tarifa_plana_si + "¦" + tarifa_plana_no + "¦" + mantenimiento_linea_si + "¦" + mantenimiento_linea_no + "¦" + sist_facturacion_propio_si + "¦" + sist_facturacion_propio_no + "¦" + factu_ajena;

            var empresa_suministra, min_consumo_men_fijofijo, precio_min_fijofijo, min_consumo_men_fijomovil, precio_min_fijomovil;

            empresa_suministra = document.getElementById("suministra_telefonico").value;
            min_consumo_men_fijofijo = document.getElementById("min_consumo_mensual").value;
            precio_min_fijofijo = document.getElementById("fijo_fijo").value;
            min_consumo_men_fijomovil = document.getElementById("fijo_movil_min").value;
            precio_min_fijomovil = document.getElementById("precio_fijo_movil").value;

            if ((empresa_suministra == null) || (empresa_suministra == "")) {
                empresa_suministra = 0;
            }

            if ((min_consumo_men_fijofijo == null) || (min_consumo_men_fijofijo == "")) {
                min_consumo_men_fijofijo = 0;
            }

            if ((precio_min_fijofijo == null) || (precio_min_fijofijo == "")) {
                precio_min_fijofijo = 0;
            }

            if ((min_consumo_men_fijomovil == null) || (min_consumo_men_fijomovil == "")) {
                min_consumo_men_fijomovil = 0;
            }

            if ((precio_min_fijomovil == null) || (precio_min_fijomovil == "")) {
                precio_min_fijomovil = 0;
            }

            total = total + "¦" + empresa_suministra + "¦" + min_consumo_men_fijofijo + "¦" + precio_min_fijofijo + "¦" + min_consumo_men_fijomovil + "¦" + precio_min_fijomovil; 

            return total;
        }

        //Funcion para comprobar todo el sub-menu de Internet
        function comprobar_submenu_tmovil() {

            //Si eres OMV
            var operador, ofreces_tarifaplana_si, ofreces_tarifaplana_no, min_movilmovil, min_movilfijo;
            operador = document.getElementById("cual_operador").value;
            ofreces_tarifaplana_si = document.getElementById("OfrecesTarifaPlana_si").checked;
            ofreces_tarifaplana_no = document.getElementById("OfrecesTarifaPlana_no").checked;
            min_movilmovil = document.getElementById("cuantos_min_men_movilmovil").value;
            min_movilfijo = document.getElementById("cuantos_min_men_movilfijo").value;

            if ((operador == null) || (operador == "")) {
                operador = 0;
            }
            if ((min_movilmovil == null) || (min_movilmovil == "")) {
                min_movilmovil = 0;
            }
            if ((min_movilfijo == null) || (min_movilfijo == "")) {
                min_movilfijo = 0;
            }



            var total = operador + "¦" + ofreces_tarifaplana_si + "¦" + ofreces_tarifaplana_no + "¦" + min_movilmovil + "¦" + min_movilfijo;

            //Si comercializas el servicio
            var omv, omv_tarifaplana_si, omv_tarifaplana_no, min_facturas_omv_movilmovil, min_facturas_omv_movilfijo, consumo_datos_men, factu_men_movil, sist_fact_propio_si, sist_fact_propio_no,empresa_lleva_fact;

            omv = document.getElementById("cual_omv").value;
            omv_tarifaplana_si = document.getElementById("OfrecesTarifaPlanaCualomv_si").checked;
            omv_tarifaplana_no = document.getElementById("OfrecesTarifaPlanaCualomv_no").checked;
            min_facturas_omv_movilmovil = document.getElementById("min_facturas_omv_mens_movilmovil").value;
            min_facturas_omv_movilfijo = document.getElementById("min_facturas_omv_mens_movilfijo").value;
            consumo_datos_men = document.getElementById("consumo_datos_mens").value;
            factu_men_movil = document.getElementById("facturacion_mensual").value;
            sist_fact_propio_si = document.getElementById("SistFactuPropio_si").checked;
            sist_fact_propio_no = document.getElementById("SistFactuPropio_no").checked;
            empresa_lleva_fact = document.getElementById("empresa_lleva_fact").value;

            if ((omv == null) || (omv == "")) {
                omv = 0;
            }
            if ((min_facturas_omv_movilmovil == null) || (min_facturas_omv_movilmovil == "")) {
                min_facturas_omv_movilmovil = 0;
            }
            if ((min_facturas_omv_movilfijo == null) || (min_facturas_omv_movilfijo == "")) {
                min_facturas_omv_movilfijo = 0;
            }
            if ((consumo_datos_men == null) || (consumo_datos_men == "")) {
                consumo_datos_men = 0;
            }
            if ((factu_men_movil == null) || (factu_men_movil == "")) {
                factu_men_movil = 0;
            }
            if ((empresa_lleva_fact == null) || (empresa_lleva_fact == "")) {
                empresa_lleva_fact = 0;
            }

            total = total + "¦" + omv + "¦" + omv_tarifaplana_si + "¦" + omv_tarifaplana_no + "¦" + min_facturas_omv_movilmovil + "¦" + min_facturas_omv_movilfijo + "¦" + consumo_datos_men + "¦" + factu_men_movil + "¦" + sist_fact_propio_si + "¦" + sist_fact_propio_no + "¦" + empresa_lleva_fact;

            return total;
        }

        //Funcion para comprobar todo el sub-menu de Internet
        function comprobar_submenu_otros() {
            var marketing_propio_si, marketing_propio_no, pres_mensual, juridico_propio_si, juridico_propio_no, pres_mensual_invierte, dep_ingenieria_propio_si, dep_ingenieria_propio_no, personas_forman_ingenieria, empresa_gestiona;
            var hogares_pasados,abonados_TV,abonados_internet,abonados_tfija,abonados_tmovil,num_lineas_totales,num_trabajadores,ingresos

            marketing_propio_si = document.getElementById("MarketingPropio_si").checked;
            marketing_propio_no = document.getElementById("MarketingPropio_no").checked;
            pres_mensual = document.getElementById("pres_invirte_mes").value;
            juridico_propio_si = document.getElementById("DepartamentoJuridico_si").checked;
            juridico_propio_no = document.getElementById("DepartamentoJuridico_no").checked;
            pres_mensual_invierte = document.getElementById("pres_mensual_invierte").value;
            dep_ingenieria_propio_si = document.getElementById("DepartamentoIngenieria_si").checked;
            dep_ingenieria_propio_no = document.getElementById("DepartamentoIngenieria_no").checked;

            personas_forman_ingenieria = document.getElementById("personas_forman_ingenieria").value;
            empresa_gestiona = document.getElementById("empresa_gestiona").value;

            hogares_pasados = document.getElementById("hogares_pasados").value;
            abonados_TV = document.getElementById("abonados_TV").value;
            abonados_internet = document.getElementById("abonados_internet").value;
            abonados_tfija = document.getElementById("abonados_tfija").value;
            abonados_tmovil = document.getElementById("abonados_tmovil").value;
            num_lineas_totales = document.getElementById("num_lineas_totales").value;
            num_trabajadores = document.getElementById("num_trabajadores").value;
            ingresos = document.getElementById("ingresos").value;

            if ((pres_mensual == null) || (pres_mensual == "")) {
                pres_mensual = 0;
            }

            if ((pres_mensual_invierte == null) || (pres_mensual_invierte == "")) {
                pres_mensual_invierte = 0;
            }

            if ((personas_forman_ingenieria == null) || (personas_forman_ingenieria == "")) {
                personas_forman_ingenieria = 0;
            }

            if ((empresa_gestiona == null) || (empresa_gestiona == "")) {
                empresa_gestiona = 0;
            }
            if ((hogares_pasados == null) || (hogares_pasados == "")) {
                hogares_pasados = 0;
            }
            if ((abonados_TV == null) || (abonados_TV == "")) {
                abonados_TV = 0;
            }
            if ((abonados_internet == null) || (abonados_internet == "")) {
                abonados_internet = 0;
            }
            if ((abonados_tfija == null) || (abonados_tfija == "")) {
                abonados_tfija = 0;
            }
            if ((abonados_tmovil == null) || (abonados_tmovil == "")) {
                abonados_tmovil = 0;
            }
            if ((num_lineas_totales == null) || (num_lineas_totales == "")) {
                num_lineas_totales = 0;
            }
            if ((num_trabajadores == null) || (num_trabajadores == "")) {
                num_trabajadores = 0;
            }
            if ((ingresos == null) || (ingresos == "")) {
                ingresos = 0;
            }

            var total = marketing_propio_si + "¦" + marketing_propio_no + "¦" + pres_mensual + "¦" + juridico_propio_si + "¦" + juridico_propio_no + "¦" + pres_mensual_invierte + "¦" + dep_ingenieria_propio_si + "¦" + dep_ingenieria_propio_no + "¦" + personas_forman_ingenieria + "¦" + empresa_gestiona;
            total = total + "¦" + hogares_pasados + "¦" + abonados_TV + "¦" + abonados_internet + "¦" + abonados_tfija + "¦" + abonados_tmovil + "¦" + num_lineas_totales + "¦" + num_trabajadores + "¦" + ingresos;

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
                case 3: //abrir cuantas personas lo componen, en otros/Ingenieria.
                    $('#personas_componen_inge').toggle("slide");
                    break;
                case 4: //abrir que empresa lo gestiona.
                    $('#empresa_gestiona_ingenie').toggle("slide");
                    break;
            }
        }





        //funcion que le pasamos los chk para que si esta el si seleccionado, el no, no lo este, vamos nos cercioramos de que efectivamente siempre hay 1 marcado.
        function MisRadioButtons(Valor1, Valor2) {
            document.getElementById(Valor1 + Valor2).checked = true;
            document.getElementById(Valor1 + (Valor2 == "si" ? "no" : "si")).checked = false;
        }

       //funcion para comprobar los inputs text en en el panel de TV
        function comprobar_tv_text() {
            var V_Ids = ["horas_produccion", "nombre_proveedor", "ncanales_contratados", "precio_paquete", "equipo_tv2", "encriptar_tv2", "mis_servicios", "ott_provedor", "otros_derechos"];
            var i, comprobar, comprobar2, total,total2;

            total = '';
            for (i = 0; i < 9; i++) {
                comprobar = document.getElementById(V_Ids[i]).value;                
                if (i == 0) {
                    total = comprobar;
                }
                else {
                    if ((comprobar == null) || (comprobar == "")) {
                        comprobar = 0;
                    }
                    total = total + "¦" + comprobar;
                }                
            }
            comprobar2 = comprobar_tv_chk();
            total2 = total + "¦" + comprobar2;
            alert(total2);
        }

        //funcion para comprobar los inputs checkboxs en en el panel de TV
        function comprobar_tv_chk() {
            var chk_Ids = ["success", "danger", "encriptacionPropia_si", "encriptacionPropia_no", "PlataformaOTTPropia_si", "PlataformaOTTPropia_no", "SGAE", "EGEDA", "AGEDI"];
            var comprobar2,j;
            var total = '';
            for (j = 0; j < 9; j++) {
                comprobar2 = document.getElementById(chk_Ids[j]).checked;
                if (j == 0) {
                    total = comprobar2;
                }
                else {
                    total = total + "¦" + comprobar2;
                }
                
            }
            return total;
        }

        //funcion para comprobar los inputs checkboxs en en el panel de Internet.
        function comprobar_internet_chk() { }

        //funcion para comprobar los inputs texts en en el panel de Internet.
        function comprobar_internet_text() {} 

        function miprueba() {

        }
    </script>
</head>
<body>
    <form name="form_AOTEC" id="form1" runat="server">
        <div class="container-fluid logo_aotec" onclick="miprueba()">
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
                    <label for="success" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="success" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                    <label for="danger" class="btn btn-danger">No <input type="checkbox" id="danger" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
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
                        <label for="encriptacionPropia_si" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="encriptacionPropia_si" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                        <label for="encriptacionPropia_no" class="btn btn-danger">No <input type="checkbox" id="encriptacionPropia_no" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
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
                        <label for="PlataformaOTTPropia_si" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="PlataformaOTTPropia_si" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                        <label for="PlataformaOTTPropia_no" class="btn btn-danger">No <input type="checkbox" id="PlataformaOTTPropia_no" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
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
                        <label for="Autonomo_si" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="Autonomo_si" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                        <label for="Autonomo_no" class="btn btn-danger">No <input type="checkbox" id="Autonomo_no" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-4">
                        <div class="form-group">
                            <input type="checkbox" name="custom_checkbox" id="fibra" value="custom_checkbox" runat="server" />
                            <label for="fibra">¿Recibo canal por fibra óptica?</label>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <label for="textos" style="font-size: 15px !important;">¿Cuántos Megas?</label> 
                    </div>
                    <div class="col-xs-4" style="padding: 6px;">
                        <input type="text" class="form-control" id="fibra_megas" runat="server" style="margin-left: 5% !important;width: 94.5% !important;margin-bottom: 2.5%;margin-top: 2%;" placeholder="Introduzca número Mbs." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-4">
                        <div class="form-group">
                            <input type="checkbox" name="custom_checkbox" id="radioenlace" value="custom_checkbox" runat="server" />
                            <label for="radioenlace">¿Recibo canal por radioenlace?</label>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <label for="textos" style="font-size: 15px !important;">¿Cuántos Megas?</label> 
                    </div>
                    <div class="col-xs-4" style="padding: 6px;">
                        <input type="text" class="form-control" id="radioenlace_megas" runat="server" style="margin-left: 5% !important;width: 94.5% !important;margin-bottom: 2.5%;margin-top: 2%;" placeholder="Introduzca número Mbs." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Cuántos megas de caudal consumes aproximadamente?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 3%;">
                        <input type="text" class="form-control" id="megas_caudal" runat="server" placeholder="Introduzca el número de Mbs." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Quién es tu Proveedor de circuito?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 3%;">
                        <input type="text" class="form-control" id="proveedor_circuito" runat="server" placeholder="Introduzca su proveedor." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">Precio de su Circuito</label>
                    </div>
                    <div class="col-xs-6" style="padding: 3%;">
                        <input type="text" class="form-control" id="precio_circuito" runat="server" placeholder="Introduzca el Precio." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Quién es tu proveedor de caudal?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 3%;">
                        <input type="text" class="form-control" id="proveedor_caudal" runat="server" placeholder="Introduzca su proveedor." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Precio del caudal contratado?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 3%;">
                        <input type="text" class="form-control" id="precio_caudal" runat="server" placeholder="Introduzca el Precio." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">Velocidad que ofreces actualmente a tus clientes (Máx=5) .</label>
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-3">
                        <label for="textos">Subida (Mbps)</label>
                    </div>
                    <div class="col-xs-3" style="padding: 1%;">
                        <input type="text" class="form-control" id="subida_ofreces" runat="server" style="margin-left: 5% !important;width: 94.5% !important;margin-bottom: 2.5%;margin-top: 2%;" placeholder="Introduzca número Mbs." />
                    </div>
                    <div class="col-xs-3" onclick="prueba()">
                        <label for="textos">Bajada (Mbps)</label>
                    </div>
                    <div class="col-xs-3" style="padding: 1%;">
                        <input type="text" class="form-control" id="bajada_ofreces" runat="server" style="margin-left: 5% !important;width: 94.5% !important;margin-bottom: 2.5%;margin-top: 2%;" placeholder="Introduzca número Mbs." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-3">
                        <label for="textos">Subida (Mbps)</label>
                    </div>
                    <div class="col-xs-3" style="padding: 1%;">
                        <input type="text" class="form-control" id="subida_ofreces2" runat="server" style="margin-left: 5% !important;width: 94.5% !important;margin-bottom: 2.5%;margin-top: 2%;" placeholder="Introduzca número Mbs." />
                    </div>
                    <div class="col-xs-3" onclick="prueba()">
                        <label for="textos">Bajada (Mbps)</label>
                    </div>
                    <div class="col-xs-3" style="padding: 1%;">
                        <input type="text" class="form-control" id="bajada_ofreces2" runat="server" style="margin-left: 5% !important;width: 94.5% !important;margin-bottom: 2.5%;margin-top: 2%;" placeholder="Introduzca número Mbs." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-3">
                        <label for="textos">Subida (Mbps)</label>
                    </div>
                    <div class="col-xs-3" style="padding: 1%;">
                        <input type="text" class="form-control" id="subida_ofreces3" runat="server" style="margin-left: 5% !important;width: 94.5% !important;margin-bottom: 2.5%;margin-top: 2%;" placeholder="Introduzca número Mbs." />
                    </div>
                    <div class="col-xs-3" onclick="prueba()">
                        <label for="textos">Bajada (Mbps)</label>
                    </div>
                    <div class="col-xs-3" style="padding: 1%;">
                        <input type="text" class="form-control" id="bajada_ofreces3" runat="server" style="margin-left: 5% !important;width: 94.5% !important;margin-bottom: 2.5%;margin-top: 2%;" placeholder="Introduzca número Mbs." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-3">
                        <label for="textos">Subida (Mbps)</label>
                    </div>
                    <div class="col-xs-3" style="padding: 1%;">
                        <input type="text" class="form-control" id="subida_ofreces4" runat="server" style="margin-left: 5% !important;width: 94.5% !important;margin-bottom: 2.5%;margin-top: 2%;" placeholder="Introduzca número Mbs." />
                    </div>
                    <div class="col-xs-3" onclick="prueba()">
                        <label for="textos">Bajada (Mbps)</label>
                    </div>
                    <div class="col-xs-3" style="padding: 1%;">
                        <input type="text" class="form-control" id="bajada_ofreces4" runat="server" style="margin-left: 5% !important;width: 94.5% !important;margin-bottom: 2.5%;margin-top: 2%;" placeholder="Introduzca número Mbs." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-3">
                        <label for="textos">Subida (Mbps)</label>
                    </div>
                    <div class="col-xs-3" style="padding: 1%;">
                        <input type="text" class="form-control" id="subida_ofreces5" runat="server" style="margin-left: 5% !important;width: 94.5% !important;margin-bottom: 2.5%;margin-top: 2%;" placeholder="Introduzca número Mbs." />
                    </div>
                    <div class="col-xs-3" onclick="prueba()">
                        <label for="textos">Bajada (Mbps)</label>
                    </div>
                    <div class="col-xs-3" style="padding: 1%;">
                        <input type="text" class="form-control" id="bajada_ofreces5" runat="server" style="margin-left: 5% !important;width: 94.5% !important;margin-bottom: 2.5%;margin-top: 2%;" placeholder="Introduzca número Mbs." />
                    </div>
                </div>
            </div>
            <div id="desplegar_equipamiento" class="row centrado desplegables">
                <label for="textos_desple">Equipamiento</label> <span style="float:right; margin-right:10%;margin-top: 3.5%;color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>"
            </div>
            <div id="submenu_interne2" class="row centrado"> 
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">Equipo / Uso</label>
                    </div>
                <div class="col-xs-6" style="padding:2%">
                    <input type="text" class="form-control" id="equipo_uso" runat="server" placeholder="Introduzca el uso que le da a su equipo." />
                </div>
            </div>
            <div class="row centrado">
                <div class="col-xs-6">
                    <label for="textos">Marca / Fabricante</label>
                </div>
                <div class="col-xs-6" style="padding:2%">
                    <input type="text" class="form-control" id="marca_fabricante" runat="server" placeholder="Introduzca la marca de su fabricante." />
                </div>
            </div>
            </div>
        </div>
        <div id="tfija" class="container-fluid options_menu" runat="server">
            <div class="form-groupu">
                <input type="checkbox" id="tefija" runat="server" />
                <label for="tefija" class="margen_izq">Telefonia Fija</label>
            </div>            
        </div>
        <div class="tv1" id="tfija1" runat="server">
            <div class="row centrado">
                <div class="col-xs-6">
                    <label for="textos">¿Eres operador con numeración propia?</label>
                </div>
                <div class="col-xs-6" style="padding: 2.38%;margin-top: 1%;">
                    <label for="operadorNumPropia_si" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="operadorNumPropia_si" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                    <label for="operadorNumPropia_no" class="btn btn-danger">No <input type="checkbox" id="operadorNumPropia_no" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                </div>
            </div>
            <div class="row centrado">
                <div class="col-xs-6" style="margin-top:.5%;">
                    <label for="textos">¿Tienes tarifa plana?</label>
                </div>
                <div class="col-xs-6" style="padding:2.3%;">
                    <label for="TarifaPplana_si" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="TarifaPplana_si" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                    <label for="TarifaPplana_no" class="btn btn-danger">No <input type="checkbox" id="TarifaPplana_no" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                </div>
            </div>
            <div class="row centrado" style="margin-top:.9%;">
                <div class="col-xs-6">
                    <label for="textos">¿Tienes mantenimiento de línea?</label>
                </div>
                <div class="col-xs-6" style="padding:2.3%;">
                    <label for="MantenimientoLinea_si" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="MantenimientoLinea_si" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                    <label for="MantenimientoLinea_no" class="btn btn-danger">No <input type="checkbox" id="MantenimientoLinea_no" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                </div>
            </div>
            <div class="row centrado">
                <div class="col-xs-6">
                    <label for="textos">¿Tienes sistema de facturación propio?</label>
                </div>
                <div class="col-xs-6" style="padding: 2.3%;margin-top: 0.5%;">
                    <label for="FacturacionPropia_si" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="FacturacionPropia_si" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                    <label for="FacturacionPropia_no" class="btn btn-danger">No <input type="checkbox" id="FacturacionPropia_no" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                </div>
            </div>
            <div id="sistema_factu_propio" class="row centrado" style="display:none;">
                <div class="col-xs-6">
                    <label for="textos">¿Que empresa ajena te lleva la facturación?</label>
                </div>
                <div class="col-xs-6" style="padding:4.1%;">
                    <input type="text" class="form-control" id="facturacion_ajena" runat="server" placeholder="Quien te lleva la facturación." />
                </div>
            </div>
            <div class="row centrado">
                <div class="col-xs-6" style="margin-top:1%;">
                    <label for="textos">¿Que empresa te suministra la telefonía?</label>
                </div>
                <div class="col-xs-6" style="padding: 10px;margin-top: 3%;">
                    <input type="text" class="form-control" id="suministra_telefonico" runat="server" placeholder="Que empresa te proporciona el servicio." />
                </div>
            </div>
            <div class="row centrado">
                <div class="col-xs-6" style="margin-top:1%;">
                    <label for="textos">¿Cuantos minutos tienes de consumo mensualmente (aprox) de fijo a fijo?</label>
                </div>
                <div class="col-xs-6" style="padding: 10px;margin-top: 4%;">
                    <input type="text" class="form-control" id="min_consumo_mensual" runat="server" placeholder="¿Cuantos minutos tienes?" />
                </div>
            </div>
            <div class="row centrado">
                <div class="col-xs-6">
                    <label for="textos">¿Precio del min de fijo a fijo?</label>
                </div>
                <div class="col-xs-6" style="padding: 10px;margin-top: .1%;">
                    <input type="text" class="form-control" id="fijo_fijo" runat="server" placeholder="Precio del min de fijo a fijo." />
                </div>
            </div>
            <div class="row centrado">
                <div class="col-xs-6">
                    <label for="textos">¿Cuantos minutos tienes de consumo mensualmente (aprox) de fijo a móvil?</label>
                </div>
                <div class="col-xs-6" style="padding: 10px;margin-top: 3%;">
                    <input type="text" class="form-control" id="fijo_movil_min" runat="server" placeholder="Precio del min de fijo a fijo." />
                </div>
            </div>
            <div class="row centrado">
                <div class="col-xs-6">
                    <label for="textos">¿Precio del min de fijo a móvil?</label>
                </div>
                <div class="col-xs-6" style="padding: 10px;margin-top: .1%;">
                    <input type="text" class="form-control" id="precio_fijo_movil" runat="server" placeholder="Precio del min de fijo a fijo." />
                </div>
            </div>
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
            <div id="si_eres_omv" class="row centrado" style="display:none;">
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Cuál es tu operador de red?</label>
                    </div>
                    <div class="col-xs-6" style="padding:10px;">
                        <input type="text" class="form-control" id="cual_operador" runat="server" placeholder="Dinos el nombre de tu Operador." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Ofreces tarifa plana?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top: .3%;">                        
                        <label for="OfrecesTarifaPlana_si" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="OfrecesTarifaPlana_si" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                        <label for="OfrecesTarifaPlana_no" class="btn btn-danger">No <input type="checkbox" id="OfrecesTarifaPlana_no" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Cuántos minutos tienes de consumo mensualmente (aprox) de móvil a móvil?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top:3%;">
                        <input type="text" class="form-control" id="cuantos_min_men_movilmovil" runat="server" placeholder="Cuantos min  aprox." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Cuántos minutos tienes de consumo mensualmente (aprox) de móvil a fijo?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top: 4%;">
                        <input type="text" class="form-control" id="cuantos_min_men_movilfijo" runat="server" placeholder="Dinos el nombre de tu Operador." />
                    </div>
                </div>
            </div>
            <div id="desplegar_comercializas_OMV" class="row centrado desplegables">
                <label for="textos_desple">Si comercializas el servicio de un OMV</label> <span style="float:right; margin-right:10%;margin-top: 3.5%;color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>"
            </div>
            <div id="comercializas_omv" class="row centrado" style="display:none;">
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Cuál es tu OMV?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top:.3%;">
                        <input type="text" class="form-control" id="cual_omv" runat="server" placeholder="Dinos el nombre de tu Operador." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Ofrece tarifa plana?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top:.3%;">
                        <label for="OfrecesTarifaPlanaCualomv_si" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="OfrecesTarifaPlanaCualomv_si" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                        <label for="OfrecesTarifaPlanaCualomv_no" class="btn btn-danger">No <input type="checkbox" id="OfrecesTarifaPlanaCualomv_no" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Cuántos minutos facturas para tu OMV mensualmente (aprox) de móvil a móvil?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top:4%;">
                        <input type="text" class="form-control" id="min_facturas_omv_mens_movilmovil" runat="server" placeholder="Dinos el nombre de tu Operador." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Cuántos minutos facturas para tu OMV mensualmente (aprox) de móvil a fijo?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top:3%;">
                        <input type="text" class="form-control" id="min_facturas_omv_mens_movilfijo" runat="server" placeholder="Dinos el nombre de tu Operador." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Que consumo de datos tienes mensualmente (aprox)?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top:2%;">
                        <input type="text" class="form-control" id="consumo_datos_mens" runat="server" placeholder="Dinos el nombre de tu Operador." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Cuál es su facturación mensual/comisiones móvil?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top:2%;">
                        <input type="text" class="form-control" id="facturacion_mensual" runat="server" placeholder="Dinos el nombre de tu Operador." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Tiene sistema de facturación propio?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top:1.5%;">
                        <label for="SistFactuPropio_si" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="SistFactuPropio_si" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                        <label for="SistFactuPropio_no" class="btn btn-danger">No <input type="checkbox" id="SistFactuPropio_no" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                    </div>                    
                </div>
                <div id="quien_telleva_fact" class="row centrado" style="display:none;">
                    <div class="col-xs-6">
                        <label for="textos">¿Qué empresa ajena te lleva la facturación?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top:1.5%;">
                        <input type="text" class="form-control" id="empresa_lleva_fact" runat="server" placeholder="Que empresa te lleva la facturación." />
                    </div>
                </div>
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
                <label for="textos_desple">Marketing</label> <span style="float:right; margin-right:10%;margin-top: 3.5%;color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>
            </div>
            <div id="marketing" class="row centrado" style="display:none;">
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Dispone de departamento de marketing propio?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top: 2%;">
                        <label for="MarketingPropio_si" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="MarketingPropio_si" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                        <label for="MarketingPropio_no" class="btn btn-danger">No <input type="checkbox" id="MarketingPropio_no" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Qué presupuesto mensual invierte (aprox)?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top: 2%;">
                        <input type="text" class="form-control" id="pres_invirte_mes" runat="server" placeholder="Describa cuanto presupuesto invierte al mes." />
                    </div>
                </div>
            </div>
            <div id="desplegar_juridico" class="row centrado desplegables">
                <label for="textos_desple">Jurídico</label> <span style="float:right; margin-right:10%;margin-top: 3.5%;color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>
            </div>
            <div id="juridico" class="row centrado" style="display:none;">
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Dispone de departamento de jurídico propio?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top: 2%;">
                        <label for="DepartamentoJuridico_si" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="DepartamentoJuridico_si" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                        <label for="DepartamentoJuridico_no" class="btn btn-danger">No <input type="checkbox" id="DepartamentoJuridico_no" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Qué presupuesto mensual invierte (aprox)?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top: 2%;">
                        <input type="text" class="form-control" id="pres_mensual_invierte" runat="server" placeholder="Describa cuanto presupuesto invierte al mes." />
                    </div>
                </div>
            </div>
            <div id="desplegar_ingenieria" class="row centrado desplegables">
                <label for="textos_desple">Ingeniería</label> <span style="float:right; margin-right:10%;margin-top: 3.5%;color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>
            </div>
            <div id="ingenieria" class="row centrado" style="display:none;">
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">¿Dispone de departamento de ingeniería propio?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top: 2%;">
                        <label for="DepartamentoIngenieria_si" class="btn btn-success" style="margin-right: 47%;">Sí <input type="checkbox" id="DepartamentoIngenieria_si" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                        <label for="DepartamentoIngenieria_no" class="btn btn-danger">No <input type="checkbox" id="DepartamentoIngenieria_no" class="badgebox" onclick="MisRadioButtons(this.id.substr(0,this.id.lastIndexOf('_')+1),this.id.substr(this.id.lastIndexOf('_')+1))" runat="server" /><span class="badge">&check;</span></label>
                    </div>
                </div>
                <div id="personas_componen_inge" class="row centrado" style="display:none;">
                    <div class="col-xs-6">
                        <label for="textos">¿Cuántas personas lo componen?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;">
                        <input type="text" class="form-control" id="personas_forman_ingenieria" runat="server" placeholder="Describa de cuantas personas dispone en Marketing." />
                    </div>
                </div>
                <div id="empresa_gestiona_ingenie" class="row centrado" style="display:none;">
                    <div class="col-xs-6">
                        <label for="textos">¿Qué empresa se lo gestiona?</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;">
                        <input type="text" class="form-control" id="empresa_gestiona" runat="server" placeholder="Describa que empresa se lo gestiona." />
                    </div>
                </div>
            </div>
            <div id="desplegar_masopc" class="row centrado desplegables">
                <label for="textos_desple">Más Opciones..</label> <span style="float:right; margin-right:10%;margin-top: 3.5%;color:#fff;"><i class="fas fa-arrow-alt-circle-down"></i></span>
            </div>
            <div id="mas_opc" class="row centrado" style="display:none;">
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">Número total de hogares pasados:</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;">
                        <input type="text" class="form-control" id="hogares_pasados" runat="server" placeholder="Número de hogares pasados." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">Número de abonados al servicio de TV:</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top:1%;">
                        <input type="text" class="form-control" id="abonados_TV" runat="server" placeholder="Número de abonados al servicio de TV." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">Número de abonados a Internet:</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;">
                        <input type="text" class="form-control" id="abonados_internet" runat="server" placeholder="Número de abonados al servicio de Internet." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">Número de abonados a telefonía fija:</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;margin-top:1%;">
                        <input type="text" class="form-control" id="abonados_tfija" runat="server" placeholder="Número de abonados al servicio de Telefonia Fija." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">Número de abonados a telefonía móvil:</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;">
                        <input type="text" class="form-control" id="abonados_tmovil" runat="server" placeholder="Número de abonados al servicio de Telefonia móvil." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">Número de líneas totales:</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;">
                        <input type="text" class="form-control" id="num_lineas_totales" runat="server" placeholder="Número de líneas totales." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">Número de trabajadores en la empresa:</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;">
                        <input type="text" class="form-control" id="num_trabajadores" runat="server" placeholder="Número de trabajadores en la empresa." />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="col-xs-6">
                        <label for="textos">Ingresos anuales de explotación:</label>
                    </div>
                    <div class="col-xs-6" style="padding: 10px;">
                        <input type="text" class="form-control" id="ingresos" runat="server" placeholder="Número de ingresos anuales." />
                    </div>
                </div>
            </div> 
        </div>
        <div class="row boton_save">
            <button id="guardar_data" type="button" class="btn btn-warning guardar" onclick="loader_gif();">Guardar Datos</button>
        </div>
        <div class="row">
            <asp:TextBox class="form-control" id="datos_user" runat="server" />
            <asp:TextBox class="form-control oculto_contador" id="datos_ocultos" runat="server" />
        </div>
    </form>
    <script type="text/javascript" src="../Script/ComunicacioAJAX.js"></script> 
    <script type="text/javascript">   
        
        $(document).ready(function () {
            $('#tele').click(function () {            
                if ($("#tele").is(':checked')) {
                    $("#tele").attr('checked', true);   
                    $('#tv1').slideDown(1500);
                }
                else {
                    $("#tele").attr('checked', false);
                    $('#tv1').slideUp(1500);
                }              
            });
            $('#internet').click(function () {                
                if ($("#internet").is(':checked')) {
                    $("#internet").attr('checked', true);    
                    $('#interne1').toggle("slide");
                }
                else {
                    $("#internet").attr('checked', false);
                    $('#interne1').slideUp(1500);
                }               
            });
            $('#tefija').click(function () {                
                if ($("#tefija").is(':checked')) {
                    $("#tefija").attr('checked', true);   
                    $('#tfija1').slideDown(1500);
                }
                else {
                    $("#tefija").attr('checked', false);
                    $('#tfija1').slideUp(1500);
                }                
            });
            $('#temovil').click(function () {                
                if ($("#temovil").is(':checked')) {
                    $("#temovil").attr('checked', true);
                    $('#tmovil1').toggle("slide");
                }
                else {
                    $("#temovil").attr('checked', false);
                    $('#tmovil1').toggle("slide");
                }                
            });
            $('#another').click(function () {
                if ($("#another").is(':checked')) {
                    $("#another").attr('checked', true);    
                    $('#otros1').slideDown(1500);
                }
                else {
                    $("#another").attr('checked', false);
                    $('#otros1').slideUp(1500);
                }                
            });

            //Desplegar los SubMenus.
            $('#desplegar_prove').click(function () {
                $('#submenu_tv1').slideDown(1000);
                
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
            $('#desplegar_equipamiento').click(function () {
                $('#submenu_interne2').toggle("slide");                
            });
            $('#desplegar_OMV').click(function () {
                $('#si_eres_omv').toggle("slide");                
            });

            $('#desplegar_comercializas_OMV').click(function () {
                $('#comercializas_omv').toggle("slide");                
            });

            $('#desplegar_marketing').click(function () {
                $('#marketing').toggle("slide");                
            });
            $('#desplegar_juridico').click(function () {
                $('#juridico').toggle("slide");                
            });
            $('#desplegar_ingenieria').click(function () {
                $('#ingenieria').toggle("slide");                
            });
            $('#desplegar_masopc').click(function () {
                $('#mas_opc').toggle("slide");                
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
            $("#encriptacionPropia_si").click(function () {
                if ($("#encriptacionPropia_si").is(':checked')) {
                    $('#submenu_tv3_2').toggle("slide");
                }
            });
            $("#encriptacionPropia_no").click(function () {
                if ($("#encriptacionPropia_no").is(':checked')) {   
                    $('#submenu_tv3_2').hide("slide");                    
                }
            });

            //función para radio button de sist. OTT
            $("#PlataformaOTTPropia_si").click(function () {
                if ($("#PlataformaOTTPropia_si").is(':checked')) {                    
                    $('#submenu_tv4_2').show("slide");
                }
            });
            $("#PlataformaOTTPropia_no").click(function () {
                if ($("#PlataformaOTTPropia_no").is(':checked')) {
                    $('#submenu_tv4_2').hide("slide");
                    
                }
            });

            //función para radio button de sist. facturación propio.
            $("#facturacion_propia_si").click(function () {
                if ($("#facturacion_propia_si").is(':checked')) {
                    $("#facturacion_propia_no").attr('checked', false);
                    $("#facturacion_propia_si").attr('checked', true);                           
                } else {
                    $("#facturacion_propia_no").attr('checked', true);
                    $("#facturacion_propia_si").attr('checked', false);
                }
            });
            $("#facturacion_propia_no").click(function () {
                if ($("#facturacion_propia_no").is(':checked')) {
                    $("#facturacion_propia_si").attr('checked', false);
                    $("#facturacion_propia_no").attr('checked', true);                    
                    $('#sistema_factu_propio').toggle("slide");                    
                } else {
                    $("#facturacion_propia_si").attr('checked', true);
                    $("#facturacion_propia_no").attr('checked', false);
                    $('#sistema_factu_propio').toggle("slide");                    
                }
            });


            //función para radio button de sist.facturacion propio comercializas omv.
            $("#SistFactuPropio_si").click(function () {
                if ($("#SistFactuPropio_si").is(':checked')) {  
                    $('#quien_telleva_fact').hide();                    
                }
            });
            $("#SistFactuPropio_no").click(function () {
                if ($("#SistFactuPropio_no").is(':checked')) {
                    $('#quien_telleva_fact').show("slide");                    
                }
            });

            //función para radio button de ingenieria
            $("#DepartamentoIngenieria_si").click(function () {
                if ($("#DepartamentoIngenieria_si").is(':checked')) {                      
                    $('#personas_componen_inge').show("slide");
                    $('#empresa_gestiona_ingenie').hide();

                }
            });
            $("#DepartamentoIngenieria_no").click(function () {
                if ($("#DepartamentoIngenieria_no").is(':checked')) {
                    $('#personas_componen_inge').hide();
                    $('#empresa_gestiona_ingenie').show("slide");
                    
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

            var comprobacion_tv = comprobar_submenu_tv();
            alert(comprobacion_tv);
            var comprobacion_internet = comprobar_submenu_internet();
            alert(comprobacion_internet);
            var comprobacion_tel_fija = comprobar_submenu_tfija();
            alert(comprobacion_tel_fija);
            var comprobacion_tel_movil = comprobar_submenu_tmovil();
            alert(comprobacion_tel_movil);
            var comprobacion_otros = comprobar_submenu_otros();
            alert(comprobacion_otros);
            Dades = document.getElementById("datos_user").value + "¦" + chk1 + "¦" + chk2 + "¦" + chk3 + "¦" + chk4 + "¦" + chk5 + "¦" + comprobacion_tv + "¦" + comprobacion_internet + "¦" + comprobacion_tel_fija + "¦" + comprobacion_tel_movil + "¦" + comprobacion_otros;

            alert(Dades);
            setTimeout("InformacioAJAX(9,\"" + Dades.replace(/"/g, "'").replace(/\n/g, "\\n") + "\", 'Registre_Tornada', '../RecepcionAJAX.aspx')", 1000);
        }          


        function Registre_Tornada(Dades) {
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
