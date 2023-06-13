Attribute VB_Name = "usuario"
Option Explicit

Public username As String
Public userid As Integer

Public Function auth(username_, password_ As String) As Boolean
    On Error GoTo auth_error:

    auth = False

    Dim rsUsuario As ADODB.Recordset
    Set rsUsuario = databaseConnection.Execute("SELECT usrid, actv FROM usr.t001 WHERE usrnm = '" & username_ & "' AND encode(digest('" & password_ & "', 'sha1'), 'hex') = pwdhsh")

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

    GoTo fim

auth_error:
    If (Err.Number = -2147467259) And (Not extensionExists("pgcrypto")) Then
        databaseConnectionExecute "CREATE EXTENSION IF NOT EXISTS pgcrypto;"
        auth = auth(username_, password_)
    Else
        Err.Raise Err.Number, Err.Source, Err.Description, Err.HelpFile, Err.HelpContext
    End If

fim:
    freeRecordset rsUsuario
End Function
