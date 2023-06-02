VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   8850
   ClientTop       =   4605
   ClientWidth     =   11130
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   11130
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    Me.Caption = SOFTWARE_NAME & " v. " & App.Major & "." & App.Minor & "." & App.Revision
End Sub
