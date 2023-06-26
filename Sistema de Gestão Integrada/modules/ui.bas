Attribute VB_Name = "ui"
Option Explicit

Public Sub ControlSetFocus(ctrl As Control)
    If ctrl Is Nothing Then Exit Sub
    If ctrl.Visible And ctrl.Enabled Then ctrl.SetFocus
End Sub

Public Function MsgExcl(Prompt, Optional Title = SOFTWARE_NAME, Optional HelpFile, Optional Context) As VbMsgBoxResult
    MsgExcl = MsgBox(Prompt, vbExclamation + vbOKOnly, Title, HelpFile, Context)
End Function

Public Function MsgExclYN(Prompt, Optional Title = SOFTWARE_NAME, Optional HelpFile, Optional Context) As VbMsgBoxResult
    MsgExclYN = MsgBox(Prompt, vbExclamation + vbYesNo, Title, HelpFile, Context)
End Function

Public Function MsgInfo(Prompt, Optional Title = SOFTWARE_NAME, Optional HelpFile, Optional Context) As VbMsgBoxResult
    MsgInfo = MsgBox(Prompt, vbInformation + vbOKOnly, Title, HelpFile, Context)
End Function

Public Function MsgInfoYN(Prompt, Optional Title = SOFTWARE_NAME, Optional HelpFile, Optional Context) As VbMsgBoxResult
    MsgInfoYN = MsgBox(Prompt, vbInformation + vbYesNo, Title, HelpFile, Context)
End Function

Public Function MsgCrit(Prompt, Optional Title = SOFTWARE_NAME, Optional HelpFile, Optional Context) As VbMsgBoxResult
    MsgCrit = MsgBox(Prompt, vbCritical + vbOKOnly, Title, HelpFile, Context)
End Function

Public Function MsgCritYN(Prompt, Optional Title = SOFTWARE_NAME, Optional HelpFile, Optional Context) As VbMsgBoxResult
    MsgCritYN = MsgBox(Prompt, vbCritical + vbYesNo, Title, HelpFile, Context)
End Function
