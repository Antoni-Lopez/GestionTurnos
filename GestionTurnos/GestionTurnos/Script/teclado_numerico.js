// JavaScript Document

//Acciones tras cargar la página
window.onload = function () {
    mostrarEnPantalla = document.getElementById("textoPantalla");
    document.onkeydown = teclado;
}

/*La pantalla de inicio muestra un 0 y solo permitirá la entrada de los 
dígitos del teclado de la calculadora a los que hemos llamado 'numero'*/
x = "0";

/*Se inician las variales en la pantalla: 1 es un número escrito por primera 
vez, mientras que 0 son las cifras que completan nuestro número*/
x1 = 1;

/*La opción de añadir un decimal. El 0 significará que el número es entero 
y el 1 indicará que no lo es*/
punto = 0;

//Función numero para registrar la escritura en pantalla
function numero(xx) {
    // Si x es igual a 0 el número que se muestra en pantalla es igual a 1.
    if (x == "0" || x1 == 1) {
        mostrarEnPantalla.innerHTML = xx;
        //Con esta variable se guarda el número y se continua con este
        x = xx;        
    }
    /*Esta operación se hace mediante una cadena de texto para que el 
      número tan solo se añada y no se sume al anterior*/
    else {
        mostrarEnPantalla.innerHTML += xx;
        x += xx;
    }
    x1 = 0
}


//Borramos todas las numeros a 0
function borradoTotal() {
    mostrarEnPantalla.innerHTML = 0;
    x = "0";
    punto = 0;
    pendiente = 0
    enCurso = "no"
}