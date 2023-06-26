VERSION 5.00
Begin VB.Form frmSetDB 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Configura��o do PostgreSQL"
   ClientHeight    =   5220
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5625
   Icon            =   "frmSetDB.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5220
   ScaleWidth      =   5625
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   400
      Left            =   3447
      TabIndex        =   12
      Top             =   4575
      Width           =   2000
   End
   Begin VB.Frame frmePgConf 
      Caption         =   "PostgreSQL info"
      Height          =   4200
      Left            =   207
      TabIndex        =   0
      Top             =   90
      Width           =   5240
      Begin VB.TextBox txtBanco 
         Height          =   350
         Left            =   180
         TabIndex        =   10
         Top             =   3540
         Width           =   3800
      End
      Begin VB.TextBox txtSenha 
         Height          =   350
         Left            =   180
         TabIndex        =   8
         Top             =   2820
         Width           =   3800
      End
      Begin VB.TextBox txtUsuario 
         Height          =   350
         Left            =   180
         TabIndex        =   6
         Top             =   2100
         Width           =   3800
      End
      Begin VB.TextBox txtPorta 
         Height          =   350
         Left            =   180
         MaxLength       =   5
         TabIndex        =   4
         Top             =   1395
         Width           =   1400
      End
      Begin VB.TextBox txtHost 
         Height          =   350
         Left            =   180
         TabIndex        =   2
         Top             =   675
         Width           =   4880
      End
      Begin VB.Label lblBanco 
         Caption         =   "Banco"
         Height          =   195
         Left            =   180
         TabIndex        =   9
         Top             =   3255
         Width           =   1515
      End
      Begin VB.Label lblSenha 
         Caption         =   "Senha"
         Height          =   195
         Left            =   180
         TabIndex        =   7
         Top             =   2535
         Width           =   2085
      End
      Begin VB.Label lblUsuario 
         Caption         =   "Usu�rio"
         Height          =   195
         Left            =   180
         TabIndex        =   5
         Top             =   1830
         Width           =   1635
      End
      Begin VB.Label lblPorta 
         Caption         =   "Porta"
         Height          =   195
         Left            =   180
         TabIndex        =   3
         Top             =   1110
         Width           =   1245
      End
      Begin VB.Label lblHost 
         Caption         =   "Host"
         Height          =   200
         Left            =   180
         TabIndex        =   1
         Top             =   390
         Width           =   2145
      End
   End
   Begin VB.Label lblInfo 
      Caption         =   "host ou porta inv�lidos"
      ForeColor       =   &H000000FF&
      Height          =   600
      Left            =   280
      TabIndex        =   11
      Top             =   4420
      Visible         =   0   'False
      Width           =   3000
   End
End
Attribute VB_Name = "frmSetDB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private focCtrl As Control

Private Sub cmdOK_Click()
    databaseHost = txtHost.Text
    databasePort = CInt(txtPorta.Text)
    databaseName = txtBanco.Text
    databaseUser = txtUsuario.Text
    databasePassword = txtSenha.Text
    If Me.Tag = "frmInit" Then
        frmInit.Tag = "frmSetDB_OK"
    End If
    Unload Me
End Sub

Private Sub Form_Activate()
    ControlSetFocus focCtrl
End Sub

Private Sub Form_Load()
    Set focCtrl = txtHost
End Sub

Private Sub txtBanco_GotFocus()
    Set focCtrl = txtBanco
End Sub

Private Sub txtBanco_KeyPress(KeyAscii As Integer)
    If KeyAscii = 32 Then
        KeyAscii = 0
    End If
End Sub

Private Sub txtHost_GotFocus()
    Set focCtrl = txtHost
End Sub

Private Sub txtHost_KeyPress(KeyAscii As Integer)
    If KeyAscii = 32 Then
        KeyAscii = 0
    End If
End Sub

Private Sub txtPorta_GotFocus()
    Set focCtrl = txtPorta
End Sub

Private Sub txtPorta_KeyPress(KeyAscii As Integer)
    If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then KeyAscii = 0
End Sub

Private Sub txtSenha_GotFocus()
    Set focCtrl = txtSenha
End Sub

Private Sub txtSenha_KeyPress(KeyAscii As Integer)
    If KeyAscii = 32 Then
        KeyAscii = 0
    End If
End Sub

Private Sub txtUsuario_GotFocus()
    Set focCtrl = txtUsuario
End Sub

Private Sub txtUsuario_KeyPress(KeyAscii As Integer)
    If KeyAscii = 32 Then
        KeyAscii = 0
    End If
End Sub
