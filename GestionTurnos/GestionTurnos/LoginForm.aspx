<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="LoginForm.aspx.vb" Inherits="GestionTurnos.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- CSS y distintas librerias -->

    <asp:literal id="bootstrap_min_css" runat="server"></asp:literal>
    <asp:literal id="jquery_1_9_1_min_js" runat="server"></asp:literal>
    <asp:literal id="bootstrap_min_js" runat="server"></asp:literal>
    <asp:literal id="bootbox_min_js" runat="server"></asp:literal>

    <link href="Css/loginForm.css" rel="stylesheet" type="text/css" /> <!-- Css mio -->
    <title>Login para acceder a Form</title>
     <script type="text/javascript">
         function ComprobarEmail(Email) {
            //Comprobamos que el Email introducido por el usuario tenga el formato correcto. Ej: prueba@prueba.com
            return (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(Email))
         }

        function CompruebaPass(Password) {
            pass = document.getElementById("Password").value;
            //Comprobamos que el password introducido por el usuario no este vacio.
            if (pass.length == 0) {
                LanzaAviso("El campo contraseña no puede estar vacio!");
                return false;
            }
            else
            {
                var espacios = false;
                var cont = 0;
 
                while (!espacios && (cont < pass.length)) {
                    if (pass.charAt(cont) == " ")
                        espacios = true;
                        cont++;
                }
                //Comprobamos que el password introducido por el usuario no tenga espacios en blanco.
                if (espacios) {
                    LanzaAviso("La contraseña no puede contener espacios en blanco");
                    return false;
                }
                else {
                    return true;
                }
            }            
        } 
        function LanzaAviso(Text) {
            bootbox.alert({ title: "Gestión de turnos", message: Text });
        }
        function enviar(url) {
            window.open(url);
         }
        //Funcion que hace la comprobación del Email y Password introducidos por el usuario, si hay algún error, nos lo indica a traves de LanzarAviso().
        function Comprueba() {
            if (!ComprobarEmail(document.getElementById('Email1').value)) {
                LanzaAviso("Por favor, comprueba el email.");
                if (Check1.Checked) {
                    Properties.Settings.Default.userName = Email1.Text;
                    Properties.Settings.Default.passUser = Password.Text;
                    Properties.Settings.Default.Save();
                }
                if (Properties.Settings.Default.userName != string.Empty) {
                    Email1.Text = Properties.Settings.Default.userName;
                    Password.Text = Properties.Settings.Default.passUser;
                }
                return false
            }
            else {
                if (!CompruebaPass(document.getElementById("Password").value)) {
                   return false;
                }
                else {
                    if (Check1.Checked) {
                        Properties.Settings.Default.userName = Email1.Text;
                        Properties.Settings.Default.passUser = Password.Text;
                        Properties.Settings.Default.Save();
                    }
                    if (Properties.Settings.Default.userName != string.Empty) {
                        Email1.Text = Properties.Settings.Default.userName;
                        Password.Text = Properties.Settings.Default.passUser;
                    }
                    return true;
                }
            }
        }

    </script>
</head>
<body>
    <div class="container-fluid main_cuadro">
        <div class="row header_maincuadro">
            <h3 class="row text_header">
                Identificación para el Formulario:
            </h3>
        </div>
        <form id="form1" runat="server">
            <div class="form-group">
                <label for="exampleInputEmail1" class="label_email">Dirección de Email </label>
                <asp:TextBox ID="Email1" runat="server" CssClass="form-control input_mail" onclick="this.value=''; "></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1" class="label_pass">Contraseña</label>
                <asp:TextBox ID="Password" runat="server" CssClass="form-control input_pass" TextMode="Password"  onclick="this.value=''; "></asp:TextBox>
            </div>
            <div class="form-check">
                <input type="checkbox" class="form-check-input input_checkbox" id="Check1" />
                <label class="form-check-label" for="exampleCheck1" onclick="CompruebaPass()">Recordar Contraseña</label>
            </div>
            <asp:Button ID="validar" runat="server" class="btn btn-primary enviar" Text="Valídar" />
        </form>
    </div>
</body>
</html>
