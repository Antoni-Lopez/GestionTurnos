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
        addLoadEvent(chorra); 

        function chorra() {
            alert("funcionamos o no???");
            var compruebacheckbox1 = document.getElementById("chekbox_delegado");
            var compruebacheckbox2 = document.getElementById("chekbox_medico");

            if (compruebacheckbox1.checked == true && compruebacheckbox2.checked == false) {
                
                compruebacheckbox2.cheked = null;
                document.getElementById('boton_enviar').style.opacity = '1';
                $('#boton_enviar').show(3000);     
                alert("entra en el if :)");
                

            }
        }
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

        function comprueba_checkbox() {
            var check1 = document.getElementById("chekbox_delegado");
            var check2 = document.getElementById("chekbox_medico");
            check1.onclick = function () {
                if (check1.checked == true) {
                    check2.checked = null;
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
                    check1.checked = null;
                    check2.checked = true;
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
                    /*
                    check2.checked = true;
                    document.getElementById('cuadro_delegado').style.opacity = '0';
                    $('#cuadro_delegado').hide("slow");
                    document.getElementById('cuadro_delegado1').style.opacity = '0';
                    $('#cuadro_delegado').hide("slow");
                    document.getElementById('cuadro_delegado2').style.opacity = '0';
                    $('#cuadro_delegado').hide("slow");
                    document.getElementById('boton_enviar').style.opacity = '0';
                    $('#boton_enviar').hide("slow"); 
                    document.getElementById('cuadro_medico').style.opacity = '1';
                    $('#cuadro_medico').show(3000);
                    */
                }
            }
            check2.onclick = function () {
                if (check2.checked == true) {
                    check1.checked = null;
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
                    check2.checked = null;
                    check1.checked = true;
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
                    /*
                    document.getElementById('cuadro_medico').style.opacity = '0';
                    $('#cuadro_medico').hide("slow");
                    */
                }
            }
        }
   
    </script>
</head>
<body>

    <div class="container-fluid main_cuadro ">
        <form id="form1" runat="server">
            <div class="row eleccion">
                <div class="col-md-6 datos_delegado">
                    <input type="checkbox" class="form-check-input" id="chekbox_delegado"  onclick="comprueba_checkbox()" runat="server" checked="checked"/>Mís Datos.
                </div>
                <div class="col-md-6 datos_medico">
                    <input type="checkbox" class="form-check-input" id="chekbox_medico" onclick="comprueba_checkbox()" runat="server" />Medicos.
                </div>
            </div>
            <div id="cuadro_delegado" class="row eleccion_delegado">
                <div class="row eleccion_delegado1 padd">
                    <fieldset>
                        <legend>Datos Personales</legend>      
                            <div class="col-md-4 prueba padd">
                                <p class="col-md-6 texto_delegado">Nombre: </p>                                 
                                <asp:TextBox id="texto_nombre" ReadOnly="true" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div> 
                        <div class="col-md-4 prueba padd">
                               <p class="col-md-6 texto_delegado">Apellido: </p>
                                <asp:TextBox ID="apellido1" ReadOnly="true" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div> 
                        <div class="col-md-4 prueba padd">
                                <p class="col-md-6 texto_delegado">2º Apellido: </p>
                                <asp:TextBox ID="apellido2" ReadOnly="true" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div>                     
                    </fieldset>
                    <fieldset>
                        <legend>Datos Personales 2</legend>      
                            <div class="col-md-4 prueba padd">
                                <p class="col-md-6 texto_delegado">Email: </p>                                 
                                <asp:TextBox ID="texto_email" runat="server" CssClass="col-md-6 input_email input_data_delegado "></asp:TextBox>
                            </div> 
                        <div class="col-md-4 prueba padd">
                               <p class="col-md-6 texto_delegado">NºTelefono: </p>
                                <asp:TextBox ID="texto_phone" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div> 
                        <div class="col-md-4 prueba padd">
                                <p class="col-md-6 texto_delegado">Región: </p>
                                <asp:TextBox ID="texto_region" runat="server" CssClass="col-md-6 input_data_delegado"></asp:TextBox>
                            </div>                     
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
                <div class="row">
                    <div class="col-md-4 padd">
                        <p class="preguntas">¿Asiste? </p>
                    </div>
                    <div class="col-md-4 paddi">
                        <input type="checkbox" class="form-check-input" id="Checkbox_asiste_si"  onclick="comprueba_checkbox2()" runat="server" />Sí.
                    </div>
                    <div class="col-md-4 paddi">
                        <input type="checkbox" class="form-check-input" id="Checkbox_asiste_no"  onclick="comprueba_checkbox2()" runat="server" checked="checked" />No.
                    </div>
                </div>
                <div id="cuadro_asiste" class="row padd">
                    <label for="transporte" class="transporte_si padd verde">¿Necesita transporte?</label>
                    <input type="checkbox" class="form-check-input" id="CheckboxSI"  onclick="" runat="server" />Si.
                    <input type="checkbox" class="form-check-input" id="CheckboxNO"  onclick="" runat="server" checked="checked" />No.
                    <div class="row padd rojo" id="asiste_transporte">
                        Indique ciudad de Origen: <asp:TextBox ID="transporte" runat="server"></asp:TextBox>
                    </div>
                    <label for="alojamiento" class="alojamiento_si padd verde">¿Necesita alojamiento?</label>
                    <input type="checkbox" class="form-check-input" id="CheckboxSI1"  onclick="" runat="server" />Si.
                    <input type="checkbox" class="form-check-input" id="CheckboxNO2"  onclick="" runat="server" checked="checked" />No.
                </div>
                

            </div>
            <div id="cuadro_delegado2" class="row eleccion_delegado1">
                <div class="row padd">
                    <label for="nombre" class="label_textos">Observaciones: </label>
                    <asp:TextBox id="TextBox1" ReadOnly="false" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <p id="meua_prueba" runat="server" onclick="comprobacion_checkboxs()"></p>
            </div>
            <div class="row">
                <asp:Button ID="boton_enviar" CssClass="enviar" Text="Enviar" runat="server" />
            </div>
            <div id="cuadro_medico" class="row eleccion_medico rosa">
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
</body>
</html>
