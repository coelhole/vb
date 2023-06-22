VERSION 5.00
Begin VB.Form FrmHelloWorld 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "Tchau!"
      Height          =   1935
      Left            =   413
      TabIndex        =   0
      Top             =   630
      Width           =   3855
   End
End
Attribute VB_Name = "FrmHelloWorld"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    Unload Me
    End
End Sub

Private Sub Form_Load()
    Me.Caption = "Hello, World!"
    MsgBox "Hello, World!"
End Sub
