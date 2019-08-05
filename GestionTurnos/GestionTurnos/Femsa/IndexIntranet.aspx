<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="IndexIntranet.aspx.vb" Inherits="GestionTurnos.IndexIntranet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login Intranet</title>
    <!-- CSS y distintas librerias -->
    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>
    <style type="text/css">
        body{margin:0;padding:0;box-sizing:border-box;width:100%;}

        /* Cuadro principal */
        .cuadro_princi{max-width:1024px;width:100%;height:auto;margin: 5% auto 1.5% auto;background-color:antiquewhite;}
        .cuadro_princi img{max-width:160px;width:100%;height:57px;margin: .5% 0 0 0;}

        /* Cuadro principal 2*/
        .cuadro2{background-color:#fff;color:Black;border:black solid .5px;}
        .nav-header{margin-left: 4.5%;text-decoration: underline;}
        
        /* Cuadro Principal 3*/
        .cuadro3{border:black solid .5px;margin-bottom:.5%;}
        .conte_datapersonal{margin-left:-3.5%;width:106.5%;background-color:#009999;}

        /* select listado eventos */
        .select_listado{background-color:#009999;padding:10px;border:black solid .5px;margin:.5% -15px .5% -13px;}
        #listado_eventos{display:block; margin-left:auto;margin-right:auto;}
        
        /* Select inscritos */
        #inscritos{width:95%; display:block;margin-left:auto;margin-right:auto;}

        /* Select Idioma */
        .idioma{background-color:#009999;border:black solid .5px;margin-left: -1%;margin-top: 2%;}

        /* 2 selects finales */
        #Select1,#Select2{width:30%;margin:5px;}

        .data_personal{margin-left:0;width:100%;background-color:#009999;border:.5px solid black;}

        /* Todos los labels */
        label[for=listados]{margin-left:2%}
        label[for=datos_personales]{margin-left: 2.5%;margin-top: 10%;padding: 10px;font-size:10px;}
        label[for=fichero] {margin-left: 20%;margin-top:1.5%;}
        label[for=alojamiento]{font-size:9px;margin-left:7%;}
        label[for=personal_data]{margin-left:1%;margin-top:1%;margin-bottom: -1%;}

        /* inputs */
        .mi_input{height:15px;padding:10px;font-size:11px;width:95%;}
        .mi_input2{height:15px;padding:10px;font-size:11px;margin-left: -9%;width: 103%;}


        .rojo{border:red solid 1px;}
        .verde{border:green solid 1px;}
        .azul{border:blue solid 1px;}
        
        @media (max-width: 1920px){
        }
    </style>
</head>
<body>
    <form id="form1" enctype="multipart/form-data" runat="server" >
        <div class="container-fluid cuadro_princi">
            <div class="row img_femsa">
                <img src="img/logo.png" />
                <p style="float: right; margin-top: 4.5%;margin-right:3%;">Intranet de control de Eventos</p>
            </div>
            <div class="col-xs-12 cuadro2">
                <div class="col-xs-6">
                    <ul class="nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Menú Gestión <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li class="nav-header">Asistentes</li>
                                <li><a href="#">Un link</a></li>
                                <li><a href="#">Otro más</a></li>
                                <li><a href="#">Y otro más</a></li>
                                <li class="divider"></li>
                                <li class="nav-header">Password</li>
                                <li><a href="#">Link separado</a></li>
                                <li><a href="#">Link separado 2</a></li>
                                <li class="nav-header">Gestión</li>
                                <li><a href="#">Link separado</a></li>
                                <li><a href="#">Link separado 2</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-6">
                    <label for="asis_gestion" style="padding: 5px;float:right;margin-top:10px">Asistentes / Gestión</label>
                </div>
                <div class="col-xs-12 cuadro3">
                    <div class="col-xs-6 select_listado">
                            <label for="listados">Listado de Eventos: </label>
                            <select id="listado_eventos" runat="server">
                                <option value="1">Reunión Anual de Asuntos Jurídicos y Regulatorios</option>
                            </select>                   
                    </div>
                    <div class="col-xs-6"></div>
                                    <div class="col-xs-12">
                    <table width="100%">
                        <tr>
                            <td style="width:50%;margin-left:1%;">
                                <label for="personal_data">Datos Personales</label>
                                <div class="col-xs-12 data_personal">
                                    <table width="106.5%" style="margin-left:-3.5%;">
                                        <tr>
                                            <td style="width:6.25%;margin-left:-1.5%">
                                                <label for="datos_personales" >Nombre<span>*</span></label>
                                            </td>
                                            <td style="width:18.75%">
                                                <input type="text" class="form-control mi_input2" id="Input_name" style="width:94%;margin-left:0;" value="" placeholder="Introduzca su Nombre" runat="server"  />
                                            </td>
                                            <td style="width:6.25%">
                                                <label for="datos_personales" >Dirección</label>
                                            </td>
                                            <td style="width:18.75%">
                                                <input type="text" class="form-control mi_input2" id="Input_adress" value="" placeholder="Introduzca su Direccion" runat="server"  />
                                            </td>
                                        </tr>
                                    </table>
                                    <table width="106.5%" style="margin-left:-3.5%;margin-top:-5.5%;">
                                        <tr>
                                            <td style="width:6.25%;margin-left:-1.5%">
                                                <label for="datos_personales">Email<span>*</span></label>
                                            </td>
                                            <td style="width:18.75%">
                                                <input type="text" class="form-control mi_input" id="Input_mail" style="width:89%;margin-left:5%;" value="" placeholder="Introduzca su Email" runat="server"  />
                                            </td>
                                            <td style="width:6.25%">
                                                <label for="datos_personales">Ciudad</label>
                                            </td>
                                            <td style="width:18.75%">
                                                <input type="text" class="form-control mi_input" id="Input_city" style="margin-left:-1%" value="" placeholder="Introduzca su Ciudad" runat="server"  />
                                            </td>
                                        </tr>
                                    </table>
                                    <table width="106.5%" style="margin-left:-3.5%;margin-top:-5.5%;">
                                        <tr>
                                            <td style="width:6.25%;margin-left:-1.5%">
                                                <label for="datos_personales" style="font-size:11px">Password<span>*</span></label>
                                            </td>
                                            <td style="width:18.75%">
                                                <input type="password" class="form-control mi_input2" style="margin-left: -12.5%;width: 89%;font-size:9px;" id="Input_pass" value="" placeholder="Introduzca su Contraseña" runat="server"  />
                                            </td>
                                            <td style="width:6.25%">
                                                <label for="datos_personales" style="margin-left:-25px;">País</label>
                                            </td>
                                            <td style="width:18.75%">
                                                <input type="text" class="form-control mi_input2" id="Input_pais" style="margin-left: 4.2%;width: 90%;" value="" placeholder="Introduzca su País" runat="server"  />
                                            </td>
                                        </tr>
                                    </table>
                                    <table width="106.5%" style="margin-left:-3.5%;margin-top:-5.5%;">
                                        <tr>
                                            <td style="width:6.25%;margin-left:-1.5%">
                                                <label for="datos_personales">Cargo</label>
                                            </td>
                                            <td style="width:18.75%">
                                                <input type="text" class="form-control mi_input" style="margin-left:6.2%;width:89.1%" id="Input_cargo" value="" placeholder="Introduzca su Cargo." runat="server"  />
                                            </td>
                                            <td style="width:6.25%">
                                                <label for="datos_personales" style="font-size:11px;margin-left:-2px;">Tlf. oficina</label>
                                            </td>
                                            <td style="width:18.75%">
                                                <input type="text" class="form-control mi_input" id="Input_oficina" style="margin-left:2%;width:92%" value="" placeholder="Introduzca su Ciudad." runat="server"  />
                                            </td>
                                        </tr>
                                    </table>
                                    <table width="106.5%" style="margin-left:-3.5%;margin-top:-5.5%;">
                                        <tr>
                                            <td style="width:6.25%;margin-left:-1.5%">
                                                <label for="datos_personales">Empresa</label>
                                            </td>
                                            <td style="width:18.75%">
                                                <input type="text" class="form-control mi_input2" id="Input_company" style="margin-left:-2%;width:90%" value="" placeholder="Introduzca su Empresa." runat="server"  />
                                            </td>
                                            <td style="width:6.25%">
                                                <label for="datos_personales" style="margin-left:-8px;">Celular</label>
                                            </td>
                                            <td style="width:18.75%">
                                                <input type="text" class="form-control mi_input2" id="Input_celular" style="margin-left:-4%;width:99%" value="" placeholder="Introduzca su Celular." runat="server"  />
                                            </td>
                                        </tr>
                                    </table>                                    
                                </div>
                                <table width="100%">
                                    <tr>
                                        <td>     
                                            <label for="personal_data">Itinerario(PDF)</label>
                                            <div class="row" style="margin-left:0;width:100%;margin-top:-3%;padding:5px">                                             
                                                <div class="col-xs-8 idioma"  style="padding:5px;font-size:12px;">
                                                    <label for="fichero">Fichero: </label>
                                                </div>
                                                <div class="col-xs-4" style="padding:7px;margin-top: 2%;">
                                                    <label for="idioma" id="change_idioma" runat="server">Idioma: </label>
                                                    <select id="idioma_select" style="float:right;margin-top:.5%;" runat="server">
                                                        <option value="1">Español</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <label for="personal_data">Alojamiento hotel</label>
                                            <div class="col-xs-12 idioma" style="margin-left:0;width:100%;margin-top:0%;padding:5px;margin-bottom:1%;">
                                                <div class="col-xs-3" style="padding:5px;">
                                                    <label for="alojamiento">Fecha Check-in</label>
                                                </div>
                                                <div class="col-xs-3" style="padding:5px;">
                                                    <input type="text" class="form-control mi_input2" id="Input_fecha_in" style="margin-left:-4%;width:105%;padding:10px;font-size:9.5px;" value="" placeholder="Introduzca la fecha." runat="server"  />
                                                </div>
                                                <div class="col-xs-3" style="padding:5px;">
                                                    <label for="alojamiento">Fecha Check-out</label>
                                                </div>
                                                <div class="col-xs-3" style="padding:5px;">
                                                    <input type="text" class="form-control mi_input" id="Input_fecha_out" style="margin-left:-4%;width:105%;padding:10px;font-size:9.5px;" value="" placeholder="Introduzca la fecha." runat="server"  />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <div class="row" style="margin-left:0;width:100%;margin-bottom:2.5%">
                                                <label for="2selects" style="margin-left:1%">Cena</label>
                                                <select id="Select1" runat="server">
                                                    <option value="1">-------------</option>
                                                </select>
                                                <label for="2selects" style="margin-left: 7%;">Audifonos</label>
                                                <select id="Select2" runat="server">
                                                    <option value="1">-------------</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width:50%;margin-left:0;vertical-align:top;">
                                <div class="col-xs-12" style="width: 110%">
                                    <div class="col-xs-6">
                                        <label for="personal_data" style="margin-left:-10%;padding:1px;margin-top: 2%;">Preinscritos: </label><span id="numero_insc" style="padding:5px;font-weight:bold" runat="server"></span>
                                    </div>
                                    <div class="col-xs-6">
                                        <label for="personal_data" style="padding:1px;margin-left:40%">Registrados: </label><span id="numero_insc2" style="margin-left:2%;padding:5px;font-weight:bold" runat="server"></span>
                                    </div>                             
                                </div>
                                <div class="col-xs-12 select_listado" style="margin-left:2%;width:100%;border:.5px solid black;margin-top:-.2%">
                                    <select id="inscritos" runat="server">
                                        <option value="1">AÑADIR INSCRITOS...</option>
                                    </select>
                                </div>
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <label for="personal_data" style="margin-left:2.2%">Vuelo a Monterrey</label>
                                            <div class="col-xs-12 select_listado" style="margin-left:2%;width:100%;border:.5px solid black;margin-top: -.2%;">
                                                <div class="row" style="margin-left:0;width:100%;">
                                                    <div class="col-xs-3">
                                                        <label for="personal_data" style="font-size:10px;padding:5px;">Hora Llegada</label>                                                        
                                                    </div>
                                                    <div class="col-xs-3" style="padding:5px;">
                                                        <input type="text" class="form-control mi_input" id="Input_llegada" style="margin-left:.5%;padding:8px;width:100%;font-size:9px;" value="" placeholder="Introduzca la hora de LLegada." runat="server"  />
                                                    </div>
                                                    <div class="col-xs-6">
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-left:0;width:100%;">
                                                    <div class="col-xs-3">
                                                        <label for="personal_data" style="font-size:10px;padding:5px;">Num.Vuelo</label>                                                        
                                                    </div>
                                                    <div class="col-xs-3" style="padding:5px;">
                                                        <input type="text" class="form-control mi_input" id="Input_nVuelo" style="margin-left:.5%;padding:8px;width:100%;font-size:9px;" value="" placeholder="Introduzca la hora de LLegada." runat="server"  />
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label for="personal_data" style="font-size:10px;padding:5px;">Aerolinea</label>                                                        
                                                    </div>
                                                    <div class="col-xs-3" style="padding:5px;">
                                                        <input type="text" class="form-control mi_input" id="Input_aerolinea" style="margin-left:.5%;padding:8px;width:100%;font-size:9px;" value="" placeholder="Introduzca la compañia." runat="server"  />
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <label for="personal_data" style="margin-left:2.5%;">Vuelo regreso</label>
                                            <div class="col-xs-12 select_listado" style="margin-left:2%;width:100%;border:.5px solid black;margin-top: -.2%;">
                                                <div class="row" style="margin-left:0;width:100%;">
                                                    <div class="col-xs-3">
                                                        <label for="personal_data" style="font-size:10px;padding:5px;">Hora Llegada</label>                                                        
                                                    </div>
                                                    <div class="col-xs-3" style="padding:5px;margin-top: -.2%;">
                                                        <input type="text" class="form-control mi_input" id="Text1" style="margin-left:.5%;padding:8px;width:100%;font-size:9px;" value="" placeholder="Introduzca la hora de LLegada." runat="server"  />
                                                    </div>
                                                    <div class="col-xs-6">
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-left:0;width:100%;">
                                                    <div class="col-xs-3">
                                                        <label for="personal_data" style="font-size:10px;padding:5px;">Num.Vuelo</label>                                                        
                                                    </div>
                                                    <div class="col-xs-3" style="padding:5px;">
                                                        <input type="text" class="form-control mi_input" id="Text2" style="margin-left:.5%;padding:8px;width:100%;font-size:9px;" value="" placeholder="Introduzca la hora de LLegada." runat="server"  />
                                                    </div>
                                                    <div class="col-xs-3">
                                                        <label for="personal_data" style="font-size:10px;padding:5px;">Aerolinea</label>                                                        
                                                    </div>
                                                    <div class="col-xs-3" style="padding:5px;">
                                                        <input type="text" class="form-control mi_input" id="Text3" style="margin-left:.5%;padding:8px;width:100%;font-size:9px;" value="" placeholder="Introduzca la compañia." runat="server"  />
                                                    </div>

                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                </div>

            </div>
            <p style="padding: 5px;margin-top: 2%;margin-left: -2%;">Privilegios como: <span id="privilegio_name" runat="server"> </span><em> FEMSA </em> </p>
        </div>
    </form>
        <script type="text/javascript" src="../Script/ComunicacioAJAX.js"></script>
    <script type="text/javascript"> 
        function Registre() {
           
            var Dades;
            var idferia = "211";
            var id = document.getElementById("inscritos").value;

            Dades = idferia + "¦" + id;
            setTimeout("InformacioAJAX(15,\"" + Dades.replace(/"/g, "'").replace(/\n/g, "\\n") + "\", 'Registre_Tornada', '../RecepcionAJAX.aspx')", 500);
        }

        function Registre_Tornada(Dades) {
            if (Dades.substr(0, 2) == "OK") {
                if (Dades.substr(2, 2) == "15") {
                    //Send_Mail.innerHTML = "<h4 style='text-align:center;'>Email enviado!<br/>";

                    var separar = Dades.split("¦");
                    var nombre, email, pass,cargo,empresa,dire,city,country,mobil,fijo;

                    if (separar.length < 5) {
                        nombre = separar[1];
                        email = separar[2];
                        pass = separar[3];
                        document.getElementById("Input_name").value = nombre;
                        document.getElementById("Input_mail").value = email;
                        document.getElementById("Input_pass").value = pass;
                        document.getElementById("Input_cargo").value = "";
                        document.getElementById("Input_company").value = "";
                        document.getElementById("Input_adress").value = "";
                        document.getElementById("Input_city").value = "";
                        document.getElementById("Input_pais").value = "";
                        document.getElementById("Input_celular").value = "";
                        document.getElementById("Input_oficina").value = "";
                    }
                    else {
                        nombre = separar[1];
                        email = separar[2];
                        pass = separar[3];
                        cargo = separar[4];
                        empresa = separar[5];
                        dire = separar[6];
                        city = separar[7];
                        country = separar[8];
                        mobil = separar[9];
                        fijo = separar[10];

                        document.getElementById("Input_name").value = nombre;
                        document.getElementById("Input_mail").value = email;
                        document.getElementById("Input_pass").value = pass;
                        document.getElementById("Input_cargo").value = cargo;
                        document.getElementById("Input_company").value = empresa;
                        document.getElementById("Input_adress").value = dire;
                        document.getElementById("Input_city").value = city;
                        document.getElementById("Input_pais").value = country;
                        document.getElementById("Input_celular").value = mobil;
                        document.getElementById("Input_oficina").value = fijo;
                    }

                    

                    
                }
            }
            else {
                if (Dades.substr(2, 2) == "15") {
                    Send_Mail.innerHTML = "<h4 style='text-align:center;'>ERROR al Enviar el Email!<br/>";
                }
            }
        }
    </script>
</body>
</html>
