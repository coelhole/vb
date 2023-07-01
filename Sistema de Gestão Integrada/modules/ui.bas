Attribute VB_Name = "ui"
Option Explicit

Public Sub Fcs(ctrl As Control)
    If ctrl Is Nothing Then
        Exit Sub
    End If

    If ctrl.Visible And ctrl.Enabled Then
        ctrl.SetFocus
    End If
End Sub

Public Function IsTextControl(ctrl As Control) As Boolean
    IsTextControl = False

    If TypeOf ctrl Is TextBox Then
        If Not ctrl.Locked Then
            IsTextControl = True
        End If
    ElseIf TypeOf ctrl Is ComboBox Then
        If (Not ctrl.Locked) And (ctrl.Style <> vbComboDropdownList) Then
            IsTextControl = True
        End If
    End If
End Function

Public Sub FcsEnd(ctrl As Control)
    If ctrl.Visible And ctrl.Enabled Then
        ctrl.SetFocus

        If IsTextControl(ctrl) Then
            ctrl.SelStart = Len(ctrl.Text)
        End If
    End If
End Sub

Public Sub TrmFcs(ctrl As Control)
    If ctrl.Visible And ctrl.Enabled Then
        If IsTextControl(ctrl) Then
            ctrl.Text = Trim(ctrl.Text)
        End If

        ctrl.SetFocus
    End If
End Sub

Public Sub TrmFcsEnd(ctrl As Control)
    If ctrl.Visible And ctrl.Enabled Then
        ctrl.SetFocus

        If IsTextControl(ctrl) Then
            ctrl.Text = Trim(ctrl.Text)
            ctrl.SelStart = Len(ctrl.Text)
        End If
    End If
End Sub

Public Sub chk_revelar_senha_click(txtbx As TextBox, chkbx As CheckBox)
    If chkbx.Value = vbChecked Then
        txtbx.PasswordChar = EMPTY_STRING
        chkbx.ToolTipText = TOOLTIP_OCULTAR_SENHA
    Else
        txtbx.PasswordChar = PASSWORD_CHAR
        chkbx.ToolTipText = TOOLTIP_REVELAR_SENHA
    End If
End Sub

Public Sub ShowModal(frm As Form, Optional owner = Nothing)
    If Not (frm Is Nothing) Then
        frm.Show vbModal, owner
    End If
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
