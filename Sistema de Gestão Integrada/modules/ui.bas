Attribute VB_Name = "ui"
Option Explicit

Public Sub ControlSetFocus(ctrl As Control)
    If ctrl Is Nothing Then Exit Sub
    If ctrl.Visible And ctrl.Enabled Then ctrl.SetFocus
End Sub

Public Function MsgExcl(Prompt, Optional Title As String = SOFTWARE_NAME, Optional HelpFile, Optional Context) As VbMsgBoxResult
    MsgBox Prompt, vbExclamation + vbOKOnly, Title, HelpFile, Context
End Function

Public Function MsgInfo(Prompt, Optional Title As String = SOFTWARE_NAME, Optional HelpFile, Optional Context) As VbMsgBoxResult
    MsgBox Prompt, vbInformation + vbOKOnly, Title, HelpFile, Context
End Function
