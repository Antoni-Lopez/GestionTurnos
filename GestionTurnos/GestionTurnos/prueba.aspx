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
        .verde{border: 2px solid green;}
        .azul{border: 2px solid blue;}
        .amarillo{border: 2px solid yellow;}
        /* Div Principal*/
        .principal{max-width:650px;width:100%;border: 2px solid black;height: auto;margin-top: 2%;margin-bottom: 2%;background-color: #efefef;}
        .img_logo img{width: 100%;}
        .contenido{margin-top:2.5%!important;margin:auto;max-width:500px;width:100%;margin-bottom: 2.5% !important;}

        /* Style para la Tabla*/
        table{text-align:center;}
        .header_tabla{background-color: #20032F !important;color:#fff !important;text-align:center;}
        tr:nth-child(odd) {background-color:#F0174C !important;color: #fff;}
        tr:nth-child(even) {background-color: #f2f2f2   !important;}

        /* Media Querys para diseño Responsive.*/
        @media (max-width: 660px) {
            .principal{max-width: 450px; width: 100%;}
        }
    </style>
</head>
<body> 
    <div class="container-fluid principal verde">
        <div class="row img_logo">
            
            <img src="/img/banner_novonordisk.jpg" />
        </div>
        <div class="row contenido padd">
            <h3>Bienvenido </h3>
            <p> A continuación vamos a detallarle los datos de los medicos<br />
                que usted tiene a su cargo:
            </p>
            <table class="table table-responsive table-striped">
                <thead>
                    <tr class="header_tabla">
                        <th class="header_tabla">Nombre</th>
                        <th class="header_tabla">Apellidos</th>
                        <th class="header_tabla">Email</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>[email protected]</td>
                    </tr>
                    <tr>
                        <td>Smith</td>
                        <td>Thomas</td>
                        <td>[email protected]</td>
                    </tr>
                    <tr>
                        <td>Merry</td>
                        <td>Jim</td>
                        <td>[email protected]</td>
                    </tr>
                    <tr>
                        <td>Merry</td>
                        <td>Jim</td>
                        <td>[email protected]</td>
                    </tr>
                    <tr>
                        <td>Merry</td>
                        <td>Jim</td>
                        <td>[email protected]</td>
                    </tr>
                    <tr>
                        <td>Merry</td>
                        <td>Jim</td>
                        <td>[email protected]</td>
                    </tr>
                    <tr>
                        <td>Merry</td>
                        <td>Jim</td>
                        <td>[email protected]</td>
                    </tr>
                    <tr>
                        <td>Merry</td>
                        <td>Jim</td>
                        <td>[email protected]</td>
                    </tr>
                    <tr>
                        <td>Merry</td>
                        <td>Jim</td>
                        <td>[email protected]</td>
                    </tr>
                    <tr>
                        <td>Merry</td>
                        <td>Jim</td>
                        <td>[email protected]</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>


