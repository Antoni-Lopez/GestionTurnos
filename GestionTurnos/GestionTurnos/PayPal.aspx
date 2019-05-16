<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PayPal.aspx.vb" Inherits="GestionTurnos.PayPal" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Add meta tags for mobile and IE -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
    <!-- Preparamos un div donde irá el botón -->
    <div id="paypal-button-container"></div>

    <!-- Incluimos el PayPal JavaScript SDK -->
    <script src="https://www.paypal.com/sdk/js?client-id=AQjOeBCn3OzBHoByhXhGgqiaoO_LpmZwbiumV0JZ3H4URf5jEC9zxlaAAdfLb4DsmSaAw-B7vQlybLls&currency=EUR"></script>

    <script>
        // Introducimos el botón dentro de #paypal-button-container
        paypal.Buttons({

            // Set up the transaction
            createOrder: function (data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '5.00' //precio a cobrar
                        }
                    }]
                });
            },

            // Finalize the transaction
            onApprove: function (data, actions) {
                return actions.order.capture().then(function (details) {
                    // Show a success message to the buyer
                    alert('Transación completada con exito por ' + details.payer.name.given_name + '!');
                });
            }


        }).render('#paypal-button-container');
    </script>
</body>
</html>
