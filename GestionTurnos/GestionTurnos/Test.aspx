<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Test.aspx.vb" Inherits="GestionTurnos.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1" />

        <!-- CSS y distintas librerias -->
        <asp:literal id="bootstrap_min_css" runat="server"></asp:literal>
        <asp:literal id="jquery_1_9_1_min_js" runat="server"></asp:literal>
        <asp:literal id="bootstrap_min_js" runat="server"></asp:literal>
        <asp:literal id="bootbox_min_js" runat="server"></asp:literal>

        <link href="Css/css_querys.css" rel="stylesheet" type="text/css" /> <!-- Css para las Media Querys -->    
        <link href="Css/css1.css" rel="stylesheet" type="text/css" /> <!-- Css mio -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" /> <!-- Css FontAwesome -->
        
        <!-- Titulo del Website! -->
        <title>Pagina de Testeo de Gestión de Turnos</title>    

        <script type="text/javascript">
            function LanzaAviso(Text) {
                bootbox.alert({ title: "Gestión de turnos", message: Text });
            }
        
        </script>
        <script type="text/javascript">   
            //Acciones tras cargar la página
            window.onload = function () {
                mostrarEnPantalla = document.getElementById("textoMostrar1");
                document.onkeydown = teclado;
                desactivar_onclicks(); 
            }

            /*La pantalla de inicio muestra un 0 y solo permitirá la entrada de los 
            dígitos del teclado de la calculadora a los que hemos llamado 'numero'*/
            x = "0";

            /*Se inician las variales en la pantalla: 1 es un número escrito por primera 
            vez, mientras que 0 son las cifras que completan nuestro número*/
            x1 = 1;

            //Función numero para registrar la escritura en pantalla
            function numero(xx) {
                // Si x es igual a 0 el número que se muestra en pantalla es igual a 1.
                if (x == "0" || x1 == 1) {
                    var almacenar = xx;
                    //Comprobamos que el 1º numero introducido sea 6 o 7, sino ERROR.
                    if (xx == 6 || xx == 7) {
                        mostrarEnPantalla.value = xx;
                        //Con esta variable se guarda el número y se continua con este
                        x = xx;
                    }
                    else {
                        mostrarEnPantalla.value = "ERROR.";
                    }

                }
                /*Esta operación se hace mediante una cadena de texto para que el 
                  número tan solo se añada y no se sume al anterior*/

                else {

                    longitud = 1 + x.length;
                    if (longitud <= 9) {
                        document.getElementById("textoMostrar1").value += xx;
                        x += xx;
                    }
                    else {
                        return;
                    }
                }
                x1 = 0
            }                   
            //Borramos todas las numeros a 0
            function borradoPantalla() {
                mostrarEnPantalla.value = 0;
                x = "0";
            }
            function MostrarOcultar(capa, enlace) {
                //Nos creamos la variable prueba para saber la resolucón de la Screen.
                var prueba = screen.width;
                //Comprobamos si la res. es <de 800px para tomar medidas oportunas.
                if (prueba <= 800) {

                    //Comprobamos si el panel de sms, está visible.
                    if (document.getElementById('tabla_normal').style.opacity == "0.2") {

                        //Como sí lo está, ocultamos el contenedor de solicitar turno sin sms,
                        //ocultamos el contenedor oculto desactivandolo y le damos al contenedor de sms un tamaño del 100%
                        document.getElementById('cuadro1').style.display = 'none';
                        document.getElementById('cuadro2').style.width = '100%';
                        document.getElementById('tabla_normal').style.opacity = '1';
                        activar_onclicks();
                    }
                    //Como no está visible el cuadro de solicitar turno, lo activamos, y volvemos el contenedor de sms a
                    //su estado normal.
                    else {
                        document.getElementById('tabla_normal').style.opacity = '0.2';
                        document.getElementById('cuadro1').style.display = 'Block';
                        document.getElementById('cuadro2').style.width = '50%';
                        mostrarEnPantalla.value = '';
                        desactivar_onclicks();  
                    }
                }
                else {
                    //Comprobamos si el panel de sms, está visible.
                    if (document.getElementById('tabla_normal').style.opacity == "0.2") {
                        document.getElementById('cuadro1').style.display = 'none';
                        document.getElementById('cuadro2').style.width = '50%';
                        document.getElementById('tabla_normal').style.opacity = '1';
                        activar_onclicks();
                    }
                    //Como no está visible el cuadro de solicitar turno, lo activamos, y volvemos el contenedor de sms a
                    //su estado normal.
                    else {
                        document.getElementById('tabla_normal').style.opacity = '0.2';
                        document.getElementById('cuadro1').style.display = 'Block';
                        document.getElementById('cuadro2').style.width = '25%';
                        mostrarEnPantalla.value = 0;
                        desactivar_onclicks();                        
                    }
                }
            }

            //Funcion para desactivar los onclicks de la tabla numerica.
            function desactivar_onclicks() {
              document.getElementById('tabla_normal').style.pointerEvents = "none";
            }
            //Funcion para activar los onclicks de la tabla numerica.
            function activar_onclicks() {
              document.getElementById('tabla_normal').style.pointerEvents = "auto";
            }

            ///Sección para la función incrementar.

            //Variables necesarias para el contador.

            var contador = 0;
            var limite = 99;
            var total = 0;

            function incrementar()
            {

                //Esto lo dejamos de momento para aspecto visual,
                //Aunque aquí deberemos de contactar con el servidor para retomar el numero de turno que tenemos en la bd.

                //incrementamos el contador.
                contador++;

                var a = contador.toString();
                var b = a.length;

                if (contador <= limite) {
                    //este bucle es para los numeros de 1 a 9, para que se muestren como 01...09
                    if (b == '1') {
                        var contador_fixed = '0' + contador;
                        escribir = document.getElementById("contador");
                        escribir.innerHTML = contador_fixed;
                    }
                    //sino se muestran normales, 10....100
                    else {
                        var contador_fixed = contador;
                        escribir = document.getElementById("contador");
                        escribir.innerHTML = contador;
                    }
                }
                //Sí superamos el valor 100 del contador.
                else {
                    total = contador + 1;
                    LanzaAviso("el contador es:" + contador + " y el total es: " + total);
                    contador = 1;
                    var contador_fixed = '0' + contador;
                    escribir = document.getElementById("contador");
                    escribir.innerHTML = contador_fixed;
                }
            } 

        </script>          
    </head>
<body>
    <!-- Nueva interfaz con Bootstrap siguiend ejemplo de Toni -->
    <div class="separacion"></div>
    <div class="container-fluid contenedor_principal">
        <form id="Formulario1" method="post" runat="server" class="form-horizontal1">
            <div class="interfaz1">
                <div class="interfaz-header"></div>
                <div class="interfaz-cuerpo">
                    <div class="row banner">
                        <a href="www.peinarte.net"><img class="logo_banner" src="img/PEINARTE-LOG0.png" /></a>
                        <h4 class="eslogan_banner">Que no te tomen el Pelo! <i class="fas fa-cut" style="color: #CF3B9A;"></i></h4>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 contador-turnos "> 
                            <h3 class="ciudad">Málaga</h3>
                            <p class="direccion">Cristo de la Epidemia, 52</p>
                            <img class="numero_turno" src="img/turno.png" />
                            <p class="contador_turnos" id="contador"></p>
                            <h3 class="frase1">Reserva tu Turno!</h3>
                            <p class="texto_primer_panel">Solicita turno directamente o introduce tu número de móvil y te avisaremos mediante un SMS gratuito cuando te falten pocos turnos para la cita...</p>
                            <p class="info_web">Peinarte.net</p>
                        </div>
                        <div id="cuadro1" class="col-xs-3 cuadro-normal" onclick="incrementar()"> 
                            <i class="far fa-clock"></i>
                            <p class="buton_solicitar">SOLICITA TURNO</p>
                        </div>
                        <div id="cuadro2" class="col-xs-3 cuadro-sms" onclick="MostrarOcultar('')"> 
                            <i class="far fa-clock segunda_sms"></i>
                            <i class="fas fa-arrow-right"></i>
                            <i class="fas fa-mobile"></i>
                            <p class="buton_solicitar2">SOLICITA TURNO + SMS</p>
                        </div>
                        <div id="tabla_normal" class="row nueva_tabla">
                            <table class="table-responsive tabla_numeros">
                                <tbody>
                                    <tr>
                                        <th scope="row"></th>
                                        <th colspan="2" class="col-xs-3 cuadro_texto"><input type="text" id="textoMostrar1" class="cuadro_texto2"/></th>
                                        <th class="col-xs-3 cuadro_ok"> OK </th>
                                    </tr>
                                    <tr>
                                        <th scope="row"></th>
                                        <td class="primera_linea_tabla"><button type="button" class="botones" onclick='numero("1")' />1</td>
                                        <td class="segunda_linea_tabla"><button type="button" class="botones" onclick='numero("2")' />2</td>
                                         <td class="tercera_linea_tabla"><button type="button" class="botones" onclick='numero("3")' />3</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"></th>
                                        <td class="primera_linea_tabla"><button type="button" class="botones" onclick='numero("4")' />4</td>
                                        <td class="segunda_linea_tabla"><button type="button" class="botones" onclick='numero("5")' />5</td>
                                         <td class="tercera_linea_tabla"><button type="button" class="botones" onclick='numero("6")' />6</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"></th>
                                        <td class="primera_linea_tabla"><button type="button" class="botones" onclick='numero("7")' />7</td>
                                        <td class="segunda_linea_tabla"><button type="button" class="botones" onclick='numero("8")' />8</td>
                                        <td class="tercera_linea_tabla"><button type="button" class="botones" onclick='numero("9")' />9</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"></th>
                                        <td class="primera_linea_tabla"><button type="button" class="botones" onclick='numero("0")' />0</td>
                                        <td colspan="2" class="segunda_linea_tabla"><button type="button" class="botones" onclick='borradoPantalla()' />Borrar</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--
                        
                        -->
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="separacion"></div>


    <!-- JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
