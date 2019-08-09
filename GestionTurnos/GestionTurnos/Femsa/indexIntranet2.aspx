<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="indexIntranet2.aspx.vb" Inherits="GestionTurnos.indexIntranet2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login Intranet</title>
        <!-- CSS y distintas librerias -->
    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous" />

    <style type="text/css">

        /* Cuadro principal */
        .cuadro_uno{max-width:1024px;width:100%;height:auto;margin: 5% auto 1.5% auto;background-color:antiquewhite;}
        .cuadro_uno img{max-width:160px;width:100%;height:57px;margin: .5% 0 0 0;}

        /* Cuadro principal 2*/
        .segundo_cuadro{background-color:#fff;color:Black;border:black solid .5px;height:540px;margin-bottom:.5%;}
        .nav-header{margin-left: 4.5%;text-decoration: underline;}

        /* Cuadro principal 2*/
        .cuadro_tercero{height:auto;margin-bottom:.5%;border:black solid .5px;width:99%;margin-left:.5%;padding:10px;margin-top:.1%;}


        /* Cuadro inscritos */
        .inscritos{background-color: #c3d5d5;padding: 10px;margin-left: 1.5%;width: 50%;border:black solid .5px;margin-bottom:0.5%;}

        /* Cuadro data personal */
        .data_personale{background-color: #c3d5d5;padding: 10px;border:black solid .5px;margin-bottom:0.5%;margin-left:-15px}

        /*Cuadro Vuelo Regreso */
        .comeback{padding: 10px;margin-bottom:0.5%;margin-left:-15px;width:50%;margin-top:-10.5%}
        .comeback2{padding: 10px;background-color: #c3d5d5;border:black solid .5px;margin-left: -10px;margin-top:-1.5%}
        
        /* Cuadro Itinerario */
        .itinerary{background-color: #c3d5d5;padding: 10px;border:black solid .5px;margin-bottom:0.5%;margin-left:.5px;width:49.9%;}

        /* Cuadro Hotel */
        .hotel{background-color: #c3d5d5;padding: 10px;border:black solid .5px;margin-bottom:0.5%;margin-top: -6%;}
        .hotelito{margin-left: -1.5%;font-size: 15px;}
        .checkin,.checkout{width:28%;Padding:10px;}
        .div_cheout{width:22%;Padding:10px;}

        /* Cuadro generar informes */
        .informes{background-color:#d9d9d9;padding: 10px;border:black solid .5px;margin-bottom:0.5%;}

        /* Dropdown List*/
        .eventos{background-color:#c3d5d5;padding:10px;margin-left:0;}
        .select_inscritos{width:90%;display:block;margin-left:auto;margin-right:auto;}

        /* labels */
        .asis_gestion{padding: 5px;float:right;}
        .Lista_Eventos{font-weight:bold;font-size: 14px;}
        .data_personal{margin-left: -9.5%;font-size: 15px;padding: 10px;}
        .preinscripto{margin-left: -6.5%;font-size: 15px;padding: 10px;}
        .login_como{font-weight:bold;font-size:16px;}
        .registers{float:right;margin-right: -2.5%;}
        .personaldata_texts{font-size:12px;float: right;padding: 2px;}
        .personaldata_texts2{font-size:10px;float: right;padding: 2px;}
        .personaldata_texts span{color:red;font-weight:bold;}
        .vuelos{margin-left: -0.5%;}
        .vuelos2{margin-left: -4.5%;}
        .fechas{font-size:12px;}
    
        .para_labels{width:20%;margin-top:1.5%;margin-left:-1.5%}
        .para_labels2{width:30%;margin-top:1.5%;margin-left:-1.5%}
        .mis_inputs{width: 136%;margin-left: -15px;padding: 5px;line-height: 0;height: 21px;}
        .mis_inputs2{width: 140%;margin-left: -21px;padding: 5px;line-height: 0;height: 21px;}

        /* Select Listado */
        .select_listado{font-size: 12px;padding: 5px;width: 70%;}
        /* Select Idioma */
        .select_idioma{display:block;margin:0 auto 0 auto;}
        /* Select Cena y Audifonos */
        #audifonosss,#cenas{width: 90%;display: block;margin-left: auto;margin-right: auto;}

        /* Boton */
        .mybutton{border-radius: 1px;float:right;margin-right:5%;margin-top: 2.5%;background-color:#009999;color:#fff;box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.8);font-family: Arial;font-size: 15px;font-weight: bold;}
        .mybutton:hover{background-color:#fff;color:#009999;}

        .centrado{margin-left:-15px;}
        
        .verde{border:1px solid green;}
        .azul{border:1px solid blue;}
        .amarillo{border:1px solid yellow;}
        .rojo{border:1px solid red;}
        
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <%--Primer Cuadro--%>
        <div class="container-fluid cuadro_uno">
            <div class="row img_femsa">
                <asp:Panel ID="Panel1" runat="server">
                </asp:Panel>
                <asp:Image ID="Image1" ImageUrl="img/logo.png" runat="server" Width="800px" CssClass="banner_img"/>
                <p style="float: right; margin-top: 4.5%;margin-right:3%;">Intranet de control de Eventos</p>
            </div>
            <%--Segundo Cuadro--%>
            <div class="segundo_cuadro">
                <div class="col-xs-6">
                    Hola
                </div>
                <div class="col-xs-6">
                    <asp:Label ID="asistentes_gestion" CssClass="asis_gestion" runat="server" Text="Label">Asistentes / Gestión</asp:Label>
                </div>
                <div class="col-xs-12 cuadro_tercero">
                    <div class="col-xs-6 eventos">
                        <asp:Label ID="Listado_Eventos" CssClass="Lista_Eventos" runat="server">Listado de Eventos: </asp:Label>
                        <asp:DropDownList ID="list_eventos" CssClass="select_listado" runat="server">
                            <asp:ListItem>Reunión Anual de Asuntos Jurídicos y Regulatorios.</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-xs-6">
                        aaaa
                    </div>
                   
                    <%----%>
                    <div class="col-xs-12" style="margin-top:.5%;">
                        <div class="col-xs-12">
                            <div class="col-xs-6">
                                <asp:Label ID="personal_data" CssClass="data_personal" runat="server">Datos Personales: </asp:Label>
                            </div>
                            <div class="col-xs-6">
                                <asp:Label ID="preinscritos" CssClass="preinscripto" runat="server">Preinscritos: </asp:Label>
                                <asp:Label ID="registrados" CssClass="registers" runat="server">Registrados: </asp:Label>
                            </div>                            
                        </div>
                        <div class="col-xs-12">
                            <div class="col-xs-6 data_personale">
                                <div class="row" style="margin-left:0;width:100%">
                                    <div class="col-xs-3 para_labels">
                                        <asp:Label ID="name" CssClass="personaldata_texts" runat="server">Nombre <span>*</span> </asp:Label>
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                        <asp:TextBox ID="input_name" CssClass="form-control mis_inputs" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-3 para_labels">
                                        <asp:Label ID="Label2" CssClass="personaldata_texts" runat="server">Dirección</asp:Label>
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                        <asp:TextBox ID="input_adrees" CssClass="form-control mis_inputs" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row" style="margin-left:0;width:100%">
                                    <div class="col-xs-3 para_labels">
                                        <asp:Label ID="Label1" CssClass="personaldata_texts" runat="server">Email <span>*</span> </asp:Label>
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                        <asp:TextBox ID="inputs_mail" CssClass="form-control mis_inputs" runat="server"></asp:TextBox> 
                                    </div>
                                    <div class="col-xs-3 para_labels">
                                        <asp:Label ID="Label3" CssClass="personaldata_texts" runat="server">Ciudad</asp:Label>
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                        <asp:TextBox ID="inputs_city" CssClass="form-control mis_inputs" runat="server"></asp:TextBox>
                                    </div>
                                </div> 
                                <div class="row" style="margin-left:0;width:100%">
                                    <div class="col-xs-3 para_labels">
                                        <asp:Label ID="Password" CssClass="personaldata_texts" runat="server">Password</asp:Label>
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                        <asp:TextBox ID="input_pass" CssClass="form-control mis_inputs" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-3 para_labels">
                                        <asp:Label ID="country" CssClass="personaldata_texts" runat="server">País</asp:Label>
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                        <asp:TextBox ID="input_pais" CssClass="form-control mis_inputs" runat="server"></asp:TextBox>
                                    </div>
                                </div> 
                                <div class="row" style="margin-left:0;width:100%">
                                    <div class="col-xs-3 para_labels">
                                        <asp:Label ID="Cargo" CssClass="personaldata_texts" runat="server">Cargo </asp:Label>
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                        <asp:TextBox ID="input_cargo" CssClass="form-control mis_inputs" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-3 para_labels">
                                        <asp:Label ID="Oficina" CssClass="personaldata_texts" runat="server">Tlf.Oficina</asp:Label>
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                        <asp:TextBox ID="input_ofi" CssClass="form-control mis_inputs" runat="server"></asp:TextBox>
                                    </div>
                                </div> 
                                <div class="row" style="margin-left:0;width:100%">
                                    <div class="col-xs-3 para_labels">
                                        <asp:Label ID="Empresa" CssClass="personaldata_texts" runat="server">Empresa </asp:Label>
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                        <asp:TextBox ID="input_company" CssClass="form-control mis_inputs" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-3 para_labels">
                                        <asp:Label ID="Celular" CssClass="personaldata_texts" runat="server">Celular</asp:Label>
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                        <asp:TextBox ID="input_mobil" CssClass="form-control mis_inputs" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 inscritos">
                                <asp:DropDownList ID="inscritos" CssClass="select_inscritos" runat="server"></asp:DropDownList>
                            </div>
                            <div class="col-xs-6">
                                <asp:Label ID="fly_Monterrey" CssClass="vuelos" runat="server">Vuelo a Monterrey: </asp:Label>
                            </div>
                            <div class="col-xs-6 inscritos">
                                <div class="row" style="margin-left:0;width:100%">
                                    <div class="col-xs-3 para_labels">
                                        <asp:Label ID="input_hllegada" CssClass="personaldata_texts2" runat="server">Hora Llegada </asp:Label>
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                        <asp:TextBox ID="TextBox1" CssClass="form-control mis_inputs" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-3 para_labels">
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                    </div>
                                </div> 
                                <div class="row" style="margin-left:0;width:100%">
                                    <div class="col-xs-3 para_labels">
                                        <asp:Label ID="Label7" CssClass="personaldata_texts" runat="server">Num.Vuelo </asp:Label>
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                        <asp:TextBox ID="input_numVuelo" CssClass="form-control mis_inputs" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-3 para_labels">
                                        <asp:Label ID="Label8" CssClass="personaldata_texts" runat="server">Aerolinea</asp:Label>
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                        <asp:TextBox ID="input_aerolinea" CssClass="form-control mis_inputs" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-xs-12">
                            <div class="col-xs-6">
                                <asp:Label ID="Label4" CssClass="data_personal" runat="server">Itinerario (PDF): </asp:Label>
                            </div>
                            <div class="col-xs-6">
                                <asp:Label ID="fly_back" CssClass="vuelos2" runat="server">Vuelo de regreso: </asp:Label>
                            </div>
                            <div class="col-xs-6 itinerary">
                                <div class="row" style="margin-left:0;width:100%">
                                    <div class="col-xs-3 para_labels">
                                        <asp:Label ID="Label5" CssClass="personaldata_texts2" runat="server">Hora Llegada </asp:Label>
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                        <asp:TextBox ID="TextBox2" CssClass="form-control mis_inputs" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-3 para_labels">
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                    </div>
                                </div> 
                                <div class="row" style="margin-left:0;width:100%">
                                    <div class="col-xs-3 para_labels">
                                        <asp:Label ID="Label6" CssClass="personaldata_texts" runat="server">Num.Vuelo </asp:Label>
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                        <asp:TextBox ID="TextBox3" CssClass="form-control mis_inputs" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-3 para_labels">
                                        <asp:Label ID="Label9" CssClass="personaldata_texts" runat="server">Aerolinea</asp:Label>
                                    </div>
                                    <div class="col-xs-3 para_labels2">
                                        <asp:TextBox ID="TextBox4" CssClass="form-control mis_inputs" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 comeback">
                                <div class="col-xs-6 comeback2">
                                    <asp:Label ID="itinerari" CssClass="preinscripto" runat="server">Fichero: </asp:Label>
                                </div>
                                <div class="col-xs-6" style="padding:10px;">
                                    <asp:DropDownList ID="lenguaje" CssClass="select_idioma" runat="server">
                                        <asp:ListItem>Español</asp:ListItem>
                                    </asp:DropDownList>
                                </div>                                
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:-1.5%">
                            <div class="col-xs-6" style="margin-left:-15px;">
                                <div class="col-xs-6" style="margin-left:-15px;width:50%;">
                                    
                                </div>
                            </div>
                            <div class="col-xs-6" style="margin-left:15px;padding:5px;">
                                <asp:Button ID="myboton" CssClass="mybutton" Text="Dar de Alta" runat="server" />
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top: -8%;">
                            <asp:Label ID="Alojamiento_Hotel" CssClass="hotelito" runat="server">Alojamiento/Hotel: </asp:Label>
                        </div>
                        <div class="col-xs-12">
                            <div class="col-xs-6 hotel" style="margin-left:-15px;width:50%;">
                                <div class="row" style="margin-left:0;width:100%">
                                    <div class="col-xs-3 checkin">
                                        <asp:Label ID="fecha_in" CssClass="personaldata_texts3 fechas" runat="server">Fecha Check-in: </asp:Label>
                                    </div>
                                    <div class="col-xs-3 div_cheout">
                                        <asp:TextBox ID="input_fechain" CssClass="form-control mis_inputs2" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-3 checkout">
                                        <asp:Label ID="fecha_out" CssClass="personaldata_texts3 fechas" runat="server">Fecha Check-out: </asp:Label>
                                    </div>
                                    <div class="col-xs-3 div_cheout">
                                        <asp:TextBox ID="input_fechaout" CssClass="form-control mis_inputs2" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6" style="margin-left:15px;width:50%;">
                                <div class="row">
                                    <asp:Label ID="informesss" CssClass="personaldata_texts3 fechas" runat="server">Informe inscritos </asp:Label>
                                </div>
                                <div class="row informes">
                                    <div class="col-xs-6" style="margin-top: 2%;">
                                        <asp:TextBox ID="generar_informe" CssClass="form-control mis_inputs2" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-6">
                                        <asp:Button ID="informe_generate" CssClass="mybutton" Text="Enviar" runat="server" />
                                    </div>
                                    <div class="col-xs-12" style="margin-left:-15px;">
                                        <asp:Label ID="texto_informe" CssClass="personaldata_texts3 fechas" runat="server">Si es más de uno, separar por punto y coma. </asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6" style="margin-left:-15px;width:50%;margin-top: -4.5%;">
                                <div class="col-xs-6" style="margin-left:-15px;width:50%;">
                                    <div class="col-xs-6">
                                        <asp:Label ID="dinners" CssClass="" runat="server">Cena(28): </asp:Label>
                                    </div>
                                    <div class="col-xs-6">
                                        <asp:DropDownList ID="cenas" CssClass="select_idioma" runat="server">
                                            <asp:ListItem>--------</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-xs-6" style="margin-left:15px;width:50%;">
                                    <div class="col-xs-6">
                                        <asp:Label ID="audifons" CssClass="" runat="server">Audifonos: </asp:Label>
                                    </div>
                                    <div class="col-xs-6">
                                        <asp:DropDownList ID="audifonosss" CssClass="select_idioma" runat="server">
                                            <asp:ListItem>--------</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            Privilegios como: <asp:Label ID="login_how" CssClass="login_como" runat="server">Admin </asp:Label> FEMSA
        </div>      
                    
        
                    
    </form>
</body>
</html>
