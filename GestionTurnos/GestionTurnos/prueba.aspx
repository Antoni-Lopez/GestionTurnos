<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="prueba.aspx.vb" Inherits="GestionTurnos.prueba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <asp:literal id="bootstrap_min_css" runat="server"></asp:literal>
    <asp:literal id="jquery_1_9_1_min_js" runat="server"></asp:literal>
    <asp:literal id="bootstrap_min_js" runat="server"></asp:literal>
    <asp:literal id="bootbox_min_js" runat="server"></asp:literal>

    <style>
        /* Formateamos el body para que se apliquen nuestros stilos perfect (-;*/
        body{margin: 0;padding: 0;box-sizing:border-box;}
        .padd{padding:10px;}
        /* Div Principal*/
        .principal{max-width:650px;width:100%;border: 2px solid black;height: auto;margin-top: 2%;background-color: #efefef;}
        .img_logo img{width: 100%;}
        .contenido{margin-top:2.5%!important;margin:auto;max-width:500px;width:100%;margin-bottom: 2.5% !important;}
    </style>
</head>
<body> 
    <div class="container-fluid principal verde">
        <div class="row img_logo">
            <img src="img/banner_novonordisk.jpg" />
        </div>
        <div class="row contenido padd">
            <h3>Bienvenido </h3>
            <p> Esto es un pre formato de como se debería de quedar el email que vamos a enviar.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<br />
                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <br />
                Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <br />
                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        </div>
    </div>
</body>
</html>


