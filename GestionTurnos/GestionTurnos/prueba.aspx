<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="prueba.aspx.vb" Inherits="GestionTurnos.prueba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
        addLoadEvent(especialidad);


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
        <label for="exampleInputEmail1">Necesita Alojamiento?</label>
                    <div class="toggle-radio">
                            <input type="radio" class="input_prueba" name="radio4" id="yes" value="yes" runat="server" onclick="mostrar_ocultar_origen()" />
                            <input type="radio" class="input_prueba" name="radio4" id="no" value="no" runat="server" onclick="mostrar_ocultar_origen()" />
                            <div class="switch">
                                <label for="yes">Sí</label>
                                <label for="no">No</label>
                                <span></span>
                            </div>
                     </div>
        <div>
            <input type="radio" class="input_prueba" name="radio5" id="Radio1" value="no"  />Si
            <input type="radio" class="input_prueba" name="radio5" id="Radio21" value="no" />No
        </div>
    </form>
</body>
</html>
