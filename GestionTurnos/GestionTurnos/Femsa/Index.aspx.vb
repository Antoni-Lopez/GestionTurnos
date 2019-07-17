Public Class Index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim clsGeneral As New ClaseGeneral
        clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String
        DS = New DataSet

        Dim mail As String, idferia As Integer, registrado As String, idioma As String
        'Recogemos el mail del usuario que esta oculto.
        mail = Request.QueryString("Email")
        registrado = Request.QueryString("registrado")
        idioma = Request.QueryString("idioma")
        idferia = "202"

        If mail = "" Or mail = Nothing Then 'Email vacio.
            If idioma = "" Or idioma = Nothing Then
                principal.Attributes.Add(“style”, ” display:none;”)
                mensaje_es.Attributes.Add(“style”, ” display:Block;”)
            Else
                If idioma = "es" Then
                    principal.Attributes.Add(“style”, ” display:none;”)
                    mensaje_es.Attributes.Add(“style”, ” display:Block;”)
                Else
                    principal.Attributes.Add(“style”, ” display:none;”)
                    mensaje_en.Attributes.Add(“style”, ” display:Block;”)
                End If
            End If

            'Response.Redirect("login.aspx")
        Else

        End If



    End Sub

End Class