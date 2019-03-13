<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PlantillaBootstrap.aspx.vb" Inherits="GestionTurnos.PlantillaBootstrap" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <script type="text/javascript">
        function LlançaAvis(Text) {
            bootbox.alert({ title: "Gestión de turnos", message: Text });
        }
    </script>
    <title></title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">
    <asp:literal id="bootstrap_min_css" runat="server"></asp:literal>
    <asp:literal id="jquery_1_9_1_min_js" runat="server"></asp:literal>
    <asp:literal id="bootstrap_min_js" runat="server"></asp:literal>
    <asp:literal id="bootbox_min_js" runat="server"></asp:literal>
    <style type="text/css">
.glyphicon-refresh-animate {
    -animation: spin .7s infinite linear;
    -ms-animation: spin .7s infinite linear;
    -webkit-animation: spinw .7s infinite linear;
    -moz-animation: spinm .7s infinite linear;
}
@keyframes spin {
    from { transform: scale(1) rotate(0deg);}
    to { transform: scale(1) rotate(360deg);}
} 
@-webkit-keyframes spinw {
    from { -webkit-transform: rotate(0deg);}
    to { -webkit-transform: rotate(360deg);}
}
@-moz-keyframes spinm {
    from { -moz-transform: rotate(0deg);}
    to { -moz-transform: rotate(360deg);}
}
.modal {
  text-align: center;
  padding: 0!important;
}
.modal:before {
  content: '';
  display: inline-block;
  height: 100%;
  vertical-align: middle;
  margin-right: -4px;
}
.modal-dialog {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}
.no-click {pointer-events: none;}
.modal-header {background-color: #003466; color: #FFFFFF; border-top-left-radius: 5px; border-top-right-radius: 5px}
.modal-body {font-family: helvetica, arial; font-size: 15px}
.panel {font-family: helvetica, arial; box-shadow: none; border: solid 1px #014185; color: #003466;}
.panel-body {background-color: #F0F0F0; padding: 5px;}
.panel-heading {font-family: helvetica, arial; font-size: 15px; font-weight: bold; background-color:#014185; color: #FFFFFF; text-align: center}
.titol1 {font-size: 13px; font-weight: bold; color: #FFFFFF; background-color:#003466; padding: 3px}
.caixa {font-size: 14px; font-weight: bold; color: #003466; background-color:#FFFFFF; width: 100%;min-width: 75px; max-width: 140px; padding-left: 3px; padding-right: 3px; text-align: center;}
.btnBoto1 {box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.8); font-size: 12px; font-weight: bold; background-color: #003466; color: #FFFFFF;}
.btnBoto1:hover {background-color: #418501; color: #FFFFFF;}
.row {padding: 0px; margin: 0px}
@media (max-width: 767px)
{
    .col-xs-6_1 { width: 100% }
}
</style>
</head>
<body style="background-color:#FFFFFF">
    <div class="container-fluid" style="max-width: 800px;margin:auto; padding: 10px;">
        <form id="Form1" method="post" runat="server" class="form-horizontal">
            
	        <div class="panel" style="box-shadow: 0px 0px 7px rgba(0, 0, 0, 0.8); border-radius: 10px">
                <div class="panel-heading" style="display: none"></div>
                <div class="panel-body">
                    <div class="row"><img class="img-responsive center-block" src="img/PEINARTE-LOG0.png" /></div>
                    <div class="row">
                        <div class="col-xs-6" style="background-color: #DDDDDD">Parte 1</div>
                        <div class="col-xs-6" style="background-color: #999999">Parte 2</div>
                    </div>
                </div>
            </div>
            <br /><br />&nbsp;
        </form>
    </div>
    </body>
</html>