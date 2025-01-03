
;  ; Alt + ^ (caret) on a German keyboard layout
;  !°:: ; Alt + ^ (caret)
;  MsgBox, You pressed Alt + ^ (caret)
;  return

;  ; Alt + ^ (caret) on a German keyboard layout
;  !°:: ; Alt + ^ (caret)
;  Send, ^ ; Send the caret character
;  return


!;:: ; Alt + ; so cycle through instances of the same application
{
    static LastRun := 0
    static QuickPress := 0

    Now := A_TickCount

    if (Now - LastRun < 400)
        QuickPress++
    else
        QuickPress := 0

    OutputDebug '`n`nNow: ' Now ' LastRun: ' LastRun ' QuickPress: ' QuickPress '`n'



    OldClass := WinGetClass("A")
    ActiveProcessName := WinGetProcessName("A")
    WinClassCount := WinGetCount("ahk_exe " ActiveProcessName)
    ActiveId := WinGetID("A")
    OutputDebug 'Current:    ' ActiveId '/' OldClass '/' ActiveProcessName '/' WinGetTitle("ahk_id" ActiveId) "`n"

    if (WinClassCount = 1)
        Return

    ToSkip := QuickPress
    OutputDebug 'Will skip ' ToSkip ' of ' WinClassCount '`n'

    ids := WinGetList("ahk_exe " ActiveProcessName)
    for SiblingId in ids {
        if (WinGetClass("ahk_id" SiblingId) != OldClass)
            continue

        OutputDebug 'Found:      ' SiblingId '/' WinGetClass("ahk_id" SiblingId) '/' WinGetProcessName("ahk_id" SiblingId) '/' WinGetTitle("ahk_id" SiblingId) '`n'

        if (SiblingId != ActiveId && ToSkip-- <=0) {
            OutputDebug 'Switch to:  ' SiblingId '/' WinGetClass("ahk_id" SiblingId) '/' WinGetProcessName("ahk_id" SiblingId) '/' WinGetTitle("ahk_id" SiblingId) '`n'
            WinActivate("ahk_id" SiblingId)
            break
        }
    }


    LastRun := A_TickCount
}

; Function to find an executable in common installation directories
FindExecutable(executablePattern, commonPaths) {
    Loop, % commonPaths.MaxIndex()
    {
        Loop, % commonPaths[A_Index] "\" executablePattern, 1, 1
        {
            return A_LoopFileFullPath
        }
    }
    return ""
}

; Define common installation directories
commonPaths := [
    "C:\Program Files",
    "C:\Program Files (x86)",
    "C:\Users\" A_UserName "\AppData\Local",
    "C:\Users\" A_UserName "\AppData\Roaming",
    "C:\ProgramData",
    "C:\Users\" A_UserName "\AppData\Local\Programs"
]

; Alt + W to open or switch to Chrome
!w::
IfWinExist, ahk_class Chrome_WidgetWin_1
{
    ; Check for a specific window title to ensure it's Chrome
    IfWinExist, Google Chrome
    {
        WinActivate
    }
    else
    {
        Run, chrome.exe
    }
}
else
{
    Run, chrome.exe
}
return

; Alt + S to open or switch to Spotify
!s::
IfWinExist, ahk_class SpotifyMainWindow
{
    WinActivate
}
else
{
    spotifyPath := FindExecutable("%Spotify.exe%", commonPaths)
    if (spotifyPath != "")
    {
        Run, %spotifyPath%
    }
    else
    {
        MsgBox, Spotify executable not found.
    }
}
return

; Alt + E to open or switch to Visual Studio Code
!e::
IfWinExist, ahk_class Chrome_WidgetWin_1
{
    ; Check for a specific window title to ensure it's VS Code
    IfWinExist, Visual Studio Code
    {
        WinActivate
    }
    else
    {
        vscodePath := FindExecutable("%Code.exe%", commonPaths)
        if (vscodePath != "")
        {
            Run, %vscodePath%
        }
        else
        {
            MsgBox, Visual Studio Code executable not found.
        }
    }
}
else
{
    vscodePath := FindExecutable("%Code.exe%", commonPaths)
    if (vscodePath != "")
    {
        Run, %vscodePath%
    }
    else
    {
        MsgBox, Visual Studio Code executable not found.
    }
}
return

; Alt + T to open or switch to Windows Terminal
!t::
IfWinExist, ahk_class CascadiaWindow
{
    WinActivate
}
else
{
    Run, wt.exe
}
return

; Alt + C to open or switch to Discord
!c::
IfWinExist, ahk_class Chrome_WidgetWin_1
{
    ; Check for a specific window title to ensure it's Discord
    IfWinExist, Discord
    {
        WinActivate
    }
    else
    {
        discordPath := FindExecutable("%Discord.exe%", commonPaths)
        if (discordPath != "")
        {
            Run, %discordPath%
        }
        else
        {
            MsgBox, Discord executable not found.
        }
    }
}
else
{
    discordPath := FindExecutable("%Discord.exe%", commonPaths)
    if (discordPath != "")
    {
        Run, %discordPath%
    }
    else
    {
        MsgBox, Discord executable not found.
    }
}
return

; Alt + F to open or switch to Windows Explorer
!f::
IfWinExist, ahk_class CabinetWClass
{
    WinActivate
}
else
{
    Run, explorer.exe
}
return

; Alt + D to open or switch to DBeaver
!d::
IfWinExist, ahk_class SunAwtFrame
{
    WinActivate
}
else
{
    dbeaverPath := FindExecutable("%dbeaver.exe%", commonPaths)
    if (dbeaverPath != "")
    {
        Run, %dbeaverPath%
    }
    else
    {
        MsgBox, DBeaver executable not found.
    }
}
return

; Alt + , to open or switch to Windows Settings
!,:: ; Alt + Comma
IfWinExist, ahk_class ApplicationFrameWindow
{
    WinActivate
}
else
{
    Run, ms-settings:
}
return
