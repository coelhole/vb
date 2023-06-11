VERSION 5.00
Begin VB.Form frmSplashScreen 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   0  'None
   ClientHeight    =   4635
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   10425
   LinkTopic       =   "Form1"
   ScaleHeight     =   4635
   ScaleWidth      =   10425
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   2000
      Left            =   390
      Top             =   420
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      Caption         =   "v. 1.2.5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   8070
      TabIndex        =   3
      Top             =   4200
      Width           =   2220
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Sistema de Gestão Empresarial"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   705
      Left            =   240
      TabIndex        =   2
      Top             =   2850
      Width           =   9945
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00C0C0C0&
      Caption         =   "SGE"
      BeginProperty Font 
         Name            =   "Microsoft Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   555
      Left            =   4590
      TabIndex        =   1
      Top             =   2040
      Width           =   1245
   End
   Begin VB.Label Label1 
      Caption         =   "Carregando configurações do banco de dados..."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   270
      TabIndex        =   0
      Top             =   4200
      Width           =   5385
   End
   Begin VB.Shape splashScreenBorder 
      BorderColor     =   &H8000000A&
      Height          =   4515
      Left            =   60
      Top             =   60
      Width           =   10335
   End
End
Attribute VB_Name = "frmSplashScreen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    Me.Caption = "Seja bem-vindo ao " & SOFTWARE_NAME
    splashScreenBorder.Left = 8
    splashScreenBorder.Top = 8
    splashScreenBorder.Width = Me.Width - 32
    splashScreenBorder.Height = Me.Height - 32
    Label1.BackColor = Me.BackColor
    Label2.BackColor = Me.BackColor
    Label3.BackColor = Me.BackColor
    Label4.BackColor = Me.BackColor
    Label4.Caption = " v. " & App.Major & "." & App.Minor & "." & App.Revision
End Sub

Private Sub Timer1_Timer()
    Unload Me
    Set frmSplashScreen = Nothing
    frmLogin.Show vbModeless
End Sub
