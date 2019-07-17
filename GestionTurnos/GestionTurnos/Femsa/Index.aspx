<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Index.aspx.vb" Inherits="GestionTurnos.Index" %>

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

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous" />

    <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" />

    <style type="text/css">

        /* banner cabecera */
        .img_banner{max-width:600px;display:block; margin-left:auto;margin-right:auto;box-shadow: 0px 0px 25px rgba(0, 0, 0, 1);margin-top:1.5%}
        .img_banner img{max-width:600px;width:102.7%;}

        /* Cuadro Principal(Name/Email) */
        #principal{max-width:400px;display:block; margin-left:auto;margin-right:auto;margin-top:2%;background-color:#DCDCDC;border-radius:4.5px;border:#707070 solid 0.5px;}
        .inputs_no_rellenar{height:25px;border-radius:0 !important; border:#851724 solid 1.5px;pointer-events:none;cursor: not-allowed !important;width:116.7%;}
        label[for=texto]{margin-top:2.5%;font-size:12px;float:right;}

        /* Pass para la App */
        #pass_app{max-width:400px;display:block; margin-left:auto;margin-right:auto;margin-top:.5%;}
        .header{background-color:black;color:#fff;}
        .cuerpo{background-color:#DCDCDC;margin-top:.4%;border:#707070 solid 0.5px;}
        .cuadro_info{margin-left:5%;width:90%;background-color:#FFCC00;font-size:10px;padding:5px;margin-top:1%;margin-bottom:1.5%;border:#333300 solid 0.5px;}
        .cuadro_info p{margin-top:2%;}
        .cuadro_info span{font-weight:Bold;}

        /* Datos Personales */
        #personal_data{max-width:500px;display:block; margin-left:auto;margin-right:auto;margin-top:1%;}
        .inputs_personaldata{margin-left:0;width:100%;border:#851724 solid 1.5px;border-radius:0;height:25px}

        /* Vuelo Monterrey */
        #vuelo_monte{max-width:500px;display:block; margin-left:auto;margin-right:auto;margin-top:1%;}

        /* Ventana Modal LanzaAviso */
        .modal-open .modal{display: flex;justify-content: center;align-items: center;}

        /* Sin email */
        .no_email{max-width:550px;width:100%;display:block; margin-left:auto;margin-right:auto;padding:15px;}
        .no_email span{color:red;font-weight:bold;}

        /* Centrado al Div - Horizontal. */
        .centrado{margin-left:0;width:100%;}

        /* Centrado Vertical */
        .centrarlos{padding:10px;}
        .vertical{display: flex;justify-content: center;align-items: center;}

        .verde{border:1px solid green;}
        .azul{border:1px solid blue;}
        .amarillo{border:1px solid yellow;}
        .rojo{border:1px solid red;}
    </style>

    <script type="text/javascript">

        function LanzaAviso(Text) {
            bootbox.alert({ title: "ASUNTOS JURÍDICOS Y REGULATORIOS 2019 - FEMSA", message: Text, size: 'large' });

        }

        function mensajes(x) {
            switch (x) {
                case 1:
                    LanzaAviso("<p>Su nombre y su Email son campos que no se pueden modificar y por ello solo se los mostramos.<br /> Gracias por entenderlo! </p>");
                    break;
                case 2:
                    break;
            }
        }
        $(document).ready(function () {

            $('#datetimepicker1').datetimepicker({
                language: /*(document.getElementById('txtIdioma').value == '2' ? 'en' : 'es')*/('es'),
                startDate: new Date(2019, 7, 26),
                endDate: new Date(2019, 7, 30),
                minView: 2,
                autoclose: 1,
                forceParse: 0
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid img_banner" onclick="">
            <img src="img/banner.jpg" />
        </div>
        <div id="principal" runat="server" onclick="mensajes(1)">
            <div class="row centrado">
                <div class="col-xs-6 centrarlos" style="width:40% !important">
                    <label for="texto">Nombre completo</label>
                </div>
                <div class="col-xs-6 centrarlos">
                    <input type="Text" class="form-control inputs_no_rellenar" id="Input_Nombre"  runat="server"  />
                </div>
            </div> 
            <div class="row centrado">
                <div class="col-xs-6 centrarlos" style="width:40% !important">
                    <label for="texto">Email</label>
                </div>
                <div class="col-xs-6 centrarlos">
                    <input type="text" class="form-control inputs_no_rellenar" id="Input_Email" runat="server"  />
                </div>
            </div>                
        </div>
        <div id="pass_app">
            <div class="row centrado header">
                <p style="margin-top: 2%;margin-left:2%;">Password para la App</p>
            </div>
            <div class="row centrado cuerpo">
                <div class="row centrado">
                    <div class="col-xs-6 centrarlos" style="width:40% !important">
                        <label for="texto">Password</label>
                    </div>
                    <div class="col-xs-6 centrarlos">
                        <input type="text" class="form-control inputs_no_rellenar" id="Input_Password" runat="server"  />
                    </div>
                </div>
                <div class="row centrado">
                    <div class="cuadro_info">
                        <p class="vertical"><i class="fas fa-exclamation-circle"></i><span>Atención: </span> Este Password lo usará para acceder a la App RAA 2019</p>
                    </div>
                </div>
            </div>
        </div>
        <div id="personal_data">
            <div class="row centrado header">
                <p style="margin-top: 2%;margin-left:2%;">Datos Personales</p>
            </div>
            <div class="row centrado cuerpo" style="margin-top:1%;margin-bottom:2%;padding:5px;">
                <div class="col-xs-6">
                    <label for="textosss">Puesto <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Text1" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss">Unidad de negocio <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Text10" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss">Dirección <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Text11" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss">Ciudad <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Text120" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss">País <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Text111" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss">Teléfono celular <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Text1201" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss">Teléfono oficina <span>*</span></label>
                    <input type="text" class="form-control inputs_personaldata" id="Text12011" runat="server"  />
                </div>
            </div>
        </div>
        <div id="vuelo_monte">
            <div class="row centrado header">
                <p style="margin-top: 2%;margin-left:2%;">Vuelo a Monterrey</p>
            </div>
            <div class="row centrado cuerpo" style="margin-top:1%;margin-bottom:2%;padding:5px;">
                <div class="col-xs-6">
                    <label for="textosss">Día de Llegada </label>
                    <input type="text" class="form-control inputs_personaldata" id="datetimepicker1" step="1" min="2019-06-26" max="2019-06-30" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss">Hora de Llegada</label>
                    <input type="text" class="form-control inputs_personaldata" id="Text3" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss">Nº. Vuelo </label>
                    <input type="text" class="form-control inputs_personaldata" id="Text4" runat="server"  />
                </div>
                <div class="col-xs-6">
                    <label for="textosss">Aerolinea</label>
                    <input type="text" class="form-control inputs_personaldata" id="Text5" runat="server"  />
                </div>
            </div>
        </div>

        <div id="mensaje_es" class="no_email" style="display:none;" runat="server">
            <p>Está intentando acceder <span>sin ningún Email</span>, por ello no le podemos mostrar nada. Por favor vuelva a la página de Login.aspx y vuelva a Introducir su Email. Gracias!</p>
        </div>
        <div id="mensaje_en" class="no_email" style="display:none;" runat="server">
            <p>You are trying to access <span> without any Email </span>, so we can not show you anything. Please go back to the Login.aspx page and enter your Email again. Thank you!!</p>            
        </div>
    </form>
    <script src="script/jquery.datetimepicker.full.min.js"></script>
    <script src="script/jquery.datetimepicker.min.js"></script>
</body>
</html>
