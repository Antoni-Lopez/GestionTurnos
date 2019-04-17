Public Class Formulario2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim clsGeneral As New ClaseGeneral
            clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)

            Dim IdUsuario As Integer, Rol As Integer, Agrupacion As Integer
            IdUsuario = Request.QueryString("IdUser")

            Rol = Extraer_Rol(IdUsuario)

            If Rol = 0 Then
                radio1.Checked = True
                'Extraer_BD_Delegado(IdUsuario, Rol)
            Else
                ClientScript.RegisterStartupScript(Page.GetType(), "id", "desactivar();", True)
                'Extraer_BD_Medicos(IdUsuario)
            End If
        Else

        End If
    End Sub

    Private Function Extraer_Rol(ByRef idusuario)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As New DataSet
        Dim VectorSQL(0) As String
        Dim Rol As Integer

        VectorSQL(0) = "SELECT idContacte FROM EEContactes WHERE Auto ='" & clsBD.Cometes(Left(idusuario, 100)) & "'"

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            'Problema
        Else
            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    Rol = DS.Tables(0).Rows(i).Item("idContacte")
                Next
            Else
                'No nos devuelve valores
            End If
        End If
        Return Rol
    End Function
    Private Function Extraer_Agrupacion(ByRef idusuario, ByVal Rol)

    End Function
End Class