Attribute VB_Name = "banco"
Option Explicit

Public Function newDatabaseConnection() As ADODB.connection
    Set newDatabaseConnection = New ADODB.connection
    newDatabaseConnection.ConnectionString = "DRIVER={PostgreSQL Unicode};SERVER=" & databaseHost & ";port=" & databasePort & ";DATABASE=" & databaseName & ";UID=" & databaseUser & ";PWD=" & databasePassword
End Function

Public Sub closeDatabaseConnection(databaseConnection_ As ADODB.connection)
    If (Not (databaseConnection_ Is Nothing)) And (databaseConnection_.State = adStateOpen) Then
        databaseConnection_.Close
    End If
End Sub

Public Sub freeDatabaseConnection(databaseConnection_ As ADODB.connection)
    If (Not (databaseConnection_ Is Nothing)) And (databaseConnection_.State = adStateOpen) Then
        databaseConnection_.Close
    End If

    Set databaseConnection_ = Nothing
End Sub

Public Sub closeRecordset(recordset_ As ADODB.Recordset)
    If (Not (recordset_ Is Nothing)) And (recordset_.State = adStateOpen) Then
        recordset_.Close
    End If
End Sub

Public Sub freeRecordset(recordset_ As ADODB.Recordset)
    If (Not (recordset_ Is Nothing)) And (recordset_.State = adStateOpen) Then
        recordset_.Close
    End If

    Set recordset_ = Nothing
End Sub

Public Function auth(username_, password_ As String) As Boolean
    auth = False

    Dim databaseConnection As ADODB.connection
    Set databaseConnection = newDatabaseConnection

    databaseConnection.Open

    Dim rsUSR As ADODB.Recordset
    Set rsUSR = databaseConnection.Execute("select ""USRID"", ""ACTV"" from ""USR"".""001"" where ""USRNM"" = '" & username_ & "' and encode(digest('" & password_ & "', 'sha1'), 'hex') = ""PWDHSH""")

    If rsUSR.BOF Then
        MsgBox "Não há um usuário" & vbCrLf & "com o nome de usuário e a senha fornecidos", vbExclamation, SOFTWARE_NAME
    Else
        If Not CBool(rsUSR.Fields(1).Value) Then
            MsgBox "Usuário não ativo!", vbExclamation, SOFTWARE_NAME
        Else
            username = username_
            userid = CInt(rsUSR.Fields(0).Value)
            auth = True
        End If
    End If

    freeRecordset rsUSR

    freeDatabaseConnection databaseConnection
End Function
