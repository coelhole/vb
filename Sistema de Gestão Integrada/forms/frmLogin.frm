VERSION 5.00
Begin VB.Form frmLogin 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Seja bem-vindo ao Sistema de Gestão Empresarial"
   ClientHeight    =   1830
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6390
   Icon            =   "frmLogin.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1830
   ScaleWidth      =   6390
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
      Height          =   360
      IMEMode         =   3  'DISABLE
      Left            =   1290
      MaxLength       =   64
      PasswordChar    =   "*"
      TabIndex        =   3
      ToolTipText     =   "Forneça aqui a senha do usuário informado"
      Top             =   1290
      Width           =   2800
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
      Height          =   360
      Left            =   1290
      MaxLength       =   32
      TabIndex        =   1
      ToolTipText     =   "Informe um nome de usuário válido (apenas letras, maiúsculas ou minúsculas, duas ou mais, mas não mais do que 32)"
      Top             =   765
      Width           =   2800
   End
   Begin VB.CommandButton cmdSair 
      Caption         =   "Cancelar"
      Height          =   400
      Left            =   4590
      TabIndex        =   5
      Top             =   720
      Width           =   1500
   End
   Begin VB.CommandButton cmdEntrar 
      Caption         =   "OK"
      Height          =   400
      Left            =   4590
      TabIndex        =   4
      Top             =   120
      Width           =   1500
   End
   Begin VB.Label lblInfo 
      Caption         =   "Forneça seus dados de acesso, nome e senha, para acessar o Sistema de Gestão Empresarial."
      Height          =   465
      Left            =   330
      TabIndex        =   6
      Top             =   120
      Width           =   4065
   End
   Begin VB.Label lblSenha 
      Alignment       =   1  'Right Justify
      Caption         =   "Senha"
      Height          =   255
      Left            =   330
      TabIndex        =   2
      Top             =   1335
      Width           =   855
   End
   Begin VB.Label lblUsuario 
      Alignment       =   1  'Right Justify
      Caption         =   "Usuário"
      Height          =   255
      Left            =   330
      TabIndex        =   0
      Top             =   810
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
    Me.lblInfo.Caption = "Forneça seus dados de acesso, nome e senha, para acessar o " & SOFTWARE_NAME & "."
End Sub

Private Sub txtUsuario_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
        If Len(txtUsuario.Text) > 1 Then
            Fcs txtSenha
        End If
    End If

    If KeyAscii <> 8 And (KeyAscii < 65 Or KeyAscii > 90) And (KeyAscii < 97 Or KeyAscii > 122) Then
        KeyAscii = 0
    End If
End Sub

Private Sub txtSenha_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
        If Len(txtUsuario.Text) > 1 And Len(txtSenha.Text) > 0 Then
            Fcs cmdEntrar
            cmdEntrar_Click
        End If
        KeyAscii = 0
    End If

    If KeyAscii = 32 Then
        KeyAscii = 0
    End If
End Sub

Private Sub cmdEntrar_Click()
    If txtUsuario.Text = EMPTY_STRING Then
        MsgInfo "Informe um usuário!"
        Fcs txtUsuario
        Exit Sub
    End If

    If Len(txtUsuario) = 1 Then
        MsgInfo "Nome de usuário inválido: uma só letra!"
        Fcs txtUsuario
        Exit Sub
    End If

    If txtSenha.Text = EMPTY_STRING Then
        MsgInfo "Informe a senha do usuário!"
        Fcs txtSenha
        Exit Sub
    End If

    Select Case auth(txtUsuario.Text, txtSenha.Text)
        Case AUTH_OK
            Unload Me
            Set frmLogin = Nothing
            frmMain.statusbar.Panels(1).Text = "Banco: " & databaseHost & ":" & databasePort & "\" & databaseName & "@" & databaseUser & "  "
            frmMain.statusbar.Panels(2).Text = "Usuário: " & userid & " " & username & "  "
            ShowModal frmMain
        Case AUTH_USERNOTFOUND
            MsgExcl "Usuário não encontrado!"
            Fcs txtUsuario
        Case AUTH_WRONGPASSWORD
            MsgExcl "Senha inválida!"
            Fcs txtSenha
        Case AUTH_USERINACTIVE
            MsgExcl "Usuário inativo!"
            Fcs txtUsuario
        Case AUTH_INTERNAL
            '
        Case Else
            '
    End Select
End Sub

Private Sub cmdSair_Click()
    Unload Me
    Set frmLogin = Nothing
End Sub
