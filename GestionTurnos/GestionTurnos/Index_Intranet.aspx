

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <!-- CSS y distintas librerias -->
    <link href="css/intranet.css" rel="stylesheet" type="text/css" />
    <link href="css/css_querys.css" rel="stylesheet" type="text/css" />

    <title>Acceso a Intranet de Gestion de Turnos.</title>
</head>
<body>
    <h2 class="Titulo">Intranet de Gestión de Turnos</h2>
    <div class="cuadro_central">
        <form id="form_acceso"  runat="server">
            <legend class="titulo_formu">Identificación</legend>
            <div class="formu_acceso">
                <div class="estructura">
                    <label for="nombre_pass" class="usuario">
                        <p class="mail">Email :</p>
                        <p class="pass">Password :</p>
                    </label>
                    <input type="email" class="correo" name="email" placeholder="Introduzca su email: ejemplo@towerplane.com" required />
                    <input type="password" class="contrasenia" name="email" required />
                </div>
                <input type="checkbox" class="recordar" id="id-espada" name="recordar_email" value="1"><p class="chekbox">Recordar Email</p>
                <input type="submit" value="Enviar" class="enviar">

            </div>
        </form>
    </div>
    
</body>
</html>
