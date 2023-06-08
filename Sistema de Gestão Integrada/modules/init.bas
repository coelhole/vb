Attribute VB_Name = "init"
Option Explicit

Sub Main()
    databaseHost = "localhost"
    databasePort = 5432
    databaseName = "SGE"
    databaseUser = "postgres"
    databasePassword = "masterkey"

    Set databaseConnection = newDatabaseConnection
    databaseConnection.Open

    frmLogin.Show vbModal
End Sub
