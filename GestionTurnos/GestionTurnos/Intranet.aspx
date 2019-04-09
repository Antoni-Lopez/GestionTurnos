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
                if (defaultCheck1.Checked)
                {
                    Properties.Settings.Default.userName = textBoxUserName.Text;
                    Properties.Settings.Default.passUser = textBoxUserPass.Text;
                    Properties.Settings.Default.Save();
                }
                if (Properties.Settings.Default.userName != string.Empty)
                {
                   textBoxUserName.Text = Properties.Settings.Default.userName;
                   textBoxUserPass.Text = Properties.Settings.Default.passUser;
                }
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



<!--
                <div class="row padd">
                    <fieldset>
                        <legend class="asiste_legend">¿Asiste?</legend>
                        <div class="custom-control custom-radio custom-control-inline padd mis_radios">
                            
                        <label class="custom-control-label label_asiste" for="asisteRadioSi">Si.</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline padd mis_radios1">
                            
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
                            Indique ciudad de Origen:
                        </div>
                        
                    </div>
-->