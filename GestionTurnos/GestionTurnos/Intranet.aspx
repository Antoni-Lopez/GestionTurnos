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
    <script runat="server">
    </script>
    <script type="text/javascript">
        function ComprobarEmail(Email){
                return (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(Email))
        }
        function LanzaAviso(Text) {
            bootbox.alert({ title: "Gestión de turnos", message: Text });
        }
        function enviar(url) {
            window.open(url);
        }
        function Comprueba() {
            if (!ComprobarEmail(document.getElementById('txtUsuario').value)){
                LanzaAviso("Por favor, comprueba el email.");
                return false
            }
        }

    </script>
</head>
<body >
    <!-- Nuevo Diseño con #BootStrap -->
    <h3 class="titulo">Gestión de Turnos</h3>
    <form id="form_acceso" runat="server">
        <div class="container-fluid contenedor_princi_intranet">
            <div class="row cabecera">
                <div class="col-md-6 banner" id="poner_img" >
                    <asp:Literal ID="logo_img" runat="server"></asp:Literal>
                </div>
                <div id='introducirtexto' class='col-md-6 banner' runat="server">

                </div>
                </div>
            <div class="intranet_tabla"> 
                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label texto_inputs">Email</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtUsuario" runat="server" class="form-control form-control-lg" value="hola@hola.com"></asp:TextBox> 
                    </div>
                </div>
                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label texto_inputs">Contraseña</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="TextPass" class="form-control form-control-lg texto_inputs" TextMode="Password" runat="server" Text="1234"></asp:TextBox> 
                    </div>
                </div>
                <div class="raw div_checkbox">
                    <input class="form-check-input mi_checkbox" type="checkbox" value="" id="defaultCheck1" />
                        <label class="form-check-label" for="defaultCheck1">
                            Recordar Contraseña
                        </label>
                </div>
                <div class="row contenedor_boton">
                    <asp:Button ID="Button1" runat="server" class="boton_validar" Text="ACEPTAR" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
