Attribute VB_Name = "erro"
Option Explicit

'user-defined error codes
Public Const CODE_INVALID_USERID As Long = 1001
'user-defined error messages
Public Const MSG_INVALID_USERID As String = "UserID inválido: negativo"

'other error strings
Public Const DB_CONN_FAIL As String = "A tentativa de conexão ao banco de dados falhou."

'error to logfile
Public Sub err_logfile(err As String)
    Debug.Print err
End Sub

'reraise
Public Sub ReRaise(errObj As ErrObject)
    If Not (errObj Is Nothing) Then
        errObj.Raise errObj.Number, errObj.Source, errObj.Description, errObj.HelpFile, errObj.HelpContext
    Else
        err_logfile "erro: ReRaise(ErrObject): errObj is Nothing"
    End If
End Sub
