Attribute VB_Name = "init"
Option Explicit

Sub Main()
    frmSplashScreen.Show vbModal

    DoEvents

    databaseHost = "localhost"
    databasePort = 5432
    databaseName = "SGE"
    databaseUser = "postgres"
    databasePassword = "masterkey"

    openDatabaseConnection databaseConnection
End Sub
