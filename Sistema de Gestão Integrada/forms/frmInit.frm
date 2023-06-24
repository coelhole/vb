VERSION 5.00
Begin VB.Form frmInit 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   0  'None
   ClientHeight    =   4635
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   10425
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   4635
   ScaleWidth      =   10425
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Label Label3 
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
      TabIndex        =   2
      Top             =   4200
      Width           =   2220
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Sistema de Gestão Empresarial"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   27.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   705
      Left            =   240
      TabIndex        =   1
      Top             =   1965
      Width           =   9945
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
   Begin VB.Shape bdr 
      BorderColor     =   &H8000000A&
      Height          =   4515
      Left            =   60
      Top             =   60
      Width           =   10335
   End
End
Attribute VB_Name = "frmInit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub CheckDatabaseConnection()
    databaseHost = "localhost"
    databasePort = 5432
    databaseName = "SGE"
    databaseUser = "postgres"
    databasePassword = "masterkey"
    openDatabaseConnection databaseConnection
End Sub

Private Sub Form_Activate()
    DoEvents
    CheckDatabaseConnection
    Unload Me
    Set frmInit = Nothing
    frmLogin.Show vbModal
End Sub

Private Sub Form_Load()
    Me.Caption = "Seja bem-vindo ao " & SOFTWARE_NAME
    bdr.Left = 8
    bdr.Top = 8
    bdr.Width = Me.Width - 32
    bdr.Height = Me.Height - 32
    Label1.BackColor = Me.BackColor
    Label2.BackColor = Me.BackColor
    Label2.Caption = SOFTWARE_NAME
    Label3.BackColor = Me.BackColor
    Label3.Caption = " v. " & App.Major & "." & App.Minor & "." & App.Revision
End Sub
