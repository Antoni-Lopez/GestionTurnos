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
        .funkyradio div {clear: both;/*margin: 0 50px;*/overflow: hidden;}
        .funkyinline {display: inline-block;padding-right:10px;}
        .funkyinline label {padding-right:10px;}
        .funkyradio label {min-width: 300px;width: 100%;border-radius: 5px;border: 2px solid #D1D3D4;font-weight: normal;margin-left: 3%;}
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

        /* Selector de Medicos */
        .mi_selector{margin:auto;}
        select#soflow, select#soflow-color {-webkit-appearance: button;-webkit-border-radius: 2px;-webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);-webkit-padding-end: 20px;-webkit-padding-start: 2px;-webkit-user-select: none;background-image: url(http://i62.tinypic.com/15xvbd5.png), -webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);background-position: 97% center;background-repeat: no-repeat;border: 1px solid #AAA;color: #555;font-size: inherit;margin: 20px;overflow: hidden;padding: 5px 10px;text-overflow: ellipsis;white-space: nowrap;width: 52%;margin-left: 22.5%;}


        /* Estilos Radio Buttons personalizados de Medico. */
        .switch {position: absolute;top: 135%;left: 50%;width: 150px;height: 50px;text-align: center;margin: -30px 0 0 -75px;background: #00bc9c;transition: all 0.2s ease;border-radius: 25px;}
        .switch1{position: absolute;top: 66%;left: 50%;width: 150px;height: 50px;text-align: center;margin: -30px 0 0 -75px;background: #00bc9c;transition: all 0.2s ease;border-radius: 25px;}
        .switch2 {position: absolute;top: 66%;left: 50%;width: 150px;height: 50px;text-align: center;margin: -30px 0 0 -75px;background: #00bc9c;transition: all 0.2s ease;border-radius: 25px;}
        .switch4 {position: absolute;top: 66%;left: 50%;width: 150px;height: 50px;text-align: center;margin: -30px 0 0 -75px;background: #00bc9c;transition: all 0.2s ease;border-radius: 25px;}
        .switch span, .switch1 span,.switch2 span,.switch4 span {position: absolute;width: 20px;height: 4px;top: 50%;left: 50%;margin: -2px 0px 0px -4px;background: #fff;display: block;transform: rotate(-45deg);transition: all 0.2s ease;}
        .switch span:after,.switch1 span:after,.switch2 span:after,.switch4 span:after {content: "";display: block;position: absolute;width: 4px;height: 12px;margin-top: -8px;background: #fff;transition: all 0.2s ease;}
        .input_prueba {display: none;}
        .switch label, .switch1 label, .switch2 label, .switch4 label {cursor: pointer;color: rgba(0,0,0,0.2);width: 60px;line-height: 50px;transition: all 0.2s ease;}
        .switch1 label {margin-left: -54%;}
        label[for=yes],label[for=yes1], label[for=ConsentimientoS], label[for=transporte_medic_si],label[for=transporte_medic_si1],label[for=Asistencia_si] {position: absolute;left: 0px;height: 20px;}
        label[for=no],label[for=no1], label[for=ConsentimientoN], label[for=transporte_medic_no],label[for=transporte_medic_no1],label[for=Asistencia_no] {position: absolute;right: 0px;}
        #no:checked ~ .switch,#no1:checked ~ .switch, #ConsentimientoN:checked ~ .switch1, #transporte_medic_no:checked ~ .switch2,#transporte_medic_no1:checked ~ .switch2,#Asistencia_no:checked ~ .switch4 {background: #eb4f37;}
        #no:checked ~ .switch span,#no1:checked ~ .switch span,#ConsentimientoN:checked ~ .switch1 span,#transporte_medic_no:checked ~ .switch2 span,#transporte_medic_no1:checked ~ .switch2 span, #Asistencia_no:checked ~ .switch4 span {background: #fff;margin-left: -8px;}
        #no:checked ~ .switch span:after,#no1:checked ~ .switch span:after,#ConsentimientoN:checked ~ .switch1 span:after ,#transporte_medic_no:checked ~ .switch2 span:after,#transporte_medic_no1:checked ~ .switch2 span:after,#Asistencia_no:checked ~ .switch4 span:after {background: #fff;height: 20px;margin-top: -8px;margin-left: 8px;}
        #yes:checked ~ .switch label[for=yes],#yes1:checked ~ .switch label[for=yes1], #ConsentimientoSi:checked ~ .switch1 label[for=ConsentimientoSi], #transporte_medic_si:checked ~ .switch2 label[for=transporte_medic_si],#transporte_medic_si1:checked ~ .switch2 label[for=transporte_medic_si1], #Asistencia_si:checked ~ .switch4 label[for=Asistencia_si] {color: #fff;}
        #no:checked ~ .switch label[for=no],#no1:checked ~ .switch label[for=no1], #ConsentimientoN:checked ~ .switch1 label[for=ConsentimientoN], #transporte_medic_no1:checked ~ .switch2 label[for=transporte_medic_no1], #transporte_medic_no:checked ~ .switch2 label[for=ConsentimientoN], #Asistencia_no:checked ~ .switch4 label[for=Asistencia_no] {color: #fff;}


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
        #cuadro_delegado2,#cuadro_delegado3,#cuadro_delegado4{margin-top: 0.2%;}
        #cuadro_delegado4{margin-bottom: 10%;}
        /*input ocultos para paso de valores*/
        .inputs_hidden{display:block;position: absolute; top: 250%;}
        /* Media Querys para diseño Responsive.*/
        @media (max-width: 991px) {
            #cuadro_medico2{height: 400px;}
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
        }

        #paso_datos,#paso_datos2,#paso_datos3,#jose_prueba3,.inputs_hidden{display: block;}
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
            document.getElementById("cuadro_delegado").style.display = 'none';
            document.getElementById("cuadro_medico").style.display = 'none';                 
            document.getElementById("cuadro_medico").style.opacity = '0';                 
            document.getElementById("cuadro_medico4").style.opacity = '0';                 
            document.getElementById("cuadro_medico4").style.display = 'none';                 
        }


        //activamos el cuadro del medico.
        function activar_cuadro_medico() {
            document.getElementById("cuadro_medico1").style.display = 'Block';          
            document.getElementById("cuadro_medico2").style.display = 'Block';               
            document.getElementById("cuadro_medico3").style.display = 'Block';  
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


        //funcion que nos activa/desactiva los cuadros de delagado/medico
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
            var radio_aloja = document.getElementById("no");
            var radio_asistencia = document.getElementById("Asistencia_no");
            
            if (radio_aloja.checked == true) {
                document.getElementById("ciudad_origen").style.opacity = '0';
            }
            else {
                document.getElementById("ciudad_origen").style.opacity = '1';
            }

            if (radio_asistencia.checked == true) {
                document.getElementById("city_origen_delegado").style.opacity = '0';
            }
            else {
                document.getElementById("city_origen_delegado").style.opacity = '1';
            }
        }


        //funcion que con 3 inputs ocultos, nos servirá para identificar que accion realiza el usuario.
        function elegir_accion(x) {
            switch (x) {
                case 1:
                    var boton_envio_delegado = document.getElementById("paso_datos");
                    boton_envio_delegado.value = '1';
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
            }
        }

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
            document.getElementById("ConsentimientoN").checked = true;
            document.getElementById("transporte_medic_no").checked = true;
            document.getElementById("no").checked = true;
        }
    </script>
</head>
<body>
    <form id="form2" runat="server">
        <div class="row banner">
            <img src="img/banner_novonordisk.jpg" class="my_img" />
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
                    <asp:TextBox ID="medic_especialidad" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4 segundo padd inputs_medico">
                    <label for="exampleInputEmail1">Nº Selas</label>                    
                    <asp:TextBox ID="medic_selas" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>            
        </div>
        <div id="cuadro_medico2" class="row panel">
            <div class="row padd margen centro altura">
                <div class="col-md-6 mi_responsive padd">
                    <label for="exampleInputEmail1" class="consen">Consentimiento firmado</label>
                </div>
                <div class="col-md-6 padd transpor_respon">
                    <label id="transporte_label" for="transporte_label">Necesita Transporte?</label>
                </div>
                <div class="col-md-6 padd consen_respon">
                    <div class="toggle-radio1">
                            <input type="radio" class="input_prueba" name="radio2" id="ConsentimientoSi" value="Consentimiento_si" runat="server"/>
                            <input type="radio" class="input_prueba" name="radio2" id="ConsentimientoN" value="Consentimiento_no" runat="server" />
                            <div class="switch1">
                                <label for="ConsentimientoSi">Sí</label>
                                <label for="ConsentimientoN">No</label>
                                <span></span>
                            </div>
                     </div>
                </div>                
                <div class="col-md-6 padd">
                    <div class="toggle-radio2">
                            <input type="radio" class="input_prueba" name="radio3" id="transporte_medic_si" value="transporte_medic_si" runat="server"/>
                            <input type="radio" class="input_prueba" name="radio3" id="transporte_medic_no" value="transporte_medic_no" runat="server" />
                            <div class="switch2">
                                <label for="transporte_medic_si">Sí</label>
                                <label for="transporte_medic_no">No</label>
                                <span></span>
                            </div>
                     </div>
                </div>
            </div>
            <div class="row margen centro origen_respon">
                <div id="ciudad_origen" class="col-md-6 padd">
                    <label for="exampleInputEmail1">Indique ciudad de Origen</label>                    
                    <asp:TextBox ID="origen_medic" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6 padd">
                    <label for="exampleInputEmail1">Necesita Alojamiento?</label>
                    <div class="toggle-radio">
                            <input type="radio" class="input_prueba" name="radio4" id="yes" value="yes" runat="server" onclick="mostrar_ocultar_origen()" />
                            <input type="radio" class="input_prueba" name="radio4" id="no" value="no" runat="server" onclick="mostrar_ocultar_origen()" />
                            <div class="switch">
                                <label for="yes">Sí</label>
                                <label for="no">No</label>
                                <span></span>
                            </div>
                     </div>
                </div>
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
            <div class="row padd margen centro altura asiste_respon">
                <div class="col-md-6 mi_responsive padd">
                    <label for="exampleInputEmail1" class="consen">Asistirá al evento?</label>
                </div>
                <div class="col-md-6 padd">
                    <label id="transporte_label1" for="transporte_label">Necesita Transporte?</label>
                </div>
                <div class="col-md-6 padd">
                    <div class="toggle-radio1">
                            <input type="radio" class="input_prueba" name="radio2" id="Asistencia_si" value="Asistencia_si" runat="server" onclick="mostrar_ocultar_origen()" />
                            <input type="radio" class="input_prueba" name="radio2" id="Asistencia_no" value="Asistencia_no" runat="server" onclick="mostrar_ocultar_origen()" />
                            <div class="switch4">
                                <label for="Asistencia_si">Sí</label>
                                <label for="Asistencia_no">No</label>
                                <span></span>
                            </div>
                     </div>
                </div>                
                <div class="col-md-6 padd">
                    <div class="toggle-radio2">
                            <input type="radio" class="input_prueba" name="radio3" id="transporte_medic_si1" value="transporte_medic_si1" runat="server"/>
                            <input type="radio" class="input_prueba" name="radio3" id="transporte_medic_no1" value="transporte_medic_no1" runat="server" />
                            <div class="switch2">
                                <label for="transporte_medic_si1">Sí</label>
                                <label for="transporte_medic_no1">No</label>
                                <span></span>
                            </div>
                     </div>
                </div>
            </div>
            <div class="row margen centro">
                <div id="ciudad_origen_delegado" class="col-md-6 padd">
                    <label for="exampleInputEmail1">Indique ciudad de Origen</label>                    
                    <asp:TextBox ID="city_origen_delegado" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6 padd">
                    <label for="exampleInputEmail1">Necesita Alojamiento?</label>
                    <div class="toggle-radio">
                            <input type="radio" class="input_prueba" name="radio4" id="yes1" value="yes1" runat="server" />
                            <input type="radio" class="input_prueba" name="radio4" id="no1" value="no1" runat="server" />
                            <div class="switch">
                                <label for="yes1">Sí</label>
                                <label for="no1">No</label>
                                <span></span>
                            </div>
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
        </div>
    </form>
</body>
</html>
