<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="prueba_seg.aspx.vb" Inherits="GestionTurnos.prueba_sgemented" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <!-- CSS y distintas librerias -->

    <asp:Literal ID="bootstrap_min_css" runat="server"></asp:Literal>
    <asp:Literal ID="jquery_1_9_1_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootstrap_min_js" runat="server"></asp:Literal>
    <asp:Literal ID="bootbox_min_js" runat="server"></asp:Literal>

    <link rel="stylesheet" type="text/css" href="Css/segment.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="Script/segment.js"></script>
</head>
<body>
    <form id="form1" runat="server">
            Hola
            <select class="segment-select">
                <option value="1">None</option>
                <option value="2">First</option>
                <option value="3">Second</option>
                <option value="4">Second</option>
                <option value="5">Second</option>
                <option value="6">Second</option>
            </select>
        <select class="segment-select">
            <option value="1">Yes</option>
            <option value="0">No</option>
        </select>
    </form>
    <script type="text/javascript">
        jQuery(function ($) {
            $(".segment-select").Segment();
        });
    </script>
    
</body>
</html>
