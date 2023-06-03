Attribute VB_Name = "init"
Option Explicit

Sub Main()
    databaseHost = "localhost"
    databasePort = 5432
    databaseName = "SGE"
    databaseUser = "postgres"
    databasePassword = "masterkey"
    
    frmMain.statusbar.Panels(1).Text = "Banco: " & databaseHost & ":" & databasePort & "\" & databaseName & "@" & databaseUser & "  "
    
    frmLogin.Show vbModal
End Sub
