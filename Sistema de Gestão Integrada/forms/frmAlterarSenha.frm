VERSION 5.00
Begin VB.Form frmAlterarSenha 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Alterar senha"
   ClientHeight    =   2430
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5715
   Icon            =   "frmAlterarSenha.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2430
   ScaleWidth      =   5715
   StartUpPosition =   1  'CenterOwner
   Begin VB.CheckBox chkRevelarSenhaRepetida 
      Height          =   225
      Left            =   5310
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   1260
      Width           =   280
   End
   Begin VB.CheckBox chkRevelarSenhaNova 
      Height          =   225
      Left            =   5310
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   750
      Width           =   280
   End
   Begin VB.CheckBox chkRevelarSenhaAtual 
      Height          =   225
      Left            =   5310
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   240
      Width           =   280
   End
   Begin VB.CommandButton cmdAlterarSenha 
      Caption         =   "&OK"
      Height          =   400
      Left            =   3707
      TabIndex        =   9
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
   Begin VB.TextBox txtSenhaRepetida 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1982
      PasswordChar    =   "*"
      TabIndex        =   7
      Top             =   1200
      Width           =   3225
   End
   Begin VB.TextBox txtSenhaNova 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1982
      PasswordChar    =   "*"
      TabIndex        =   4
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
      TabIndex        =   6
      Top             =   1230
      Width           =   1600
   End
   Begin VB.Label lblNovaSenha 
      Alignment       =   1  'Right Justify
      Caption         =   "Nova senha"
      Height          =   285
      Left            =   207
      TabIndex        =   3
      Top             =   720
      Width           =   1600
   End
End
Attribute VB_Name = "frmAlterarSenha"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub chkRevelarSenhaAtual_Click()
    chk_revelar_senha_click txtSenhaAtual, chkRevelarSenhaAtual
End Sub

Private Sub chkRevelarSenhaNova_Click()
    chk_revelar_senha_click txtSenhaNova, chkRevelarSenhaNova
End Sub

Private Sub chkRevelarSenhaRepetida_Click()
    chk_revelar_senha_click txtSenhaRepetida, chkRevelarSenhaRepetida
End Sub

Private Sub cmdAlterarSenha_Click()
    If txtSenhaAtual.Text = EMPTY_STRING Then
        MsgExcl "Forneça sua senha atual!"
        Fcs txtSenhaAtual
    ElseIf txtSenhaNova.Text = EMPTY_STRING Then
        MsgExcl "Forneça a nova senha!"
        Fcs txtSenhaNova
    ElseIf txtSenhaRepetida.Text = EMPTY_STRING Then
        MsgExcl "Repita a nova senha!"
        Fcs txtSenhaRepetida
    Else
        If auth(username, txtSenhaAtual.Text) = AUTH_OK Then
            If txtSenhaNova.Text = txtSenhaRepetida.Text Then
                resetPassword txtSenhaNova.Text
                MsgInfo "Senha alterada com sucesso!"
                Unload Me
                Set frmAlterarSenha = Nothing
            Else
                MsgExcl "Senha nova e senha nova repetida não conferem!"
                FcsEnd txtSenhaRepetida
            End If
        Else
            MsgExcl "Senha atual fornecida inválida!"
            FcsEnd txtSenhaAtual
        End If
    End If
End Sub

Private Sub Form_Load()
    txtSenhaAtual.PasswordChar = PASSWORD_CHAR
    chkRevelarSenhaAtual.ToolTipText = TOOLTIP_REVELAR_SENHA
    txtSenhaNova.PasswordChar = PASSWORD_CHAR
    chkRevelarSenhaNova.ToolTipText = TOOLTIP_REVELAR_SENHA
    txtSenhaRepetida.PasswordChar = PASSWORD_CHAR
    chkRevelarSenhaRepetida.ToolTipText = TOOLTIP_REVELAR_SENHA
End Sub

Private Sub txtSenhaNova_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeySpace Then
        KeyAscii = 0
    End If

    If KeyAscii = vbKeyReturn Then
        If Len(txtSenhaNova.Text) > 0 Then
            FcsEnd txtSenhaRepetida
        End If
        KeyAscii = 0
    End If
End Sub

Private Sub txtSenhaRepetida_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeySpace Then
        KeyAscii = 0
    End If

    If KeyAscii = vbKeyReturn Then
        If Len(txtSenhaRepetida.Text) > 0 Then
            Fcs cmdAlterarSenha
            cmdAlterarSenha_Click
        End If
        KeyAscii = 0
    End If
End Sub

Private Sub txtSenhaAtual_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeySpace Then
        KeyAscii = 0
    End If

    If KeyAscii = vbKeyReturn Then
        If Len(txtSenhaAtual.Text) > 0 Then
            FcsEnd txtSenhaNova
        End If
        KeyAscii = 0
    End If
End Sub
