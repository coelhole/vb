Attribute VB_Name = "erro"
Option Explicit

'user-defined error codes
Public Const CODE_INVALID_USERID As Long = 1001
'user-defined error messages
Public Const MSG_INVALID_USERID As String = "UserID inválido: negativo"

'other error strings
Public Const DB_CONN_FAIL As String = "A tentativa de conexão ao banco de dados falhou."

'LogError (write error to logfile)
Public Sub logError(errStr As String)
    Debug.Print errStr
End Sub

'raiseError
Public Sub raiseError(Number As Long, Optional Source, Optional Description, Optional HelpFile, Optional HelpContext)
    Err.raise Number, Source, Description, HelpFile, HelpContext
End Sub

'reraiseError
Public Sub reraiseError(errObj As ErrObject)
    If Not (errObj Is Nothing) Then
        errObj.raise errObj.Number, errObj.Source, errObj.Description, errObj.HelpFile, errObj.HelpContext
    Else
        logError "erro: reraiseError(ErrObject): obj is Nothing"
    End If
End Sub
