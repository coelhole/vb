Attribute VB_Name = "banco"
Option Explicit

Public databaseHost As String
Public databasePort As Integer
Public databaseName As String
Public databaseUser As String
Public databasePassword As String
Public databaseConnection As ADODB.Connection

Public Function newDatabaseConnection() As ADODB.Connection
    Set newDatabaseConnection = New ADODB.Connection
    newDatabaseConnection.ConnectionString = "DRIVER={PostgreSQL Unicode}" _
        & ";SERVER=" & databaseHost _
        & ";PORT=" & databasePort _
        & ";DATABASE=" & databaseName _
        & ";UID=" & databaseUser _
        & ";PWD=" & databasePassword
End Function

Public Sub openDatabaseConnection(databaseConnection_ As ADODB.Connection, Optional instanciarSeNaoExiste As Boolean = True)
    If Not (databaseConnection_ Is Nothing) Then
        If databaseConnection_.State = adStateClosed Then
            databaseConnection_.Open
        End If
    ElseIf instanciarSeNaoExiste Then
        Set databaseConnection_ = newDatabaseConnection
        databaseConnection_.Open
    End If
End Sub

Public Sub closeDatabaseConnection(databaseConnection_ As ADODB.Connection)
    If Not (databaseConnection_ Is Nothing) Then
        If databaseConnection_.State = adStateOpen Then
            databaseConnection_.Close
        End If
    End If
End Sub

Public Sub freeDatabaseConnection(databaseConnection_ As ADODB.Connection)
    closeDatabaseConnection databaseConnection_
    Set databaseConnection_ = Nothing
End Sub

Public Sub openRecordset(recordset_ As ADODB.Recordset)
    If Not (recordset_ Is Nothing) Then
        If recordset_.State = adStateClosed Then
            recordset_.Open
        End If
    End If
End Sub

Public Sub closeRecordset(recordset_ As ADODB.Recordset)
    If Not (recordset_ Is Nothing) Then
        If recordset_.State = adStateOpen Then
            recordset_.Close
        End If
    End If
End Sub

Public Sub freeRecordset(recordset_ As ADODB.Recordset)
    closeRecordset recordset_
    Set recordset_ = Nothing
End Sub

Public Function databaseConnectionExecute(CommandText As String, Optional RecordsAffected As Long, Optional Options As Long = -1) As ADODB.Recordset
    openDatabaseConnection databaseConnection
    Set databaseConnectionExecute = databaseConnection.Execute(CommandText, RecordsAffected, Options)
End Function

Public Function extensionExists(extensionName As String) As Boolean
    Dim rsExtensionExists As ADODB.Recordset
    Set rsExtensionExists = databaseConnectionExecute("SELECT True AS ext_exists FROM pg_extension WHERE extname = '" & extensionName & "'")
    extensionExists = Not rsExtensionExists.BOF
    If extensionExists Then extensionExists = rsExtensionExists.Fields(0).Value
    freeRecordset rsExtensionExists
End Function

Public Function sha1(str As String) As String
    Dim rsSHA1 As ADODB.Recordset
    Set rsSHA1 = databaseConnectionExecute("SELECT encode(digest('" & str & "', 'sha1'), 'hex')")
    sha1 = rsSHA1.Fields(0).Value
    freeRecordset rsSHA1
End Function
