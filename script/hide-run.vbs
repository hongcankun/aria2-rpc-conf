Set oShell = CreateObject("WScript.Shell")
strHomeFolder = oShell.ExpandEnvironmentStrings("%USERPROFILE%")
strAria2Folder = strHomeFolder & "\.aria2\rpc"

strLogLoc = strAria2Folder & "\aria2.log"
Set oFSO = CreateObject("Scripting.FileSystemObject")
set logFile = oFSO.GetFile(strLogLoc)
If logFile.Size > 10000000 Then
    Const ForReading = 1, ForWriting = 2, ForAppending = 8
    Const TristateUseDefault = -2, TristateTrue = -1, TristateFalse = 0
    ' open the log in overwritten Unicode mode
    Set openLog = logFile.OpenAsTextStream(ForWriting, TristateUseDefault)
    openLog.Close
End If

strConfLoc = strAria2Folder & "\aria2.conf"
command = "aria2c.exe --conf-path=" & strConfLoc
CreateObject("WScript.Shell").Run command, 0