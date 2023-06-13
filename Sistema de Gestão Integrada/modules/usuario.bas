Attribute VB_Name = "usuario"
Option Explicit

Public username As String
Public userid As Integer

Public Enum AuthStatus
    AUTH_OK = 1
    AUTH_USERNOTFOUND
    AUTH_WRONGPASSWORD
    AUTH_USERINACTIVE
    AUTH_INTERNAL
End Enum

Public Function auth(username_, password_ As String) As AuthStatus
    On Error GoTo auth_error:

    auth = AUTH_INTERNAL

    Dim rsUsuario As ADODB.Recordset
    Set rsUsuario = databaseConnection.Execute("SELECT usrid, pwdhsh, actv FROM usr.t001 WHERE usrnm = '" & username_ & "'")

    If rsUsuario.BOF Then
        auth = AUTH_USERNOTFOUND
    Else
        If Not (rsUsuario.Fields(1).Value = sha1(password_)) Then
            auth = AUTH_WRONGPASSWORD
        ElseIf Not CBool(rsUsuario.Fields(2).Value) Then
            auth = AUTH_USERINACTIVE
        Else
            username = username_
            userid = CInt(rsUsuario.Fields(0).Value)
            auth = AUTH_OK
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
