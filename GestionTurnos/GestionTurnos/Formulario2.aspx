<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Formulario2.aspx.vb" Inherits="GestionTurnos.Formulario2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <!-- CSS y distintas librerias -->

    <asp:literal id="bootstrap_min_css" runat="server"></asp:literal>
    <asp:literal id="jquery_1_9_1_min_js" runat="server"></asp:literal>
    <asp:literal id="bootstrap_min_js" runat="server"></asp:literal>
    <asp:literal id="bootbox_min_js" runat="server"></asp:literal>


    <style>
        /* Formateamos el body para que se apliquen nuestros stilos perfect (-;*/
        body{margin: 0;padding: 0;box-sizing:border-box;}


        /* Colores para ver visualmente que realiza cada nomenclatura de BootStrap.*/
        .verde {border: 2px solid green;}
        .rojo {border: 2px solid red;}
        .amarillo {border: 2px solid yellow;}
        .azul {border: 2px solid blue;}
        .rosa {border: 2px solid pink;}


        /* Varios */
        .margen{margin:auto;}
        .pad{padding:5px;}
        .padd{padding:10px;}
        .centro{text-align: center;}
        .altura{height: 100px;}
        #ciudad_origen{opacity:0;}


        /* Cuadro para el banner */
        .banner{max-width: 810px;margin:auto;margin-top: 2.5%;border: 1px solid black;padding: 10px;height: 391px;background-color: #fff;box-shadow: 0px 0px 25px 1px rgba(0,0,0,0.75);}
        .my_img{width: 103%;margin-left:-1.3%;margin-top:-1.3%;height: 391px;}
        
                
        /* Radio Buttons Delegado/Medico */
        .funkyradio {clear: both;/*margin: 0 50px;*/overflow: hidden;margin-left: 17%;}
        .funkyinline {display: inline-block;padding-right:10px;width: 40%;}
        .funkyinline label {padding-right:10px;}
        .funkyradio label {width: 100%;border-radius: 5px;border: 2px solid #D1D3D4;font-weight: normal;margin-left: 0;}
        .funkyradio label:hover {color:#FFFFFF;background-color: #0e4c57;}
        .funkyradio input[type="radio"]:empty, .funkyradio input[type="checkbox"]:empty {display: none;}
        .funkyradio input[type="radio"]:empty ~ label, .funkyradio input[type="checkbox"]:empty ~ label {position: relative;line-height: 2.5em;text-indent: 3.25em;margin-top: 0.2em;cursor: pointer;-webkit-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none;}
        .funkyradio input[type="radio"]:empty ~ label:before, .funkyradio input[type="checkbox"]:empty ~ label:before {position: absolute;display: block;top: 0;bottom: 0;left: 0;content:'';width: 2.5em;background: #D1D3D4;border-radius: 3px 0 0 3px;}
        .funkyradio input[type="radio"]:hover ~ label:before, .funkyradio input[type="checkbox"]:hover ~ label:before {background-color: #0BBDE3;color: #fff;}
        .funkyradio input[type="radio"]:not(:checked) ~ label:before {content:'\29BE';text-indent: .8em;color: #000000;}
        .funkyradio input[type="radio"]:hover:not(:checked) ~ label:before {content:'\29BE';text-indent: .8em;color: #FFF;}
        .funkyradio input[type="checkbox"]:hover:not(:checked) ~ label:before {content:'\2714';text-indent: .9em;color: #C2C2C2;}
        .funkyradio input[type="radio"]:hover:not(:checked) ~ label, .funkyradio input[type="checkbox"]:hover:not(:checked) ~ label {color: #FFF;}
        .funkyradio input[type="radio"]:checked ~ label:before {content:'\29BF';text-indent: .8em;color: #333;background-color: #CCC;}
        .funkyradio input[type="checkbox"]:checked ~ label:before {content:'\2714';text-indent: .9em;color: #333;background-color: #ccc;}
        .funkyradio input[type="radio"]:checked ~ label, .funkyradio input[type="checkbox"]:checked ~ label {background-color: #0e4c57;color: #FFF;}
        .funkyradio input[type="radio"]:focus ~ label:before, .funkyradio input[type="checkbox"]:focus ~ label:before {box-shadow: 0 0 0 3px #999;}
        .funkyradio-default input[type="radio"]:checked ~ label:before, .funkyradio-default input[type="checkbox"]:checked ~ label:before {color: #FFF;background-color: #115f6d;}
        .funkyradio-primary input[type="radio"]:checked ~ label:before, .funkyradio-primary input[type="checkbox"]:checked ~ label:before {color: #fff;background-color: #337ab7;}
        .funkyradio-success input[type="radio"]:checked ~ label:before, .funkyradio-success input[type="checkbox"]:checked ~ label:before {color: #fff;background-color: #5cb85c;}
        .funkyradio-danger input[type="radio"]:checked ~ label:before, .funkyradio-danger input[type="checkbox"]:checked ~ label:before {color: #fff;background-color: #d9534f;}
        .funkyradio-warning input[type="radio"]:checked ~ label:before, .funkyradio-warning input[type="checkbox"]:checked ~ label:before {color: #fff;background-color: #f0ad4e;}
        .funkyradio-info input[type="radio"]:checked ~ label:before, .funkyradio-info input[type="checkbox"]:checked ~ label:before {color: #fff;background-color: #5bc0de;}

        /* Sentencias para el medico. */
        .cabecera{margin-top: 3.5% !important;border-radius: 6px;background-color: #E07C1A;color: #fff;font-size: 22px;padding-left: 20px;}
        .panel,#cuadro_medico1{margin-top: .2% !important;background-color: #D4D4D4;font-size: 16px;}        
        #cuadro_medico1{height: auto !important;}
        #cuadro_medico4{margin-bottom: 5% !important;}
        .cabecera,.panel,.panel1{max-width: 660px;width: 100%;padding: 10px;margin: auto;border: 2px solid black;}
        .text-muted{color: #C80C1B;font-weight: bold;font-size: 78%;}
        #cuadro_medico5{display:none;margin-bottom: 10%;}
        .desaparecer_botones_edicion_delegado{display: none !important;opacity: 0;}
        label[for=consen_no],label[for=transpor_no],label[for=alojamiento_medico_no]{margin-left: -20%;}

        .textos_radios_medico{font-size: 16px; font-weight: bold;margin-left: 5%;}

        /* Selector de Medicos */
        .mi_selector{margin:auto;}
        select#soflow, select#soflow-color {-webkit-appearance: button;-webkit-border-radius: 2px;-webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);-webkit-padding-end: 20px;-webkit-padding-start: 2px;-webkit-user-select: none;background-image: url(http://i62.tinypic.com/15xvbd5.png), -webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);background-position: 97% center;background-repeat: no-repeat;border: 1px solid #AAA;color: #555;font-size: inherit;margin: 20px;overflow: hidden;padding: 5px 10px;text-overflow: ellipsis;white-space: nowrap;width: 52%;margin-left: 22.5%;}


        /* Estilos Radio Buttons personalizados. */
        .radios_molones {clear: both;overflow: hidden;}
        .radios_molones label {min-width: 50%; width: 85%;border-radius: 5px;border: 1px solid Black;font-weight: normal;background: #fff; color: #0990BC;}
        .radios_molones input[type="radio"]:empty {display: none;}
        .radios_molones input[type="radio"]:empty ~ label{position: relative;line-height: 2.5em;text-indent: 3.25em;margin-top: 2em;cursor: pointer;-webkit-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none;}
        .radios_molones input[type="radio"]:empty ~ label:before {position: absolute;display: block;top: 0;bottom: 0;left: 0;content: '';width: 2.5em;background: #bfbfbf;border-radius: 3px 0 0 3px;}
        .radios_molones input[type="radio"]:hover:not(:checked) ~ label {color: Black;}
        .radios_molones input[type="radio"]:hover:not(:checked) ~ label:before {content: '\2714';text-indent: .9em;color: white;}
        .radios_molones input[type="radio"]:checked ~ label{color: #fff;background-color: #115F6D}
        .radios_molones input[type="radio"]:checked ~ label:before {content: '\2714';text-indent: .9em;color: #333;background-color: #ccc;}
        .radios_molones input[type="radio"]:focus ~ label:before {box-shadow: 0 0 0 3px #999;}
        .radios_molones-success input[type="radio"]:checked ~ label:before {color: #fff;background-color: #5cb85c;}
        .radios_molones-danger input[type="radio"]:checked ~ label:before {color: #fff;background-color: #d9534f;}
      
        .subir_miketa{margin-top: -12%;}

        /* Alergia y obser medicos*/
        .medic_aler,.medic_obser{ height: 40px;}
              
        
        /* Boton SEND medicos */
        .enviar {background-color: #E07C1A;margin-left: 40%;width: 20%;font-size: 20px;color: #fff;opacity: 1;border-radius: 6px;}
        .enviar:hover {background-color: #04B5DE;color: #fff;box-shadow: -2px 10px 25px -15px rgba(0,0,0,0.75);font-weight: bold;}


        /* Boton Delete medicos*/
        #Button_Medico_Delete {background-color:#E21212;margin-left: -77%;margin-bottom: 4%;margin-top: 4%;width: 20%;font-size: 20px;color: #fff;opacity: 1;border-radius: 6px;}
        #Button_Medico_Delete:hover {background-color: #fff;color: #E21212;box-shadow: -2px 10px 25px -15px rgba(0,0,0,0.75);font-weight: bold;}


        /* Cuadro delegado */
        #cuadro_delegado,#cuadro_delegado2,#cuadro_delegado3,#cuadro_delegado4 {background-color: #D4D4D4;font-size: 16px;border-radius: 6px;padding-left: 20px;max-width: 660px;width: 100%;padding: 10px;margin: auto;border: 2px solid black;}
        #cuadro_delegado{margin-top: 1%;}
        #cuadro_delegado2{height: 250px;}
        #cuadro_delegado2,#cuadro_delegado3,#cuadro_delegado4{margin-top: 0.2%;}
        #cuadro_delegado4{margin-bottom: 10%;}
        #city_origen_medic{margin-top: 3%;}
        label[for=asistira_delegado_no],label[for=transporte_delegado_no],label[for=alojamiento_delegado_no]{margin-left: -20%;}
        .textos_radios_delegado{font-size: 16px; font-weight: bold;margin-left: 10%;}

        /*input ocultos para paso de valores*/
        .inputs_hidden{display:block;position: absolute; top: 250%;}
        /* Media Querys para diseño Responsive.*/
        @media (max-width: 991px) {
            #cuadro_medico2{height: auto;}
            .switch1 {position: absolute;top: -340%;}
            #transporte_label{margin-top:7%;}
            .switch2 {top: -7%;}
            .duo{width: 50% !important;}
            .segundo{margin-left: 50%;margin-top: -13.1%;width: 49%;}
            .mailto{margin-left: 50%;margin-top: -16.5%;width: 49%;}
            #ciudad_origen {margin-top: 14%;}
            .maildelegat{margin-left: 50%;margin-top: -16.5%;}
            .num_delegat {margin-top: 0;} 
            .region_delegat{margin-top: -13%;}
            .inputs_responsives1{width: 50% !important;}
            .inputs_responsives2{width: 50% !important;margin-left: 50%;margin-top: -11.5%;}
            .asiste_respon{margin-top: -4%;}
            .mi_responsive{margin-top: 5%;}
            .input_aloja_respon{margin-top: -12%;}
            .input_transpor_respon{margin-top: 12%;}
            .citi_origen_respon{margin-top: 17%;margin-bottom: 2%;}
            .inputs_alojamiento_respon{margin-top: 0;margin-bottom: 10%;}
            .origen_medic_respon{margin-top: 5%;}
            .alojamiento_responsive{margin-top: -1%;}
            #cuadro_medico5{margin-bottom: 20%;}
            .input_aloja_respon {margin-top: -12% !important;}
            label[for=transporte_label]{margin-top: 5% !important;}
            .textos_radios_medico{}
            .radios_molones label{min-width: 50%; width: 50%;}
            .consen_respon_medic,.aloja_respon_medic{width: 49%;}
            .transpor_respon_medic,.city_origen_medic{width: 49%;margin-left: 50%;margin-top: -13.5%;}
            label[for=consen_si]{margin-top:13%;}
            .consen_no_respon,.transpor_no_respon,.asiste_no_respon{margin-top: -28.5%;margin-left: 53%;}
            .radios_molones-success{width: 71%;}
            .radios_molones-danger{width: 71%;}
            .city_origen_medic{margin-bottom: 5%;padding-top:1.5%;}
            }
        @media (max-width: 810px) {
            .cabecera,.panel,#cuadro_delegado,#cuadro_delegado2,#cuadro_delegado3,#cuadro_delegado4{max-width: 360px;width: 100%;}
            .inputs_medico,.inputs_responsives{width: 100% !important;margin-left:0 !important; margin-top: 0 !important;}
            .consen_respon{margin-top: 2%;margin-bottom: 4%;}
            .transpor_respon{margin-top: 5%;}
            .toggle-radio2{margin-top: -2%;}
            .origen_respon{margin-top: 13.5% !important;}
            #soflow,#Button_Medico_Delete,.enviar{font-size: 14px !important;}
            .toggle-radio1{margin-top: -20% !important;}
            .inputs_responsives1,.inputs_responsives2{width: 100% !important;}
            .inputs_responsives2{margin: 0 0 0 0 !important;}
            .mi_responsive{margin-top: -2%;}
            .switch2{margin-top: -1.5% !important;}
            .transporRespon{margin-top: -9.5% !important;}
            #cuadro_medico5{margin-bottom: 20%;}
            .banner{max-width: 610px;margin:auto;}
            .input_aloja_respon {margin-top: -25% !important;}
            label[for=transporte_label]{margin-top: 5% !important;}
            .transporte_responsive{margin-top: 9% !important;}
            .input_transpor_respon {margin-top: 17%;}
            .citi_origen_respon{margin-top: 25% !important ;}
            inputs_alojamiento_respon{margin-top: -2% !important;margin-bottom: 2.5% !important;}

            .consen_respon_medic,.aloja_respon_medic,.transpor_respon_medic,.city_origen_medic{width: 100%;margin-top: 1%;margin-left: 0;padding:5px;} 
            .radios_molones-danger{margin-top: -28.5%;}
            .textos_radios_medico{margin-left:20%;}
            .radios_molones{margin-left: 15%;margin-top: 1%;}
            }

        #paso_datos,#paso_datos2,#paso_datos3,#paso_datos4,#jose_prueba3,.inputs_hidden{display: none;}
    </style>
    <script type="text/javascript">
        //funcion que nos realiza la acción que queramos en la carga de la web.
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
        addLoadEvent(ocultar_datos_delegado);


        //funcion que llamamos desde ASP.net para desactivar/activar ciertas cosas, 
        //cuando el sistema detecta que somos un medico.
        function desactivar() {
            desactivar_cuadro_delegado();
            activar_cuadro_medico();
            onlyread_inputs_medicos(); 
        }


        //desactivamos los divs que no queremos que vea el medico.
        function desactivar_cuadro_delegado() {
            document.getElementById("eleccion_radios").style.display = 'none';
            document.getElementById("cuadro_medico").style.display = 'none';
            document.getElementById('cuadro_medico').style.opacity = '0';
            document.getElementById("cuadro_delegado").style.display = 'none';
            //document.getElementById("cuadro_medico4").addClass.desaparecer_botones_edicion_delegado;
            $('#cuadro_medico4').addClass('desaparecer_botones_edicion_delegado');
            //document.getElementById('cuadro_medico4').style.setProperty('display', 'none', 'important');

        }


        //activamos el cuadro del medico.
        function activar_cuadro_medico() {
            document.getElementById("cuadro_medico1").style.display = 'Block';          
            document.getElementById("cuadro_medico2").style.display = 'Block';               
            document.getElementById("cuadro_medico3").style.display = 'Block';
            document.getElementById("cuadro_medico5").style.display = 'Block';
        }



        //dejamos los inputs de nombre/ape/email/especialidad/nselas desactivados.
        //es decir, solo podemos verlos, no editarlos.
        function onlyread_inputs_medicos() {
           document.getElementById("name_medic").style.pointerEvents = "none";
           document.getElementById("ape1_medic").style.pointerEvents = "none";
           document.getElementById("ape2_medic").style.pointerEvents = "none";
           document.getElementById("medic_mail").style.pointerEvents = "none";
           document.getElementById("medic_especialidad").style.pointerEvents = "none";
           document.getElementById("medic_selas").style.pointerEvents = "none";
        }


         //Solo lectura de los inputs del medico (Name/Ape1/Ape2/Email)
        function onlyread_inputs_medicos2() {
           document.getElementById("name_medic").style.pointerEvents = "none";
           document.getElementById("ape1_medic").style.pointerEvents = "none";
           document.getElementById("ape2_medic").style.pointerEvents = "none";
           document.getElementById("medic_mail").style.pointerEvents = "none";
        }


         //Lectura/Escritura de los inputs del delegado (Name/Ape1/Ape2/Email)
        function activate_inputs_medicos() {
           document.getElementById("name_medic").style.pointerEvents = "auto";
           document.getElementById("ape1_medic").style.pointerEvents = "auto";
           document.getElementById("ape2_medic").style.pointerEvents = "auto";
            document.getElementById("medic_mail").style.pointerEvents = "auto";
            
        }


        //Funcion que creamos a la hora de añadir un nuevo medico. 1º limpiamos todos los inputs
        //2º activamos los campos de Nombre/Ape1/Ape2/Email para poder registrar a un nuevo medico.
        function nueva_alta() {
            vaciar_inputs_medicos();
            activate_inputs_medicos();            
        }


        //Solo lectura de los inputs del delegado (Name/Ape1/Ape2/Email)
        function onlyread_inputs_delegado() {
            document.getElementById("email_delegado").style.pointerEvents = "none";
            document.getElementById("ape2_delegado").style.pointerEvents = "none";
            document.getElementById("ape1_delegado").style.pointerEvents = "none";
            document.getElementById("name_delegado").style.pointerEvents = "none";            
        }


        //funcion que nos realiza una recarga de la pagina cuando la llamemos.
        function EnviemFormulari() {
            var theform;
            if (window.navigator.appName.toLowerCase().indexOf("microsoft") > -1) theform = document.form2;
            else theform = document.forms["form2"];
            theform.submit();
        }


        //funcion que nos activa/desactiva los cuadros de delegado/medico
        //segun este el input seleccionado.
        function ocultar_datos_delegado() {
            var radio1 = document.getElementById("radio1");
            var radio2 = document.getElementById("radio2");
            if (radio1.checked == true) {
                document.getElementById("cuadro_medico").style.display = 'block';
                document.getElementById("cuadro_medico1").style.display = 'block';
                document.getElementById("cuadro_medico2").style.display = 'block';
                document.getElementById("cuadro_medico3").style.display = 'block';
                document.getElementById("cuadro_medico4").style.display = 'block';
                document.getElementById("cuadro_delegado").style.display = 'none';          
                document.getElementById("cuadro_delegado2").style.display = 'none';
                document.getElementById("cuadro_delegado3").style.display = 'none';
                document.getElementById("cuadro_delegado4").style.display = 'none';
            }
            else {
                document.getElementById("cuadro_medico").style.display = 'none';
                document.getElementById("cuadro_medico1").style.display = 'none';
                document.getElementById("cuadro_medico2").style.display = 'none';
                document.getElementById("cuadro_medico3").style.display = 'none';
                document.getElementById("cuadro_medico4").style.display = 'none';

                document.getElementById("cuadro_delegado").style.display = 'block';
                document.getElementById("cuadro_delegado2").style.display = 'block';
                document.getElementById("cuadro_delegado3").style.display = 'block';
                document.getElementById("cuadro_delegado4").style.display = 'block';
            }
            if (radio2.checked == true) {
                document.getElementById("cuadro_medico").style.display = 'none';
                document.getElementById("cuadro_medico1").style.display = 'none';
                document.getElementById("cuadro_medico2").style.display = 'none';
                document.getElementById("cuadro_medico3").style.display = 'none';
                document.getElementById("cuadro_medico4").style.display = 'none';
                document.getElementById("cuadro_delegado").style.display = 'Block';
                document.getElementById("cuadro_delegado2").style.display = 'Block';
                document.getElementById("cuadro_delegado3").style.display = 'Block';
                document.getElementById("cuadro_delegado4").style.display = 'Block';
            }
            else {
                document.getElementById("cuadro_medico").style.display = 'Block';
                document.getElementById("cuadro_medico1").style.display = 'Block';
                document.getElementById("cuadro_medico2").style.display = 'Block';
                document.getElementById("cuadro_medico3").style.display = 'Block';
                document.getElementById("cuadro_medico4").style.display = 'Block';
                document.getElementById("cuadro_delegado").style.display = 'none';
                document.getElementById("cuadro_delegado2").style.display = 'none';
                document.getElementById("cuadro_delegado3").style.display = 'none';
                document.getElementById("cuadro_delegado4").style.display = 'none';
            }
            mostrar_ocultar_origen();
        }


        //funcion que nos comprueba el mail.
        function ComprobarEmail(Email) {
           //Comprobamos que el Email introducido por el usuario tenga el formato correcto. Ej: prueba@prueba.com
           return (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(Email))
        }


        //nos lanza el modal con el texto que queramos.
        function LanzaAviso(Text) {
           bootbox.alert({ title: "Gestión de turnos", message: Text });
        }


        //activamos/desActivamos el div de ciudad de origen.
        function mostrar_ocultar_origen() {
            var radio_aloja = document.getElementById("asistira_delegado_si");
            var radio_asistencia = document.getElementById("alojamiento_medico_si");
            if (radio_asistencia.checked == true) {
                document.getElementById("city_origen_medico").style.opacity = '1';
            }
            else {
                document.getElementById("city_origen_medico").style.opacity = '0';
            }
            if (radio_aloja.checked == true) {
                document.getElementById("city_origen_medic").style.opacity = '1';
            }
            else {
                document.getElementById("city_origen_medic").style.opacity = '0';
            }

            
        }


        //funcion que con 3 inputs ocultos, nos servirá para identificar que accion realiza el usuario.
        function elegir_accion(x) {
            switch (x) {
                case 1:
                    var boton_envio_delegado = document.getElementById("paso_datos");
                    boton_envio_delegado.value = '1';
                    document.getElementById("paso_datos2").value = '1';
                    break;
                case 2:
                    var clickeado = document.getElementById("soflow").value
                    jose = document.getElementById("paso_datos2");
                    jose.value = clickeado;
                    document.getElementById("paso_datos").value = '2';
                    EnviemFormulari();                    
                    break;
                case 3:                    
                    document.getElementById("paso_datos").value = '3';
                    break;
                case 4:
                    document.getElementById("paso_datos").value = '4';
                    break;
                case 5:
                    document.getElementById("paso_datos").value = '5';
                    break;
                case 6:
                    document.getElementById("paso_datos").value = '6';
                    document.getElementById("paso_datos2").value = '1';
                    break;
            }
        }


        //funcion para darle datos a los inputs ocultos y asi poder decidir que accion quiere realizar el usuario.
        function boton_enviar_medico() {
            var cuadro1 = document.getElementById("paso_datos").value;
            var cuadro2 = document.getElementById("paso_datos2").value;
            if (cuadro2 == -2) {
                elegir_accion(3);
            }
            else {
                elegir_accion(4);
            }
        }


        //Vaciamos todos los inputs medicos para poder añadir 1 nuevo.
        function vaciar_inputs_medicos() {
            valor = "";
            document.getElementById("name_medic").value = valor;
            document.getElementById("ape1_medic").value = valor;
            document.getElementById("ape2_medic").value = valor;
            document.getElementById("medic_mail").value = valor;
            document.getElementById("medic_selas").value = valor;
            document.getElementById("medic_especialidad").value = valor;
            document.getElementById("alergia_medic").value = valor;
            document.getElementById("Observa_medic").value = valor;
            document.getElementById("ConsentimientoSi").disabled = true;
            document.getElementById("ConsentimientoN").disabled = true;
            document.getElementById("transporte_medic_si").disabled = true;
            document.getElementById("transporte_medic_no").disabled = true;
            document.getElementById("yes").disabled = true;
            document.getElementById("no").disabled = true;

        }


        //funcion que creamos para cuando tenemos 1 registro en la BD
        //del campo Email, y a la misma vez que soltamos el error al usuario,
        //Limpiamos todos los inputs, ya que el registro no ha funcionado correctamente.
        function Email_Medic_BD() {
            LanzaAviso('Lo sentimos hemos encontrado ya un Email similar en la base de datos! Por favor ponga otra distinto.');
            vaciar_inputs_medicos();
        }


        //nos quedamos con el valor seleccionado en el ComboBox
        //y lo pasamos a un input que nos creamos.
        function especialidad() {
            var input_hidden, clickeado2;
            clickeado2 = document.getElementById("medic_especialidad1").value;
            input_hidden = document.getElementById("paso_datos4");
            input_hidden.value = clickeado2;
        }
    </script>
</head>
<body>
    <form id="form2" runat="server">
        <div class="row banner">
            <img src="img/banner_novonordisk.jpg" class="my_img"/>
        </div>
        <div id="eleccion_radios" class="row cabecera">
            <div class="funkyradio">
                <div class="funkyradio-default funkyinline">
                    <input type="radio" name="radio" id="radio1" onclick="ocultar_datos_delegado()" runat="server" />
                    <label for="radio1">Medico</label>
                </div>
                <div class="funkyradio-default funkyinline">
                    <input type="radio" name="radio" id="radio2" onclick="ocultar_datos_delegado()" runat="server" />
                    <label for="radio2">Delegado</label>
                </div>
            </div>
        </div>
        <div id="cuadro_medico" class="panel">
            <div id="myselect" class="row mi_selector">
                <select id="soflow" class="mi_selector" onchange="elegir_accion(2)" runat="server" name="selector_medicos">
                    <option value="-2" id="anadir_registro_medico1">Nueva Alta Médico</option>
                    <option selected>Listado De Medicos</option>
                </select>
            </div>
        </div>
        <div id="cuadro_medico1" class="row panel">
            <div class="row padd margen">
                <div class="col-md-4 duo padd inputs_medico">
                    <label for="exampleInputEmail1">Nombre</label>                    
                    <asp:TextBox ID="name_medic" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4 segundo padd inputs_medico">
                    <label for="exampleInputEmail1">Apellido</label>                    
                    <asp:TextBox ID="ape1_medic" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4 duo padd inputs_medico">
                    <label for="exampleInputEmail1">2º Apellido</label>                    
                    <asp:TextBox ID="ape2_medic" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row padd margen">
                <div class="col-md-4 mailto padd inputs_medico">
                    <label for="exampleInputEmail1">Email</label>                    
                    <asp:TextBox ID="medic_mail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4 duo padd inputs_medico">
                    <label for="exampleInputEmail1">Especialidad</label>
                    <asp:DropDownList runat="server" ID="medic_especialidad1" onchange="especialidad()" CssClass="form-control">
                        <asp:ListItem Text="Eliga una opción." Value="0" Selected="True" />
                        <asp:ListItem Text="Ginecología" Value="1" />
                        <asp:ListItem Text="Cardiología" Value="2" />
                        <asp:ListItem Text="Dermatología" Value="3" />
                        <asp:ListItem Text="Geriatría" Value="4" />
                        <asp:ListItem Text="Medicina Interna" Value="5" />
                    </asp:DropDownList>                  
                </div>
                <div class="col-md-4 segundo padd inputs_medico">
                    <label for="exampleInputEmail1">Nº Selas</label>                    
                    <asp:TextBox ID="medic_selas" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>            
        </div>
        <div id="cuadro_medico2" class="container-fluid panel">
            <div class="col-md-6 consen_respon_medic">
                <h4 class="textos_radios_medico">¿Consentimiento Firmado?</h4>
                <div class="radios_molones subir_miketa">
                    <div class="col-md-6 radios_molones-success">
                        <input type="radio" name="Consentimiento" id="consen_si" runat="server" />
                        <label for="consen_si">SI</label>
                    </div>
                    <div class="col-md-6 consen_no_respon radios_molones-danger">
                        <input type="radio" name="Consentimiento" id="consen_no" runat="server"/>
                        <label for="consen_no">NO</label>
                    </div>
                </div>
            </div>
             <div class="col-md-6 transpor_respon_medic"> 
                <h4 class="textos_radios_medico">¿Necesita Transporte?</h4>
                <div class="radios_molones subir_miketa">
                    <div class="col-md-6 radios_molones-success">
                        <input type="radio" name="transporte" id="transpor_si" runat="server" />
                        <label for="transpor_si">SI</label>
                    </div>
                    <div class="col-md-6 transpor_no_respon radios_molones-danger">
                        <input type="radio" name="transporte" id="transpor_no" runat="server" />
                        <label for="transpor_no">NO</label>
                    </div>
                </div>
            </div>
            <div class="col-md-6 aloja_respon_medic">
                <h4 class="textos_radios_medico">¿Necesita Alojamiento?</h4>
                <div class="radios_molones subir_miketa">
                    <div class="col-md-6 radios_molones-success">
                        <input type="radio" name="alojamiento_medico" id="alojamiento_medico_si" onclick="mostrar_ocultar_origen()" runat="server"  />
                        <label for="alojamiento_medico_si">SI</label>
                    </div>
                    <div class="col-md-6 asiste_no_respon radios_molones-danger">
                        <input type="radio" name="alojamiento_medico" id="alojamiento_medico_no" onclick="mostrar_ocultar_origen()" runat="server"  />
                        <label for="alojamiento_medico_no">NO</label>
                    </div>
                </div>
            </div>
            <div id="city_origen_medico" class="col-md-6 city_origen_medic">
                <h4 class="textos_radios_medico">Indique la ciudad de Origen: </h4>
                <asp:TextBox ID="origen_medic" CssClass="form-control" runat="server"></asp:TextBox>
            </div>             
            
        </div>
        <div id="cuadro_medico3" class="row panel">
            <div class="row margen padd">
                <label for="nombre" class="label_textos">Alergias: </label>
                <asp:TextBox id="alergia_medic" ReadOnly="false" runat="server" CssClass="form-control medic_aler"></asp:TextBox>
            </div>
            <div class="row margen padd">
                <label for="nombre" class="label_textos">Observaciones: </label>
                <asp:TextBox id="Observa_medic" ReadOnly="false" runat="server" CssClass="form-control medic_obser"></asp:TextBox>
            </div>
        </div>
        <div id="cuadro_medico4" class="row panel">
            <asp:Button ID="Button_Medico" CssClass="enviar" Text="Enviar" runat="server" />
            <div class="row centro">
                <asp:Button ID="Button_Medico_Delete" CssClass="enviar" Text="Eliminar" runat="server" />
            </div>
        </div>
        <div id="cuadro_medico5" class="row panel">
            <asp:Button ID="Button_envio_medico" CssClass="enviar" Text="Enviar" runat="server" />
        </div>
        <div id="cuadro_delegado">
            <div class="row margen padd">
                    <div class="col-md-4 duo input_nombre padd inputs_responsives">
                        <label for="exampleInputEmail1">Nombre</label>                    
                        <asp:TextBox ID="name_delegado" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>                
                    <div class="col-md-4 segundo input_ape1 padd inputs_responsives">
                        <label for="exampleInputEmail1">Apellido</label>                    
                        <asp:TextBox ID="ape1_delegado" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4 duo input_ape2 padd inputs_responsives">
                        <label for="exampleInputEmail1">2º Apellido</label>                    
                        <asp:TextBox ID="ape2_delegado" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="row margen padd">
                    <div class="col-md-4  duo input_email padd maildelegat inputs_responsives">
                        <label for="exampleInputEmail1">Email</label>                    
                        <asp:TextBox ID="email_delegado" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4 segundo input_number padd num_delegat inputs_responsives">
                        <label for="exampleInputEmail1">Numero</label>                    
                        <asp:TextBox ID="numero_delegado" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4 duo input_region padd region_delegat inputs_responsives">
                        <label for="exampleInputEmail1">Región</label>                    
                        <asp:TextBox ID="region_delegado" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            <div class="row margen padd">
                <div class="col-md-6 alergia_delegado inputs_responsives1">
                    <label for="nombre" class="label_textos">Siglas Delegado: </label>
                    <asp:TextBox id="siglas_delegado" ReadOnly="false" runat="server" CssClass="form-control medic_aler"></asp:TextBox>
                </div>
                <div class="col-md-6 alergia_delegado inputs_responsives2">
                    <label for="nombre" class="label_textos">Siglas Gerente: </label>
                    <asp:TextBox id="siglas_gerente_delegado" ReadOnly="false" runat="server" CssClass="form-control medic_aler"></asp:TextBox>
                </div>
            </div>
        </div>
        <div id="cuadro_delegado2">
            <div class="col-md-6">
                <h4 class="textos_radios_delegado">¿Asistirá al evento?</h4>
                <div class="radios_molones subir_miketa">
                    <div class="col-md-6 radios_molones-success">
                        <input type="radio" name="asistira_delegado" id="asistira_delegado_si" onclick="mostrar_ocultar_origen()" runat="server" />
                        <label for="asistira_delegado_si">Si</label>
                    </div>
                    <div class="col-md-6 radios_molones-danger">
                        <input type="radio" name="asistira_delegado" id="asistira_delegado_no" onclick="mostrar_ocultar_origen()" runat="server"/>
                        <label for="asistira_delegado_no">No</label>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <h4 class="textos_radios_delegado">¿Necesita Transporte?</h4>
                <div class="radios_molones subir_miketa">
                    <div class="col-md-6 radios_molones-success">
                        <input type="radio" name="transporte_delegado" id="transporte_delegado_si" runat="server" />
                        <label for="transporte_delegado_si">Si</label>
                    </div>
                    <div class="col-md-6 radios_molones-danger">
                        <input type="radio" name="transporte_delegado" id="transporte_delegado_no" runat="server" />
                        <label for="transporte_delegado_no">No</label>
                    </div>
                </div>
            </div>
            <div id="city_origen_medic" class="col-md-6">
                <h4>Indique la ciudad de Origen: </h4>
                <asp:TextBox ID="city_origen_delegado" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <h4 class="textos_radios_delegado">¿Necesita Alojamiento?</h4>
                <div class="radios_molones subir_miketa">
                    <div class="col-md-6 radios_molones-success">
                        <input type="radio" name="alojamiento_delegat" id="alojamiento_delegado_si"  runat="server"  />
                        <label for="alojamiento_delegado_si">Si</label>
                    </div>
                    <div class="col-md-6 radios_molones-danger">
                        <input type="radio" name="alojamiento_delegat" id="alojamiento_delegado_no"  runat="server"  />
                        <label for="alojamiento_delegado_no">No</label>
                    </div>
                </div>
            </div>
        </div>
        <div id="cuadro_delegado3">
            <div class="row margen padd">
                <label for="nombre" class="label_textos">Alergias: </label>
                <asp:TextBox id="alergia_delegado" ReadOnly="false" runat="server" CssClass="form-control medic_aler"></asp:TextBox>
            </div>
            <div class="row margen padd">
                <label for="nombre" class="label_textos">Observaciones: </label>
                <asp:TextBox id="observa_delegado" ReadOnly="false" runat="server" CssClass="form-control medic_obser"></asp:TextBox>
            </div>
        </div>
        <div id="cuadro_delegado4">
            <asp:Button ID="Button_delegado" CssClass="enviar" Text="Enviar" runat="server" />
        </div>
        <div class="row margen">
            <asp:TextBox ID="paso_datos" ReadOnly="false" runat="server" CssClass="form-control  "></asp:TextBox>
            <asp:TextBox ID="paso_datos2" ReadOnly="false" runat="server" CssClass="form-control  "></asp:TextBox>
            <asp:TextBox ID="paso_datos3" ReadOnly="false" runat="server" CssClass="form-control  "></asp:TextBox>
            <asp:TextBox ID="paso_datos4" ReadOnly="false" runat="server" CssClass="form-control  "></asp:TextBox>
        </div>
    </form>
</body>
</html>
