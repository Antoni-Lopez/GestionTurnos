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
        addLoadEvent(); 

        function LanzaAviso(Text) {
                bootbox.alert({ title: "Gestión de turnos", message: Text });
        }

        function comprueba_radio() {
            var radio1 = document.getElementById("datos_input_radio");
            var radio2 = document.getElementById("datos_input_medico");

            if (radio2.checked == true) {
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
            else {
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
        }
        /*
        function comprueba_checkbox2() {
            var check3 = document.getElementById("Checkbox_asiste_si");
            var check4 = document.getElementById("Checkbox_asiste_no");
            check3.onclick = function () {
                if (check3.checked == true) {
                    //Checkeamos el checkbox Sí.
                    check4.checked = null;
                    document.getElementById('cuadro_asiste').style.display = 'Block';
                    $('#cuadro_asiste').show(3000);
                }
                else {
                    //des chekeamos el checkbox.
                    check4.checked = true;
                    document.getElementById('cuadro_asiste').style.display = 'none';
                    $('#cuadro_asiste').hide("slow");
                }
            }
            check4.onclick = function () {
                if (check4.checked == true) {
                    //Checkeamos el checkbox No.
                    check3.checked = null;
                    document.getElementById('cuadro_asiste').style.display = 'none';
                    $('#cuadro_asiste').hide("slow");
                }
                else {
                    check4.checked = null;
                    check3.checked = true;
                    document.getElementById('cuadro_asiste').style.display = 'Block';
                    $('#cuadro_asiste').show(3000);
                }
            }
            
        }  
        function comprueba_checkbox3() {
            var check5 = document.getElementById("Transporte_CheckboxSI");
            var check6 = document.getElementById("Transporte_CheckboxNO");
            check5.onclick = function () {
                //Marcamos click de: sí necesitamos transporte.
                if (check5.checked == true) {
                    check6.checked = null;                    
                    document.getElementById('asiste_transporte').style.opacity = '1';
                    $('#asiste_transporte').show(3000);
                }
                else {
                    check5.checked = null;
                    check6.checked = true;
                    document.getElementById('asiste_transporte').style.opacity = '0';
                    $('#asiste_transporte').hide("slow");
                }
            }
            check6.onclick = function () {
                //Marcamos click de: no necesitamos transporte.
                if (check6.checked == true) {
                    check5.checked = null;
                    document.getElementById('asiste_transporte').style.opacity = '0';
                    $('#asiste_transporte').hide("slow");
                }
                else {
                    check6.checked = null;
                    check5.checked = true;
                    document.getElementById('asiste_transporte').style.opacity = '0';
                    $('#asiste_transporte').hide("slow");
                }
            }            
        }
        */
        function radio_asiste() {
            var si = document.getElementById("radio_asiste_si");
            if (si.checked == true) {
                document.getElementById('cuadro_asiste').style.opacity = '1';
                $('#cuadro_asiste').show(3000);
            }
            else {
                document.getElementById('cuadro_asiste').style.opacity = '0';
                $('#cuadro_asiste').hide("slow");
            }
        }
   
    </script>
</head>
<body>

    <div class="container-fluid main_cuadro ">
        <form id="form1" runat="server">
            <div class="row eleccion">
                <div class="col-md-6 datos_delegado">
                    <input type="radio" class="custom-control-input input_radio_eleccion" id="datos_input_radio" name="radiodatos" value="misdatos" onclick="comprueba_radio()" checked />Mis Datos. 
                </div>
                <div class="col-md-6 datos_medico">
                    <input type="radio" class="custom-control-input input_radio_eleccion" id="datos_input_medico" name="radiodatos" value="medicosdatos" onclick="comprueba_radio()"  />Datos Médicos.
                </div>        
            </div>
            <div id="cuadro_delegado" class="row eleccion_delegado">
                <div class="row eleccion_delegado1 padd">
                    <fieldset>
                        <legend>Datos Personales</legend> 
                        <p class="col-md-4 pad textos_personales">Nombre</p>
                        <p class="col-md-4 pad textos_personales">Apellido</p>
                        <p class="col-md-4 pad textos_personales">2º Apellido</p>
                        <div class="col-md-4 parraf">
                            <asp:TextBox id="texto_nombre" ReadOnly="true" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                        </div>
                        <div class="col-md-4 parraf">
                            <asp:TextBox ID="apellido1" ReadOnly="true" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                        </div>
                        <div class="col-md-4 parraf">
                            <asp:TextBox ID="apellido2" ReadOnly="true" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                        </div>
                        <p class="col-md-4 pad textos_personales">Email</p>
                        <p class="col-md-4 pad textos_personales">Telefono</p>
                        <p class="col-md-4 pad textos_personales">Region</p>
                        <div class="col-md-4 parraf">
                            <asp:TextBox ID="texto_email" runat="server" CssClass="col-md-6 input_data_delegado "></asp:TextBox>
                        </div>
                        <div class="col-md-4 parraf">
                            <asp:TextBox ID="texto_phone" runat="server" CssClass="col-md-6 input_data_delegado "></asp:TextBox>
                        </div>
                        <div class="col-md-4 parraf">
                            <asp:TextBox ID="texto_region" runat="server" CssClass="col-md-6 input_data_delegado "></asp:TextBox>
                        </div>
                        <!--
                        <div class="col-md-4 datos_personales padd">


                            
                            <p class="col-md-6 texto_delegado">Nombre: </p>                                 
                            <asp:TextBox id="texto_nombre1" ReadOnly="true" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                        </div> 

                        <div class="col-md-4 datos_personales1 padd">
                            <p class="col-md-6 texto_delegado">Apellido: </p>
                            <asp:TextBox ID="apellido11" ReadOnly="true" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                        </div> 

                        <div class="col-md-4 datos_personales2 padd">
                            <p class="col-md-6 texto_delegado">2º Apellido: </p>
                            <asp:TextBox ID="apellido21" ReadOnly="true" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                        </div>                      
                        
                        <div class="col-md-6 datos_personales3 padd">
                            <p class="col-md-6 texto_delegado2">Email: </p>                                 
                            
                        </div> 

                        <div class="col-md-6 datos_personales4 padd">
                            <p class="col-md-6 texto_delegado2">Password: </p>                                 
                            <asp:TextBox ID="texto_pass" runat="server" CssClass="col-md-6 input_pass input_data_delegado "></asp:TextBox>
                        </div> 
                        <div class="col-md-6 datos_personales3 padd">
                            <p class="col-md-6 texto_delegado2">NºTelefono: </p>                                 
                            
                        </div> 
                        <div class="col-md-6 datos_personales4 padd">
                            <p class="col-md-6 texto_delegado2">Región: </p>                                 
                            
                        </div>  
                        -->
                    </fieldset>
                    <fieldset>
                        <legend>Siglas</legend>
                        <div class="col-md-6 padd">
                            <p class="col-md-6 texto_delegado1 padd">Delegado:</p>
                            <asp:TextBox ID="texto_gerente" CssClass="col-md-6 padd input_siglas_gerente" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6 padd">
                            <p class="col-md-6 texto_delegado1 padd">Gerente:</p>
                            <asp:TextBox ID="texto_delegado" CssClass="col-md-6 padd input_siglas_delegado" runat="server"></asp:TextBox>
                        </div>
                    </fieldset>
                </div>                        
            </div>                    
            <div id="cuadro_delegado1" class="row eleccion_delegado1">
                <div class="row padd">
                    <fieldset>
                        <legend class="asiste_legend">¿Asiste?</legend>
                        <div class="custom-control custom-radio custom-control-inline padd mis_radios">
                            <input type="radio" class="custom-control-input input_asiste" id="radio_asiste_si" name="example" onclick="radio_asiste()" value="customEx" />
                        <label class="custom-control-label label_asiste" for="asisteRadioSi">Si.</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline padd mis_radios1">
                            <input type="radio" class="custom-control-input input_asiste" id="radio_asiste_no" name="example" onclick="radio_asiste()" value="customEx" checked />
                            <label class="custom-control-label label_asiste1" for="asisteRadioNo">No.</label>
                        </div> 
                    </fieldset>
                </div>
                <div id="cuadro_asiste" class="row padd">
                    <div class="col-md-6 padd preguntas_asiste">
                        <div class="col-md-4 texto_transporte padd">¿Necesitas Transporte?</div>
                        <div class="col-md-4 padd">
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" class="custom-control-input input_transporte" id="transporte_si" name="transporte" onclick="" value="trans_si" />
                                <label class="custom-control-label" for="customRadio">Sí.</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" class="custom-control-input input_transporte" id="customRadio2" name="transporte" value="transporte_no" checked />
                                <label class="custom-control-label" for="customRadio2">No.</label>
                            </div>
                        </div>
                        
                    </div>
                    <div class="col-md-6 padd preguntas_asiste">
                        <div class="col-md-4 texto_transporte padd">¿Necesitas Alojamiento?</div>
                        <div class="col-md-4 padd">
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="checkbox" class="form-check-input" id="chekbox_alojamiento_si" onclick="comprueba_checkbox2()" runat="server" />
                                <label class="custom-control-label" for="customRadio3">Sí.</label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="checkbox" class="form-check-input" id="chekbox_alojamiento_no" onclick="comprueba_checkbox2()"  runat="server" checked />
                                <label class="custom-control-label" for="customRadio4">No.</label>
                            </div>
                        </div>
                    </div>                        
                    <div class="row padd city" id="asiste_transporte">
                            Indique ciudad de Origen: <asp:TextBox ID="transporte" runat="server"></asp:TextBox>
                        </div>
                        
                    </div>
                </div>                        
            <div id="cuadro_delegado2" class="row eleccion_delegado1">
                <div class="row padd">
                    <label for="nombre" class="label_textos">Alergias: </label>
                    <asp:TextBox id="TextBox10" ReadOnly="false" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="row padd">
                    <label for="nombre" class="label_textos">Observaciones: </label>
                    <asp:TextBox id="TextBox1" ReadOnly="false" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <asp:Button ID="boton_enviar" CssClass="enviar" Text="Enviar" runat="server" />
            </div>     
            <div id="cuadro_medico" class="row eleccion_medico">
                <div class="row eleccion_medico1 padd">
                    <fieldset>
                        <legend>Datos 1</legend>      
                            <div class="col-md-4 prueba">
                                <p class="col-md-6 texto_medico">Nombre: </p>                                 
                                <asp:TextBox ID="Nombre_medico" runat="server" CssClass="col-md-6 input_data_medico"></asp:TextBox>
                            </div> 
                        <div class="col-md-4 prueba">
                               <p class="col-md-6 texto_medico">Apellido: </p>
                                <asp:TextBox ID="Ape1_medico" runat="server" CssClass="col-md-6 input_data_medico"></asp:TextBox>
                            </div> 
                        <div class="col-md-4">
                                <p class="col-md-6 texto_medico">2º Apellido: </p>
                                <asp:TextBox ID="Ape2_medico" runat="server" CssClass="col-md-6 input_data_medico"></asp:TextBox>
                            </div>                     
                    </fieldset>
                    <fieldset>
                        <legend>Datos 2</legend>      
                            <div class="col-md-4">
                                <p class="col-md-6 texto_medico">Email: </p>                                 
                                <asp:TextBox ID="email_medico" runat="server" CssClass="col-md-6 input_data_medico"></asp:TextBox>
                            </div> 
                        <div class="col-md-4">
                                <p class="col-md-6 texto_medico">Numero Telefono: </p> 
                                <asp:TextBox ID="phone_medico" runat="server" CssClass="col-md-6 input_data_medico"></asp:TextBox>
                            </div> 
                        <div class="col-md-4">
                                <p class="col-md-6 texto_medico">Region: </p>
                                <asp:TextBox ID="region_medico" runat="server" CssClass="col-md-6 input_data_medico"></asp:TextBox>
                            </div>                     
                    </fieldset>
                </div>
                <div class="row eleccion_medico1 padd">
                    Aquí irían los datos de la asistencia.
                </div>
                <div class="row eleccion_medico1 padd">
                    Aquí irían las Observaciones.
                </div>
            </div>
            </form>
            </div>
    </div>    
</body>
</html>
