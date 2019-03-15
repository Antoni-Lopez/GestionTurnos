<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Index_Intranet.aspx.vb" Inherits="GestionTurnos.Test" %>

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
</head>
<body>
    <!-- Nuevo Diseño con #BootStrap -->
    <h3 class="titulo">Intranet de Gestión de Turnos</h3>
    <form id="form_acceso"  runat="server">
    <div class="container-fluid contenedor_princi_intranet">
        <div class="row cabecera">
            Identificación en el Sistema
        </div>
        <div class="row">
            <div class="col-xs-6 espacio_texto ">
                <p class="p_espacio_texto">Email</p>
            </div>
            <div class="col-xs-6 espacio_input">
                <input type="email" class="inputs" />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 espacio_texto">
                <p class="p_espacio_texto">Contraseña</p>
            </div>
            <div class="col-xs-6 espacio_input">
                <input type="password" class="inputs" />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 espacio_texto">
                <input type="checkbox" class="inputs_chek" /><p class="p_espacio_texto2">Recordar Email</p>
            </div>
        </div>
        <div class="row contenedor_boton">
            <input type="submit" class="boton_validar" value="ACEPTAR" />
        </div>
    </div>
    </form>
    <!--
    <h2 class="Titulo">Intranet de Gestión de Turnos</h2>
    <div class="cuadro_central">
       
            <legend class="titulo_formu">Identificación</legend>
            <div class="formu_acceso">
                <div class="estructura">
                    <label for="nombre_pass" class="usuario">
                        <p class="mail">Email :</p>
                        <p class="pass">Password :</p>
                    </label>
                    <input type="email" class="correo" name="email" placeholder="Introduzca su email: ejemplo@towerplane.com" required />
                    <input type="password" class="contrasenia" name="email" required />
                </div>
                <input type="checkbox" class="recordar" id="id-espada" name="recordar_email" value="1"><p class="chekbox">Recordar Email</p>
                <input type="submit" value="Enviar" class="enviar">

            </div>
        
    </div>
    -->
</body>
</html>
