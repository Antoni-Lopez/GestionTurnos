<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Porcelanosa.aspx.vb" Inherits="GestionTurnos.Porcelanosa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- CSS y distintas librerias -->

    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>

    <link href="https://fonts.googleapis.com/css?family=Merriweather|Nunito" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">



    <title>Formulario PORCELANOSA</title>
    <style>        
        .verde{border: 2px solid green;}
        .rojo{border:2px solid red;}
        .azul{border: 2px solid blue;}
        /* Pre-formateamos el BODY*/
        body{padding:0;margin:0;box-sizing:border-box;}
        .logo{border: 1px solid #8f8f8f;max-width: 610px; width: 100%; margin: auto; margin-top:1.5%;height: auto;box-shadow: 0px 0px 25px 1px rgba(0,0,0,0.75);}
        .logo img{height:250px;width: 100%;}

        /* Cuadro Principal */
        .principal{border-radius: 6px;background-color: #fff;color: #8f8f8f;font-size: 22px;border: 1px solid #8f8f8f;max-width: 610px; width: 100%; margin: auto; margin-top:1.5%;height: auto;font-family: 'Nunito', sans-serif}
        
        #cabeceras_acti,#cabeceras_trasla{margin: 0;padding: 6px;background-color:#4B9DEA; color: #fff;font-family: 'Merriweather', serif;}
        /*#cabeceras_acti:hover,#cabeceras_trasla:hover{background-color: #fff; color: #4B9DEA;}*/

        #traslado1,#traslado2,#traslado3,#Actividades1,#Actividades2,#Actividades3{display:none;}
        .cabecera1{margin-bottom: .6% !important;}

        .tabla{width: 94.8%;padding: 6px;margin-left: 3%;}
        .tabla tbody tr td,.tabla thead tr th{text-align: center;}
        .tabla thead tr th{text-decoration: underline;color: black; font-weight:bold;}

         /* Checkbox personalizado */
        #mycheckbox_traslados:after,#mycheckbox2_traslados:after,#mycheckbox3_traslados:after,#mycheckbox4_traslados:after,#Mycheckbox_Actividades:after,#Mycheckbox_Actividades2:after {line-height: 1.2em;content: '';display: block;width: 25px;height: 25px;border: 1px solid Black;margin-top: -8px;background-color: #8F8F8F;} /*background: #4B9DEA;*/
        #mycheckbox_traslados:checked:after,#mycheckbox2_traslados:checked:after,#mycheckbox3_traslados:checked:after,#mycheckbox4_traslados:checked:after,#Mycheckbox_Actividades:checked:after,#Mycheckbox_Actividades2:checked:after {content: '✔';text-align: center;color: #fff;background: #4B9DEA;}

        /* Boton personalizado */
        #Button_enviar{background: #4B9DEA;color:#fff;width: 20%;border-radius:6px;height:30px;margin: 2.5% 0 2.5% 40%;font-size:20px;padding:2px;}
        #Button_enviar:hover{background: #fff;color:#4B9DEA;border:1px solid #4B9DEA;}


        /*Personalizando el Modal que mostramos a veces. */
        .modal-header{color: #fff;background: #4B9DEA;font-family: 'Merriweather', serif;font-size: 20px;}

        .text_benvingut{text-align:center;margin:5px;padding:10px;font-family: 'Merriweather', serif;font-size: 20px;}
        .text_benvingut span{text-decoration:underline; font-weight:bold;color: black;}
        .text_benvingut span .fa-home:before {font-size: 33px;}

        @media (max-width: 800px) {
          .toggle input + label {padding: .75rem .25rem; flex: 0 0 50%;display: flex; justify-content: center;align-items: center;}
        }

    </style>
    <script type="text/javascript">
        function desplazar(x) {
            switch (x) {
                case 1:
                    if (document.getElementById("traslado1").style.display === 'none') {
                        document.getElementById("traslado1").style.display = 'block';
                    }
                    else {
                        document.getElementById("traslado1").style.display = 'none';
                    }
                    break;
                case 2:
                    if (document.getElementById("Actividades1").style.display === 'block') {
                        document.getElementById("Actividades1").style.display = 'none';
                    }
                    else {
                        document.getElementById("Actividades1").style.display = 'block';
                    }
                    break;

            }
        }
        function comprobar_marcados() {
            var check = document.getElementById("mycheckbox_traslados").checked;
            var check2 = document.getElementById("mycheckbox2_traslados").checked;
            var check3 = document.getElementById("mycheckbox3_traslados").checked;
            var check4 = document.getElementById("mycheckbox4_traslados").checked;
            var check5 = document.getElementById("Mycheckbox_Actividades").checked;
            var check6 = document.getElementById("Mycheckbox_Actividades2").checked;

            if ((check == false) && (check2 == false) && (check3 == false) && (check4 == false) && (check5 == false) && (check6 == false)) {
                LanzaAviso("Lo sentimos pero necesita marcar al menos 1 checkbox. Gracias!");
            }
            else {

            }
        }
        function LanzaAviso(Text) {
                bootbox.alert({ title: "PORCELANOSA", message: Text });
        }
        function desactivar_todo() {
            LanzaAviso("Lo sentimos pero no puede acceder sin el credencial de Email. Intentelo de Nuevo gracias!");
            document.getElementById("cont_princi").style.display = 'none';
            document.getElementById("prueba_aspx").innerHTML = '<p style="padding: 10px; color: Red; margin: 5px;">Lo sentimos pero sin identificación no podemos mostrarle ningún tipo de información. <i class="fas fa-exclamation-triangle"></i></p>';           
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid logo" onclick="desactivar_todo()">
            <img src="img/Porcelanosa_Logo.gif" />
        </div>
        <div id="prueba_aspx" class="principal usuario" runat="server">
            Hola
        </div>
        <div id="cont_princi" class="row principal">
            <div id="cabeceras_trasla" class="row cabecera1" onclick="desplazar(1)">
                Traslados <span style="float: right;">↓</span>
            </div>
            <div id="traslado1" class="row">
                <table class="row table tabla">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Hora</th>
                            <th scope="col">Descripción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">
                                <input type="checkbox" id="mycheckbox_traslados" name="omg" runat="server" />
                            </th>
                            <td>11/06</td>                            
                            <td>18:00</td>
                            <td>Llegada Hotel, recepción de <i class="fas fa-suitcase-rolling"></i> </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                <input type="checkbox" id="mycheckbox2_traslados" name="omg" runat="server" />
                            </th>
                            <td>12/06</td>
                            <td>08:30</td>
                            <td>Traslado Hotel <i class="fas fa-arrow-circle-right"></i> Feria</td>
                        </tr>
                        <tr>
                            <th scope="row">
                                <input type="checkbox" id="mycheckbox3_traslados" name="omg" runat="server" />
                            </th>
                            <td>12/06</td>
                            <td>18:30</td>
                            <td>Traslado Feria <i class="fas fa-arrow-circle-right"></i> Hotel</td>
                        </tr>
                        <tr>
                            <th scope="row">
                                <input type="checkbox" id="mycheckbox4_traslados" name="omg" runat="server" />
                            </th>
                            <td>13/06</td>
                            <td>18:00</td>
                            <td>Traslado Hotel <i class="fas fa-arrow-circle-right"></i> Est.AVE</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="cabeceras_acti" class="row cabeceras" onclick="desplazar(2)">
                Actividades <span style="float: right;">↓</span>
            </div>
            <div id="Actividades1" class="row">
                <table class="table tabla">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Hora</th>
                            <th scope="col">Descripción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">
                                <input type="checkbox" id="Mycheckbox_Actividades" name="omg" runat="server" />
                            </th>
                            <td>12/06</td>                            
                            <td>13:30</td>
                            <td> Comida de la asociación.<i class="fas fa-utensils"></i></td>
                        </tr>
                        <tr>
                            <th scope="row">
                                <input type="checkbox" id="Mycheckbox_Actividades2" name="omg" runat="server" />
                            </th>
                            <td>12/06</td>
                            <td>19:30</td>
                            <td>Visita nocturna a la ciudad.<i class="fas fa-moon"></i></td>
                        </tr>                        
                    </tbody>
                </table>
            </div>
            <asp:Button ID="Button_enviar" runat="server" Text="Enviar" />
        </div>
    </form>
    <script>
        
    </script>
</body>
</html>
