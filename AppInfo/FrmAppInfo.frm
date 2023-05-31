VERSION 5.00
Begin VB.Form FrmAppInfo 
   Caption         =   "AppInfo"
   ClientHeight    =   3600
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7875
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   3600
   ScaleWidth      =   7875
   StartUpPosition =   2  'CenterScreen
   Begin VB.Label InfoThreadId 
      Caption         =   "Label1"
      Height          =   255
      Left            =   1560
      TabIndex        =   19
      Top             =   2415
      Width           =   6135
   End
   Begin VB.Label InfoTitle 
      Caption         =   "Label1"
      Height          =   255
      Left            =   1560
      TabIndex        =   18
      Top             =   2160
      Width           =   6135
   End
   Begin VB.Label InfoComments 
      Caption         =   "Label1"
      Height          =   255
      Left            =   1560
      TabIndex        =   17
      Top             =   1905
      Width           =   6135
   End
   Begin VB.Label InfoLegalCopyright 
      Caption         =   "Label1"
      Height          =   255
      Left            =   1560
      TabIndex        =   16
      Top             =   1650
      Width           =   6135
   End
   Begin VB.Label InfoPath 
      Caption         =   "Label11"
      Height          =   255
      Left            =   1560
      TabIndex        =   15
      Top             =   1395
      Width           =   6135
   End
   Begin VB.Label InfoVersion 
      Caption         =   "Label11"
      Height          =   255
      Left            =   1560
      TabIndex        =   14
      Top             =   1140
      Width           =   6135
   End
   Begin VB.Label InfoFileDescription 
      Caption         =   "Label11"
      Height          =   255
      Left            =   1560
      TabIndex        =   13
      Top             =   885
      Width           =   6135
   End
   Begin VB.Label InfoExeName 
      Caption         =   "Label11"
      Height          =   255
      Left            =   1560
      TabIndex        =   12
      Top             =   630
      Width           =   6135
   End
   Begin VB.Label InfoProductName 
      Caption         =   "Label11"
      Height          =   255
      Left            =   1560
      TabIndex        =   11
      Top             =   375
      Width           =   6135
   End
   Begin VB.Label InfoCompanyName 
      Caption         =   "Label11"
      Height          =   255
      Left            =   1560
      TabIndex        =   10
      Top             =   120
      Width           =   6135
   End
   Begin VB.Label LblComments 
      Caption         =   "Comments"
      Height          =   255
      Left            =   120
      TabIndex        =   9
      Top             =   1905
      Width           =   1335
   End
   Begin VB.Label LblThreadId 
      Caption         =   "ThreadID"
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   2415
      Width           =   1335
   End
   Begin VB.Label LblTitle 
      Caption         =   "Title"
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   2160
      Width           =   1335
   End
   Begin VB.Label LblPath 
      Caption         =   "Path"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   1395
      Width           =   1335
   End
   Begin VB.Label LblVersion 
      Caption         =   "Version"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   1140
      Width           =   1335
   End
   Begin VB.Label LblLegalCopyright 
      Caption         =   "LegalCopyright"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   1650
      Width           =   1335
   End
   Begin VB.Label LblFileDescription 
      Caption         =   "FileDescription"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   885
      Width           =   1335
   End
   Begin VB.Label LblExeName 
      Caption         =   "EXEName"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   630
      Width           =   1335
   End
   Begin VB.Label LblProductName 
      Caption         =   "ProductName"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   375
      Width           =   1335
   End
   Begin VB.Label LblCompanyName 
      Caption         =   "CompanyName"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1335
   End
End
Attribute VB_Name = "FrmAppInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
    InfoCompanyName.Caption = App.CompanyName
    InfoProductName.Caption = App.ProductName
    InfoExeName.Caption = App.EXEName
    InfoFileDescription.Caption = App.FileDescription
    InfoVersion.Caption = App.Major & "." & App.Minor & "." & App.Revision
    InfoPath.Caption = App.Path
    InfoLegalCopyright = App.LegalCopyright
    InfoComments = App.Comments
    InfoTitle = App.Title
    InfoThreadId = App.ThreadID
End Sub
