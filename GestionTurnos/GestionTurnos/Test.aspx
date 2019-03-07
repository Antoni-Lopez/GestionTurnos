<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Test.aspx.vb" Inherits="GestionTurnos.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

        <!-- CSS y distintas librerias -->
        <link href="Css/css1.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <!-- Css para las Media Querys -->
        <link href="Css/css_querys.css" rel="stylesheet" type="text/css" />

        <!-- JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
        <!-- Titulo del Website! -->
        <title>Pagina de Testeo</title>
    </head>
<body>
    <div class="jumbotron jose">
        <p class="primer_alineado">
            <img class="logo" src="img/PEINARTE-LOG0.png" />
            <h4 class="eslogan">Que no te tomen el Pelo! <i class="fas fa-cut" style="color: #CF3B9A;"></i></h4>
        </p>
        <div class="agrupados">
            <div class="panel_mostrar">
                <h3 class="ciudad">Málaga</h3>
                <p class="direccion">Cristo de la Epidemia, 52</p>
                <img class="turno" src="img/turno.png" />
                <h3 class="frase1">Get your time!</h3>
                <p class="texto_primer_panel">Solicita turno directamente o introduce tu número de móvil y te avisaremos mediante un SMS gratuito cuando te falten pocos turnos para la cita...</p>
                <div class="estado_servicio">
                    <p class="p_estado_servicio">SERVICIO ACTIVO</p> 
                </div>
                <p class="info_web">Peinarte.net</p>
            </div>
            <a class="panel_mostrar2"  title="Solicita tu Turno." href="#">
                <i class="far fa-clock"></i>
                <p class="boton_solicitar">SOLICITA TURNO</p>
            </a>
            <div class="panel_mostrar3">
                continuamos2
            </div>
            <div class="panel_mostrar4">
                continuamos3
            </div>
        </div>
        
    </div>
    <form id="form1" runat="server">
        Holaaaaaa José!
        Muy buenas toni. Funciona o no?
        Pues este comentario solo deberia estar en el ordenador de jose.
        hola
    </form>

      
</body>
</html>
