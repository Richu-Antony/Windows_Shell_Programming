; ----------------------------------------------------------------------------------------------------------------------
; Function .....: TrayIcon_Button
; Description ..: Simulate mouse button click on a tray icon.
; Parameters ...: sExeName - Executable Process Name of tray icon.
; ..............: sButton  - Mouse button to simulate (L, M, R).
; ..............: bDouble  - True to double click, false to single click.
; ..............: index    - Index of tray icon to click if more than one match.
; ----------------------------------------------------------------------------------------------------------------------
TrayIcon_Button(lmc.exe, sButton := "L", bDouble := false, index := 1)
{
    Setting_A_DetectHiddenWindows := A_DetectHiddenWindows
    DetectHiddenWindows, On
    WM_MOUSEMOVE      = 0x0200
    WM_LBUTTONDOWN    = 0x0201
    WM_LBUTTONUP      = 0x0202
    WM_LBUTTONDBLCLK = 0x0203
    WM_RBUTTONDOWN    = 0x0204
    WM_RBUTTONUP      = 0x0205
    WM_RBUTTONDBLCLK = 0x0206
    WM_MBUTTONDOWN    = 0x0207
    WM_MBUTTONUP      = 0x0208
    WM_MBUTTONDBLCLK = 0x0209
    sButton := "WM_" sButton "BUTTON"
    oIcons := {}
    oIcons := TrayIcon_GetInfo(sExeName)
    msgID  := oIcons[index].msgID
    uID    := oIcons[index].uID
    hWnd   := oIcons[index].hWnd
    if bDouble
        PostMessage, msgID, uID, %sButton%DBLCLK, , ahk_id %hWnd%
    else
    {
        PostMessage, msgID, uID, %sButton%DOWN, , ahk_id %hWnd%
        PostMessage, msgID, uID, %sButton%UP, , ahk_id %hWnd%
    }
    DetectHiddenWindows, %Setting_A_DetectHiddenWindows%
    return
}