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
   Begin VB.Label lblSoftwareVersion 
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
   Begin VB.Label lblSoftwareName 
      Alignment       =   2  'Center
      Caption         =   "Sistema de Gest�o Empresarial"
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
   Begin VB.Label lblInfo 
      Caption         =   "Carregando configura��es do banco de dados..."
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
      Left            =   240
      TabIndex        =   0
      Top             =   4200
      Width           =   7700
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

Private initializationOK As Boolean
Private screenSplashDisplayed As Boolean

Private Sub infomsg(msg As String)
    frmInit.lblInfo.ForeColor = vbBlack
    frmInit.lblInfo.Caption = msg
    frmInit.lblInfo.Refresh
End Sub

Private Sub errmsg(msg As String, Optional errObj As ErrObject)
    If Not (errObj Is Nothing) Then
        logError "frmInit: initialize: Erro " & Err.Number & ": " & Err.Source & ": " & Err.Description
    End If

    frmInit.lblInfo.ForeColor = vbRed
    frmInit.lblInfo.Caption = msg
    frmInit.Refresh
End Sub

Private Function initialize() As Boolean
initialize = False
On Error GoTo initialize_error

    Dim lonPort As Long
    Dim postgresFail As Boolean
    Dim tryAgain As Boolean

db_info_loading:
    infomsg "Carregando configura��es do banco de dados..."
    lonPort = 5433
    databasePort = lonPort
    databaseHost = "localhost"
    databaseName = "SGE"
    databaseUser = "postgres"
    databasePassword = "masterkey"

db_connecting:
    infomsg "Estabelecendo conex�o com o banco de dados..."
    openDatabaseConnection databaseConnection

initialize = True
Exit Function 'exit 0

initialize_error:
    Set databaseConnection = Nothing

    postgresFail = False Or ((InStr(1, Err.Description, "banco de dados") + InStr(1, Err.Description, "n�o existe")) > 1) 'nome de banco de dados invalido/inexistente
    postgresFail = postgresFail Or (InStr(1, Err.Description, "invalid port number") > 0) 'numero de porta invalido: nao-positivo
    postgresFail = postgresFail Or (InStr(1, Err.Description, "could not connect to server") > 0) 'servidor fora do ar ou nome de usuario do banco de dados ou senha invalidos
    postgresFail = postgresFail Or (InStr(1, Err.Description, "could not translate host") > 0) 'nao foi possivel mapear o hostname para um endereco valido na rede: host desconhecido
    postgresFail = postgresFail And (Err.Number = -2147467259) 'todos os erros acima tem por numero -2147467259
    postgresFail = postgresFail Or ((Err.Number = 6) And (lonPort > CLng((2 ^ 15) - 1))) 'overflow: o numero da porta excede o valor maximo

    If postgresFail Then
        errmsg DB_CONN_FAIL, Err
        If MsgCritYN(DB_CONN_FAIL & vbCrLf & "Gostaria de corrigir/especificar os dados de configura��o do banco de dados?") = vbYes Then
            frmSetDB.txtHost = databaseHost
            frmSetDB.txtPorta = CStr(databasePort)
            frmSetDB.txtUsuario = databaseUser
            frmSetDB.txtSenha = databasePassword
            frmSetDB.txtBanco = databaseName
            frmSetDB.Tag = "frmInit"
            frmSetDB.Show vbModal, frmInit
            tryAgain = (frmInit.Tag = "frmSetDB_OK")
            frmInit.Tag = EMPTY_STRING
            If tryAgain Then
                Resume db_connecting
            End If
        End If
    Else
        errmsg "Erro: " & Err.Number, Err
    End If

End Function 'exit -1

Private Sub Form_Activate()
    If Not screenSplashDisplayed Then
        screenSplashDisplayed = True
        DoEvents
        initializationOK = initialize
        Me.Visible = False
        Unload Me
        Set frmInit = Nothing
        screenSplashDisplayed = False
    End If
End Sub

Private Sub Form_Load()
    Me.Caption = "Seja bem-vindo ao " & SOFTWARE_NAME
    bdr.Left = 8
    bdr.Top = 8
    bdr.Width = Me.Width - 32
    bdr.Height = Me.Height - 32
    lblInfo.BackColor = Me.BackColor
    lblSoftwareName.BackColor = Me.BackColor
    lblSoftwareName.Caption = SOFTWARE_NAME
    lblSoftwareVersion.BackColor = Me.BackColor
    lblSoftwareVersion.Caption = " v. " & App.Major & "." & App.Minor & "." & App.Revision
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If initializationOK Then
        ShowModal frmLogin
    End If
End Sub
