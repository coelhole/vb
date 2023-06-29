Attribute VB_Name = "utils"
Option Explicit

Public Function ToByte(val) As Byte
On Error GoTo to_byte_error

    ToByte = CByte(val)

Exit Function
to_byte_error:
    ToByte = 0
End Function

Public Function ToInteger(val) As Integer
On Error GoTo to_integer_error

    ToInteger = CInt(val)

Exit Function
to_integer_error:
    ToInteger = 0
End Function

Public Function ToLong(val) As Long
On Error GoTo to_long_error

    ToLong = CLng(val)

Exit Function
to_long_error:
    ToLong = 0
End Function

