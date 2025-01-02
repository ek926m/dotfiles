; Alt + W to open or switch to Chrome
!w::
IfWinExist, ahk_class Chrome_WidgetWin_1
{
    WinActivate
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
    Run, spotify.exe
}
return

; Alt + E to open or switch to Visual Studio Code
!e::
IfWinExist, ahk_class Chrome_WidgetWin_1
{
    WinActivate
}
else
{
    Run, "C:\Program Files\Microsoft VS Code\Code.exe"
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
    WinActivate
}
else
{
    Run, "C:\Users\%USERNAME%\AppData\Local\Discord\app-1.0.9003\Discord.exe"
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
    Run, "C:\Program Files\DBeaver\dbeaver.exe"
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
