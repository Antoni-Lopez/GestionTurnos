<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Chorra.aspx.vb" Inherits="GestionTurnos.Chorra" %>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>MDN Example</title>
<script type="text/javascript">
    function PrintWindow() {

        var isIE11 = !!navigator.userAgent.match(/Trident.*rv[ :]*11\./);
        if (navigator.appName == "Microsoft Internet Explorer" || isIE11== true) {

            var PrintCommand = '<OBJECT ID="PrintCommandObject" WIDTH=0 HEIGHT=0 ';
            PrintCommand += 'CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
            document.body.insertAdjacentHTML('beforeEnd', PrintCommand);
            PrintCommandObject.ExecWB(6, 2); PrintCommandObject.outerHTML = "";
            window.close();

        }

        else {
              window.print();
        }
        function Imprimir()
        {
            var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
            document.body.insertAdjacentHTML('beforeEnd', WebBrowser); WebBrowser1.ExecWB(6, 2); WebBrowser1.outerHTML = ""; 
        }
      }
</script>
</head>

<body>
  <p><span onclick="PrintWindow();" style="cursor:pointer;text-decoration:underline;color:#0000ff;">Print external page!</span></p>
  <p><span onclick="Imprimir();" style="cursor:pointer;text-decoration:underline;color:#0000ff;">Imprimir external page!</span></p>
</body>
</html>