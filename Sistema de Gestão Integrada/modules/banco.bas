Attribute VB_Name = "banco"
Option Explicit

Public Function newDBConn() As ADODB.Connection
    Set newDBConn = New ADODB.Connection
    newDBConn.ConnectionString = "DRIVER={PostgreSQL Unicode};SERVER=" & databaseHost & ";port=" & databasePort & ";DATABASE=" & databaseName & ";UID=" & databaseUser & ";PWD=" & databasePassword
End Function

Public Function auth(username_, password_ As String) As Boolean
    auth = False

    Dim databaseConn As ADODB.Connection
    Set databaseConn = newDBConn

    databaseConn.Open

    Dim rsUSR As ADODB.Recordset
    Set rsUSR = databaseConn.Execute("select ""USRID"", ""ACTV"" from ""USR"".""001"" where ""USRNM"" = '" & username_ & "' and encode(digest('" & password_ & "', 'sha1'), 'hex') = ""PWDHSH""")

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

    rsUSR.Close
    Set rsUSR = Nothing

    databaseConn.Close
    Set databaseConn = Nothing
End Function
