VERSION 5.00
Begin VB.Form FrmOnlyNumberTextBox 
   Caption         =   "Caixa de Texto que aceita apenas dígitos numéricos"
   ClientHeight    =   1455
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   15180
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   1455
   ScaleWidth      =   15180
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox MinhaCaixaDeTexto 
      Height          =   375
      Left            =   263
      TabIndex        =   0
      Top             =   540
      Width           =   14655
   End
End
Attribute VB_Name = "FrmOnlyNumberTextBox"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub MinhaCaixaDeTexto_KeyPress(KeyAscii As Integer)
    If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then KeyAscii = 0
End Sub
