<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Agenda.aspx.vb" Inherits="GestionTurnos.Agenda" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">--%>
    <style>
        * {
            font-family: Arial, sans;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
        }

        .rojo {
            border: 2px solid red;
        }

        .verde {
            border: 2px solid green;
        }

        .azul {
            border: 2px solid blue;
        }

        h1 {
            margin: 1em 0;
            text-align: center;
        }

        #container {
            margin: 0 auto;
            width: 55%; /* Ancho del contenedor */
        }

            #container input {
                height: 2.5em;
                visibility: hidden;
            }

            #container label {
                background: #0f7699; /* Fondo de las pestañas */
                border-radius: .25em .25em 0 0;
                color: #fff; /* Color del texto de las pestañas */
                cursor: pointer;
                display: block;
                float: left;
                font-size: 1em; /* Tamaño del texto de las pestañas */
                
                line-height: 2.5em;
                margin-right: .25em;
                padding: 0 1.5em;
                text-align: center;
            }

            #container input:hover + label {
                background: #ffc000; /* Fondo de las pestañas al pasar el cursor por encima */
                color: #666; /* Color del texto de las pestañas al pasar el cursor por encima */
            }

            #container input:checked + label {
                background: #0f7699; /* Fondo de las pestañas al presionar */
                color: #ffc000; /* Color de las pestañas al presionar */
                position: relative;
                z-index: 6;
                /*
	-webkit-transition: .1s;
	-moz-transition: .1s;
	-o-transition: .1s;
	-ms-transition: .1s;
	*/
            }

        #content {
            background: #0f7699; /* Fondo del contenido */
            border-radius: 0 .25em .25em .25em;            
            height: auto;
            position: relative;
            width: 100%;
            z-index: 5;
            margin-bottom:2.5%;
        }

            #content div {
                padding: 10px;
                z-index: -100;                
	            transition: all linear 0.1s;	
            }

        #content-1 p {
            clear: both;
        }

            #content-1 p.left img {
                float: left;
                margin-right: 1em;
            }

            #content-1 p.last {
                margin-bottom: 0;
            }

        #content-2 p {
            float: left;
            width: 48.5%;
        }

            #content-2 p.column-right {
                margin-left: 3%;
            }

            #content-2 p img {
                display: block;
                margin: 0 auto 1em auto;
            }

        #content-3 p,
        #content-3 ul {
            margin-bottom: 1em;
        }

        #content-3 ul {
            margin-left: 2em;
        }

        #container input#tab-1:checked ~ #content #content-1, #container input#tab-1:checked ~ #content #content-1 .miclase,#container input#tab-1:checked ~ #content #content-1 .miclase .time_cont,
        #container input#tab-2:checked ~ #content #content-2,
        #container input#tab-3:checked ~ #content #content-3 {
            opacity: 1;
            z-index: 100;
        }

        input.visible {
            visibility: visible !important;
        }

        .miclase,.miclase2,.miclase3 {
            width: 100%;
            height: auto !important;
            background-color: #ffc000;
        }
        .time_cont{margin-top: 3%;background-color:#fff;border: 1px solid #0F7699;border-radius: 4px;}
        .time_cont2{margin-top: .5%;background-color:#fff;border: 1px solid #0F7699;border-radius: 4px;}
        .time_cont,.sala_cont,.time_cont2,.sala_cont2,.ponente_cont,.descri_cont{
            opacity: 1 !important;
            z-index: 100 !important;
            width: 95%;
            height:auto;
            margin:0 auto;
            padding: 15px;            
        }    
        .time_cont,.time_cont2{padding: 5px !important;margin-top: .5%;}
        .sala_cont,.sala_cont2,.ponente_cont,.descri_cont{
            margin-top: 5px !important;
            display: none;
            border-bottom: #0F7699 solid 1px;
        }
        .centrar {
            text-align: center !important;
        }
        .descri_cont{height:10em;border:0 !important;}
            
       #content-2,#content-3{display:none;}
        @media (max-width: 1000px) {
            #container {width: 90%;}
        }
    </style>
    <script type="text/javascript">
        function mostrar_ocultar(x) {

            switch (x) {
                case 1:
                    if (document.getElementById("sala").style.display == 'none') {
                        document.getElementById("sala").style.display = 'Block';
                        document.getElementById("ponente").style.display = 'Block';
                        document.getElementById("descripcion").style.display = 'Block';
                    }
                    else {
                        document.getElementById("sala").style.display = 'none';
                        document.getElementById("ponente").style.display = 'none';
                        document.getElementById("descripcion").style.display = 'none';
                    }
                    break;
                case 2:
                    if (document.getElementById("sala2").style.display == 'none') {
                        document.getElementById("sala2").style.display = 'Block';
                        document.getElementById("ponente2").style.display = 'Block';
                        document.getElementById("descripcion2").style.display = 'Block';
                    }
                    else {
                        document.getElementById("sala2").style.display = 'none';
                        document.getElementById("ponente2").style.display = 'none';
                        document.getElementById("descripcion2").style.display = 'none';
                    }
                    break;
                case 3:
                    if (document.getElementById("sala3").style.display == 'none') {
                        document.getElementById("sala3").style.display = 'Block';
                        document.getElementById("ponente3").style.display = 'Block';
                        document.getElementById("descripcion3").style.display = 'Block';
                    }
                    else {
                        document.getElementById("sala3").style.display = 'none';
                        document.getElementById("ponente3").style.display = 'none';
                        document.getElementById("descripcion3").style.display = 'none';
                    }
                    break;
                case 4:
                    if (document.getElementById("sala4").style.display == 'none') {
                        document.getElementById("sala4").style.display = 'Block';
                        document.getElementById("ponente4").style.display = 'Block';
                        document.getElementById("descripcion4").style.display = 'Block';
                    }
                    else {
                        document.getElementById("sala4").style.display = 'none';
                        document.getElementById("ponente4").style.display = 'none';
                        document.getElementById("descripcion4").style.display = 'none';
                    }
                    break;
                case 5:                    
                    if (document.getElementById("sala_content2").style.display == 'none') {
                        document.getElementById("sala_content2").style.display = 'Block';
                        document.getElementById("ponente_content2").style.display = 'Block';
                        document.getElementById("descripcion_content2").style.display = 'Block';
                    }
                    else {
                        document.getElementById("sala_content2").style.display = 'none';
                        document.getElementById("ponente_content2").style.display = 'none';
                        document.getElementById("descripcion_content2").style.display = 'none';
                    }
                    break;
                case 6:
                    if (document.getElementById("sala_content2_2").style.display == 'none') {
                        document.getElementById("sala_content2_2").style.display = 'Block';
                        document.getElementById("ponente_content2_2").style.display = 'Block';
                        document.getElementById("descripcion_content2_2").style.display = 'Block';
                    }
                    else {
                        document.getElementById("sala_content2_2").style.display = 'none';
                        document.getElementById("ponente_content2_2").style.display = 'none';
                        document.getElementById("descripcion_content2_2").style.display = 'none';
                    }
                    break;
                case 7:
                    if (document.getElementById("sala_content2_3").style.display == 'none') {
                        document.getElementById("sala_content2_3").style.display = 'Block';
                        document.getElementById("ponente_content2_3").style.display = 'Block';
                        document.getElementById("descripcion_content2_3").style.display = 'Block';
                    }
                    else {
                        document.getElementById("sala_content2_3").style.display = 'none';
                        document.getElementById("ponente_content2_3").style.display = 'none';
                        document.getElementById("descripcion_content2_3").style.display = 'none';
                    }
                    break;
                case 8:
                    if (document.getElementById("sala_content2_4").style.display == 'none') {
                        document.getElementById("sala_content2_4").style.display = 'Block';
                        document.getElementById("ponente_content2_4").style.display = 'Block';
                        document.getElementById("descripcion_content2_4").style.display = 'Block';
                    }
                    else {
                        document.getElementById("sala_content2_4").style.display = 'none';
                        document.getElementById("ponente_content2_4").style.display = 'none';
                        document.getElementById("descripcion_content2_4").style.display = 'none';
                    }
                    break;
                case 9:
                    if (document.getElementById("sala_content2_5").style.display == 'none') {
                        document.getElementById("sala_content2_5").style.display = 'Block';
                        document.getElementById("ponente_content2_5").style.display = 'Block';
                        document.getElementById("descripcion_content2_5").style.display = 'Block';
                    }
                    else {
                        document.getElementById("sala_content2_5").style.display = 'none';
                        document.getElementById("ponente_content2_5").style.display = 'none';
                        document.getElementById("descripcion_content2_5").style.display = 'none';
                    }
                    break;
                case 10:                    
                    if (document.getElementById("sala_content3").style.display == 'none') {
                        document.getElementById("sala_content3").style.display = 'Block';
                        document.getElementById("ponente_content3").style.display = 'Block';
                        document.getElementById("descripcion_content3").style.display = 'Block';
                    }
                    else {
                        document.getElementById("sala_content3").style.display = 'none';
                        document.getElementById("ponente_content3").style.display = 'none';
                        document.getElementById("descripcion_content3").style.display = 'none';
                    }
                    break;
                case 11:
                    if (document.getElementById("sala_content3_2").style.display == 'none') {
                        document.getElementById("sala_content3_2").style.display = 'Block';
                        document.getElementById("ponente_content3_2").style.display = 'Block';
                        document.getElementById("descripcion_content3_2").style.display = 'Block';
                    }
                    else {
                        document.getElementById("sala_content3_2").style.display = 'none';
                        document.getElementById("ponente_content3_2").style.display = 'none';
                        document.getElementById("descripcion_content3_2").style.display = 'none';
                    }
                    break;
                case 12:
                    if (document.getElementById("sala_content3_3").style.display == 'none') {
                        document.getElementById("sala_content3_3").style.display = 'Block';
                        document.getElementById("ponente_content3_3").style.display = 'Block';
                        document.getElementById("descripcion_content3_3").style.display = 'Block';
                    }
                    else {
                        document.getElementById("sala_content3_3").style.display = 'none';
                        document.getElementById("ponente_content3_3").style.display = 'none';
                        document.getElementById("descripcion_content3_3").style.display = 'none';
                    }
                    break;

            }          
        }

        function mostrar_cuadro(x) {
            switch (x) {
                case 1:
                    document.getElementById("content-1").style.display = 'Block';
                    document.getElementById("content-2").style.display = 'none';
                    document.getElementById("content-3").style.display = 'none';
                    //document.getElementById("").style.display = 'none';
                    break;
                case 2:
                    document.getElementById("content-2").style.display = 'Block';
                    document.getElementById("content-1").style.display = 'none';
                    document.getElementById("content-3").style.display = 'none';
                    break;
                case 3:
                    document.getElementById("content-3").style.display = 'Block';
                    document.getElementById("content-1").style.display = 'none';
                    document.getElementById("content-2").style.display = 'none';
                    break;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!--Título-->
        <h1>Agenda</h1>
        <!--Contenedor-->
        <div id="container">
            <!--Pestaña 1 activa por defecto-->
            <input id="tab-1" type="radio" name="tab-group" checked="checked" />
            <label for="tab-1" onclick="mostrar_cuadro(1)"><i class="far fa-calendar-alt" style="font-size: 16px; color: #fff;"></i>14 Junio</label>
            <!--Pestaña 2 inactiva por defecto-->
            <input id="tab-2" type="radio" name="tab-group" />
            <label for="tab-2" onclick="mostrar_cuadro(2)"><i class="far fa-calendar-alt" style="font-size: 16px; color: #fff;"></i>15 Junio</label>
            <!--Pestaña 3 inactiva por defecto-->
            <input id="tab-3" type="radio" name="tab-group" />
            <label for="tab-3" onclick="mostrar_cuadro(3)"><i class="far fa-calendar-alt" style="font-size: 16px; color: #fff;"></i>16 Junio</label>
            <!--Contenido a mostrar/ocultar-->
            <div id="content">
                <!--Contenido de la Pestaña 1-->
                <div id="content-1">
                    <div class="miclase">
                        <h1 style="text-align: center; padding: 10px; color: #fff">Agenda Conferencia  GasNedgia 2019</h1>
                        <h2 style="text-align: center; padding: 10px; color: #fff;margin-top:-4.5%;">Viernes 14 Junio de 2019.</h2>
                        <div id="hora" class="well time_cont" onclick="mostrar_ocultar(1)">
                            <h3 style="padding:5px;margin-left:1%;">Hora: 10:00 am <span style="float:right;margin-right:5%;">↓</span></h3>
                            <div id="sala" class="sala_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Lugar: <span style="float:right;margin-right:10%;">Sala 22M</span></h4>
                            </div>
                            <div id="ponente" class="ponente_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Ponente: <span style="float:right;margin-right:10%;"><a href="#">Don Juan Carlos Sánchez</a></span></h4>
                            </div>
                            <div id="descripcion" class="descri_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Descripción: <span style="float: right;width: 50%;text-align: justify;">El biogás agroindustrial es una tecnología con una enorme implantación en Europa y que ha generado grandes expectativas en España desde hace más de una década. No obstante, tratándose incluso de una tecnología madura y contrastada, ha generado una realidad muy inferior a las previsiones del sector, con apenas 50 plantas de biogás agroindustrial instaladas en España</span></h4>
                            </div>
                        </div>
                        <div id="hora2" class="well time_cont2" onclick="mostrar_ocultar(2)">
                            <h3 style="padding:5px;margin-left:.5%;">Hora: 12:30 pm <span style="float:right;margin-right:5%;">↓</span></h3>
                            <div id="sala2" class="sala_cont2">
                                <h4 style="padding:5px;margin-left:2.5%;">Lugar: <span style="float:right;margin-right:10%;">Sala 2B</span></h4>
                            </div>
                            <div id="ponente2" class="ponente_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Ponente: <span style="float:right;margin-right:10%;">Don Antoni Lopez</span></h4>
                            </div>
                            <div id="descripcion2" class="descri_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Descripción: <span style="float: right;width: 50%;text-align: justify;">Instalaciones de energía solar en la vivienda. La energía solar es un tipo de alternativa energética que saca partido de los rayos solares para generar electricidad o calor que puede ayudar a satisfacer parte de la demanda energética de una vivienda. Dentro de esta variedad existen diferentes tipos o modelos de instalaciones que se podrán realizar en una edificación.</span></h4>
                            </div>
                        </div>
                        <div id="hora3" class="well time_cont2" onclick="mostrar_ocultar(3)">
                            <h3 style="padding:5px;margin-left:.5%;">Hora: 16:10 pm <span style="float:right;margin-right:5%;">↓</span></h3>
                            <div id="sala3" class="sala_cont2">
                                <h4 style="padding:5px;margin-left:2.5%;">Lugar: <span style="float:right;margin-right:10%;">Sala de Conferencias 2</span></h4>
                            </div>
                            <div id="ponente3" class="ponente_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Ponente: <span style="float:right;margin-right:10%;">Don Jose Sánchez</span></h4>
                            </div>
                            <div id="descripcion3" class="descri_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Descripción: <span style="float: right;width: 50%;text-align: justify;">Nos hablará sobre su investigación: "Amoniaco como vector energético portador de hidrógeno: Proyecto Hidroam".</span></h4>
                            </div>
                        </div>
                        <div id="hora4" class="well time_cont2" onclick="mostrar_ocultar(4)">
                            <h3 style="padding:5px;margin-left:.5%;">Hora: 17:30 pm <span style="float:right;margin-right:5%;">↓</span></h3>
                            <div id="sala4" class="sala_cont2">
                                <h4 style="padding:5px;margin-left:2.5%;">Lugar: <span style="float:right;margin-right:10%;">Teatro B</span></h4>
                            </div>
                            <div id="ponente4" class="ponente_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Ponente: <span style="float:right;margin-right:10%;">Don Victor Tuñon</span></h4>
                            </div>
                            <div id="descripcion4" class="descri_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Descripción: <span style="float: right;width: 50%;text-align: justify;">Director de Aprovisionamiento de gas de Naturgy .</span></h4>
                            </div>
                        </div>
                    </div>                    
                </div>
                <!--Contenido de la Pestaña 2-->
                <div id="content-2">
                    <div class="miclase2">
                        <h1 style="text-align: center; padding: 10px; color: #fff">Agenda Conferencia  GasNedgia 2019</h1>
                        <h2 style="text-align: center; padding: 10px; color: #fff;margin-top:-3.5%;">Sabado 15 Junio de 2019.</h2>
                        <div id="hora_content2" class="well time_cont" onclick="mostrar_ocultar(5)">
                            <h3 style="padding:5px;margin-left:.5%;">Hora: 10:00 am <span style="float:right;margin-right:5%;">↓</span></h3>
                            <div id="sala_content2" class="sala_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Lugar: <span style="float:right;margin-right:10%;">Sala 2A</span></h4>
                            </div>
                            <div id="ponente_content2" class="ponente_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Ponente: <span style="float:right;margin-right:10%;"><a href="#">Doña Marta Margarit</a></span></h4>
                            </div>
                            <div id="descripcion_content2" class="descri_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Descripción: <span style="float: right;width: 50%;text-align: justify;">El sector energético ha sido tradicionalmente un sector con una fuerte presencia masculina y, por ello, el título “Mujer y Energía” llama tanto la atención. Sin embargo, esta serie de artículos demuestra que la cantidad de mujeres en este sector es notable.</span></h4>
                            </div>
                        </div>
                        <div id="hora_content2_2" class="well time_cont" style="margin-top:.3%;" onclick="mostrar_ocultar(6)">
                            <h3 style="padding:5px;margin-left:.5%;">Hora: 12:05 pm <span style="float:right;margin-right:5%;">↓</span></h3>
                            <div id="sala_content2_2" class="sala_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Lugar: <span style="float:right;margin-right:10%;">Sala Conferencias</span></h4>
                            </div>
                            <div id="ponente_content2_2" class="ponente_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Ponente: <span style="float:right;margin-right:10%;"><a href="#">Doña Marie Vandendriessche</a></span></h4>
                            </div>
                            <div id="descripcion_content2_2" class="descri_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Descripción: <span style="float: right;width: 50%;text-align: justify;">Senior Researcher' ESADEgeo – Center.</span></h4>
                            </div>
                        </div>
                        <div id="hora_content2_3" class="well time_cont" style="margin-top:.3%;" onclick="mostrar_ocultar(7)">
                            <h3 style="padding:5px;margin-left:.5%;">Hora: 16:05 pm <span style="float:right;margin-right:5%;">↓</span></h3>
                            <div id="sala_content2_3" class="sala_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Lugar: <span style="float:right;margin-right:10%;">Teatro A</span></h4>
                            </div>
                            <div id="ponente_content2_3" class="ponente_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Ponente: <span style="float:right;margin-right:10%;"><a href="#">Doña Paula LaGuia</a></span></h4>
                            </div>
                            <div id="descripcion_content2_3" class="descri_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Descripción: <span style="float: right;width: 50%;text-align: justify;">En el horizonte 2030 serán imprescindibles las renovables con almacenamiento.</span></h4>
                            </div>
                        </div>
                        <div id="hora_content2_4" class="well time_cont" style="margin-top:.3%;" onclick="mostrar_ocultar(8)">
                            <h3 style="padding:5px;margin-left:.5%;">Hora: 17:25 pm <span style="float:right;margin-right:5%;">↓</span></h3>
                            <div id="sala_content2_4" class="sala_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Lugar: <span style="float:right;margin-right:10%;">Sala Charlas 2A</span></h4>
                            </div>
                            <div id="ponente_content2_4" class="ponente_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Ponente: <span style="float:right;margin-right:10%;"><a href="#">Don Juan Sebastian</a></span></h4>
                            </div>
                            <div id="descripcion_content2_4" class="descri_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Descripción: <span style="float: right;width: 50%;text-align: justify;">He analizado los programas electorales energéticos de las seis principales formaciones políticas de ámbito estatal que concurren a las próximas elecciones generales. </span></h4>
                            </div>
                        </div>
                        <div id="hora_content2_5" class="well time_cont" style="margin-top:.3%;" onclick="mostrar_ocultar(9)">
                            <h3 style="padding:5px;margin-left:.5%;">Hora: 18:05 pm <span style="float:right;margin-right:5%;">↓</span></h3>
                            <div id="sala_content2_5" class="sala_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Lugar: <span style="float:right;margin-right:10%;">Sala B</span></h4>
                            </div>
                            <div id="ponente_content2_5" class="ponente_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Ponente: <span style="float:right;margin-right:10%;"><a href="#">Don Felipe Lopez</a></span></h4>
                            </div>
                            <div id="descripcion_content2_5" class="descri_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Descripción: <span style="float: right;width: 50%;text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus, odit?.</span></h4>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Contenido de la Pestaña 3-->
                <div id="content-3">
                    <div class="miclase3">
                        <h1 style="text-align: center; padding: 10px; color: #fff">Agenda Conferencia  GasNedgia 2019</h1>
                        <h2 style="text-align: center; padding: 10px; color: #fff;margin-top:-3.5%;">Domingo 16 Junio de 2019.</h2>
                        <div id="hora_content3" class="well time_cont" onclick="mostrar_ocultar(10)">
                            <h3 style="padding:5px;margin-left:.5%;">Hora: 09:25 am <span style="float:right;margin-right:5%;">↓</span></h3>
                            <div id="sala_content3" class="sala_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Lugar: <span style="float:right;margin-right:10%;">Sala Conferencias B</span></h4>
                            </div>
                            <div id="ponente_content3" class="ponente_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Ponente: <span style="float:right;margin-right:10%;"><a href="#">Don Jeronimo Tuñón</a></span></h4>
                            </div>
                            <div id="descripcion_content3" class="descri_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Descripción: <span style="float: right;width: 50%;text-align: justify;">El futuro del gas Europa del norte y central vendrá dado por la dependencia de una gran parte de Europa a los suministros de gas por gaseoducto de Rusia y por el rechazo de Estados Unidos a que esto sea así.</span></h4>
                            </div>
                        </div>
                        <div id="hora_content3_2" class="well time_cont" style="margin-top:.3%;" onclick="mostrar_ocultar(11)">
                            <h3 style="padding:5px;margin-left:.5%;">Hora: 10:45 am <span style="float:right;margin-right:5%;">↓</span></h3>
                            <div id="sala_content3_2" class="sala_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Lugar: <span style="float:right;margin-right:10%;">Sala Conferencias B</span></h4>
                            </div>
                            <div id="ponente_content3_2" class="ponente_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Ponente: <span style="float:right;margin-right:10%;"><a href="#">Doña Marta Pedrera</a></span></h4>
                            </div>
                            <div id="descripcion_content3_2" class="descri_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Descripción: <span style="float: right;width: 50%;text-align: justify;">Europa, al estar muy centrada en el peso de Alemania, solo mira al este y a Rusia. Pero la oportunidad para Europa es el GNL a través de España.</span></h4>
                            </div>
                        </div>
                        <div id="hora_content3_3" class="well time_cont" style="margin-top:.3%;" onclick="mostrar_ocultar(12)">
                            <h3 style="padding:5px;margin-left:.5%;">Hora: 12:00 pm <span style="float:right;margin-right:5%;">↓</span></h3>
                            <div id="sala_content3_3" class="sala_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Lugar: <span style="float:right;margin-right:10%;">Sala Prensa</span></h4>
                            </div>
                            <div id="ponente_content3_3" class="ponente_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Ponente: <span style="float:right;margin-right:10%;"><a href="#">Doña Marie Perez</a></span></h4>
                            </div>
                            <div id="descripcion_content3_3" class="descri_cont">
                                <h4 style="padding:5px;margin-left:2.5%;">Descripción: <span style="float: right;width: 50%;text-align: justify;">Viene a presentarnos su investigación, que se centra en la gobernanza global y la geopolítica de la energía y el cambio climático.</span></h4>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>


