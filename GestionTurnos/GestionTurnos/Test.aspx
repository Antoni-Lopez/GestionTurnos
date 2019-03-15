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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"> <!-- Css FontAwesome -->
        <script type="text/javascript" src="Script/teclado_numerico.js"></script>
        
        <!-- Titulo del Website! -->
        <title>Pagina de Testeo de Gestión de Turnos</title>    

        <script type="text/javascript">
            function LanzaAviso(Text) {
                bootbox.alert({ title: "Gestión de turnos", message: Text });
            }
        
        </script>
        <script type="text/javascript">   
            <!--  
            /*document.write('<style type="text/css">div.mostrar{display: none;}</style>'); */ 
            function MostrarOcultar(capa,enlace)  
            {
                /*document.getElementById('mostrar').style.display = 'block'; */
                if (document.getElementsByClassName('panel_mostrar_numeros').style == "block") {

                    document.getElementsByClassName('panel_mostrar_numeros').style.display = "none";                    
                }
                else {
                    document.getElementById('mostrar').style.display = "block";
                    document.getElementById('cuadro1').style.display = "none";
                    document.getElementById('cuadro2').style.width = "50%";
                }
                /*
                if (document.getElementById)  
                {  
                    var aux = document.getElementById(capa).style;  
                    aux.display = aux.display? "":"block";  
                }  
                */
            }  
   
            //-->  
        </script> 
        <script type="text/javascript"> 
            
            <!--  
            var contador = 0;
            var limite = 99;
            var total = 0;

            function incrementar()
            {
                contador++;
                var a = contador.toString();
                var b = a.length;

                if (contador <= limite) {

                    if (b == '1') {
                        var contador_fixed = '0' + contador;
                        escribir = document.getElementById("contador");
                        escribir.innerHTML = contador_fixed;
                    }
                    else {
                        var contador_fixed = contador;
                        escribir = document.getElementById("contador");
                        escribir.innerHTML = contador;
                    }
                }
                else {
                    total =  contador + 1;
                    contador = 1;

                    var contador_fixed = '0' + contador;
                    escribir = document.getElementById("contador");
                    escribir.innerHTML = contador_fixed;
                }
            } 
            //-->  
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
                            <div class="row estado_servicio">
                                <p class="p_estado_servicio">SERVICIO FUNCIONANDO</p> 
                            </div>
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
                        <div class="row">
                            <div class="col-xs-3 cuadro_texto">
                            
                            </div>
                            <div class="col-xs-3 cuadro_ok">
                                OK
                            </div>
                            <div class="row">
                                <table class="table-responsive tabla_numeros">
                                  <tbody>
                                    <tr>
                                      <th scope="row"></th>
                                      <td class="primera_linea_tabla" onclick="numero('1')">1</td>
                                      <td class="segunda_linea_tabla" onclick="numero('2')">2</td>
                                      <td class="tercera_linea_tabla" onclick="numero('3')">3</td>
                                    </tr>
                                    <tr>
                                      <th scope="row"></th>
                                      <td class="primera_linea_tabla" onclick="numero('4')">4</td>
                                      <td class="segunda_linea_tabla" onclick="numero('5')">5</td>
                                      <td class="tercera_linea_tabla" onclick="numero('6')">6</td>
                                    </tr>
                                    <tr>
                                      <th scope="row"></th>
                                      <td class="primera_linea_tabla" onclick="numero('7')">7</td>
                                      <td class="segunda_linea_tabla" onclick="numero('8')">8</td>
                                      <td class="tercera_linea_tabla" onclick="numero('9')">9</td>
                                    </tr>
                                  </tbody>
                                </table>
                                <div class="row">
                                    <div class="col-xs-3 cuadro_0 verde" onclick="numero('0')">
                                        0
                                    </div>
                                    <div class="col-xs-3 cuadro_borrar amarillo" onclick="borradoTotal()">
                                        BORRAR
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div  id="mostrar" class="panel_mostrar_numeros">
                            <p id="textoPantalla"></p>
                        </div>

                        <!--
                        <div class="row col-xs-6 oculto">
                            <div class="row col-xs-6 oculto2">
                                <div class="col-md-6 cuadro_texto">
                                    <p class="">0</p>
                                </div>
                                <div class="col-md-6 cuadro_ok">
                                    <p class="texto_ok">OK</p>
                                </div>             
                            </div>
                            <div class="row col-xs-6 oculto3">
                                <div class="row">
                                    <div class="col-md-4 cuadro_1">
                                        <p class="texto_1">1</p>
                                    </div>
                                    <div class="col-md-4 cuadro_2">
                                        <p class="texto_2">2</p>
                                    </div>
                                    <div class="col-md-4 cuadro_3">
                                        <p class="texto_3">3</p>
                                    </div>             
                                </div>
                            </div>
                            <div class="row col-xs-6 oculto4">
                                <div class="col-md-4 cuadro_1">
                                    <p class="texto_1">4</p>
                                </div>
                                <div class="col-md-4 cuadro_2">
                                    <p class="texto_2">5</p>
                                </div>
                                <div class="col-md-4 cuadro_3">
                                    <p class="texto_3">6</p>
                                </div>             
                            </div>
                            <div class="row col-xs-6 oculto5">
                                <div class="col-md-4 cuadro_1">
                                    <p class="texto_1">7</p>
                                </div>
                                <div class="col-md-4 cuadro_2">
                                    <p class="texto_2">8</p>
                                </div>
                                <div class="col-md-4 cuadro_3">
                                    <p class="texto_3">9</p>
                                </div>
                            </div>
                            <div class="row col-xs-6 oculto6">
                                <div class="col-xs-3 cuadro_0">
                                    <p class="texto_1">0</p>
                                </div>
                                <div class="col-xs-3 cuadro_borrar">
                                    <p class="texto_2">BORRAR</p>
                                </div> 
                            </div>

                        </div>
                        <div id="mostrar" class="row col-xs-6 mostrar_panel">
                            <div class="row col-xs-6 oculto2_1">
                                <div class="col-md-6 cuadro_texto">
                                    <p id="textoPantalla">0</p>
                                </div>
                                <div class="col-md-6 cuadro_ok">
                                    <p class="texto_ok">OK</p>
                                </div>             
                            </div>
                            <div class="row col-xs-6 oculto3">
                                <div class="row">
                                    <div class="col-md-4 cuadro_1_oculto" onclick="numero('1')">
                                        <p class="texto_1" >1</p>
                                    </div>
                                    <div class="col-md-4 cuadro_2_oculto" onclick="numero('2')">
                                        <p class="texto_2" >2</p>
                                    </div>
                                    <div class="col-md-4 cuadro_3_oculto" onclick="numero('3')">
                                        <p class="texto_3" >3</p>
                                    </div>             
                                </div>
                            </div>
                            <div class="row col-xs-6 oculto4">
                                <div class="col-md-4 cuadro_1_oculto" onclick="numero('4')">
                                    <p class="texto_1">4</p>
                                </div>
                                <div class="col-md-4 cuadro_2_oculto" onclick="numero('5')">
                                    <p class="texto_2" >5</p>
                                </div>
                                <div class="col-md-4 cuadro_3_oculto" onclick="numero('6')">
                                    <p class="texto_3" >6</p>
                                </div>             
                            </div>
                            <div class="row col-xs-6 oculto5">
                                <div class="col-md-4 cuadro_1_oculto" onclick="numero('7')">
                                    <p class="texto_1" >7</p>
                                </div>
                                <div class="col-md-4 cuadro_2_oculto" onclick="numero('8')">
                                    <p class="texto_2" >8</p>
                                </div>
                                <div class="col-md-4 cuadro_3_oculto" onclick="numero('9')">
                                    <p class="texto_3" >9</p>
                                </div>
                            </div>
                            <div class="row col-xs-6 oculto6">
                                <div class="col-xs-3 cuadro_0_oculto" onclick="numero('0')">
                                    <p class="texto_1" >0</p>
                                </div>
                                <div class="col-xs-3 cuadro_borrar_oculto" onclick="borradoParcial()">
                                    <p class="texto_2" >BORRAR</p>
                                </div> 
                            </div>
                        </div>
                        -->
                    </div>
                </div>
            </div>
        </form>
    </div>
-->

    <div class="separacion"></div>


    <!-- JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
