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
    newDatabaseConnection.ConnectionString = "DRIVER={PostgreSQL Unicode};SERVER=" & databaseHost & ";port=" & databasePort & ";DATABASE=" & databaseName & ";UID=" & databaseUser & ";PWD=" & databasePassword
End Function

Public Sub openDatabaseConnection(databaseConnection_ As ADODB.Connection)
    If Not (databaseConnection_ Is Nothing) Then
        If databaseConnection_.State = adStateClosed Then
            databaseConnection_.Open
        End If
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
    If Not (databaseConnection_ Is Nothing) Then
        If databaseConnection_.State = adStateOpen Then
            databaseConnection_.Close
        End If
    End If

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
    If Not (recordset_ Is Nothing) Then
        If recordset_.State = adStateOpen Then
            recordset_.Close
        End If
    End If

    Set recordset_ = Nothing
End Sub
