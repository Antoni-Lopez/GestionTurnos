<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Probando_cositas.aspx.vb" Inherits="GestionTurnos.Probando_cositas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <!-- CSS y distintas librerias -->

    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>


    <!-- style -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat|Rubik&display=swap" rel="stylesheet">
    <style>
        body{margin:0;padding:0;box-sizing:border-box;position: relative;}
        #particles-js{background-color: #494949;height:100vh;width:100%;z-index:0}

        .logo_img{border: groove solid 1.2px;position:absolute;max-width:830px;width:100%;left: 50%;
            top: 20%;transform: translate(-50%, -50%);-webkit-transform: translate(-50%, -50%);
            -webkit-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);-moz-box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75);}
        .logo_img img{margin:0;padding:0;box-sizing:border-box;margin-left: -1.7%;width:103.6%;}
        .principal{position:absolute;max-width:700px;width:100%;border:#fff solid 2px;background-color:#e9e9e9;
            display: flex;justify-content: center;align-items: center;left: 50%;top: 60%;transform: translate(-50%, -50%);
            -webkit-transform: translate(-50%, -50%);opacity: 0.9;height: 25vh;}
        .header_principal{position:absolute;top:0;left:2%;border-bottom:#DA9734 solid 3.2px;width:100.5%;padding:10px;text-align:justify;font-family: 'Montserrat', sans-serif;}
        .header_principal h2 b{margin-left: 5%;}

        .login_centrar{width:100%;margin-top:5%;}
        .label_texto{width:35%;padding:5px;}
        .label_texto label[for=staticEmail]{padding-top:5px;}
        .div_inputs{width:65%;padding:5px;}

        .verde{border:green 2px solid;}
        .rojo{border: red 2px solid;}

        @media (max-width: 1920px) {
          .logo_img{top: 25%;}
          .principal{top: 70%;}
        }

    </style>

    <!-- scripts -->
    <script src="Script/particles.js"></script>
    <%--<script src="Script/stats.js"></script>--%>
    <script src="Script/app.js"></script>

</head>
<body id="particles-js">
    <form id="form1" runat="server">
        <div class="container-fluid logo_img">
            <img src="img/aotec.jpg" />
        </div>
        <div class="container-fluid principal">
            <div class="row header_principal">
                <h2><b>Login de Acceso</b></h2>
            </div>
            <div class="row login_centrar rojo">
                <div class="col-xs-6 col-md-4 label_texto">
                     <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
                </div>
                <div class="col-xs-6 col-md-4 div_inputs">
                    <input class="form-control form-control-sm" type="text" placeholder="Introduzca su Email ">
                </div>
            </div>
        </div>
    </form>
</body>
</html>
