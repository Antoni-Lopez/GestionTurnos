//Añadimos la imagen de carga en el contenedor
$('#miButton').html('Recibiendo Respuesta<img src="img/ajax-loader.gif" alt="loading" /><br/>');

var redireccionarPagina() {
    window.location = "http://localhost:44341/Porcelanosa.aspx?mail=jsmateo@towerplane.com";
}
setTimeout("redireccionarPagina()", 2000);