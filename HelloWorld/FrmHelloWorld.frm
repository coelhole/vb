VERSION 5.00
Begin VB.Form FrmHelloWorld 
   Caption         =   "Hello, World!"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "Pressione o botão"
      Height          =   1095
      Left            =   773
      TabIndex        =   0
      Top             =   1050
      Width           =   3135
   End
End
Attribute VB_Name = "FrmHelloWorld"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    MsgBox "Hello, World!"
End Sub
