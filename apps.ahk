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
