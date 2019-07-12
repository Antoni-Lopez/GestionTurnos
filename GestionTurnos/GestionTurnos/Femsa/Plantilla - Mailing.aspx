<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Plantilla - Mailing.aspx.vb" Inherits="GestionTurnos.Plantilla___Mailing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Plantilla Mailing</title>
    <style type="text/css">
        .col-xs-1,.col-xs-10,.col-xs-11,.col-xs-12,.col-xs-2,.col-xs-3,.col-xs-4,.col-xs-5,.col-xs-6,.col-xs-7,.col-xs-8,.col-xs-9{position:relative;min-height:1px;padding-right:15px;padding-left:15px}
        .col-xs-1,.col-xs-10,.col-xs-11,.col-xs-12,.col-xs-2,.col-xs-3,.col-xs-4,.col-xs-5,.col-xs-6,.col-xs-7,.col-xs-8,.col-xs-9{float:left}
        .col-xs-12{width:100%}
        .col-xs-11{width:91.66666667%}
        .col-xs-10{width:83.33333333%}
        .col-xs-9{width:75%}
        .col-xs-8{width:66.66666667%}
        .col-xs-7{width:58.33333333%}
        .col-xs-6{width:50%}
        .col-xs-5{width:41.66666667%}
        .col-xs-4{width:33.33333333%}
        .col-xs-3{width:25%}
        .col-xs-2{width:16.66666667%}
        .col-xs-1{width:8.33333333%}
        .container-fluid {padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;}
        .row {margin-right: -15px;margin-left: -15px;}

        .banner_img{display:block;margin-right:auto;margin-left:auto;margin-top:1.5%;max-width:845px;width:100%;}
        .banner_img img{max-width:850px;box-shadow: 0px 0px 25px rgba(0, 0, 0, 1);}

        .cont_principal{max-width:815px;width:100%;display:block;margin-left:auto;margin-right:auto;margin-top:0;height:200px;}
        .centrado{margin-left:0;width:100%;}

        
        .verde{border:green solid 2px;}
        .azul{border:blue solid 2px;}
        .rojo{border:red solid 2px;}
        .amarillo{border:yellow solid 2px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid banner_img">
            <img src="img/banner.jpg" />
        </div>
        <div class="container-fluid cont_principal verde">
            <div class="row header azul">
                Esto es la cabecera
            </div>
        </div>
    </form>
</body>
</html>
