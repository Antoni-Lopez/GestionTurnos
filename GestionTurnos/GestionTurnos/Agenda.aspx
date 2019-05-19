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
            width: 50%; /* Ancho del contenedor */
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
                height: 2.5em;
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
            min-height: 40em; /* Alto del contenido */
            height: auto;
            position: relative;
            width: 100%;
            z-index: 5;
        }

            #content div {
                opacity: 0;
                padding: 1.5em;
                position: absolute;
                z-index: -100;
                /*
	transition: all linear 0.1s;
	*/
            }

        #content-1 p {
            clear: both;
            margin-bottom: 1em;
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

        #container input#tab-1:checked ~ #content #content-1, #container input#tab-1:checked ~ #content #content-1 .miclase,
        #container input#tab-2:checked ~ #content #content-2,
        #container input#tab-3:checked ~ #content #content-3 {
            opacity: 1;
            z-index: 100;
        }

        input.visible {
            visibility: visible !important;
        }

        .miclase {
            position: fixed !important;
            width: 47.5%;
            height: auto !important;
            background-color: #ffc000;
        }

            .miclase table {
                border: 2px solid blue;
                width: 100%;
                background: #fff
            }

                .miclase table tbody th {
                    vertical-align: bottom;
                    border: 2px solid #ddd;
                    padding: 8px;
                    line-height: 1.42857143;
                }

                .miclase table tbody tr td {
                    text-align: justify;
                    width: 25%;
                    padding: 1.5px;
                }

                .miclase table tbody tr {
                    border-bottom: 2px solid #ddd;
                }

        .centrar {
            text-align: center !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!--Título-->
        <h1>Agenda</h1>
        <!--Contenedor-->
        <div id="container">
            <!--Pestaña 1 activa por defecto-->
            <input id="tab-1" type="radio" name="tab-group" checked="checked" />
            <label for="tab-1"><i class="far fa-calendar-alt" style="font-size: 16px; color: #fff;"></i>14 Junio</label>
            <!--Pestaña 2 inactiva por defecto-->
            <input id="tab-2" type="radio" name="tab-group" />
            <label for="tab-2"><i class="far fa-calendar-alt" style="font-size: 16px; color: #fff;"></i>15 Junio</label>
            <!--Pestaña 3 inactiva por defecto-->
            <input id="tab-3" type="radio" name="tab-group" />
            <label for="tab-3"><i class="far fa-calendar-alt" style="font-size: 16px; color: #fff;"></i>16 Junio</label>
            <!--Contenido a mostrar/ocultar-->
            <div id="content">
                <!--Contenido de la Pestaña 1-->
                <div id="content-1">
                    <div class="miclase">
                        <h2 style="text-align: center; padding: 10px; color: #fff">Agenda Conferencia  GasNedgia 2019</h2>

<%--                        <table class="table">
                            <tbody>
                                <th><i class="fas fa-male"></i>Ponente</th>
                                <td>Juan Carlos Sánchez</td>
                                <td>Antoni Lopez</td>
                                <td>Jose Sánchez</td>
                                <tr>
                                    <th><i class="far fa-clock"></i>Hora</th>
                                    <td>10:00 am</td>
                                    <td>12:30 pm</td>
                                    <td>16:10 pm</td>
                                </tr>
                                <tr>
                                    <th><i class="fas fa-location-arrow"></i>Sala</th>
                                    <td></td>
                                    <td>Parker</td>
                                    <td>Rambo</td>
                                </tr>
                                <tr>
                                    <th><i class="fas fa-clipboard-list"></i>Descripción</th>
                                    <td>17:30 pm</td>
                                    <td>peterparker@mail.com</td>
                                    <td>johnrambo@mail.com</td>
                                </tr>
                            </tbody>
                        </table>--%>
                    </div>
                </div>
                <!--Contenido de la Pestaña 2-->
                <div id="content-2">
                    <p class="column-left">
                        <img src="http://ximg.es/200x150" alt="">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, est, nisi enim voluptates dicta quibusdam recusandae eveniet provident non at nostrum nesciunt laudantium omnis aliquam debitis magni expedita cumque tempore.
                    </p>
                    <p class="column-right">
                        <img src="http://ximg.es/200x150" alt="">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed, molestiae, officia repellendus quasi cumque dolor eius deserunt possimus aliquid neque nam assumenda veniam soluta enim commodi aperiam reprehenderit quia incidunt.
                    </p>
                </div>
                <!--Contenido de la Pestaña 3-->
                <div id="content-3">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis, aperiam, enim odit placeat minus ab vero molestiae ad fugit maiores eaque saepe debitis assumenda ut ipsam eius sit repellendus dolore.</p>
                    <ul>
                        <li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae, in magni illo dolore dicta vero.</li>
                        <li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corrupti, minus, aspernatur voluptatem doloribus labore modi.</li>
                        <li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora, exercitationem quia id accusamus beatae sunt? Dolorum mollitia sint debitis delectus.</li>
                    </ul>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis, accusantium, provident ab quo sed blanditiis perspiciatis distinctio aut voluptatibus cum odio quaerat iure vel dolorum fugit explicabo suscipit tenetur. Sed!</p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>


