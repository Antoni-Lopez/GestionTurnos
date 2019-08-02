Public Class IndexIntranet
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim clsGeneral As New ClaseGeneral
        clsGeneral.MeterFicherosBootstrap(bootstrap_min_css, , jquery_1_9_1_min_js, bootstrap_min_js, , bootbox_min_js)
        Dim clsBD As New ClaseAccesoBD
        Dim DS As DataSet
        Dim VectorSQL(0) As String
        DS = New DataSet

        Dim id As String, idferia As String
        id = Request.QueryString("id")
        idferia = Request.QueryString("idferia")

        inscritos.Attributes.Add("onchange", "Registre();")


        'La consulta.
        VectorSQL(0) = "SELECT * FROM EEContactes WHERE idFira=" & idferia & ""
        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            'Problema
        Else

            Dim almacenar_DS As String
            almacenar_DS = DS.Tables(0).Rows.Count

            numero_insc.InnerHtml = almacenar_DS

            Dim nom_bd As String, ape_bd() As String, apellidos_bd As String, idramdon As String

            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    nom_bd = DS.Tables(0).Rows(i).Item("Nom")
                    apellidos_bd = DS.Tables(0).Rows(i).Item("Password")
                    idramdon = DS.Tables(0).Rows(i).Item("SectorInteres")

                    inscritos.Items.Add(New ListItem(DS.Tables(0).Rows(i).Item("Cognoms").Replace("¦", " ") & ", " & DS.Tables(0).Rows(i).Item("Nom"), idramdon))
                Next
            End If





            DS.Reset()

            Dim no_registrado As String
            no_registrado = "true"


            'La consulta.
            VectorSQL(0) = "SELECT * FROM EEContactes WHERE idFira=" & idferia & " AND NIT='" & no_registrado & "'"

            If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                'Problema
            Else
                Dim almacenar_DS2 As String
                almacenar_DS2 = DS.Tables(0).Rows.Count
                numero_insc2.InnerHtml = almacenar_DS2

            End If

            'La consulta.
            VectorSQL(0) = "SELECT Nom FROM EEContactes WHERE idFira=" & idferia & " AND SectorInteres=" & id & ""

            If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                'Problema
            Else
                Dim admin_name As String
                If DS.Tables(0).Rows.Count > 0 Then
                    For i = 0 To DS.Tables(0).Rows.Count - 1
                        admin_name = DS.Tables(0).Rows(i).Item("Nom")
                    Next
                    privilegio_name.InnerHtml = admin_name
                End If
            End If
        End If
    End Sub

End Class