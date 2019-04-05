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
                if (check1.checked != false) {
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
                    document.getElementById('cuadro_delegado').style.opacity = '0';
                    $('#cuadro_delegado').hide("slow");
                    document.getElementById('cuadro_delegado1').style.opacity = '0';
                    $('#cuadro_delegado').hide("slow");
                    document.getElementById('cuadro_delegado2').style.opacity = '0';
                    $('#cuadro_delegado').hide("slow");
                }
            }
            check2.onclick = function () {
                if (check2.checked != false) {
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
                     document.getElementById('cuadro_medico').style.opacity = '0';
                    $('#cuadro_medico').hide("slow");
                }
            }
        }

        /*
         //Comprobamos si el panel de sms, está visible.
                    if (document.getElementById('tabla_normal').style.opacity == "0.2") {

                        //Como sí lo está, ocultamos el contenedor de solicitar turno sin sms,
                        //ocultamos el contenedor de turno sin sms desactivandolo
                        //y le damos al contenedor de sms un tamaño del 100 %
                        activar_onclicks();
                        document.getElementById('cuadro1').style.display = 'none';
                        document.getElementById('cuadro2').style.width = '100%';
                        document.getElementById('tabla_normal').style.opacity = '1';                        
                    }
        */
   
    </script>
</head>
<body>

    <div class="container-fluid main_cuadro ">
        <form id="form1" runat="server">
            <div class="row eleccion">
                <div class="col-md-6 datos_delegado">
                    <input type="checkbox" class="form-check-input" id="chekbox_delegado"  onclick="comprueba_checkbox()" runat="server" />Mís Datos.
                </div>
                <div class="col-md-6 datos_medico">
                    <input type="checkbox" class="form-check-input" id="chekbox_medico" onclick="comprueba_checkbox()" runat="server" />Medicos.
                </div>
            </div>
            <div id="cuadro_delegado" class="row eleccion_delegado">
                <div class="row">
                    <label for="nombre" class="label_textos">Nombre: </label>
                    <asp:TextBox id="texto_nombre" ReadOnly="true" runat="server" CssClass="mis_inputs"></asp:TextBox>
                    <label for="apellidos" class="label_textos">Apellidos: </label>
                    <asp:TextBox ID="texto_apellidos" runat="server" CssClass="mis_inputs input_apellidos"></asp:TextBox>
                </div>
                <div class="row">
                    <label for="Email" class="label_textos">Email: </label>
                    <asp:TextBox ID="texto_email" CssClass="mail" ReadOnly="true" runat="server"></asp:TextBox>
                    <label for="phone" class="label_textos">Telefono: </label>
                    <asp:TextBox ID="texto_phone" CssClass="mis_inputs phone" runat="server"></asp:TextBox>
                </div>
                <div class="row">
                    <div class="col-md-4 padd">
                        <label for="region" class="label_textos region">Región: </label>
                        <asp:TextBox ID="texto_region" CssClass="mis_inputs reggion" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4 padd">
                        <label for="siglas_gerente" class="label_textos siglas_gere">Siglas Gerente: </label>
                        <asp:TextBox ID="texto_gerente" CssClass="mis_inputs input_siglas_gerente" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4 padd">
                        <label for="siglas_delegado" class="label_textos siglas_dele">Siglas Delegado: </label>
                        <asp:TextBox ID="texto_delegado" CssClass="mis_inputs input_siglas_delegado" runat="server"></asp:TextBox>
                    </div>                                  
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
                Aquí irían los datos de los medicos.
            </div>
        </form>
    </div>    
</body>
</html>
