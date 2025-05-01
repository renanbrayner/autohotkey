#Requires AutoHotkey v2.0
#Include "../lib/bind.ahk"

; Fecha janela em foco
closeWindow(*) {
    WinClose("A")
}
bindMod("Q", closeWindow)

; Da toggle na maximização da janela em foco
toggleMaximize(*) {
    hwnd := WinGetID("A")
    state := WinGetMinMax(hwnd)
    if (state == 1) {
        WinRestore(hwnd)
    } else {
        WinMaximize(hwnd)
    }
}
bindMod("F", toggleMaximize)

; Muda o foco para a próxima janela
focusNextWindow(*) {
    Send("{Alt Down}{Tab}{Alt Up}")
}
bindMod("J", focusNextWindow)

; Muda o foco para a janela anterior
focusPreviousWindow(*) {
    Send("{Alt Down}{Shift Down}{Tab}{Shift Up}{Alt Up}")
}
bindMod("K", focusPreviousWindow)

; Move a janela para a esquerda
snapToLeft(*) {
    Send("#{Left}")
}
bindMod("H", snapToLeft)

; Move a janela para a direita
snapToRight(*) {
    Send("#{Right}")
}
bindMod("L", snapToRight)