VERSION 5.00
Begin VB.Form frmLogin 
   Caption         =   "Seja bem-vindo ao Sistema de Gestão Integrada"
   ClientHeight    =   1455
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8445
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1455
   ScaleWidth      =   8445
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
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   720
      Width           =   855
   End
   Begin VB.Label lblUsuario 
      Alignment       =   1  'Right Justify
      Caption         =   "Usuário"
      Height          =   255
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
    If KeyAscii <> 8 And (KeyAscii < 97 Or KeyAscii > 122) Then KeyAscii = 0
End Sub

Private Sub txtSenha_KeyPress(KeyAscii As Integer)
    If KeyAscii = 32 Then KeyAscii = 0
End Sub

Private Sub cmdEntrar_Click()
    If txtUsuario.Text = "" Then
        MsgBox "Informe um usuário!", vbInformation, SOFTWARE_NAME
        txtUsuario.SetFocus
        Exit Sub
    End If

    If Len(txtUsuario) = 1 Then
        MsgBox "Nome de usuário inválido: uma só letra!", vbInformation, SOFTWARE_NAME
        txtUsuario.SetFocus
        Exit Sub
    End If

    If txtSenha.Text = "" Then
        MsgBox "Informe a senha do usuário!", vbInformation, SOFTWARE_NAME
        txtSenha.SetFocus
        Exit Sub
    End If

    If auth(txtUsuario.Text, txtSenha.Text) Then
        Unload Me
        frmMain.Show
    Else
        MsgBox "A autenticação falhou!" & vbCrLf & "Verifique o nome de usuário e a senha.", vbExclamation, SOFTWARE_NAME
        txtSenha.SetFocus
    End If
End Sub

Private Sub cmdSair_Click()
    Unload Me
    End
End Sub
