<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Intranet.aspx.vb" Inherits="GestionTurnos.Intranet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <!-- CSS y distintas librerias -->

    <asp:literal id="bootstrap_min_css" runat="server"></asp:literal>
    <asp:literal id="jquery_1_9_1_min_js" runat="server"></asp:literal>
    <asp:literal id="bootstrap_min_js" runat="server"></asp:literal>
    <asp:literal id="bootbox_min_js" runat="server"></asp:literal>


    <link href="Css/css_querys.css" rel="stylesheet" type="text/css" /> <!-- Css para las Media Querys -->    
    <link href="Css/intranet.css" rel="stylesheet" type="text/css" /> <!-- Css mio -->

    <title>Acceso a Intranet de Gestion de Turnos.</title>
    <script type="text/javascript">
        function cuandoCargue() {

            //Aquí deberiamos de recibir a traves de la URL la información necesaria a mostrar.
            //Este tipo de información sería tal que: "Logo Compañia", "Direccion", "Telefono", etc.
            //Ahora lo dejo añadido por JavaScript para poder visualizar el efecto deseado.
            var container = document.getElementById('introducir_texto');
            var mensaje = "Cristo de la Epidemia, 52, Málaga";

            //ahora metemos la img en el div
            document.getElementById('logo_img').src = "img/PEINARTE-LOG0.png";
            container.innerHTML = mensaje;
        }
        function LanzaAviso(Text) {
            bootbox.alert({ title: "Gestión de turnos", message: Text });
        }
        function enviar(url) {
            window.open(url);
        }
        function validar() {
            /*
            var user = document.getElementById('Email_input').value;
            var pass = document.getElementById('password_input').value;
            
            if (user == "" || pass == "") {
            */
            LanzaAviso("Los campos usuario y contraseña no pueden estar vacios.");
            /*
            }
            else {
                LanzaAviso("Valor de valores. " + user + " valor de user, y valor de pass " + pass);
                enviar('http://localhost:55703/servicios.aspx');
            }
            */
        }
    </script>
</head>
<body onload="cuandoCargue()">
    <!-- Nuevo Diseño con #BootStrap -->
    <h3 class="titulo">Intranet de Gestión de Turnos</h3>
    <form id="form_acceso" runat="server">
        <div class="container-fluid contenedor_princi_intranet">
            <div class="row cabecera">
                <div class="col-md-6 banner" id="poner_img">
                    <img id="logo_img" onclick="enviar('http://localhost:55703/servicios.aspx')" />
                </div>                
                <div id="introducir_texto" class="col-md-6 banner">                    
                </div>
            </div>
            <div class="intranet_tabla"> 
                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label texto_inputs">Email</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control form-control-lg" id="Email_input" value="email@towerplane.com">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label texto_inputs">Contraseña</label>
                    <div class="col-sm-10">
                      <input type="password" id="password_input" class="form-control form-control-lg texto_inputs" />
                    </div>
                </div>
                <div class="raw div_checkbox">
                    <input class="form-check-input mi_checkbox" type="checkbox" value="" id="defaultCheck1" />
                        <label class="form-check-label" for="defaultCheck1">
                            Recordar Contraseña
                        </label>
                </div>
                <div class="row contenedor_boton">
                    <button type="submit"  class="boton_validar" onclick="enviar('http://localhost:55703/servicios.aspx')">ACEPTAR</button>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
