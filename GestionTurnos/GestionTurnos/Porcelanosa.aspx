<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Porcelanosa.aspx.vb" Inherits="GestionTurnos.Porcelanosa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

         /* Checkbox personalizado */
        #mycheckbox_traslados:after,#mycheckbox2_traslados:after,#mycheckbox3_traslados:after,#mycheckbox4_traslados:after,#Mycheckbox_Actividades:after,#Mycheckbox_Actividades2:after {line-height: 1.2em;content: '';display: block;width: 25px;height: 25px;border: 1px solid Black;margin-top: -8px;background-color: #8F8F8F;} /*background: #4B9DEA;*/
        #mycheckbox_traslados:checked:after,#mycheckbox2_traslados:checked:after,#mycheckbox3_traslados:checked:after,#mycheckbox4_traslados:checked:after,#Mycheckbox_Actividades:checked:after,#Mycheckbox_Actividades2:checked:after {content: '✔';text-align: center;color: #fff;background: #4B9DEA;}

        table tr th input[type="checkbox"]:after{line-height: 1.2em;content: '';display: block;width: 25px;height: 25px;border: 1px solid Black;margin-top: -8px;background-color: #8F8F8F;}
        table tr th input[type="checkbox"]:checked:after{content: '✔';text-align: center;color: #fff;background: #4B9DEA;}

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

    </style>
    <script type="text/javascript">
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
        function comprobar_marcados() {
            var check = document.getElementById("mycheckbox_traslados").checked;
            var check2 = document.getElementById("mycheckbox2_traslados").checked;
            var check3 = document.getElementById("mycheckbox3_traslados").checked;
            var check4 = document.getElementById("mycheckbox4_traslados").checked;
            var check5 = document.getElementById("Mycheckbox_Actividades").checked;
            var check6 = document.getElementById("Mycheckbox_Actividades2").checked;
            divCont = document.getElementById('cont_princi');

            if ((check == false) && (check2 == false) && (check3 == false) && (check4 == false) && (check5 == false) && (check6 == false)) {
                LanzaAviso("Lo sentimos pero necesita marcar al menos 1 checkbox. Gracias!");
            }
            else {                 
                checks  = divCont.getElementsByTagName('input');
                for(i=0;i<checks.length; i++){
                    if(checks[i].checked == true){
                        alert('este es');
                    }
                }
            }
        }
        function LanzaAviso(Text) {
                bootbox.alert({ title: "PORCELANOSA", message: Text });
        }
        function desactivar_todo() {
            LanzaAviso("Lo sentimos pero no puede acceder sin el credencial de Email. Intentelo de Nuevo gracias!");
            document.getElementById("cont_princi").style.display = 'none';
            document.getElementById("prueba_aspx").innerHTML = '<p style="padding: 10px; color: Red; margin: 5px;">Lo sentimos pero sin identificación no podemos mostrarle ningún tipo de información. <i class="fas fa-exclamation-triangle"></i></p>';           
        }

        function contar() {
            
            var total_checkbos;
    
            total_checkbos = $('input[type=checkbox]').map(function() {
                return $(this).attr('id'); //todos los checbox del documento.
            }).get();
    
            alert('TODOS CHECKBOXS: ' + total_checkbos.join('¦'));

            long_totalCheckbox = total_checkbos.length; //Longitud de todos los checkboxs marcados/sin marcar.
            alert("esto es prueba= " + long_totalCheckbox); 

            var checkbos_activos;
            checkbos_activos = $('input[type=checkbox]:checked').map(function () {
                return $(this).attr('id'); //checkbox marcados.                
            }).get();

            long_checkbos_activos = checkbos_activos.length;

            alert('Prueba2: ' + checkbos_activos.join('¦'));
            alert('Prueba3-Total activos: ' + long_checkbos_activos);

            for (var i = 0; i < long_checkbos_activos; i++) {
                alert(checkbos_activos[i]); //id de los checkbox activos
            }
            
            

            Long_checkbos_activos = checkbos_activos.length;
            if (Long_checkbos_activos <= 0) {
                LanzaAviso("Lo sentimos pero no ha marcado ningún checkbox, necesita marcar alguno. Gracias!");
            }
            else {
                //for (var i = 0; i < long_checkbos_activos; i++) {
                //    alert(checkbos_activos[i]);
                //}
            }
        }

        function orihuela(x) {
            //var x = "2¦3¦5¦6";
            var y = x.split("¦");
            //alert("entramossss");

            var p = y.length;

            for (i = 0; i <= p - 1; i++) {
                
                alert(y[i]);                
                document.getElementById("chk" + y[i]).checked = true;
            }         
        }
        function segunda_prueba() {
            var x = 2, i = 3, p = 5, z = 6;
            document.getElementById("chk"+x).checked = true;
            document.getElementById("chk"+i).checked = true;
            document.getElementById("chk"+p).checked = true;
            document.getElementById("chk"+z).checked = true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid logo" onclick="orihuela()">
            <img src="img/Porcelanosa_Logo.gif" />
        </div>
        <div id="prueba_aspx" class="principal usuario" runat="server">
            Hola
        </div>
        <div id="cont_princi" class="row principal">
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
            <div id="Button_enviar" onclick="comprobar_marcados()">Enviar</div>
        </div>
        <asp:TextBox ID="paso_datos" CssClass="container-fluid row verde" runat="server"></asp:TextBox>
        <asp:TextBox ID="paso_datos2" CssClass="container-fluid row verde" runat="server"></asp:TextBox>
        <asp:TextBox ID="paso_datos3" CssClass="container-fluid row verde" runat="server"></asp:TextBox>
        <asp:TextBox ID="paso_datos4" CssClass="container-fluid row verde" runat="server"></asp:TextBox>
    </form>
    <script>

        function Registre() {
            var Dades;
            var check = document.getElementById("paso_datos").value;
            var check2 = document.getElementById("paso_datos2").value;

                    var numero, numero_insert, Long_numero, Primer_numero;
                    numero = document.getElementById("numero_delegado").value.trim();
                    Long_numero = numero.length;
                    Primer_numero = numero.substr(0, 1);

                    document.getElementById("paso_datos").value = 1;

                    if (Long_numero <= 0) {
                        LanzaAviso("El número es un campo obligatorio y por tanto no puede estar vacio. Introduzca un número por favor.");
                        return false;
                    }
                    else {
                        if (Primer_numero == '6' || Primer_numero == '7') {
                            numero_insert = numero;
                        }
                        else {
                            LanzaAviso("El número debe de comenzar por 6 o 7, Cualquier otro número es invalido. Introduzca de nuevo el número de Telefono. Gracias!");
                            return false;
                        }
                    }

                    var siglas_delegat, Long_siglas_delegat, siglas_gerente_delegat, Long_siglas_gerente_delegat;

                    siglas_delegat = document.getElementById("siglas_delegado").value.trim();
                    Long_siglas_delegat = siglas_delegat.length;
                    siglas_gerente_delegat = document.getElementById("siglas_gerente_delegado").value.trim();
                    Long_siglas_gerente_delegat = siglas_gerente_delegat.length;



                    if (Long_siglas_delegat <= 0 || Long_siglas_gerente_delegat <= 0) {
                        LanzaAviso("La Siglas tanto de Delegado como de Gerente son un campo obligatorio y por tanto no pueden estar vacios. Introduzca algún valor por favor.");
                        return false;
                    }

                    var Regio, regio_long, asistira, alergia, alergia_long

                    Regio = document.getElementById("region_delegado").value.trim();
                    regio_long = Regio.length;
                    alergia = document.getElementById("alergia_delegado").value.trim();
                    alergia_long = alergia.length;

                    if (regio_long <= 0 || alergia_long <= 0) {
                        LanzaAviso("Los campos de Región y Alergias son obligatorios y no pueden estar vacios, por favor introduzca algún valor.");
                        return false;
                    }

                    Dades = document.getElementById("paso_datos2").value + "¦" + document.getElementById("name_delegado").value.trim() + "¦"
                        + document.getElementById('ape1_delegado').value.trim() + "¦" + document.getElementById('ape2_delegado').value.trim() +
                        "¦" + document.getElementById("email_delegado").value.trim() + "¦" + numero + "¦" + document.getElementById("siglas_delegado").value.trim() +
                        "¦" + document.getElementById("siglas_gerente_delegado").value + "¦" + (document.getElementById('asistira_delegado_si').checked ? '1' : '0') + "¦" +
                        (document.getElementById('alojamiento_delegado_si').checked ? '1' : '0') + "¦" +
                        (document.getElementById('transporte_delegado_si').checked ? '1' : '0') + "¦" + document.getElementById("city_origen_delegado").value.trim() +
                        "¦" + document.getElementById("alergia_delegado").value.trim() + "¦" + document.getElementById("observa_delegado").value.trim() +
                        "¦" + document.getElementById("region_delegado").value.trim();
                    setTimeout("InformacioAJAX(1,\"" + Dades.replace(/"/g, "'").replace(/\n/g, "\\n") + "\", 'Registre_Tornada', 'RecepcionAJAX.aspx')", 2000);

        }

         function Registre_Tornada(Dades) {
            if (Dades.substr(0, 2) == "OK") {
                if (Dades.substr(2, 1) == "1") {
                    LanzaAviso("Hemos modificado el registro que lleva el Email: " + document.getElementById("email_delegado").value) + " en la Base de Datos con exito. Gracias ;-)";
                }
            }
            else {
                if (Dades.substr(2, 1) == "0") {
                    LanzaAviso("Ha ocurrido un error actualizando sus datos en la Base de Datos. Vuelva a repetir el proceso por favor!");
                }
            }
        }
    </script>
</body>
</html>
