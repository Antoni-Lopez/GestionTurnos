<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportCsvSql.aspx.vb" Inherits="GestionTurnos.ImportCsvSql" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Importing CSV to SQL Server Demo</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" />  
        <asp:Button ID="btnImport" runat="server" Text="Import" OnClick="btnImport_Click"/>  
        <br />  
        <asp:Label ID="Label1" runat="server" ForeColor="Blue" />  
        <br />  
        <asp:Label ID="Label2" runat="server" ForeColor="Green" />  
        <br />  
        <asp:Label ID="lblError" runat="server" ForeColor="Red" /> 
    </div>
    </form>
</body>
</html>