Imports MySql.Data

Public Class ClaseAccesoBD
    Private Const NomServidor As String = "legoland.tsc.es"
    Private Const NomBaseDades As String = "nvdsk"
    Private Const NomUsuari As String = "administrador"
    Private Const Password As String = "AdminTAP2019"

    Public Function BaseDades(ByVal QueFer As Integer, ByVal VectorQueries As Array, Optional ByRef Dades As DataSet = Nothing, Optional ByRef TornaUltimaEntrada As Integer = -1) As Boolean
        Dim MyConnection As MySqlClient.MySqlConnection
        Dim MyDataAdapter As MySqlClient.MySqlDataAdapter
        Dim MyCommand As MySqlClient.MySqlCommand
        Dim BackUpQuery As String, EsProblemaConnexio As Boolean = False
        Dim i As Integer, PosicioInicial As Integer, PosicioFinal As Integer
        Try
            PosicioFinal = 1000
            If VectorQueries.Length <= 1000 Then PosicioFinal = VectorQueries.Length
Repetim:
            BaseDades = True
            MyConnection = New MySqlClient.MySqlConnection("server=" & NomServidor & ";pooling=true;Connect Timeout=120;database=" & NomBaseDades & ";UID=" & NomUsuari & ";PWD=" & Password & ";")
            EsProblemaConnexio = True
            MyConnection.Open()
            EsProblemaConnexio = False
            Select Case QueFer
                Case 1
                    BackUpQuery = VectorQueries(0)
                    MyDataAdapter = New MySqlClient.MySqlDataAdapter(VectorQueries(0), MyConnection)
                    MyDataAdapter.Fill(Dades)
                Case 2
                    For i = PosicioInicial To PosicioFinal - 1
                        BackUpQuery = VectorQueries(i)
                        MyCommand = New MySqlClient.MySqlCommand(VectorQueries(i), MyConnection)
                        MyCommand.ExecuteNonQuery()
                        If TornaUltimaEntrada <> -1 Then
                            MyCommand.CommandText = "SELECT LAST_INSERT_ID()"
                            TornaUltimaEntrada = CInt(MyCommand.ExecuteScalar)
                        End If
                    Next
            End Select
            MyConnection.Close()
            If PosicioFinal < VectorQueries.Length Then
                PosicioInicial = PosicioFinal
                PosicioFinal += 1000
                If PosicioFinal > VectorQueries.Length Then PosicioFinal = VectorQueries.Length
                GoTo Repetim
            End If
        Catch Problema As MySqlClient.MySqlException
            BaseDades = False
            Dim VectorSQL(0) As String, Data As String
            Data = Year(Now) & Format(Month(Now), "0#") & Format(Day(Now), "0#") & Format(Hour(Now), "0#") & Format(Minute(Now), "0#") & Format(Second(Now), "0#")
            VectorSQL(0) = "INSERT INTO Problemes(IDUsuari,MissatgeSistema,Info1,Info2,Data) VALUES(100,'','','Problema a la base de dades. Les dades eren: " & Cometes(VectorSQL(0)) & ", Ex: " & Cometes(Problema.Message) & "','" & Data & "')"
            BaseDades(2, VectorSQL)
        End Try
    End Function

    Public Shared Function Cometes(ByVal Valor As String) As String
        Cometes = Replace(Valor, "'", "''")
        Cometes = Replace(Cometes, Chr(34), "''")
    End Function

End Class
