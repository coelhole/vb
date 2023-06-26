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
On Error GoTo auth_error

    auth = AUTH_INTERNAL

    Dim rsUsuario As ADODB.Recordset
    Set rsUsuario = databaseConnectionExecute("SELECT usrid, pwdhsh, actv FROM usr.t001 WHERE usrnm = '" & username_ & "'")

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
        ReRaise Err
    End If
fim:
    freeRecordset rsUsuario
End Function

Public Sub resetPassword(newPassword As String, Optional userid_ As Long)
    If userid_ < 0 Then Err.Raise CODE_INVALID_USERID, "usuario.resetPassword(string,long)", MSG_INVALID_USERID
    userid_ = IIf(userid_ = 0, userid, userid_)
    databaseConnectionExecute "UPDATE usr.t001 SET pwdhsh = encode(digest('" & newPassword & "', 'sha1'), 'hex') WHERE usrid = " & userid_
End Sub
