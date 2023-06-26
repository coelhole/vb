VERSION 5.00
Begin VB.Form frmAlterarSenha 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Alterar senha"
   ClientHeight    =   2430
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5415
   Icon            =   "frmAlterarSenha.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2430
   ScaleWidth      =   5415
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdAlterarSenha 
      Caption         =   "&OK"
      Height          =   400
      Left            =   3707
      TabIndex        =   6
      Top             =   1800
      Width           =   1500
   End
   Begin VB.TextBox txtSenhaAtual 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1982
      PasswordChar    =   "*"
      TabIndex        =   1
      Top             =   180
      Width           =   3225
   End
   Begin VB.TextBox txtRepetirSenha 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1982
      PasswordChar    =   "*"
      TabIndex        =   5
      Top             =   1200
      Width           =   3225
   End
   Begin VB.TextBox txtNovaSenha 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1982
      PasswordChar    =   "*"
      TabIndex        =   3
      Top             =   690
      Width           =   3225
   End
   Begin VB.Label lblSenhaAtual 
      Alignment       =   1  'Right Justify
      Caption         =   "Senha atual"
      Height          =   285
      Left            =   207
      TabIndex        =   0
      Top             =   210
      Width           =   1600
   End
   Begin VB.Label lblRepetirSenha 
      Alignment       =   1  'Right Justify
      Caption         =   "Repetir nova senha"
      Height          =   285
      Left            =   207
      TabIndex        =   4
      Top             =   1230
      Width           =   1600
   End
   Begin VB.Label lblNovaSenha 
      Alignment       =   1  'Right Justify
      Caption         =   "Nova senha"
      Height          =   285
      Left            =   207
      TabIndex        =   2
      Top             =   720
      Width           =   1600
   End
End
Attribute VB_Name = "frmAlterarSenha"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdAlterarSenha_Click()
    If txtSenhaAtual.Text = EMPTY_STRING Then
        MsgExcl "Forneça sua senha atual!"
        ControlSetFocus txtSenhaAtual
    ElseIf txtNovaSenha.Text = EMPTY_STRING Then
        MsgExcl "Forneça a nova senha!"
        ControlSetFocus txtNovaSenha
    ElseIf txtRepetirSenha.Text = EMPTY_STRING Then
        MsgExcl "Repita a nova senha!"
        ControlSetFocus txtRepetirSenha
    Else
        If auth(username, txtSenhaAtual.Text) = AUTH_OK Then
            If txtNovaSenha.Text = txtRepetirSenha.Text Then
                resetPassword txtNovaSenha.Text
                MsgInfo "Senha alterada com sucesso!"
                Unload Me
                Set frmAlterarSenha = Nothing
            Else
                MsgExcl "Senha nova e senha nova repetida não conferem!"
                ControlSetFocus txtRepetirSenha
            End If
        Else
            MsgExcl "Senha atual fornecida inválida!"
            ControlSetFocus txtSenhaAtual
        End If
    End If
End Sub

Private Sub txtNovaSenha_KeyPress(KeyAscii As Integer)
    If KeyAscii = 32 Then
        KeyAscii = 0
    End If

    If KeyAscii = vbKeyReturn Then
        If Len(txtNovaSenha.Text) > 0 Then
            ControlSetFocus txtRepetirSenha
        End If
        KeyAscii = 0
    End If
End Sub

Private Sub txtRepetirSenha_KeyPress(KeyAscii As Integer)
    If KeyAscii = 32 Then
        KeyAscii = 0
    End If

    If KeyAscii = vbKeyReturn Then
        If Len(txtRepetirSenha.Text) > 0 Then
            ControlSetFocus cmdAlterarSenha
            cmdAlterarSenha_Click
        End If
        KeyAscii = 0
    End If
End Sub

Private Sub txtSenhaAtual_KeyPress(KeyAscii As Integer)
    If KeyAscii = 32 Then
        KeyAscii = 0
    End If

    If KeyAscii = vbKeyReturn Then
        If Len(txtSenhaAtual.Text) > 0 Then
            ControlSetFocus txtNovaSenha
        End If
        KeyAscii = 0
    End If
End Sub
