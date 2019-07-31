<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="subirfiles.aspx.vb" Inherits="GestionTurnos.subirfiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" enctype="multipart/form-data" action="" method="POST" runat="server">
        <fieldset>Hola</fieldset>
        <label for="subil"><input type="file" id="subil_file" runat="server"/></label>
        <button type="submit" id="envial">Subir archivo</button>
    </form>
    <script>
        $(function () {
    $("#<% = subil_file.ClientID %>").click(function () {
        var file = document.getElementById('<% = subil_file.ClientID %>').value;
        if (file == null || file == '') {
            alert('Seleccione el archivo a subir.');
            return false;
        }
        //DEFINE UN ARRAY CON LAS EXTENSIONES DE ARCHIVOS VALIDAS
        var extArray = new Array(".pdf");
        //SE EXTRAE LA EXTENSION DEL ARCHIVO CON EL PUNTO INCLUIDP 
        var ext = file.slice(file.indexOf(".")).toLowerCase();
 
        //SE RECORRE EL ARRAY PARA VERIFICAR SI LA EXTENSSION DEL ARCHIVO ESTA DEFINIDA 
        //EN EL ARRAY QUE CONTIENE LAS EXTENSIONES VALIDAS
        for (var i = 0; i < extArray.length; i++) {
            if (extArray[i] == ext) {
                alert("El archivo SI es una imagen.");
                return true;
            }
        }
        alert("El archivo NO es una imagen");
        return false;
    })
})
    </script>
</body>
</html>
