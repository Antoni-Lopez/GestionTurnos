<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Formulario.aspx.vb" Inherits="GestionTurnos.Formulario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- CSS y distintas librerias -->

    <asp:literal id="bootstrap_min_css" runat="server"></asp:literal>
    <asp:literal id="jquery_1_9_1_min_js" runat="server"></asp:literal>
    <asp:literal id="bootstrap_min_js" runat="server"></asp:literal>
    <asp:literal id="bootbox_min_js" runat="server"></asp:literal>

    <link href="Css/formulario.css" rel="stylesheet" type="text/css" /> <!-- Css mio -->


    <title>Formulario Registro/Visualización de datos.</title>
    <script type="text/javascript">
        //Acciones tras cargar la página
        //Primero nos creamos una función que se encargara 
        //De lanzar todas las funciones que queramos que se ejecuten al cargar la página.
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
        addLoadEvent(comprueba);
        var jose; 

        function EnviemFormulari() {
           var theform;
           if (window.navigator.appName.toLowerCase().indexOf("microsoft") > -1) theform = document.form1;
           else theform = document.forms["form1"];
           theform.submit();
       }
               
        function comprueba() {
            var inicio = document.getElementById("datos_input_radio");
            var asiste = document.getElementById("radio_asiste_si");
            var transporte = document.getElementById("transporte_si");
            jose = document.getElementById("jose_prueba");

            if (inicio.checked == true) {
                document.getElementById('cuadro_medico').style.opacity = '0';
                $('#cuadro_medico').hide("slow");
                document.getElementById('cuadro_delegado').style.opacity = '1';
                $('#cuadro_delegado').show(3000);
                document.getElementById('cuadro_delegado1').style.opacity = '1';
                $('#cuadro_delegado1').show(3000);
                document.getElementById('cuadro_delegado2').style.opacity = '1';
                $('#cuadro_delegado2').show(3000);
                document.getElementById('boton_enviar').style.opacity = '1';
                $('#boton_enviar').show(3000);
            }
            else {
                document.getElementById('cuadro_delegado').style.opacity = '0';
                $('#cuadro_delegado').hide("slow");
                document.getElementById('cuadro_delegado1').style.opacity = '0';
                $('#cuadro_delegado1').hide("slow");
                document.getElementById('cuadro_delegado2').style.opacity = '0';
                $('#cuadro_delegado2').hide("slow");
                document.getElementById('boton_enviar').style.opacity = '0';
                $('#boton_enviar').hide("slow");
                document.getElementById('cuadro_medico').style.opacity = '1';
                $('#cuadro_medico').show(3000);
            }

            if (asiste.checked == true) {
                document.getElementById('cuadro_asiste').style.opacity = '1';
                $('#cuadro_asiste').show(3000);

                if (transporte.checked == true) {
                    document.getElementById('cuadro_transporte').style.opacity = '1';
                    $('#cuadro_transporte').show(3000);                                        
                }
                else {
                    document.getElementById('cuadro_transporte').style.opacity = '0';
                    $('#cuadro_transporte').hide("slow");                    
                }                
            }
            else {
                document.getElementById('cuadro_asiste').style.opacity = '0';
                $('#cuadro_asiste').hide("slow");
                document.getElementById('cuadro_transporte').style.opacity = '0';
                $('#cuadro_transporte').hide("slow");
            }
            if (jose != null) {

            }
            else {

            }
        }
        function LanzaAviso(Text) {
                bootbox.alert({ title: "Gestión de turnos", message: Text });
        }
        function comprueba_radiobuttons(x) {
            var radio1 = document.getElementById("datos_input_radio");
            var radio2 = document.getElementById("radio_asiste_si");
            var radio3 = document.getElementById("transporte_si");
            switch (x) {
                case 1:
                    if (radio1.checked == true) {
                        document.getElementById('cuadro_medico').style.opacity = '0';
                        $('#cuadro_medico').hide("slow");
                        document.getElementById('cuadro_delegado').style.opacity = '1';
                        $('#cuadro_delegado').show(3000);
                        document.getElementById('cuadro_delegado1').style.opacity = '1';
                        $('#cuadro_delegado1').show(3000);
                        document.getElementById('cuadro_delegado2').style.opacity = '1';
                        $('#cuadro_delegado2').show(3000);
                        document.getElementById('boton_enviar').style.opacity = '1';
                        $('#boton_enviar').show(3000);
                    }
                    else {
                        document.getElementById('cuadro_delegado').style.opacity = '0';
                        $('#cuadro_delegado').hide("slow");
                        document.getElementById('cuadro_delegado1').style.opacity = '0';
                        $('#cuadro_delegado1').hide("slow");
                        document.getElementById('cuadro_delegado2').style.opacity = '0';
                        $('#cuadro_delegado2').hide("slow");
                        document.getElementById('boton_enviar').style.opacity = '0';
                        $('#boton_enviar').hide("slow");
                        document.getElementById('cuadro_medico').style.opacity = '1';
                        $('#cuadro_medico').show(3000);
                    }
                    break;
                case 2:
                    if (radio2.checked == true) {
                        document.getElementById('cuadro_asiste').style.opacity = '1';
                        $('#cuadro_asiste').show(3000);
                    }
                    else {
                        document.getElementById('cuadro_asiste').style.opacity = '0';
                        $('#cuadro_asiste').hide("slow");
                        document.getElementById('cuadro_transporte').style.opacity = '0';
                        $('#cuadro_transporte').hide("slow");
                    }
                    break;
                case 3:
                    if (radio3.checked == true) {
                        document.getElementById('cuadro_transporte').style.opacity = '1';
                        $('#cuadro_transporte').show(3000);
                    }
                    else {
                        document.getElementById('cuadro_transporte').style.opacity = '0';
                        $('#cuadro_transporte').hide("slow");
                    }
                    break;
                default:
                    break;
            
            }
        }
        function ocultar_select() {
            document.getElementById('myselect').style.opacity = '0';
            $('#myselect').hide("slow");
            document.getElementById('header_radiobuttons').style.opacity = '0';
            $('#header_radiobuttons').hide("slow");
            
            
        }
        function chorra() {
            var pruebaza = document.getElementById("jose_prueba");
            if (pruebaza.value = " ") {
                alert("aqui tenemos un value de: " + pruebaza);
                
                pruebaza.value = 1;
            }
            else {
                pruebaza = pruebaza + 1;
                pruebaza.value = pruebaza;
                alert("no tenemos un value de: " + pruebaza);
            }
        }
        
        function ValidaEmail() {
            var email = document.getElementById("texto_email");
            (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(Email))
            elegir_accion(1);
        }
        function elegir_accion(x) {
            switch (x) {
                case 1:
                    var boton_envio_delegado = document.getElementById("jose_prueba");
                    boton_envio_delegado.value = '1';
                    break;
                case 2:
                    alert("Aqui estamos!");
                    break;
                case 3:
                    var clickeado = $("#myselect :selected").val();
                    jose = document.getElementById("jose_prueba2");
                    jose.value = clickeado;
                    jose_prueba
                    document.getElementById("jose_prueba").value = 2;
                    EnviemFormulari();
                case 4:
                    break;
                case 5:
                    break;
            }
        }
    </script>
</head>
<body>
    <div class="container-fluid main_cuadro ">
        <form id="form1" runat="server">
            <div id="header_radiobuttons" class="row eleccion">
                <div class="col-md-6 datos_delegado">
                    <input type="radio" class="custom-control-input input_radio_eleccion" id="datos_input_radio" name="radiodatos" value="misdatos" onclick="comprueba_radiobuttons(1)" runat="server" />Delegado 
                </div>
                <div class="col-md-6 datos_medico">
                    <input type="radio" class="custom-control-input input_radio_eleccion" id="datos_input_medico" name="radiodatos" value="medicosdatos" onclick="comprueba_radiobuttons(1)" runat="server" />Médicos
                </div>        
            </div>
            <div id="cuadro_delegado" class="row eleccion_delegado">
                <div class="row eleccion_delegado1 padd">
                    <fieldset>
                        <legend>Datos Personales</legend> 
                        <div class="col-md-4 da1">
                            <label for="nombre" class="pad textos_personales">Nombre</label>
                            <div class="row parraf">
                                <asp:TextBox id="texto_nombre" ReadOnly="true" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4 da2">
                            <label for="ape1" class="pad textos_personales">Apellido</label>
                            <div class="row parraf">
                                <asp:TextBox ID="apellido1" ReadOnly="true" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4 da3">
                            <label for="ape1" class="pad textos_personales">2º Apellido</label>
                            <div class="row parraf">
                                <asp:TextBox ID="apellido2" ReadOnly="true" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4 padd da4">
                            <label for="ape1" class="pad textos_personales">Email</label>
                            <div class="row parraf">
                                <asp:TextBox ID="texto_email" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4 padd da5">
                            <label for="ape1" class="pad textos_personales">Telefono</label>
                            <div class="row parraf">
                                <asp:TextBox ID="texto_phone" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4 padd da6">
                            <label for="ape1" class="pad textos_personales">Region</label>
                            <div class="row parraf">
                                <asp:TextBox ID="texto_region" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div>
                        </div>
                    </fieldset>
                    <div class="col-md-6 padd da7">
                        <label for="ape1" class="pad textos_siglas">Siglas Delegado</label>
                        <div class="row parraf">
                            <asp:TextBox ID="texto_delegado" runat="server" CssClass="col-md-6 input_data_siglas"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6 padd da8">
                        <label for="ape1" class="pad textos_siglas">Siglas Gerente</label>
                        <div class="row parraf">
                            <asp:TextBox ID="texto_gerente" runat="server" CssClass="col-md-6 input_data_siglas"></asp:TextBox>
                        </div>
                    </div>
                </div>                        
            </div>                    
            <div id="cuadro_delegado1" class="row eleccion_delegado1">
                <fieldset>
                    <legend>¿Asiste?</legend>
                    <div class="col-md-6 pad">
                        <input type="radio" class="custom-control-input input_asiste" id="radio_asiste_si" name="asiste" onclick="comprueba_radiobuttons(2)" value="asiste_si" runat="server" />
                        <label for="asiste_si" class="label_asiste">Si.</label>
                    </div>
                    <div class="col-md-6 pad">
                        <input type="radio" class="custom-control-input input_asiste" id="radio_asiste_no" name="asiste" onclick="comprueba_radiobuttons(2)" value="asiste_no" runat="server" />
                        <label for="asiste_si" class="label_asiste">No.</label>
                    </div>
                </fieldset>
                <div id="cuadro_asiste" class="row padd asiste_cuadro">
                    <div class="col-md-6 padd bord">
                        <label for="texto_transporte" class="">¿Necesita Transporte?</label>
                        <div class="col-md-6 pad">
                            <input type="radio" class="custom-control-input input_asiste" id="transporte_si" name="transporte" onclick="comprueba_radiobuttons(3)" value="transporte_si" runat="server" />
                            <label for="transporte" class="">Si.</label>
                        </div>
                        <div class="col-md-6 pad">
                            <input type="radio" class="custom-control-input input_asiste" id="transporte_no" name="transporte" onclick="comprueba_radiobuttons(3)" value="transporte_no" runat="server" />
                            <label for="transporte" class="">No.</label>
                        </div>
                    </div>
                    <div class="col-md-6 padd">
                        <label for="texto_transporte" class="">¿Necesita Alojamiento?</label>
                        <div class="col-md-6 pad">
                            <input type="radio" class="custom-control-input input_asiste" id="alojamiento_si" name="alojamiento" value="alojamiento_si" runat="server" />
                            <label for="transporte" class="">Si.</label>
                        </div>
                        <div class="col-md-6 pad">
                            <input type="radio" class="custom-control-input input_asiste" id="alojamiento_no" name="alojamiento" value="alojamiento_no" runat="server" checked />
                            <label for="transporte" class="">No.</label>
                        </div>
                    </div>                    
                </div>
                <div id="cuadro_transporte" class="padd cityorigen">
                        Indique la ciudad de Origen  <asp:TextBox ID="ciudad_origen" CssClass="input_transporte" runat="server"></asp:TextBox>
                </div>
            </div>                        
            <div id="cuadro_delegado2" class="row eleccion_delegado1">
                <div class="row padd">
                    <label for="nombre" class="label_textos">Alergias: </label>
                    <asp:TextBox id="alergias" ReadOnly="false" runat="server" CssClass="form-control input_obser_aler"></asp:TextBox>
                </div>
                <div class="row padd">
                    <label for="nombre" class="label_textos">Observaciones: </label>
                    <asp:TextBox id="observaciones" ReadOnly="false" runat="server" CssClass="form-control input_obser_aler"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <asp:Button ID="boton_enviar" CssClass="enviar" Text="Enviar" runat="server" />
            </div>     
            <div id="cuadro_medico" class="row eleccion_medico">
                <div id="myselect" class="row eleccion_medico_delegado padd">
                    <select id="miselect" class="mi_selector" onchange="elegir_accion(3)" OnSelectedIndexChanged="myselect_selected" AutoPostBack="True" runat="server" name="d1">
                        <option value="-2" id="anadir_registro_medico" selected>Nueva Alta Médico</option>
                        <option value="-1">-------------------------------------------------------------------------</option>
                        
                    </select>
                </div>
                <div class="row eleccion_medico1 padd">
                    <div class="row eleccion_delegado1 padd">
                    <fieldset>
                        <legend>Datos Personales</legend> 
                        <div class="col-md-4 da1">
                            <label for="nombre" class="pad texto_medico1">Nombre</label>
                            <div class="row parraf">
                                <asp:TextBox id="nombre_medico" ReadOnly="true" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4 da2">
                            <label for="ape1" class="pad texto_medico1">Apellido</label>
                            <div class="row parraf">
                                <asp:TextBox ID="ape1medico" ReadOnly="true" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4 da3">
                            <label for="ape1" class="pad texto_medico1">2º Apellido</label>
                            <div class="row parraf">
                                <asp:TextBox ID="ape2medico" ReadOnly="true" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4 padd da4">
                            <label for="ape1" class="pad texto_medico1">Email</label>
                            <div class="row parraf">
                                <asp:TextBox ID="medicmail" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4 padd da5">
                            <label for="ape1" class="pad texto_medico1">Especialidad</label>
                            <div class="row parraf">
                                <asp:TextBox ID="medicespecialidad" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4 padd da6">
                            <label for="ape1" class="pad texto_medico1">Número de SELAS</label>
                            <div class="row parraf">
                                <asp:TextBox ID="medic_selas" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div>
                        </div>
                    </fieldset>
                </div> 
                </div>
                <div class="row eleccion_medico1 padd">
                    <div class="col-md-6 padd">
                        <p class="texto_consentimiento pad">Consentimiento Firmado</p>
                        <div class="col-md-6 pad">
                            <input type="radio" class="custom-control-input input_asiste" id="consenti_si" name="Consentimiento" value="Consentimiento_si" runat="server" />
                            <label for="transporte" class="">Si.</label>
                        </div>
                        <div class="col-md-6 pad">
                            <input type="radio" class="custom-control-input input_asiste" id="consenti_no" name="Consentimiento" value="Consentimiento_no" runat="server" />
                            <label for="transporte" class="">No.</label>
                        </div>
                        <div class="row">
                            <p class="texto_consentimiento indica_city pad">Indique la ciudad de Origen</p>
                            <asp:TextBox ID="TextBox1" CssClass="input_data_medico_cityorigen" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6 padd">
                        <p class="texto_consentimiento transpo pad" onclick="chorra()">¿Necesita transporte?</p>
                        <div class="col-md-6 pad">
                            <input type="radio" class="custom-control-input input_asiste" id="transpor_si" name="transporte" value="transporte_si" runat="server" />
                            <label for="transporte" class="">Si.</label>
                        </div>
                        <div class="col-md-6 pad">
                            <input type="radio" class="custom-control-input input_asiste" id="transpor_no" name="transporte" value="transporte_no" runat="server" checked />
                            <label for="transporte" class="">No.</label>
                        </div>
                        <p class="texto_consentimiento nece_transpor pad">¿Necesita alojamiento?</p>
                        <div class="col-md-6 pad">
                            <input type="radio" class="custom-control-input input_asiste" id="aloja_si" name="alojamiento" value="alojamiento_si" runat="server" />
                            <label for="transporte" class="">Si.</label>
                        </div>
                        <div class="col-md-6 pad">
                            <input type="radio" class="custom-control-input input_asiste" id="aloja_no" name="alojamiento" value="alojamiento_no" runat="server" checked />
                            <label for="transporte" class="">No.</label>
                        </div>
                    </div>
                </div>
                <div class="row eleccion_medico1 padd">
                    <div class="row padd">
                        <label for="nombre" class="label_textos">Alergias: </label>
                        <asp:TextBox id="alergia_medic" ReadOnly="false" runat="server" CssClass="form-control input_obser_aler1"></asp:TextBox>
                    </div>
                    <div class="row padd">
                        <label for="nombre" class="label_textos">Observaciones: </label>
                        <asp:TextBox id="Observa_medic" ReadOnly="false" runat="server" CssClass="form-control input_obser_aler1"></asp:TextBox>
                    </div>
                </div>
                <div class="row eleccion_medico1 padd">
                    <button onclick="prueba()">Pruebaaaa</button>
                    <asp:TextBox ID="jose_prueba" ReadOnly="false" runat="server" CssClass="form-control input_obser_aler1"></asp:TextBox>
                    <asp:TextBox ID="jose_prueba2" ReadOnly="false" runat="server" CssClass="form-control input_obser_aler1"></asp:TextBox>
                </div>
            </div>
        </form>
    </div>  
</body>
</html>
