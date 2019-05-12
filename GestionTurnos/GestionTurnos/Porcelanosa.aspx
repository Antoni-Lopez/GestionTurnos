<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Porcelanosa.aspx.vb" Inherits="GestionTurnos.Porcelanosa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- CSS y distintas librerias -->

    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>
    <title>Formulario PORCELANOSA</title>
    <style>        
        .verde{border: 2px solid green;}
        .rojo{border:2px solid red;}
        .azul{border: 2px solid blue;}
        /* Pre-formateamos el BODY*/
        body{padding:0;margin:0;box-sizing:border-box;}
        .logo{border: 1px solid #8f8f8f;max-width: 610px; width: 100%; margin: auto; margin-top:1.5%;height: auto;box-shadow: 0px 0px 25px 1px rgba(0,0,0,0.75);}
        .logo img{height:250px;width: 100%;}

        /* " Radio Buttons de traslado/actividades.*/
        .header_radios{max-width:610px; width:100%; margin:auto;margin-top:0.6%;}

        /* TOGGLE STYLING */
        .toggle {margin: .5% .5% .5% .5%;box-sizing: border-box;font-size: 0;display: flex;flex-flow: row nowrap;justify-content: flex-start;align-items: stretch;color: #4B9DEA;}
        .toggle input {width: 0;height: 0;position: absolute;left: -9999px;}
        .toggle input + label {width: 35%;margin: 0;padding: .75rem 2rem;box-sizing: border-box;position: relative;display: inline-block;border: solid 1px #DDD;background-color: #FFF;font-size: 1rem;line-height: 140%;font-weight: 600;text-align: center;box-shadow: 0 0 0 rgba(255, 255, 255, 0);transition: border-color .15s ease-out,  color .25s ease-out,  background-color .15s ease-out, box-shadow .15s ease-out;/* ADD THESE PROPERTIES TO SWITCH FROM AUTO WIDTH TO FULL WIDTH */flex: 0 0 50%; display: flex; justify-content: center; align-items: center;/* ----- */}
        .toggle input + label:first-of-type {border-radius: 6px 0 0 6px;border-right: none;}
        .toggle input + label:last-of-type {border-radius: 0 6px 6px 0;border-left: none;}
        .toggle input:hover + label { border-color: #213140;}
        .toggle input:checked + label {background-color: #4B9DEA;color: #FFF;box-shadow: 0 0 10px rgba(102, 179, 251, 0.5);border-color: #4B9DEA;z-index: 1;}
        .toggle input:focus + label {//outline: dotted 1px #CCC;outline-offset: .45rem;}

        /* Cuadro Principal */
        .principal{border-radius: 6px;background-color: #fff;color: #8f8f8f;font-size: 22px;border: 1px solid #8f8f8f;max-width: 610px; width: 100%; margin: auto; margin-top:1.5%;height: auto;}
@media (max-width: 800px) {
  .toggle input + label {
    padding: .75rem .25rem;
    flex: 0 0 50%;
    display: flex;
    justify-content: center;
    align-items: center;
  }
}

    </style>
    <script type="text/javascript">
        function cambio() {
            var trasla = document.getElementById("sizeWeight");
            var Acti = document.getElementById("sizeDimensions");

            if (trasla.checked == true) {
                document.getElementById("text_traslados").style.display = 'Block';
                document.getElementById("traslado1").style.display = 'Block';
                document.getElementById("traslado2").style.display = 'Block';
                document.getElementById("traslado3").style.display = 'Block';
                document.getElementById("text_Actividades").style.display = 'none';
                document.getElementById("Actividades1").style.display = 'none';
                document.getElementById("Actividades2").style.display = 'none';
                document.getElementById("Actividades3").style.display = 'none';
            }
            else {
                document.getElementById("text_traslados").style.display = 'none';
                document.getElementById("traslado1").style.display = 'none';
                document.getElementById("traslado2").style.display = 'none';
                document.getElementById("traslado3").style.display = 'none';
                document.getElementById("text_Actividades").style.display = 'Block';                
                document.getElementById("Actividades1").style.display = 'Block';
                document.getElementById("Actividades2").style.display = 'Block';
                document.getElementById("Actividades3").style.display = 'Block';
            }

        }
    </script>    
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid logo">
            <img src="img/Porcelanosa_Logo.gif" />
        </div>
        <div class="row header_radios">
            <div class="toggle">
		        <input type="radio" name="sizeBy" value="weight" id="sizeWeight" onclick="cambio()"/>
		        <label for="sizeWeight">Traslados</label>
		        <input type="radio" name="sizeBy" value="dimensions" id="sizeDimensions" onclick="cambio()"/>
		        <label for="sizeDimensions">Actividades</label>
	        </div>
        </div>
        <div class="row principal">
            <p id="text_traslados">Traslados <span style="float:right;">↓</span></p>
            <div id="traslado1" class="row rojo">Hola</div>
            <div id="traslado2" class="row verde">Hola</div>
            <div id="traslado3" class="row azul">Hola</div>
            <p id="text_Actividades">Actividades <span style="float:right;">↓</span></p>
            <div id="Actividades1" class="row rojo">Hola</div>
            <div id="Actividades2" class="row verde">Hola</div>
            <div id="Actividades3" class="row azul">Hola</div>
        </div>
    </form>
</body>
</html>
