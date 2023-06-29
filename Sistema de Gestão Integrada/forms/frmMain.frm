VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   10125
   ClientLeft      =   8850
   ClientTop       =   4890
   ClientWidth     =   20085
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   10125
   ScaleWidth      =   20085
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   1665
      Left            =   5760
      TabIndex        =   1
      Top             =   2130
      Width           =   5835
   End
   Begin MSComctlLib.StatusBar statusbar 
      Align           =   2  'Align Bottom
      Height          =   285
      Left            =   0
      TabIndex        =   0
      Top             =   9840
      Width           =   20085
      _ExtentX        =   35428
      _ExtentY        =   503
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1402
            MinWidth        =   1411
            Text            =   "Banco:"
            TextSave        =   "Banco:"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1402
            MinWidth        =   1411
            Text            =   "Usuário:"
            TextSave        =   "Usuário:"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   32068
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnArquivo 
      Caption         =   "Arquivo"
      Begin VB.Menu mnArquivo_Sair 
         Caption         =   "Sair"
      End
   End
   Begin VB.Menu mnUsuario 
      Caption         =   "Usuário"
      Begin VB.Menu mnUsuario_AlterarSenha 
         Caption         =   "Alterar senha"
      End
      Begin VB.Menu mnUsuario_Relogar 
         Caption         =   "Sair e entrar com outro usuário"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    ShowModal frmSetDB, Me
End Sub

Private Sub Form_Load()
    Me.Caption = SOFTWARE_NAME & " v. " & App.Major & "." & App.Minor & "." & App.Revision
End Sub

Private Sub mnArquivo_Sair_Click()
    Unload Me
    Set frmMain = Nothing
End Sub

Private Sub mnUsuario_AlterarSenha_Click()
    ShowModal frmAlterarSenha, Me
End Sub

Private Sub mnUsuario_Relogar_Click()
    Unload Me
    Set frmMain = Nothing
    ShowModal frmLogin
End Sub
