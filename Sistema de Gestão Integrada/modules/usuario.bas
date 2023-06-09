Attribute VB_Name = "usuario"
Option Explicit

Public username As String
Public userid As Integer

Public Function auth(username_, password_ As String) As Boolean
    auth = False

    Dim rsUsuario As ADODB.Recordset
    Set rsUsuario = databaseConnection.Execute("select ""USRID"", ""ACTV"" from ""USR"".""001"" where ""USRNM"" = '" & username_ & "' and encode(digest('" & password_ & "', 'sha1'), 'hex') = ""PWDHSH""")

    If rsUsuario.BOF Then
        MsgBox "Não há um usuário" & vbCrLf & "com o nome de usuário e a senha fornecidos", vbExclamation, SOFTWARE_NAME
    Else
        If Not CBool(rsUsuario.Fields(1).Value) Then
            MsgBox "Usuário não ativo!", vbExclamation, SOFTWARE_NAME
        Else
            username = username_
            userid = CInt(rsUsuario.Fields(0).Value)
            auth = True
        End If
    End If

    freeRecordset rsUsuario
End Function
