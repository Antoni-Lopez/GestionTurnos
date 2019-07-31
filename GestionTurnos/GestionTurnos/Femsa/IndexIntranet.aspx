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
        .cuadro_princi{max-width:850px;width:100%;height:70vh;margin: 5% auto 1.5% auto;background-color:#FF7F71;}
        .cuadro_princi img{max-width:160px;width:100%;height:57px;margin: .5% 0 0 0;}

        /* Cuadro principal 2*/
        .cuadro_princi2{background-color:#fff;color:Black;height:60vh;border:black solid .5px;margin-left:-1.5%; width:101.7%;}
        .nav-header{margin-left: 4.5%;text-decoration: underline;}
        
        /* Cuadro Principal 3*/
        .cuadro_princi3{height:55vh;margin-left: -1%;width:100.7%;background-color:#fff;color:black; border: black solid .5px;margin-top:-70%;}
        
        /* select listado eventos */
        label[for=listado]{margin-left:-7%;}
        .listado_eventos{padding:10px;background-color:#A9DFBF;}
        #list_eventos{margin-left:-50%;}

        .rojo{border:red solid 1px;}
        
        @media (max-width: 1920px){
            .cuadro_princi2{height:5.5vh}
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid cuadro_princi">
            <div class="row img_femsa">
                <img src="img/logo.png" />
                <p style="float: right; margin-top: 4.5%;margin-right:3%;">Intranet de control de Eventos</p>
            </div>
            <div class="row cuadro_princi2">
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
                <div class="col-xs-6" style="">
                    <p style="padding: 5px;float:right;margin-top:3%;">Asistentes / Gestión</p>
                </div>             
            </div>
            <div class="row cuadro_princi3">
                <div class="col-xs-8 listado_eventos rojo">
                    <div class="col-xs-6">
                        <label for="listado">Listado de eventos: </label>
                    </div>
                    <div class="col-xs-6">
                        <select id="list_eventos" class="list_eventos" onchange="" runat="server" name="list_eventos">
                            <option value="-1" id="anadir_nuevo">Añadir Proveedor</option>
                            <option selected value="0">Reunión Anual de Asuntos Jurídicos y Regulatorios </option>
                        </select>
                    </div>                  
                </div>
                <div class="col-xs-4">                   
                </div>
            </div>
            <div class="row rojo">
                <div class="col-xs-6 rojo">
                    <label for="personal_data">Datos Personales</label>
                    <div class="row rojo">
                        Holaaaa

                    </div>
                </div>
            </div>
            <p style="padding: 5px;margin-top: 2%;margin-left: -2%;">Privilegios como: <span>Webmaster <em>FEMSA</em></span> </p>
        </div>
    </form>
</body>
</html>
