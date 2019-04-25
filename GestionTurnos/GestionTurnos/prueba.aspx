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


        /* Colores para ver visualmente que realiza cada nomenclatura de BootStrap.*/
        .verde {border: 2px solid green;}
        .rojo {border: 2px solid red;}
        .amarillo {border: 2px solid yellow;}
        .azul {border: 2px solid blue;}
        .rosa {border: 2px solid pink;}

        /* Varios */
        .margen{margin:auto;}
        .pad{padding:5px;}
        .padd{padding:10px;}
        .centro{text-align: center;}
        .altura{height: 100px;}

        /* Estilos Radio Buttons personalizados de Medico. */
        .switch {position: absolute;top: 135%;left: 50%;width: 150px;height: 50px;text-align: center;margin: -30px 0 0 -75px;background: #00bc9c;transition: all 0.2s ease;border-radius: 25px;}
        .switch1{position: absolute;top: 66%;left: 50%;width: 150px;height: 50px;text-align: center;margin: -30px 0 0 -75px;background: #00bc9c;transition: all 0.2s ease;border-radius: 25px;}
        .switch2 {position: absolute;top: 66%;left: 50%;width: 150px;height: 50px;text-align: center;margin: -30px 0 0 -75px;background: #00bc9c;transition: all 0.2s ease;border-radius: 25px;}
        .switch4 {position: absolute;top: 66%;left: 50%;width: 150px;height: 50px;text-align: center;margin: -30px 0 0 -75px;background: #00bc9c;transition: all 0.2s ease;border-radius: 25px;}
        .switch span, .switch1 span,.switch2 span,.switch4 span {position: absolute;width: 20px;height: 4px;top: 50%;left: 50%;margin: -2px 0px 0px -4px;background: #fff;display: block;transform: rotate(-45deg);transition: all 0.2s ease;}
        .switch span:after,.switch1 span:after,.switch2 span:after,.switch4 span:after {content: "";display: block;position: absolute;width: 4px;height: 12px;margin-top: -8px;background: #fff;transition: all 0.2s ease;}
        .input_prueba {display: none;}
        .switch label, .switch1 label, .switch2 label, .switch4 label {cursor: pointer;color: rgba(0,0,0,0.2);width: 60px;line-height: 50px;transition: all 0.2s ease;}
        .switch1 label {margin-left: -54%;}
        label[for=yes],label[for=yes1], label[for=ConsentimientoS], label[for=transporte_medic_si],label[for=transporte_medic_si1],label[for=Asistencia_si] {position: absolute;left: 0px;height: 20px;}
        label[for=no],label[for=no1], label[for=ConsentimientoN], label[for=transporte_medic_no],label[for=transporte_medic_no1],label[for=Asistencia_no] {position: absolute;right: 0px;}
        #no:checked ~ .switch,#no1:checked ~ .switch, #ConsentimientoN:checked ~ .switch1, #transporte_medic_no:checked ~ .switch2,#transporte_medic_no1:checked ~ .switch2,#Asistencia_no:checked ~ .switch4 {background: #eb4f37;}
        #no:checked ~ .switch span,#no1:checked ~ .switch span,#ConsentimientoN:checked ~ .switch1 span,#transporte_medic_no:checked ~ .switch2 span,#transporte_medic_no1:checked ~ .switch2 span, #Asistencia_no:checked ~ .switch4 span {background: #fff;margin-left: -8px;}
        #no:checked ~ .switch span:after,#no1:checked ~ .switch span:after,#ConsentimientoN:checked ~ .switch1 span:after ,#transporte_medic_no:checked ~ .switch2 span:after,#transporte_medic_no1:checked ~ .switch2 span:after,#Asistencia_no:checked ~ .switch4 span:after {background: #fff;height: 20px;margin-top: -8px;margin-left: 8px;}
        #yes:checked ~ .switch label[for=yes],#yes1:checked ~ .switch label[for=yes1], #ConsentimientoSi:checked ~ .switch1 label[for=ConsentimientoSi], #transporte_medic_si:checked ~ .switch2 label[for=transporte_medic_si],#transporte_medic_si1:checked ~ .switch2 label[for=transporte_medic_si1], #Asistencia_si:checked ~ .switch4 label[for=Asistencia_si] {color: #fff;}
        #no:checked ~ .switch label[for=no],#no1:checked ~ .switch label[for=no1], #ConsentimientoN:checked ~ .switch1 label[for=ConsentimientoN], #transporte_medic_no1:checked ~ .switch2 label[for=transporte_medic_no1], #transporte_medic_no:checked ~ .switch2 label[for=ConsentimientoN], #Asistencia_no:checked ~ .switch4 label[for=Asistencia_no] {color: #fff;}





.funkyradio {
  clear: both;
  overflow: hidden;
}

.funkyradio label {
  width: 100%;
  border-radius: 3px;
  border: 1px solid #D1D3D4;
  font-weight: normal;
}

.funkyradio input[type="radio"]:empty {
  display: none;
}

.funkyradio input[type="radio"]:empty ~ label{
  position: relative;
  line-height: 2.5em;
  text-indent: 3.25em;
  margin-top: 2em;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}

.funkyradio input[type="radio"]:empty ~ label:before {
  position: absolute;
  display: block;
  top: 0;
  bottom: 0;
  left: 0;
  content: '';
  width: 2.5em;
  background: #D1D3D4;

  border-radius: 3px 0 0 3px;
}

.funkyradio input[type="radio"]:hover:not(:checked) ~ label {
  color: #888;
}

.funkyradio input[type="radio"]:hover:not(:checked) ~ label:before {
  content: '\2714';
  text-indent: .9em;
  color: #C2C2C2;
}

.funkyradio input[type="radio"]:checked ~ label{
  color: #777;
}

.funkyradio input[type="radio"]:checked ~ label:before {
  content: '\2714';
  text-indent: .9em;
  color: #333;
  background-color: #ccc;
}

.funkyradio input[type="radio"]:focus ~ label:before {
  box-shadow: 0 0 0 3px #999;
}

.funkyradio-success input[type="radio"]:checked ~ label:before {
  color: #fff;
  background-color: #5cb85c;
}

.funkyradio-danger input[type="radio"]:checked ~ label:before {
  color: #fff;
  background-color: #d9534f;
}

.chorra{max-width: 660px;width: 100%;padding: 10px;margin: auto !important;border: 2px solid black;}
    </style>
     <script type="text/javascript">
        //funcion que nos realiza la acción que queramos en la carga de la web.
        function addLoadEvent(func) { 
            var oldonload = window.onload; 
            if (typeof window.onload != 'function') { 
                window.onload = func; 
            } 
            else { 
                window.onload = function() { 
                    oldonload(); 
                    func(); 
                } 
            } 
        } 
        addLoadEvent();


        //nos quedamos con el valor seleccionado en el ComboBox
        //y lo pasamos a un input que nos creamos.
         function especialidad() {
             var nombre = prompt("Dime Si o No?");
             var nombre2 = prompt("Dime Si o No?");
             var prueba = document.getElementById("Asistencia_si");
             var prueba2 = document.getElementById("Asistencia_no");
             var prueba3 = document.getElementById("yes");
             var prueba4 = document.getElementById("no");

             if (nombre == 'Si' || nombre == 'si') {
                 prueba.checked = true;
             }
             else {
                 prueba2.checked = true;
             }
             if (nombre2 == 'Si' || nombre2 == 'si') {
                 prueba3.checked = true;
             }
             else {
                 prueba4.checked = true;
             }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!--
        <div class="col-md-6 padd input_aloja_respon">
            <div class="toggle-radio1">
                <input type="radio" class="input_prueba" name="radio2" id="Asistencia_si" value="Asistencia_si" runat="server" onclick="mostrar_ocultar_origen()" />
                <input type="radio" class="input_prueba" name="radio2" id="Asistencia_no" value="Asistencia_no" runat="server" onclick="mostrar_ocultar_origen()" />
                <div class="switch4">
                    <label for="Asistencia_si">Sí</label>
                    <label for="Asistencia_no">No</label>
                    <span></span>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <h4>Radio Buttons</h4>
            <div class="funkyradio">
                <div class="col-md-6 funkyradio-success">
                    <input type="radio" name="radio" id="radio3" />
                    <label for="radio3">Si</label>
                </div>
                <div class="col-md-6 funkyradio-danger">
                    <input type="radio" name="radio" id="radio4" />
                    <label for="radio4">No</label>
                </div>
            </div>
        </div>
        -->
        <div class="container-fluid chorra">
            <div class="col-md-6 rojo">
                <h4>Consentimiento Firmado</h4>
                <div class="funkyradio">
                    <div class="col-md-6 funkyradio-success">
                        <input type="radio" name="miprueba" id="miprueba" />
                        <label for="miprueba">Si</label>
                    </div>
                    <div class="col-md-6 funkyradio-danger">
                        <input type="radio" name="miprueba" id="miprueba2" />
                        <label for="miprueba2">No</label>
                    </div>
                </div>
            </div>
            <div class="col-md-6 amarillo">
                <h4>Consentimiento Firmado</h4>
                <div class="funkyradio">
                    <div class="col-md-6 funkyradio-success">
                        <input type="radio" name="transporte" id="miprueba3" />
                        <label for="miprueba3">Si</label>
                    </div>
                    <div class="col-md-6 funkyradio-danger">
                        <input type="radio" name="transporte" id="miprueba4" />
                        <label for="miprueba4">No</label>
                    </div>
                </div>
            </div>
            <div class="col-md-6 rojo">
                <h4>Consentimiento Firmado</h4>
                <div class="funkyradio">
                    <div class="col-md-6 funkyradio-success">
                        <input type="radio" name="alergia" id="miprueba5" />
                        <label for="miprueba5">Si</label>
                    </div>
                    <div class="col-md-6 funkyradio-danger">
                        <input type="radio" name="alergia" id="miprueba6" />
                        <label for="miprueba6">No</label>
                    </div>
                </div>
            </div>
            <div class="col-md-6 amarillo">
                <h4>Consentimiento Firmado</h4>
                <div class="funkyradio">
                    <div class="col-md-6 funkyradio-success">
                        <input type="radio" name="otromas" id="miprueba7" />
                        <label for="miprueba7">Si</label>
                    </div>
                    <div class="col-md-6 funkyradio-danger">
                        <input type="radio" name="otromas" id="miprueba8" />
                        <label for="miprueba8">No</label>
                    </div>
                </div>
            </div>            
        </div>
    </form>
</body>
</html>
