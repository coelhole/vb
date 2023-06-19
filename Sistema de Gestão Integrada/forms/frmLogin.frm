VERSION 5.00
Begin VB.Form frmLogin 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Seja bem-vindo ao Sistema de Gestão Empresarial"
   ClientHeight    =   1455
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8400
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1455
   ScaleWidth      =   8400
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtSenha 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   340
      IMEMode         =   3  'DISABLE
      Left            =   1200
      MaxLength       =   64
      PasswordChar    =   "*"
      TabIndex        =   3
      ToolTipText     =   "Forneça aqui a senha do usuário informado"
      Top             =   720
      Width           =   4935
   End
   Begin VB.TextBox txtUsuario 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   340
      Left            =   1200
      MaxLength       =   32
      TabIndex        =   1
      ToolTipText     =   "Informe um nome de usuário válido (apenas letras, maiúsculas ou minúsculas, duas ou mais, mas não mais do que 32)"
      Top             =   200
      Width           =   4935
   End
   Begin VB.CommandButton cmdSair 
      Caption         =   "Sair"
      Height          =   495
      Left            =   6360
      TabIndex        =   5
      Top             =   720
      Width           =   1815
   End
   Begin VB.CommandButton cmdEntrar 
      Caption         =   "OK"
      Height          =   495
      Left            =   6360
      TabIndex        =   4
      Top             =   120
      Width           =   1815
   End
   Begin VB.Label lblSenha 
      Alignment       =   1  'Right Justify
      Caption         =   "Senha"
      Height          =   248
      Left            =   240
      TabIndex        =   2
      Top             =   760
      Width           =   855
   End
   Begin VB.Label lblUsuario 
      Alignment       =   1  'Right Justify
      Caption         =   "Usuário"
      Height          =   248
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   855
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    Me.Caption = "Seja bem-vindo ao " & SOFTWARE_NAME
End Sub

Private Sub txtUsuario_KeyPress(KeyAscii As Integer)
    If KeyAscii <> 8 And (KeyAscii < 65 Or KeyAscii > 90) And (KeyAscii < 97 Or KeyAscii > 122) Then
        KeyAscii = 0
    End If
End Sub

Private Sub txtUsuario_KeyUp(KeyCode As Integer, Shift As Integer)
    If Len(txtUsuario.Text) > 1 And KeyCode = vbKeyReturn Then
        ControlSetFocus txtSenha
    End If
End Sub

Private Sub txtSenha_KeyPress(KeyAscii As Integer)
    If KeyAscii = 32 Then
        KeyAscii = 0
    End If
End Sub

Private Sub txtSenha_KeyUp(KeyCode As Integer, Shift As Integer)
    If Len(txtUsuario.Text) > 1 And Len(txtSenha.Text) > 0 And KeyCode = vbKeyReturn Then
        ControlSetFocus cmdEntrar
    End If
End Sub

Private Sub cmdEntrar_Click()
    If txtUsuario.Text = EMPTY_STRING Then
        MsgInfo "Informe um usuário!"
        ControlSetFocus txtUsuario
        Exit Sub
    End If

    If Len(txtUsuario) = 1 Then
        MsgInfo "Nome de usuário inválido: uma só letra!"
        ControlSetFocus txtUsuario
        Exit Sub
    End If

    If txtSenha.Text = EMPTY_STRING Then
        MsgInfo "Informe a senha do usuário!"
        ControlSetFocus txtSenha
        Exit Sub
    End If

    Select Case auth(txtUsuario.Text, txtSenha.Text)
        Case AUTH_OK
            Unload Me
            frmMain.statusbar.Panels(1).Text = "Banco: " & databaseHost & ":" & databasePort & "\" & databaseName & "@" & databaseUser & "  "
            frmMain.statusbar.Panels(2).Text = "Usuário: " & userid & " " & username & "  "
            frmMain.Show vbModeless
        Case AUTH_USERNOTFOUND
            MsgExcl "Usuário não encontrado!"
            ControlSetFocus txtUsuario
        Case AUTH_WRONGPASSWORD
            MsgExcl "Senha inválida!"
            ControlSetFocus txtSenha
        Case AUTH_USERINACTIVE
            MsgExcl "Usuário não ativo!"
            ControlSetFocus txtUsuario
        Case AUTH_INTERNAL
            '
        Case Else
            '
    End Select
End Sub

Private Sub cmdSair_Click()
    Unload Me
    Set frmLogin = Nothing
    End
End Sub
