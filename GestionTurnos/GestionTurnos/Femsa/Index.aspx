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
    <link rel="stylesheet" type="text/css" href="css/fileinput.min.css" />
    <link rel="stylesheet" type="text/css" href="fileinput-rtl.min.css" />
    <link rel="stylesheet" type="text/css" href="slick.css" />

    <style type="text/css">

        body{margin:0;padding:0;box-sizing:border-box;width:100%;}
        /* banner cabecera */
        .img_banner{max-width:600px;display:block; margin-left:auto;margin-right:auto;box-shadow: 0px 0px 25px rgba(0, 0, 0, 1);margin-top:1.5%}
        .img_banner img{max-width:600px;width:102.7%;}

        /* Cuadro Principal(Name/Email) */
        #principal{max-width:400px;display:block; margin-left:auto;margin-right:auto;margin-top:2%;background-color:#DCDCDC;border-radius:4.5px;border:#707070 solid 0.5px;}
        .inputs_no_rellenar{height:25px;border-radius:0 !important; border:#851724 solid 1.5px;pointer-events:none;cursor: not-allowed !important;width:116.7%;background-color:#A8A8A8;color:#fff;}
        label[for=texto]{margin-top:2.5%;font-size:12px;float:right;}

        /* Pass para la App */
        #pass_app{max-width:400px;display:block; margin-left:auto;margin-right:auto;margin-top:.5%;}
        .header{background-color:black;color:#fff;}
        .cuerpo{background-color:#DCDCDC;margin-top:.4%;border:#707070 solid 0.5px;}
        .cuadro_info{margin-left:5%;width:90%;background-color:#FFCC00;font-size:10px;padding:5px;margin-top:1%;margin-bottom:1.5%;border:#333300 solid 0.5px;}
        .cuadro_info p{margin-top:2%;}
        .cuadro_info span{font-weight:Bold;}

        /* Datos Personales */
        #personal_data{max-width:500px;display:block; margin-left:auto;margin-right:auto;margin-top:1%;}
        .inputs_personaldata{margin-left:0;width:100%;border:#851724 solid 1.5px;border-radius:0;height:25px}
        label[for=textosss]{padding-top: 3%;margin-left: 1%;}
        label[for=textosss] span{color:red;}

        /* Vuelo Monterrey */
        #vuelo_monte{max-width:500px;display:block; margin-left:auto;margin-right:auto;margin-top:1%;}

        /* Vuelo regreso */
        #vuelo_regreso{max-width:500px;display:block; margin-left:auto;margin-right:auto;margin-top:1%;}

        /* Adjuntar Archivo */
        #archivo{max-width:500px;display:block; margin-left:auto;margin-right:auto;margin-top:1%;}
        .file-input-new{width: 75%;display: block;margin-left: auto;margin-right: auto;margin-top: 1.5%;margin-bottom: 1.5%;}
        .krajee-default.file-preview-frame{margin-left:27%;}
        /* Hospedaje */
        #Hospedaje{max-width:500px;display:block; margin-left:auto;margin-right:auto;margin-top:1%;}






        /* Preferencias */
        #preferencia{max-width:500px;display:block; margin-left:auto;margin-right:auto;margin-top:1%;}

        /* Boton envio de datos */
        .btn-Espa {background-color: #7C0027;border-color: #c6c6c6;color:#FFFFFF;display:block;margin-left:auto;margin-right:auto;}
        .btn-Espa:hover,.btn-Espa:focus,.btn-Espa:active,.btn-Espa.active {background-color:#FFFFFF;border-color: #202020;color:#7C0027;}
        .btn-Espa.disabled:hover,.btn-Espa.disabled:focus,.btn-Espa.disabled:active,.btn-Espa.disabled.active,.btn-Espa[disabled]:hover,.btn-Espa[disabled]:focus,.btn-Espa[disabled]:active,.btn-Espa[disabled].active,fieldset[disabled] .btn-Espa:hover,fieldset[disabled] .btn-Espa:focus,fieldset[disabled] .btn-Espa:active,fieldset[disabled] .btn-Espa.active {background-color: #EEEEEE;border-color: #e1e1e1;color:#FFFFFF;}


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
        $(document).ready(function () {

            $('#datetimepicker1').datetimepicker({
                language: ('es'),//(document.getElementById('oculto').value == '2' ? 'en' : 'es'),
                startDate: '2019/08/26',
                endDate: '2019/08/30',
                minDate: '2019/08/26',
                maxDate: '2019/08/30',//false,
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

            $('#datetimepicker2').datetimepicker({
                timepicker: false,
                todayButton: false,
                prevButton: false,
                nextButton: false,
                defaultSelect: false,
                scrollMonth: false,
                scrollTime: false,
                scrollInput: false,
                arrows: false,
                minDate: '2019/08/26',
                maxDate: '2019/08/30',//false,
                timepicker: true,
                datepicker: false,
            });

            $('#datetimepicker3').datetimepicker({
                language: ('es'),//(document.getElementById('oculto').value == '2' ? 'en' : 'es'),
                startDate: '2019/08/26',
                endDate: '2019/08/30',
                minDate: '2019/08/26',
                maxDate: '2019/08/30',//false,
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

            $('#datetimepicker4').datetimepicker({
                timepicker: false,
                todayButton: false,
                prevButton: false,
                nextButton: false,
                defaultSelect: false,
                scrollMonth: false,
                scrollTime: false,
                scrollInput: false,
                arrows: false,
                minDate: '2019/08/26',
                maxDate: '2019/08/30',//false,
                timepicker: true,
                datepicker: false,
            });


            $('#datetimepicker5').datetimepicker({
                language: ('es'),//(document.getElementById('oculto').value == '2' ? 'en' : 'es'),
                startDate: '2019/08/26',
                endDate: '2019/08/30',
                minDate: '2019/08/26',
                maxDate: '2019/08/30',//false,
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

            $('#datetimepicker6').datetimepicker({
                language: ('es'),//(document.getElementById('oculto').value == '2' ? 'en' : 'es'),
                startDate: '2019/08/26',
                endDate: '2019/08/30',
                minDate: '2019/08/26',
                maxDate: '2019/08/30',//false,
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
            
//            $('#datetimepicker1').datetimepicker({
//                ownerDocument: document,
//                contentWindow: window,
//                value: '',
//                rtl: false,
//                format: 'd/m/Y ', /*Y/m/d H:i*/
//                formatTime: 'H:i',
//                formatDate: 'd/m/Y', /*Y/m/d*/
//                startDate:  false, // new Date(), '1986/12/08', '-1970/01/05','-1970/01/05',
//                step: 60,
//                monthChangeSpinner: true,
//                closeOnDateSelect: false,
//                closeOnTimeSelect: true,
//                closeOnWithoutClick: true,
//                closeOnInputClick: true,
//                openOnFocus: true,
//                timepicker: true,
//                datepicker: true,
//                weeks: false,
//                defaultTime: false, // use formatTime format (ex. '10:00' for formatTime: 'H:i')
//                defaultDate: '2019/08/26', //false, // use formatDate format (ex new Date() or '1986/12/08' or '-1970/01/05' or '-1970/01/05')
//                minDate: false,
//                maxDate: '2019/08/30',//false,
//                minTime: false,
//                maxTime: false,
//                minDateTime: false,
//                maxDateTime: false,
//                allowTimes: [],
//                opened: false,
//                initTime: true,
//                inline: false,
//                theme: '',
//                touchMovedThreshold: 5,
//                onSelectDate: function () {},
//                onSelectTime: function () {},
//                onChangeMonth: function () {},
//                onGetWeekOfYear: function () {},
//                onChangeYear: function () {},
//                onChangeDateTime: function () {},
//                onShow: function () {},
//                onClose: function () {},
//                onGenerate: function () {},
//                withoutCopyright: true,
//                inverseButton: false,
//                hours12: false,
//                next: 'xdsoft_next',
//                prev : 'xdsoft_prev',
//                dayOfWeekStart: 0,
//                parentID: 'body',
//                timeHeightInTimePicker: 25,
//                //timepicker<a href="https://www.jqueryscript.net/tags.php?/Scroll/">Scroll</a>bar: true,
//                todayButton: true,
//                prevButton: true,
//                nextButton: true,
//                defaultSelect: true,
//                scrollMonth: true,
//                scrollTime: true,
//                scrollInput: true,
//                lazyInit: false,
//                mask: false,
//                validateOnBlur: true,
//                allowBlank: true,
//                yearStart: 1950,
//                yearEnd: 2050,
//                monthStart: 0,
//                monthEnd: 11,
//                style: '',
//                id: '',
//                fixed: false,
//                roundTime: 'round', // ceil, floor
//                className: '',
//                weekends: [],
//                highlightedDates: [],
//                highlightedPeriods: [],
//                allowDates : [],
//                allowDateRe : null,
//                disabledDates : [],
//                disabledWeekDays: [],
//                yearOffset: 0,
//                beforeShowDay: null,
//                enterLikeTab: true,
//                showApplyButton: false
//});










            $("#upload_file").fileinput({
                rtl: true,
                dropZoneEnabled: false,
                allowedFileExtensions: ["pdf"]
            });
            $('#fade').slick({
              dots: false,
              infinite: true,
              speed: 500,
              fade: true,
              cssEase: 'ease',
              autoplay: true,
              autoplaySpeed: 1500,
              arrows: false,
              pauseOnHover: true,
            });


        });

        function prueba() {
            var path= "img/hotel1.jpg"; //-->Editar la ruta
    
            var img=document.createElement('img'); 
            img.setAttribute("src",path);    
            document.getElementById("content").appendChild(img);
            LanzaAviso(img);
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
                <p style="margin-top: 2%;margin-left:2%;" id="pass_for_app" runat="server">Password para la App</p>
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
                <p style="margin-top: 2%;margin-left:2%;" id="personal_data2" runat="server">Datos Personales</p>
            </div>
            <div class="row centrado cuerpo" style="margin-top:1%;margin-bottom:2%;padding:5px;">
                <div class="col-xs-6">
                    <label for="textosss" id="puesto" runat="server">Puesto <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Text1" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="unit_negocio" runat="server">Unidad de negocio <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Text10" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="adreees" runat="server">Dirección <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Text11" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="city" runat="server">Ciudad <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Text120" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="country" runat="server">País <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Text111" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="mobil" runat="server">Teléfono celular <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Text1201" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="phone" runat="server">Teléfono oficina <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Text12011" runat="server"  />
                </div>
            </div>
        </div>
        <div id="vuelo_monte">
            <div class="row centrado header">
                <p style="margin-top: 2%;margin-left:2%;" id="monterrey_fly" runat="server">Vuelo a Monterrey</p>
            </div>
            <div class="row centrado cuerpo" style="margin-top:1%;margin-bottom:2%;padding:5px;">
                <div class="col-xs-6">
                    <label for="textosss" id="day_arrive" runat="server">Día de Llegada </label>
                    <input type="text" class="form-control inputs_personaldata" id="datetimepicker1" step="1" min="2019-06-26" max="2019-06-30" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="time_arrive" runat="server">Hora de Llegada</label>
                    <input type="text" class="form-control inputs_personaldata" id="datetimepicker2" step="1" min="2019-06-26" max="2019-06-30" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="number_fly" runat="server">Nº. Vuelo </label>
                    <input type="text" class="form-control inputs_personaldata" id="Text4" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="aerolinea" runat="server">Aerolinea</label>
                    <input type="text" class="form-control inputs_personaldata" id="Text5" runat="server"  />
                </div>
            </div>
        </div>
        <div id="vuelo_regreso">
            <div class="row centrado header">
                <p style="margin-top: 2%;margin-left:2%;" id="p_vuelo_regreso" runat="server">Vuelo Regreso</p>
            </div>
            <div class="row centrado cuerpo" style="margin-top:1%;margin-bottom:2%;padding:5px;">
                <div class="col-xs-6">
                    <label for="textosss" id="day_exit" runat="server">Día de Salida </label>
                    <input type="text" class="form-control inputs_personaldata" id="datetimepicker3" step="1" min="2019-06-26" max="2019-06-30" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="time_exit" runat="server">Hora de Salida</label>
                    <input type="text" class="form-control inputs_personaldata" id="datetimepicker4" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="number_fly_back" runat="server">Nº. Vuelo </label>
                    <input type="text" class="form-control inputs_personaldata" id="Text7" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss" id="aerolinea2" runat="server">Aerolinea</label>
                    <input type="text" class="form-control inputs_personaldata" id="Text8" runat="server"  />
                </div>
            </div>
        </div>
        <div id="archivo">
            <div class="row centrado header">
                <p style="margin-top: 2%;margin-left:2%;" id="itinerario" runat="server">Adjuntar itinerario</p>
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
                <p style="margin-top: 2%;margin-left:2%;" id="hotel" runat="server">Hospedaje/Hotel </p>
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
                    <div id="fade">
                        <img src="img/hotel1.jpg" onclick="prueba()" />                      
                        <img src="img/hotel2.jpg" />
                        <img src="img/hotel3.jpg" />
                        <img src="img/hotel4.jpg" />
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
                        <input type="text" class="form-control inputs_personaldata" id="datetimepicker5" step="1" min="2019-06-26" max="2019-06-30" runat="server"  />
                    </div>
                    <div class="col-xs-6">
                        <label for="textosss" id="Fecha_chekout" runat="server">Fecha Check-out </label>
                        <input type="text" class="form-control inputs_personaldata" id="datetimepicker6" step="1" min="2019-06-26" max="2019-06-30" runat="server"  />
                    </div>
                </div>
            </div>
        </div>
        <div id="preferencia">
            <div class="row centrado cuerpo">
                Hola
            </div>
        </div>
        <div class="row centrado rojo" style="margin-top:1.5%;margin-bottom:1.5%;">
            <button id="identificacion" type="submit" class="btn-Espa" onclick="loading_gif()" runat="server">REGISTRO</button>
        </div>
        <div class="row centrado rojo" >
            <input type="text" class="" id="oculto2" runat="server"/>
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
    <script src="script/fileinput.min.js"></script>
    <script src="script/slick.min.js"></script>
    
</body>
</html>
