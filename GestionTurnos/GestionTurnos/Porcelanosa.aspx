<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Porcelanosa.aspx.vb" Inherits="GestionTurnos.Porcelanosa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSS y distintas librerias -->

    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>

    <link href="https://fonts.googleapis.com/css?family=Merriweather|Nunito" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">



    <title>Formulario PORCELANOSA</title>
    <style>        
        .verde{border: 2px solid green;}
        .rojo{border:2px solid red;}
        .azul{border: 2px solid blue;}
        /* Pre-formateamos el BODY*/
        body{padding:0;margin:0;box-sizing:border-box;}
        .logo{border: 1px solid #8f8f8f;max-width: 610px; width: 100%; margin: auto; margin-top:1.5%;height: auto;box-shadow: 0px 0px 25px 1px rgba(0,0,0,0.75);}
        .logo img{height:250px;width: 100%;}

        /* Cuadro Principal */
        .principal{border-radius: 6px;background-color: #fff;color: #8f8f8f;font-size: 22px;border: 1px solid #8f8f8f;max-width: 610px; width: 100%; margin: auto; margin-top:1.5%;height: auto;font-family: 'Nunito', sans-serif;}
        #cont_princi{margin-bottom:5%;}

        #cabeceras_acti,#cabeceras_trasla{margin: 0;padding: 6px;background-color:#4B9DEA; color: #fff;font-family: 'Merriweather', serif;padding-left: 3%;}
        /*#cabeceras_acti:hover,#cabeceras_trasla:hover{background-color: #fff; color: #4B9DEA;}*/

        #traslado1,#traslado2,#traslado3,#Actividades1,#Actividades2,#Actividades3{display:none;}
        .cabecera1{margin-bottom: .6% !important;}

        .tabla{width: 94.8%;padding: 6px;margin-left: 3%;}
        .tabla tbody tr td,.tabla thead tr th{text-align: center;}
        .tabla thead tr th{text-decoration: underline;color: black; font-weight:bold;}
        .tabla .justificado{}
         /* Checkbox personalizado */
        #mycheckbox_traslados:after,#mycheckbox2_traslados:after,#mycheckbox3_traslados:after,#mycheckbox4_traslados:after,#Mycheckbox_Actividades:after,#Mycheckbox_Actividades2:after {line-height: 1.2em;content: '';display: block;width: 25px;height: 25px;border: 1px solid Black;margin-top: -8px;background-color: #8F8F8F;} /*background: #4B9DEA;*/
        #mycheckbox_traslados:checked:after,#mycheckbox2_traslados:checked:after,#mycheckbox3_traslados:checked:after,#mycheckbox4_traslados:checked:after,#Mycheckbox_Actividades:checked:after,#Mycheckbox_Actividades2:checked:after {content: '✔';text-align: center;color: #fff;background: #4B9DEA;}

        /* Personalizar los checkboxs deshabilitados. */
        .desabilitar_chk{background-color:#E3E9EC !important;color:#4B9DEA !important;}

        /* Tabla de chk */
        table tr th input[type="checkbox"]:after{line-height: 1.2em;content: '';display: block;width: 25px;height: 25px;border: 1px solid Black;margin-top: -8px;background-color: #8F8F8F;}
        table tr th input[type="checkbox"]:checked:after{content: '✔';text-align: center;color: #fff;background: #4B9DEA;}

        #comienzo_tabla td,#comienzo_tabla2 td{text-align:justify;font-size:18px;}


        /* Boton personalizado */
        #Button_enviar{background: #4B9DEA;color:#fff;width: 20%;border-radius:6px;height:30px;margin: 2.5% 0 2.5% 40%;font-size:20px;padding:2px;text-align:center;}
        #Button_enviar:hover{background: #fff;color:#4B9DEA;border:1px solid #4B9DEA;}


        /*Personalizando el Modal que mostramos a veces. */
        .modal-header{color: #fff;background: #4B9DEA;font-family: 'Merriweather', serif;font-size: 20px;}

        .text_benvingut{text-align:center;margin:5px;padding:10px;font-family: 'Merriweather', serif;font-size: 20px;}
        .text_benvingut span{text-decoration:underline; font-weight:bold;color: black;}
        .text_benvingut span .fa-home:before {font-size: 33px;}

        @media (max-width: 800px) {
          .toggle input + label {padding: .75rem .25rem; flex: 0 0 50%;display: flex; justify-content: center;align-items: center;}
        }

        #paso_datos,#paso_datos2{display:none;}
    </style>



    
    <script type="text/javascript">
        // Mostramos¦Ocultamos el div al hacer onclick
        function desplazar(x) {
            switch (x) {
                case 1:
                    if (document.getElementById("traslado1").style.display === 'none') {
                        document.getElementById("traslado1").style.display = 'block';
                    }
                    else {
                        document.getElementById("traslado1").style.display = 'none';
                    }
                    break;
                case 2:
                    if (document.getElementById("Actividades1").style.display === 'block') {
                        document.getElementById("Actividades1").style.display = 'none';
                    }
                    else {
                        document.getElementById("Actividades1").style.display = 'block';
                    }
                    break;

            }
        }

        //comprobamos checkboxes marcados y lo enviamos a la funcion de AJAX
        function comprobar_marcados() {

            var checkbos_activos;
            checkbos_activos = $('input[type=checkbox]:checked').map(function () {
                return $(this).attr('id'); //checkbox marcados.                
            }).get();

            long_checkbos_activos = checkbos_activos.length;
            var ultimo_valor = checkbos_activos.length - 1;
            
            if (long_checkbos_activos <= 0 || long_checkbos_activos == null) {
                LanzaAviso("No has marcado ningún checkbox.Por favor marque alguno!");
            }
            else {
                var chk = [], chk_final;
                chk_final = "";
                for (var i = 0; i < long_checkbos_activos; i++) {

                    chk[i] = checkbos_activos[i];
                    //alert(checkbos_activos[i]); //id de los checkbox activos 
                    if (i == ultimo_valor) {
                        chk_final += chk[i];
                    }
                    else {
                        chk_final += chk[i] + "¦";
                    }                                     
                }     
            }
            //Registre(chk_final);
        }

        function LanzaAviso(Text) {
                bootbox.alert({ title: "PORCELANOSA", message: Text });
        }


        function desactivar_todo() {

            LanzaAviso("Lo sentimos pero no puede acceder sin el credencial de Email. Intentelo de Nuevo gracias!");            
            document.getElementById("prueba_aspx").innerHTML = '<p style="padding: 10px; color: Red; margin: 5px;">Lo sentimos pero sin identificación no podemos mostrarle ningún tipo de información. <i class="fas fa-exclamation-triangle"></i></p>';   
            desactivar_principal();
        }

        function desactivar_principal() {
            document.getElementById("cont_princi").style.display = 'none';
        }


        function contar() {
            
            var total_checkbos;    
            total_checkbos = $('input[type=checkbox]').map(function() {
                return $(this).attr('id'); //todos los checbox del documento.
            }).get();
    

            long_totalCheckbox = total_checkbos.length; //Longitud de todos los checkboxs marcados/sin marcar.
          
            

            
            var checkbos_activos;
                checkbos_activos = $('input[type=checkbox]:checked').map(function () {
                    return $(this).attr('id'); //checkbox marcados.                
            }).get();

            Long_checkbos_activos = checkbos_activos.length;

            if (Long_checkbos_activos <= 0) {
                LanzaAviso("Lo sentimos pero no ha marcado ningún checkbox, necesita marcar alguno. Gracias!");
            }
            else {                
                var pasar = checkbos_activos.join('¦');
                var idusuario = document.getElementById("paso_datos").value;
                alert('Prueba2: ' + pasar);
                alert('Prueba3-IDUsuario: ' + idusuario);
            }
        }


        //Recordando origenes xD
        function orihuela(x) {
            var y = x.split("¦");
            var p = y.length;
            for (i = 0; i <= p - 1; i++) {                                
                document.getElementById("chk" + y[i]).checked = true;
            }
        }


        function mensaje_full() {
            LanzaAviso("Lo sentimos pero esta sesión a llenado todas sus plazas y por ello no puede seleccionarla. Gracias!");
        }

    </script>
</head>
<body>
    <script
    src="https://www.paypal.com/sdk/js?client-id=SB_CLIENT_ID">
  </script>
    <form id="form1" runat="server">
        <div class="container-fluid logo" onclick="LanzaAviso('Holaaaaa')">
            <img src="img/grupoporcelanosa.jpg" />
        </div>
        <div id="prueba_aspx" class="principal usuario" runat="server">
            Hola
        </div>
        <div id="cont_princi" class="row principal" runat="server">
            <div id="cabeceras_trasla" class="row cabecera1" onclick="desplazar(1)">
                Traslados <span style="float: right; margin-right: 5%;font-size: 25px;">↓</span>
            </div>
            <div id="traslado1" class="row">
                <table class="row table tabla">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Hora</th>
                            <th scope="col">Descripción</th>
                        </tr>
                    </thead>
                    <tbody id="comienzo_tabla" runat="server">
                        
                    </tbody>
                </table>
            </div>
            <div id="cabeceras_acti" class="row cabeceras" onclick="desplazar(2)">
                Actividades <span style="float: right; margin-right: 5%;font-size: 25px;">↓</span>
            </div>
            <div id="Actividades1" class="row">
                <table class="table tabla">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Hora</th>
                            <th scope="col">Descripción</th>
                        </tr>
                    </thead>
                    <tbody id="comienzo_tabla2" runat="server">                      
                    </tbody>
                </table>
            </div>
            <%--<asp:Button ID="Button_enviar" runat="server" Text="Enviar" />--%>
            <div id="Button_enviar" onclick="Registre()">Enviar</div>
        </div>
        <asp:TextBox ID="paso_datos" CssClass="container-fluid row verde" runat="server"></asp:TextBox>
        <asp:TextBox ID="paso_datos2" CssClass="container-fluid row verde" runat="server"></asp:TextBox>
        <%--<asp:TextBox ID="paso_datos3" CssClass="container-fluid row verde" runat="server"></asp:TextBox>
        <asp:TextBox ID="paso_datos4" CssClass="container-fluid row verde" runat="server"></asp:TextBox>--%>
    </form>
    <script type="text/javascript" src="Script/ComunicacioAJAX.js"></script> 
    <script>        
        function Registre() {
            var Dades, total_checkbos;    
            total_checkbos = $('input[type=checkbox]').map(function() {
                return $(this).attr('id'); //todos los checbox del documento.
            }).get();
    

            long_totalCheckbox = total_checkbos.length; //Longitud de todos los checkboxs marcados/sin marcar.
          
            

            
            var checkbos_activos;
                checkbos_activos = $('input[type=checkbox]:checked').map(function () {
                    return $(this).attr('id'); //checkbox marcados.                
            }).get();

            Long_checkbos_activos = checkbos_activos.length;

            if (Long_checkbos_activos <= 0) {
                LanzaAviso("Lo sentimos pero no ha marcado ningún checkbox, necesita marcar alguno. Gracias!");
            }
            else {                
                var pasar = checkbos_activos.join('¦');
                var idusuario = document.getElementById("paso_datos").value;
                //alert('Prueba2: ' + pasar);
                //alert('Prueba3-IDUsuario: ' + idusuario);

                Dades = document.getElementById("paso_datos").value + "¦" + pasar;
                setTimeout("InformacioAJAX(7,\"" + Dades.replace(/"/g, "'").replace(/\n/g, "\\n") + "\", 'Registre_Tornada', 'RecepcionAJAX.aspx')", 1000);
            }
            
            
            
        }

        function Registre_Tornada(Dades) {
            //alert(Dades);
            if (Dades.substr(0, 2) == "OK") {
                if (Dades.substr(2, 1) == "7") {
                    LanzaAviso("Hemos actualizado correctacmente sus preferencias en nuestra Base de Datos. Gracias!");
                }
                else if (Dades.substr(2, 1) == "8") {
                    LanzaAviso("Hemos ingresado su elección correctacmente en nuestra Base de Datos. Gracias!");
                }
            }
            else {
                if (Dades.substr(2, 1) == "7") {
                    LanzaAviso("Ha ocurrido un error actualizando sus datos en la Base de Datos. Vuelva a repetir el proceso por favor!");
                }
                if (Dades.substr(2, 1) == "8") {
                    LanzaAviso("Ha ocurrido un error actualizando sus datos en la Base de Datos. Vuelva a repetir el proceso por favor!");
                }
            }
        }
    </script>
</body>
</html>
