<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Pay.aspx.vb" Inherits="GestionTurnos.Pay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" action="https://securepayments.sandbox.paypal.com/webapps/HostedSoleSolutionApp/webflow/sparta/hostedSoleSolutionProcess" runat="server" method="post">
        <input type="hidden" name="cmd" value="_hosted-payment" />
        <input type="hidden" name="subtotal" value="50" />
        <input type="hidden" name="business" value="ARGQmbVLST4B3w3mX1IJiczvmNQsSTW5nQ_idLrz2CnlLWUvPwwbCylI4B4KLzEnQLu9rcJ9NJ5FJeVg" />
        <input type="hidden" name="paymentaction" value="sale" />
        <input type="hidden" name="currency_code" value="EUR" />
        <input type="hidden" name="return" value="https://192.168.1.15:45458/Pay.aspx" />
        <input type="submit" name="METHOD" value="Pay" />
        <div>
        </div>
    </form>
</body>
</html>
