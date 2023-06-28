Attribute VB_Name = "erro"
Option Explicit

'user-defined error codes
Public Const CODE_INVALID_USERID As Long = 1001
'user-defined error messages
Public Const MSG_INVALID_USERID As String = "UserID inválido: negativo"

'other error strings
Public Const DB_CONN_FAIL As String = "A tentativa de conexão ao banco de dados falhou."

'LogError (write error to logfile)
Public Sub LogError(errStr As String)
    Debug.Print errStr
End Sub

'RaiseError
Public Sub RaiseError(Number As Long, Optional Source, Optional Description, Optional HelpFile, Optional HelpContext)
    Err.Raise Number, Source, Description, HelpFile, HelpContext
End Sub

'ReraiseError
Public Sub ReraiseError(errObj As ErrObject)
    If Not (errObj Is Nothing) Then
        errObj.Raise errObj.Number, errObj.Source, errObj.Description, errObj.HelpFile, errObj.HelpContext
    Else
        LogError "erro: ReraiseError(ErrObject): errObj is Nothing"
    End If
End Sub
