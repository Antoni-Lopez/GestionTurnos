Public Class indexIntranet2
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


        'La consulta.
        VectorSQL(0) = "SELECT Nom, Cognoms, SectorInteres FROM EEContactes WHERE idFira=" & idferia & " AND SectorInteres=" & id & ""

        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
            'Problema
        Else
            Dim idramdon As String, nombre As String, apellidos As String

            If DS.Tables(0).Rows.Count > 0 Then
                For i = 0 To DS.Tables(0).Rows.Count - 1
                    idramdon = DS.Tables(0).Rows(i).Item("SectorInteres")
                    nombre = DS.Tables(0).Rows(i).Item("Nom")
                    apellidos = DS.Tables(0).Rows(i).Item("Cognoms")

                Next

                id = id.Replace("'", "")

                If idramdon = id Then
                    'Identificamos quien a entrado en la Intranet y se lo mostramos. Primero vaciamos y luego rellenamos.
                    login_how.Text = ""
                    login_how.Text = nombre

                    'lo mismo con el número total de inscritos en el evento.
                    'realizamos 1 consulta para saber el numero total de inscritos.
                    VectorSQL(0) = "SELECT * FROM EEContactes WHERE idFira=" & idferia & ""

                    If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                        'Problema
                    Else
                        If DS.Tables(0).Rows.Count > 0 Then
                            For i = 0 To DS.Tables(0).Rows.Count - 1
                                idramdon = DS.Tables(0).Rows(i).Item("SectorInteres")
                                nombre = DS.Tables(0).Rows(i).Item("Nom")
                                apellidos = DS.Tables(0).Rows(i).Item("Cognoms")
                                If i = 0 Then
                                    inscritos.Items.Add(New ListItem("AÑADIR INSCRITO ...", "1"))
                                Else
                                    inscritos.Items.Add(New ListItem(DS.Tables(0).Rows(i).Item("Cognoms").Replace("¦", " ") & ", " & DS.Tables(0).Rows(i).Item("Nom"), idramdon))
                                End If
                            Next

                        End If
                        Dim almacenar_DS2 As String
                        almacenar_DS2 = DS.Tables(0).Rows.Count
                        preinscritos.Text = ""
                        preinscritos.Text = "Preinscritos: " + almacenar_DS2

                        'ahora es el turno de mostrar los registrados
                        Dim no_registrado As String
                        no_registrado = "true"

                        DS.Reset()

                        'La consulta.
                        VectorSQL(0) = "SELECT * FROM EEContactes WHERE idFira=" & idferia & " AND NIT='" & no_registrado & "'"

                        If Not clsBD.BaseDades(1, VectorSQL, DS) Then
                            'Problema
                        Else
                            almacenar_DS2 = DS.Tables(0).Rows.Count
                            registrados.Text = "Registrados: " + almacenar_DS2

                        End If

                    End If
                Else
                    form1.InnerHtml = ""
                    form1.InnerHtml = "<p style='padding:5px;text-align:center;margin:5px;'>Este Email no coincide con los Emails que hay nuestra Base de Datos <i class='fas fa-exclamation-circle' style='color:red;'></i></p>"
                End If

            Else
                form1.InnerHtml = ""
                form1.InnerHtml = "<p style='padding:5px;text-align:center;margin:5px;'>No existe ese Email en nuestra Base de Datos <i class='fas fa-exclamation-circle' style='color:red;'></i></p>"
            End If
        End If



    End Sub

End Class