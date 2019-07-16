<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="GestionTurnos.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Reunión Anual de ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA</title>
    <!-- CSS y distintas librerias -->
    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>

    <link rel="stylesheet" href="../Css/Segment.css" />

    <style type="text/css">

        /* banner cabecera */
        .img_banner{max-width:600px;display:block; margin-left:auto;margin-right:auto;box-shadow: 0px 0px 25px rgba(0, 0, 0, 1);margin-top:1.5%}
        .img_banner img{max-width:600px;width:102.7%;}

        /* confi de segment */
        .misegment{max-width:500px;width:100%;display:block; margin-left:auto;margin-right:auto;margin-top:2%;}

        /* cuadros ingles/español */
        #espanish{display:block; margin-left:auto;margin-right:auto;max-width:350px;width:100%;margin-top:2.5%;border:#333 solid 1px;}        
        #inglish{display:none; margin-left:auto;margin-right:auto;max-width:350px;width:100%;margin-top:2.5%;border:#333 solid 1px;}

        .cont_principal{display:block; margin-left:auto;margin-right:auto;max-width:350px;width:100%;margin-top:2.5%;border:#333 solid 1px;}
        
        .cabecera{text-align:justify;background-color:#202020; color:#fff;padding:10px;}

        .recuadro{margin-top:2%;}
        .cuadros{background-color:#EFEFEF;padding:15px;}

        .mi_input{height:28px !important;font-size:13px;margin-top:-2%;}

        .centrado {margin-left: 0;width: 100%;}
        label[for=texto]{    margin-top: 2%;}
        label[for=texto] span{color:red;font-weight:bold;margin-left:5%;}

        /* Boton envio de datos */
        .btn-Espa {background-color: #7C0027;border-color: #c6c6c6;color:#FFFFFF;display:block;margin-left:auto;margin-right:auto;}
        .btn-Espa:hover,.btn-Espa:focus,.btn-Espa:active,.btn-Espa.active {background-color:#FFFFFF;border-color: #202020;color:#7C0027;}
        .btn-Espa.disabled:hover,.btn-Espa.disabled:focus,.btn-Espa.disabled:active,.btn-Espa.disabled.active,.btn-Espa[disabled]:hover,.btn-Espa[disabled]:focus,.btn-Espa[disabled]:active,.btn-Espa[disabled].active,fieldset[disabled] .btn-Espa:hover,fieldset[disabled] .btn-Espa:focus,fieldset[disabled] .btn-Espa:active,fieldset[disabled] .btn-Espa.active {background-color: #EEEEEE;border-color: #e1e1e1;color:#FFFFFF;}


        .verde{border:1px solid green;}
        .azul{border:1px solid blue;}
        .amarillo{border:1px solid yellow;}
        .rojo{border:1px solid red;}
    </style>
    <script type="text/javascript">
        function addLoadEvent(func) {
            var oldonload = window.onload;
            if (typeof window.onload != 'function') {
                window.onload = func;
            }
            else {
                window.onload = function () {
                    oldonload();
                    func();
                }
            }
        }

        addLoadEvent(inicio);

        function inicio() {

            if ((document.getElementById("oculto").value == null) || (document.getElementById("oculto").value == "")) {
                document.getElementById("oculto").value = "es";
            }
        }

        function LanzaAviso(Text) {
            bootbox.alert({ title: "ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA", message: Text, size: 'large' });

        }
        function cambiar_idioma(x) {
            switch (x) {
                case 1:
                    //document.getElementById("espanish").style.display = "Block";
                    //document.getElementById("inglish").style.display = "none";
                    document.getElementById("oculto").value = "es";
                    document.getElementById("espanol").checked = true;
                    document.getElementById("identificacion").innerHTML = "IDENTIFICACIÓN";
                    document.getElementById("Vali").innerHTML = "Validación";
                    break;
                case 2:
                    //document.getElementById("inglish").style.display = "Block";
                    //document.getElementById("espanish").style.display = "none";
                    document.getElementById("english").checked = true;
                    document.getElementById("oculto").value = "en";
                    document.getElementById("identificacion").innerHTML = "IDENTIFICATION";
                    document.getElementById("Vali").innerHTML = "Validation";
                    
                    break;
            }
        }

        //Funcion para añadir animación al boton de guardado.
        function loading_gif(x) {
            switch (x) {
                case 1:
                    identificacion.innerHTML = "";
                    var texto = "Comprobando los datos! <img src='img/ajax-loader.gif' alt='loading' />";
                    $('#identificacion').html(texto);
                    break;
                case 2:
                    identification.innerHTML = "";
                    var texto = "Cheking your data! <img src='img/ajax-loader.gif' alt='loading' />";
                    $('#identification').html(texto);
                    break;
            }
            
        }

        //funcion para mostrar el password a los usuarios que ya esten registrados.
        function showPass(x) {
            switch (x) {
                case 1:
                    LanzaAviso("<p>Hemos detectado que ya estas registrado en nuestra BD.<br/>Por ello, por favor introduzca la contraseña que le enviemos al email. Gracias!</p>");
                    cambiar_idioma(1);
                    break;
                case 2:
                    LanzaAviso("<p>We have detected that you are already registered in our DataBase.<br/>So, please enter the password that we send to your email. Thank you!</p>");
                    cambiar_idioma(2);
                    break;
            }
            
            document.getElementById("mostrar_pass").style.display = "block";
            document.getElementById("show_password").style.display = "block";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid img_banner" onclick="inicio()">
            <img src="img/banner.jpg" />
        </div>
        <div class="row misegment">
            <div class="segmented-control sc-fade">
                <div class="segmented-control-btn">
                  <input type="radio" id="espanol" name="frameworkJs" value="react" checked="checked" onclick="cambiar_idioma(1)"/>
                  <label for="espanol">Español</label>
                </div>
                <div class="segmented-control-btn">
                  <input type="radio" id="english" name="frameworkJs" value="angular" onclick="cambiar_idioma(2)"/>
                  <label for="english">English</label>
                </div>
            </div>
        </div>
        <div class="cont_principal">
            <div id="Vali" class="row centrado cabecera">
                Validación
            </div>
            <div class="row centrado recuadro">
                <div class="col-xs-6 cuadros" style="margin-left:1px;width:49%;">
                    <label for="texto">Email<span>*</span></label>
                </div>
                <div class="col-xs-6 cuadros" style="width:50.6%;padding-bottom: 6%;">
                    <input type="text" class="form-control mi_input" id="Input_Email" runat="server"  />
                </div>                
            </div>
            <div id="mostrar_pass" class="row centrado recuadro" style="margin-top:-1%;display:none;">
                <div class="col-xs-6 cuadros" style="margin-left:1px;width:49%;padding-bottom:4.5%;">
                    <label for="texto">Password<span>*</span></label>
                </div>
                <div class="col-xs-6 cuadros" style="width:50.6%;">
                    <input type="text" class="form-control mi_input" id="Input_Password" placeholder="Introduzca su Contraseña." runat="server"  />
                </div>                
            </div>
            <div class="row centrado cuadros" style="margin-left:1px;width:99.5%;">
                    <button id="identificacion" type="submit" class="btn-Espa" onclick="loading_gif(1)" runat="server">IDENTIFICACIÓN</button>
            </div>
        </div>
<%--        <div id="espanish">
            <div class="row centrado cabecera">
                Validación
            </div>
            <div class="row centrado recuadro">
                <div class="col-xs-6 cuadros" style="margin-left:1px;width:49%;">
                    <label for="texto">Email<span>*</span></label>
                </div>
                <div class="col-xs-6 cuadros" style="width:50.6%;">
                    <input type="text" class="form-control mi_input" id="Input_Email" placeholder="Introduzca su Email." runat="server"  />
                </div>                
            </div>
            <div id="mostrar_pass" class="row centrado recuadro" style="margin-top:-1%;display:none;">
                <div class="col-xs-6 cuadros" style="margin-left:1px;width:49%;padding-bottom:4.5%;">
                    <label for="texto">Password<span>*</span></label>
                </div>
                <div class="col-xs-6 cuadros" style="width:50.6%;">
                    <input type="text" class="form-control mi_input" id="Input_Password" placeholder="Introduzca su Contraseña." runat="server"  />
                </div>                
            </div>
            <div class="row centrado cuadros" style="margin-left:1px;width:99.5%;">
                    <button id="identificacion" type="submit" class="btn-Espa" onclick="loading_gif(1)" runat="server">IDENTIFICACIÓN</button>
            </div>
        </div>
        <div id="inglish">
            <div class="row centrado cabecera">
                Validation
            </div>
            <div class="row centrado recuadro">
                <div class="col-xs-6 cuadros" style="margin-left:1px;width:49%;">
                    <label for="texto">Email<span>*</span></label>
                </div>
                <div class="col-xs-6 cuadros" style="width:50.6%;">
                    <input type="text" class="form-control mi_input" id="Text1" placeholder="Enter your Email." runat="server"  />
                </div>                
            </div>
            <div id="show_password" class="row centrado recuadro" style="margin-top:-1%;display:none;">
                <div class="col-xs-6 cuadros" style="margin-left:1px;width:49%;padding-bottom:4.5%;">
                    <label for="texto">Password<span>*</span></label>
                </div>
                <div class="col-xs-6 cuadros" style="width:50.6%;">
                    <input type="text" class="form-control mi_input" id="Text2" placeholder="Your Password." runat="server"  />
                </div>                
            </div>
            <div class="row centrado cuadros" style="margin-left:1px;width:99.5%;">
                    <button id="identification" type="submit" class="btn-Espa" onclick="loading_gif(2)" runat="server">IDENTIFICATION</button>
            </div>
        </div>--%>
        <div class="row centrado">
            <input type="text" class="form-control mi_input" style="display:none;"  id="oculto" runat="server"  />
        </div>
    </form>    
</body>
</html>
