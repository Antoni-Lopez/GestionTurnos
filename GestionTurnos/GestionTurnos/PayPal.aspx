<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PayPal.aspx.vb" Inherits="GestionTurnos.PayPal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
</head>
<body>
    <!-- Incluimos el PayPal JavaScript SDK -->
    <script
        src="https://www.paypal.com/sdk/js?client-id=ARGQmbVLST4B3w3mX1IJiczvmNQsSTW5nQ_idLrz2CnlLWUvPwwbCylI4B4KLzEnQLu9rcJ9NJ5FJeVg&currency=EUR">
    </script>
    <form id="form1" runat="server">

        <!-- Preparamos un div donde irá el botón -->
        <div id="paypal-button-container"></div>
        <input type="hidden" name="return" value="https://friendly-bird-42.localtunnel.me/PayPal.aspx" />
        <asp:TextBox ID="jose" runat="server"></asp:TextBox>
    </form>
    <script>
        paypal.Buttons({
            createOrder: function (data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '10.00'
                        }
                    }]
                });
            },
            onApprove: function (data, actions) {
                // Capture the funds from the transaction
                return actions.order.capture().then(function (details) {
                    // Show a success message to your buyer
                    alert('Transaction completed by ' + details.payer.name.given_name);
                    handleRequest();
                });
            }
        }).render('#paypal-button-container');





    </script>
</body>
</html>
