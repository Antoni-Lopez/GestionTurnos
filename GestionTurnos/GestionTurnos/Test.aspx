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
            document.write('<style type="text/css">div.cp_oculta{display: none;}</style>');  
            function MostrarOcultar(capa,enlace)  
            {  
                if (document.getElementById)  
                {  
                    var aux = document.getElementById(capa).style;  
                    aux.display = aux.display? "":"block";  
                }  
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
    <div class="jumbotron jose">
        <p class="primer_alineado">
            <img class="logo" src="img/PEINARTE-LOG0.png" />
            <h4 class="eslogan">Que no te tomen el Pelo! <i class="fas fa-cut" style="color: #CF3B9A;"></i></h4>
        </p>
        <div class="agrupados">
            <div class="panel_mostrar">
                <h3 class="ciudad">Málaga</h3>
                <p class="direccion">Cristo de la Epidemia, 52</p>
                <img class="turno" src="img/turno.png" />
                <p class="contador_turnos" id="contador1"></p>
                <h3 class="frase1">Get your time!</h3>
                <p class="texto_primer_panel">Solicita turno directamente o introduce tu número de móvil y te avisaremos mediante un SMS gratuito cuando te falten pocos turnos para la cita...</p>
                <div class="estado_servicio">
                    <p class="p_estado_servicio">SERVICIO FUNCIONANDO</p> 
                </div>
                <p class="info_web">Peinarte.net</p>
            </div>
            <a class="panel_mostrar2"  title="Solicita tu Turno." href="javascript:incrementar();">
                <i class="far fa-clock"></i>
                <p class="boton_solicitar">SOLICITA TURNO</p>
            </a>
            <a class="panel_mostrar3" href="javascript:MostrarOcultar('teclado_num');">
                <i class="far fa-clock segunda"></i>
                <i class="fas fa-arrow-right"></i>
                <i class="fas fa-mobile"></i>
                <p class="boton_solicitar2">SOLICITA TURNO + SMS</p>
            </a>
            <div class="oculto2">
            </div>
            <div class="panel_oculto">
                    <p class="textoPantalla_oculto">0</p>
                    <p class="button_igual">OK</p>
                    <p class="button1">1</p>
                    <p class="button2">2</p>
                    <p class="button3">3</p>
                    <p class="button4">4</p>
                    <p class="button5">5</p>
                    <p class="button6">6</p>
                    <p class="button7">7</p>
                    <p class="button8">8</p>
                    <p class="button9">9</p>
                    <p class="button0">0</p>
                    <p class="button_deleted">Borrar</p>
            </div>
            <div class="panel_mostrar4" id="teclado_num">
                <form name="calculadora" id="calculadora" runat="server">
                    <p id="textoPantalla">0</p>
                    <input type="submit" class="button_igual2" value="OK" onclick="javascript:incrementar();"/>
                    <input type="button" class="botton1" value="1" onclick="numero('1')"/>
                    <input type="button" class="botton2" value="2" onclick="numero('2')"/>
                    <input type="button" class="botton3" value="3" onclick="numero('3')"/>
                    <input type="button" class="botton4" value="4" onclick="numero('4')"/>
                    <input type="button" class="botton5" value="5" onclick="numero('5')"/>
                    <input type="button" class="botton6" value="6" onclick="numero('6')"/>
                    <input type="button" class="botton7" value="7" onclick="numero('7')"/>
                    <input type="button" class="botton8" value="8" onclick="numero('8')"/>
                    <input type="button" class="botton9" value="9" onclick="numero('9')"/>
                    <input type="button" class="botton0" value="0" onclick="numero('0')"/>
                    <input type="button" class="botton_deleted" value="Borrar" onclick="borradoTotal()"/>
                </form>
            </div>
        </div>
        
    </div>
    

    <div class="separacion"></div>

    <!-- Nueva interfaz con Bootstrap -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 interfaz">
                <div class="col-sm-5 col-md-6 banner">
                    <a href="www.peinarte.net"><img class="logo_banner" src="img/PEINARTE-LOG0.png" /></a>
                </div>
                <div class="col-sm-5 col-md-6 banner">
                    <h4 class="eslogan_banner">Que no te tomen el Pelo! <i class="fas fa-cut" style="color: #CF3B9A;"></i></h4>
                </div>
                <div class="col-sm-6 turnos">
                    <h3 class="ciudad">Málaga</h3>
                    <p class="direccion">Cristo de la Epidemia, 52</p>
                    <img class="numero_turno" src="img/turno.png" />
                    <p class="contador_turnos" id="contador"></p>
                    <h3 class="frase1">Get your time!</h3>
                    <p class="texto_primer_panel">Solicita turno directamente o introduce tu número de móvil y te avisaremos mediante un SMS gratuito cuando te falten pocos turnos para la cita...</p>
                    <div class="row estado_servicio">
                        <p class="p_estado_servicio">SERVICIO FUNCIONANDO</p> 
                    </div>
                    <p class="info_web">Peinarte.net</p>
                </div>
                <a class="col-sm-3 normal" href="javascript:incrementar();">
                    <i class="far fa-clock"></i>
                    <p class="buton_solicitar">SOLICITA TURNO</p>
                </a>
                <a class="col-sm-3 sms" href="javascript:MostrarOcultar('teclado_num_oculto');">
                    <i class="far fa-clock segunda_sms"></i>
                    <i class="fas fa-arrow-right"></i>
                    <i class="fas fa-mobile"></i>
                    <p class="buton_solicitar">SOLICITA TURNO + SMS</p>
                </a>
                <p class="col-sm-3 teclado_texto">
                    0
                </p>
                <p class="col-sm-3 teclado_ok">
                    OK
                </p>
                <p class="col-sm-3 teclado_1">
                    1
                </p>
                <p class="col-sm-3 teclado_2">
                    2
                </p> 
                <p class="col-sm-3 teclado_3">
                    3
                </p>
                <p class="col-sm-3 teclado_1">
                    4
                </p>
                <p class="col-sm-3 teclado_2">
                    5
                </p> 
                <p class="col-sm-3 teclado_3">
                    6
                </p>
                <p class="col-sm-3 teclado_1">
                    7
                </p>
                <p class="col-sm-3 teclado_2">
                    8
                </p> 
                <p class="col-sm-3 teclado_3">
                    9
                </p>
                <p class="col-sm-3 teclado_0">
                    0
                </p>
                <p class="col-sm-3 teclado_deleted">
                    BORRAR
                </p>
                <div class="col-sm-6 oculto"> 
                       
                </div>
                <label id="teclado_num_oculto" class="panel_oculto"> 
                       <p class="col-sm-3 teclado_texto_oculto">
                        0
                       </p>
                       <a class="col-sm-3 teclado_ok_oculto">
                           OK
                       </a>
                       <a class="col-sm-3 teclado_1_oculto">
                           1
                       </a>
                       <a class="col-sm-3 teclado_2_oculto">
                           2
                       </a> 
                       <a class="col-sm-3 teclado_3_oculto">
                           3
                       </a>
                </label>
             </div>
        </div>
    </div>

    <!-- JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
