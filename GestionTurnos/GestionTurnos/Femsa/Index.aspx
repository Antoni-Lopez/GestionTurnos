<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Index.aspx.vb" Inherits="GestionTurnos.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Reunión Anual de ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA</title>

    <!-- CSS y distintas librerias -->
    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous" />

    <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" type="text/css" href="css/fileinput.min.css" />
    <link rel="stylesheet" type="text/css" href="fileinput-rtl.min.css" />
    <link rel="stylesheet" type="text/css" href="jquery.bxslider.css" />

    <style type="text/css">

        body{margin:0;padding:0;box-sizing:border-box;width:100%;}
        /* banner cabecera */
        .img_banner{max-width:600px;display:block; margin-left:auto;margin-right:auto;box-shadow: 0px 0px 25px rgba(0, 0, 0, 1);margin-top:1.5%}
        .img_banner img{max-width:600px;width:102.7%;}

        /* Cuadro Principal(Name/Email) */
        #principal{max-width:400px;display:block; margin-left:auto;margin-right:auto;margin-top:2%;background-color:#DCDCDC;border-radius:4.5px;border:#707070 solid 0.5px;}
        .inputs_no_rellenar{height:34px;border-radius:0 !important; border:#851724 solid 1.5px;pointer-events:none;cursor: not-allowed !important;width:116.7%;background-color:#A8A8A8;color:#fff;}
        label[for=texto]{margin-top:2.5%;font-size:15px;float:right;}

        /* Pass para la App */
        #pass_app{max-width:400px;display:block; margin-left:auto;margin-right:auto;margin-top:.5%;}
        .header{background-color:black;color:#fff;}
        .cuerpo{background-color:#DCDCDC;margin-top:.4%;border:#707070 solid 0.5px;}
        .cuadro_info{margin-left:5%;width:90%;background-color:#FFCC00;font-size:10px;padding:5px;margin-top:1%;margin-bottom:1.5%;border:#333300 solid 0.5px;}
        .cuadro_info p{margin-top:2%;font-size:10px;}
        .cuadro_info span{font-weight:Bold;}

        /* Datos Personales */
        #personal_data{max-width:500px;display:block; margin-left:auto;margin-right:auto;margin-top:1%;}
        .inputs_personaldata{margin-left:0;width:100%;border:#851724 solid 1.5px;border-radius:0;height:34px}
        label[for=textosss]{padding-top: 3%;margin-left: 1%;font-size:15px;}
        label[for=textosss] span{color:red;}

        /* Vuelo Monterrey */
        #vuelo_monte{max-width:500px;display:block; margin-left:auto;margin-right:auto;margin-top:1%;}

        /* Vuelo regreso */
        #vuelo_regreso{max-width:500px;display:block; margin-left:auto;margin-right:auto;margin-top:1%;}

        /* Adjuntar Archivo */
        #archivo{max-width:500px;display:block; margin-left:auto;margin-right:auto;margin-top:1%;}
        .file-input-new{width: 75%;display: block;margin-left: auto;margin-right: auto;margin-top: 1.5%;margin-bottom: 1.5%;}
        .krajee-default.file-preview-frame{margin-left:27%;}
        #itinerario_warning{font-size:16px;}
        #itinerario_warning i{margin-right:.5%;}

        /* Hospedaje */
        #Hospedaje{max-width:500px;display:block; margin-left:auto;margin-right:auto;margin-top:1%;}
        #warning_hotel{font-size: 13.5px;margin-top: -1%;}
        #warning_hotel2{font-size: 13px;margin-top: -.5%;}
        .bx-has-pager{display:none;}



        /* Preferencias */
        #preferencia{max-width:500px;display:block; margin-left:auto;margin-right:auto;margin-top:1%;}
        label[for=ultimo_texto]{padding:5px;margin-left:2.5%;}
        .radio-inline{margin-left: 35%;}


        /* Boton envio de datos */
        #identificacion {box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.8);font-family: Arial;font-size: 15px;font-weight: bold;background-color: #AAAAAA;color: #FFFFFF;border-radius: 8px;display:block;margin-left:auto;margin-right:auto;}
        #identificacion:hover{background-color:#7F0328;}


        /* Ventana Modal LanzaAviso */
        .modal-open .modal{display: flex;justify-content: center;align-items: center;}

        /* Sin email */
        .no_email{max-width:550px;width:100%;display:block; margin-left:auto;margin-right:auto;padding:15px;}
        .no_email span{color:red;font-weight:bold;}

        /* Centrado al Div - Horizontal. */
        .centrado{margin-left:0;width:100%;}

        /* Centrado Vertical */
        .centrarlos{padding:10px;}
        .vertical{display: flex;justify-content: center;align-items: center;}

        .verde{border:1px solid green;}
        .azul{border:1px solid blue;}
        .amarillo{border:1px solid yellow;}
        .rojo{border:1px solid red;}
        
        /* Media querys diseño Responsive. */
        @media (max-width: 320px){
            .col-xs-6{width:100% !important;}
            label[for=texto]{float:left;margin-left:2%;}
            .inputs_no_rellenar{width:100%;}
            .cuadro_info {height:auto;}
            #warning_hotel{font-size: 13px;margin-top: -18%;}
            #warning_hotel2{font-size: 13px;margin-top: -18%;}
        }
    </style>

    <script type="text/javascript">

        function LanzaAviso(Text) {
            bootbox.alert({ title: "ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA", message: Text, size: 'large' });

        }

        function mensajes(x) {
            switch (x) {
                case 1:
                    LanzaAviso("<p>Su nombre y su Email son campos que no se pueden modificar y por ello solo se los mostramos.<br /> Gracias por entenderlo! </p>");
                    break;
                case 2:
                    LanzaAviso("<p>Esta es la password que usted eligio cuando se registro y no se puede modificar, ya que es la contraseña de la App.<br /> Gracias por entenderlo! </p>");
                    break;
            }
        }

        function adivina(x) {
            var MiArray = ["#datetimepicker1", "#datetimepicker2", "#datetimepicker3", "#datetimepicker4", "#datetimepicker5", "#datetimepicker6"];
            switch (x) {
                case 1:
                    $(MiArray[0]).datetimepicker({
                        language: ('es'),//(document.getElementById('oculto').value == '2' ? 'en' : 'es'),
                        startDate: '2019/08/26',
                        endDate: '2019/08/30',
                        minDate: '2019/08/26',
                        maxDate: '2019/08/30',//false,
                        minView: 2,
                        autoclose: 1,
                        forceParse: 0,
                        format: 'd/m/Y',
                        monthStart: 8,
                        monthEnd: 8,
                        timepicker: false,
                        todayButton: false,
                        prevButton: false,
                        nextButton: false,
                        defaultSelect: false,
                        scrollMonth: false,
                        scrollTime: false,
                        scrollInput: false,
                        arrows: false,
                    });
                    break;
                case 2:
                    $(MiArray[1]).datetimepicker({
                        datepicker:false,
                        format:'H:i'
                    });
                    break;
                case 3:
                    $(MiArray[2]).datetimepicker({
                        language: ('es'),//(document.getElementById('oculto').value == '2' ? 'en' : 'es'),
                        startDate: '2019/08/29',
                        endDate: '2019/08/30',
                        minDate: '2019/08/29',
                        maxDate: '2019/08/31',//false,
                        minView: 2,
                        autoclose: 1,
                        forceParse: 0,
                        format: 'd/m/Y',
                        timepicker: false,
                        monthStart: 8,
                        monthEnd: 8,
                        timepicker: false,
                        todayButton: false,
                        prevButton: false,
                        nextButton: false,
                        defaultSelect: false,
                        scrollMonth: false,
                        scrollTime: false,
                        scrollInput: false,
                        arrows: false,
                    });
                    break;
                case 4:
                    $(MiArray[3]).datetimepicker({
                        datepicker:false,
                        format:'H:i'
                    });
                    break;
                //case 5:
                //    $(MiArray[4]).datetimepicker({
                //        language: ('es'),//(document.getElementById('oculto').value == '2' ? 'en' : 'es'),
                //        startDate: '2019/08/26',
                //        endDate: '2019/08/30',
                //        minDate: '2019/08/26',
                //        maxDate: '2019/08/30',//false,
                //        minView: 2,
                //        autoclose: 1,
                //        forceParse: 0,
                //        format: 'd/m/Y',
                //        timepicker: false,
                //        monthStart: 8,
                //        monthEnd: 8,
                //        timepicker: false,
                //        todayButton: false,
                //        prevButton: false,
                //        nextButton: false,
                //        defaultSelect: false,
                //        scrollMonth: false,
                //        scrollTime: false,
                //        scrollInput: false,
                //        arrows: false,
                //    });
                //    break;
                //case 6:
                //    $(MiArray[5]).datetimepicker({
                //        language: ('es'),//(document.getElementById('oculto').value == '2' ? 'en' : 'es'),
                //        startDate: '2019/08/29',
                //        endDate: '2019/08/31',
                //        minDate: '2019/08/29',
                //        maxDate: '2019/08/31',//false,
                //        minView: 2,
                //        autoclose: 1,
                //        forceParse: 0,
                //        format: 'd/m/Y',
                //        timepicker: false,
                //        monthStart: 8,
                //        monthEnd: 8,
                //        timepicker: false,
                //        todayButton: false,
                //        prevButton: false,
                //        nextButton: false,
                //        defaultSelect: false,
                //        scrollMonth: false,
                //        scrollTime: false,
                //        scrollInput: false,
                //        arrows: false,
                //    });
                //    break;
            }
        }

        $(document).ready(function () {
            $("#upload_file").fileinput({
                rtl: true,
                dropZoneEnabled: false,
                allowedFileExtensions: ["pdf"]
            });

            $('#slider').bxSlider({
              auto: true,
              autoControls: true,
              stopAutoOnClick: true,
              pager: true,
              slideWidth: 600
            });
            $('#bxslider').bxSlider({
                auto: true,
                autoControls: false,
                stopAutoOnClick: true,
                mode: 'fade',
                captions: false,
                slideWidth: 610
            });

            $('#datetimepicker5').datetimepicker({                
                timepicker: false,
                language: 'es',
                minDate: '2019/08/29',
                maxDate: '2019/08/31',
                startDate: '2019/08/29',
                endDate: '2019/08/31',
                format: 'd/m/Y',
            });
        });

        //Funcion para añadir animación al boton de guardado.
        function loading_gif() {
            var x = document.getElementById("oculto2").value;
            if (x == "1") {
                identificacion.innerHTML = "";
                var texto = "Comprobando los datos! <img src='img/ajax-loader.gif' alt='loading' />";
                $('#identificacion').html(texto);
                Registre();
            }
            else {
                identificacion.innerHTML = "";
                var texto = "Cheking your data! <img src='img/ajax-loader.gif' alt='loading' />";
                $('#identificacion').html(texto);
                Registre();
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid img_banner" onclick="">
            <img src="img/banner.jpg" />
        </div>
        <div id="principal" runat="server" onclick="mensajes(1)">
            <div class="row centrado">
                <div class="col-xs-6 centrarlos" style="width:40% !important">
                    <label for="texto" id="full_name" runat="server">Nombre completo</label>
                </div>
                <div class="col-xs-6 centrarlos">
                    <input type="Text" class="form-control inputs_no_rellenar" id="Input_Nombre"  runat="server"  />
                </div>
            </div> 
            <div class="row centrado">
                <div class="col-xs-6 centrarlos" style="width:40% !important">
                    <label for="texto" id="email_web" runat="server">Email</label>
                </div>
                <div class="col-xs-6 centrarlos">
                    <input type="text" class="form-control inputs_no_rellenar" id="Input_Email" runat="server"  />
                </div>
            </div>                
        </div>
        <div id="pass_app">
            <div class="row centrado header">
                <p style="margin-top: 2%;margin-left:2%;font-size: 20px;" id="pass_for_app" runat="server">Password para la App</p>
            </div>
            <div class="row centrado cuerpo" onclick="mensajes(2)">
                <div class="row centrado">
                    <div class="col-xs-6 centrarlos" style="width:40% !important">
                        <label for="texto">Password</label>
                    </div>
                    <div class="col-xs-6 centrarlos">
                        <input type="text" class="form-control inputs_no_rellenar" id="Input_Password2" runat="server"  />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="cuadro_info">
                        <p class="vertical" id="p_cuadro_info" runat="server"><i class="fas fa-exclamation-circle"></i><span>Atención: </span> Este Password lo usará para acceder a la App RAA 2019</p>
                    </div>
                </div>
            </div>
        </div>
        <div id="personal_data">
            <div class="row centrado header">
                <p style="margin-top: 2%;margin-left:2%;font-size: 20px;" id="personal_data2" runat="server">Datos Personales</p>
            </div>
            <div class="row centrado cuerpo" style="margin-top:1%;margin-bottom:2%;padding:5px;">
                <div class="col-xs-6">
                    <label for="textosss" id="puesto" runat="server">Puesto <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Input_Puesto" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="unit_negocio" runat="server">Unidad de negocio <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Input_Negocio" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="adreees" runat="server">Dirección <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Input_direccion" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="city" runat="server">Ciudad <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Input_city" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="country" runat="server">País <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Input_country" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="mobil" runat="server">Teléfono celular <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Input_movil" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="phone" runat="server">Teléfono oficina <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Input_oficina" runat="server"  />
                </div>
            </div>
        </div>
        <div id="vuelo_monte">
            <div class="row centrado header">
                <p style="margin-top: 2%;margin-left:2%;font-size: 20px;" id="monterrey_fly" runat="server">Vuelo a Monterrey</p>
            </div>
            <div class="row centrado cuerpo" style="margin-top:1%;margin-bottom:2%;padding:5px;">
                <div class="col-xs-6">
                    <label for="textosss" id="day_arrive" runat="server">Día de Llegada </label>
                    <input type="text" class="form-control inputs_personaldata" id="datetimepicker1" onclick="adivina(1)" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="time_arrive" runat="server">Hora de Llegada</label>
                    <input type="text" class="form-control inputs_personaldata" id="datetimepicker2" onclick="adivina(2)" runat="server"  /> 
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="number_fly" runat="server">Nº. Vuelo </label>
                    <input type="text" class="form-control inputs_personaldata" id="Input_NumeroVuelo" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="aerolinea" runat="server">Aerolinea</label>
                    <input type="text" class="form-control inputs_personaldata" id="Input_aerolinea" runat="server"  />
                </div>
            </div>
        </div>
        <div id="vuelo_regreso">
            <div class="row centrado header">
                <p style="margin-top: 2%;margin-left:2%;font-size: 20px;" id="p_vuelo_regreso" runat="server">Vuelo Regreso</p>
            </div>
            <div class="row centrado cuerpo" style="margin-top:1%;margin-bottom:2%;padding:5px;">
                <div class="col-xs-6">
                    <label for="textosss" id="day_exit" runat="server">Día de Salida </label>
                    <input type="text" class="form-control inputs_personaldata" id="datetimepicker3" onclick="adivina(3)" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="time_exit" runat="server">Hora de Salida</label>
                    <input type="text" class="form-control inputs_personaldata" id="datetimepicker4" onclick="adivina(4)" runat="server"  /> 
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="number_fly_back" runat="server">Nº. Vuelo </label>
                    <input type="text" class="form-control inputs_personaldata" id="Num_Vuelito" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="aerolinea2" runat="server">Aerolinea</label>
                    <input type="text" class="form-control inputs_personaldata" id="aerolinea02" runat="server"  />
                </div>
            </div>
        </div>
        <div id="archivo">
            <div class="row centrado header">
                <p style="margin-top: 2%;margin-left:2%;font-size: 20px;" id="itinerario" runat="server">Adjuntar itinerario</p>
            </div>
            <div class="row centrado cuerpo">
                <div class="row centrado">
                    <div dir="rtl" class="file-loading"> <!-- note the direction if you want to display file-loading indicator -->
                        <!-- note that your input must just set the `rtl` data property of the plugin or in your javascript code -->
                        <input id="upload_file" name="upload_file" type="file" />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="cuadro_info">
                        <p class="vertical" id="itinerario_warning" runat="server"><i class="fas fa-exclamation-circle"></i><span>Nota: </span> El archivo se guardará cuando realice la inscripción.</p>
                    </div>
                </div>
            </div>            
        </div>
        <div id="Hospedaje">
            <div class="row centrado header">
                <p style="margin-top: 2%;margin-left:2%;font-size: 20px;" id="hotel" runat="server">Hospedaje/Hotel </p>
            </div>
            <div class="row centrado cuerpo">
                <div class="row centrado">
                    <div class="cuadro_info" style="height:82px;">
                        <div class="col-xs-6" style="width:20%;height:75px;">
                            <i class="fas fa-exclamation-circle vertical" style="margin-top: 32.5%;font-size: 29px;"></i>
                        </div>
                        <div class="col-xs-6" style="width:80%;height:75px;">
                            <p  id="warning_hotel" runat="server">
                                Hotel Quinta Real Monterrey <br />
                                Av. Diego Rivera 500, Valle Oriente, 66260 San Pedro Garza García, N.L. <br />
                                Tel: +52 81 8368 1000 - <a href="www.quintareal.com">www.quintareal.com</a>
                            </p>
                        </div>                       
                    </div>
                </div>
                <div class="row" style="margin-left:5%;width:90%;box-shadow: 0px 0px 25px rgba(0, 0, 0, 1);margin-top:1%;margin-bottom:1%;">
                    <div id="bxslider">
                        <img src="img/hotel1.jpg" title="Hotel Quinta Real Monterrey" onclick="prueba()" />                      
                        <img src="img/hotel2.jpg" title="Hotel Quinta Real Monterrey" />
                        <img src="img/hotel3.jpg" title="Hotel Quinta Real Monterrey" />
                        <img src="img/hotel4.jpg" title="Hotel Quinta Real Monterrey" />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="cuadro_info" style="height:82px;">
                        <div class="col-xs-6" style="width:20%;height:75px;">
                            <i class="fas fa-exclamation-circle vertical" style="margin-top: 32.5%;font-size: 29px;"></i>
                        </div>
                        <div class="col-xs-6" style="width:80%;height:75px;">
                            <p  id="warning_hotel2" runat="server">
                                ·La reservación de hotel será hecha por Karina Flores, favor de indicar el número de noches requeridas. <br />
                                ·Los gastos de hospedaje se liquidarán por el participante al efectuar el check-out
                            </p>
                        </div>                       
                    </div>
                </div>
                <div class="row centrado" style="margin-bottom:1%;">
                    <div class="col-xs-6">
                        <label for="textosss" id="Fecha_chekin" runat="server">Fecha Check-in </label>
                        <input type="text" class="form-control inputs_personaldata" id="datetimepicker5" onclick="adivina(5)" runat="server"  />
                    </div>
                    <div class="col-xs-6">
                        <label for="textosss" id="Fecha_chekout" runat="server">Fecha Check-out </label>
                        <input type="text" class="form-control inputs_personaldata" id="datetimepicker6" onclick="adivina(6)" runat="server"  />
                    </div>
                </div>
            </div>
        </div>
        <div id="preferencia">
            <div class="row centrado cuerpo">
                <div class="row centrado">
                    <label for="ultimo_texto" id="prefer" runat="server">Preferencia cena 28 de Agosto.</label>
                </div>   
                <div class="row centrado radios" style="border-bottom:#fff solid 1.5px;">
                    <label class="radio-inline" id="radio_pollo" runat="server">
                      <input type="radio" name="optradio" id="Pollo" runat="server" />Pollo
                    </label>
                    <label class="radio-inline" id="radio_pescado" runat="server">
                      <input type="radio" name="optradio" id="Pescado" runat="server"/>Pescado
                    </label>
                </div>
                <div class="row centrado">
                    <label for="ultimo_texto" id="futbol" runat="server">Juego de futbol soccer Rayados vs Pumas y Cena (29 de agosto).</label>
                </div>   
                <div class="row centrado radios" style="border-bottom:#fff solid 1.5px;">
                    <label class="radio-inline" id="radio_asisto_si" runat="server">
                      <input type="radio" name="optradio" id="asiste_radio_si" runat="server" />Sí asisto
                    </label>
                    <label class="radio-inline" id="radio_asisto_no" runat="server">
                      <input type="radio" name="optradio" id="asiste_radio_no" runat="server"/>No asisto
                    </label>
                </div>  
                <div class="row centrado">
                    <label for="ultimo_texto" id="confe" runat="server">Habrá una conferencia en Inglés, por favor confirma si requieres audífonos para la traducción en español.</label> 
                </div>
                <div class="row centrado radios">
                    <label class="radio-inline" id="radio_si" runat="server">
                      <input type="radio" name="optradio" id="radio_sisi" runat="server" />SÍ
                    </label>
                    <label class="radio-inline" id="radio_no" runat="server">
                      <input type="radio" name="optradio" id="radio_nono" runat="server" />NO
                    </label>
                </div>
            </div>
            
        </div>
        <div class="row centrado" style="margin-top:.5%;margin-bottom:1.5%;">
            <button id="identificacion" type="button" class="btn-Espa" onclick="loading_gif()" runat="server">REGISTRO</button>
        </div>
        <div class="row centrado" >
            <input type="text" class="" id="oculto2" style="display:none;" runat="server"/>
        </div>
    </form>
    <div id="mensaje_es" class="no_email" style="display:none;" runat="server">
        <p>Está intentando acceder <span>sin ningún Email</span>, por ello no le podemos mostrar nada. Por favor vuelva a la página de Login.aspx y vuelva a Introducir su Email. Gracias!</p>
    </div>
    <div id="mensaje_en" class="no_email" style="display:none;" runat="server">
        <p>You are trying to access <span> without any Email </span>, so we can not show you anything. Please go back to the Login.aspx page and enter your Email again. Thank you!!</p>            
    </div>
    <script src="script/jquery.datetimepicker.full.min.js"></script>
    <script src="script/jquery.datetimepicker.min.js"></script>
    <script src="script/bootstrap-datetimepicker.min"></script>
    <script src="script/es.min"></script>
    <script src="script/fileinput.min.js"></script>
    <script src="script/jquery.bxslider.js"></script>
    <script type="text/javascript" src="../Script/ComunicacioAJAX.js"></script> 
    <script type="text/javascript">   
        function Registre() {
            var Dades; 

            var email, comprobar;
            email = document.getElementById("Input_Email").value;

            //Datos personales
            var puesto = document.getElementById("Input_Puesto").value;
            var negocio = document.getElementById("Input_Negocio").value;
            var direccion = document.getElementById("Input_direccion").value;
            var city = document.getElementById("Input_city").value;
            var country = document.getElementById("Input_country").value;
            var movil = document.getElementById("Input_movil").value;
            var oficina = document.getElementById("Input_oficina").value;

            //Vuelo Monterrey
            var h_salida = document.getElementById("datetimepicker1").value;
            var h_llegada = document.getElementById("datetimepicker2").value;
            var nVuelo = document.getElementById("Input_NumeroVuelo").value;
            var aerolinea = document.getElementById("Input_aerolinea").value;

            //Vuelo Regreso
            var _h_salida2 = document.getElementById("datetimepicker3").value;
            var h_llegada2 = document.getElementById("datetimepicker4").value;
            var nVuelo2 = document.getElementById("Num_Vuelito").value;
            var aerolinea2 = document.getElementById("aerolinea02").value;

            //Hospedaje/Hotel
            var h_salida3 = document.getElementById("datetimepicker5").value;
            var h_llegada3 = document.getElementById("datetimepicker6").value;
            

            if ((puesto == "") || (puesto == null) || (negocio == "") || (negocio == null) || (direccion == "") || (direccion == null) || (city == "") || (city == null) || (country == "") || (country == null) || (movil == "") || (movil == null) || (oficina == "") || (oficina == null)) {

                var x = document.getElementById("oculto2").value;
                if (x == "1") {
                    LanzaAviso("<p>Los campos de Datos Personales son obligatorios y no pueden estar vacios. <br />Por favor asegurese que todos los campos estan rellenos.");
                    identificacion.innerHTML = "";
                    var texto = "REGISTRO";
                    $('#identificacion').html(texto);
                }
                else {
                    LanzaAviso("<p>The Personal Data fields are obligatory and can not be empty. <br /> Please make sure all fields are filled.");
                    identificacion.innerHTML = "";
                    var texto = "REGISTER";
                    $('#identificacion').html(texto);
                }                
            }

            Dades = email + "¦" + puesto + "¦" + negocio + "¦" + direccion + "¦" + city + "¦" + country + "¦" + movil + "¦" + oficina + "¦" + h_salida + "¦" + h_llegada + "¦" + nVuelo + "¦" + aerolinea + "¦" + _h_salida2 + "¦" + h_llegada2 + "¦" + nVuelo2 + "¦" + aerolinea2 + "¦" + h_salida3 + "¦"+ h_llegada3;       

            setTimeout("InformacioAJAX(13,\"" + Dades.replace(/"/g, "'").replace(/\n/g, "\\n") + "\", 'Registre_Tornada', '../RecepcionAJAX.aspx')", 1000);
        }          

        function Registre_Tornada(Dades) {
            if (Dades.substr(0, 2) == "OK") {
                if (Dades.substr(2, 2) == "13") {
                    LanzaAviso("<h4>Hemos actualizado <span style='color:#1ED760;'>correctacmente</span> sus preferencias en nuestra Base de Datos. Gracias!</h4>");
                    identificacion.innerHTML = "";
                    var texto = "<h4 style='text-align:center;'>Registro OK!<br/>";
                    setTimeout($('#identificacion').html(texto), 1000);
                }
            }
            else {
                if (Dades.substr(2, 2) == "13") {
                    LanzaAviso("Ha ocurrido un error actualizando sus datos en la Base de Datos. Vuelva a repetir el proceso por favor!");
                    guardar_data.innerHTML = "";
                    var texto = "<h4 style='text-align:center;'>ERROR al Guardar Datos!<br/>";
                    $('#guardar_data').html(texto);
                }
            }
        }
       </script>
</body>
</html>
