Attribute VB_Name = "init"
Option Explicit

Sub Main()
    frmSplashScreen.Show vbModeless

    DoEvents

    databaseHost = "localhost"
    databasePort = 5432
    databaseName = "SGE"
    databaseUser = "postgres"
    databasePassword = "masterkey"

    Set databaseConnection = newDatabaseConnection
    databaseConnection.Open
End Sub
