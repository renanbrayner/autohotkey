#Requires AutoHotkey v2.0
#Include "../config.ahk"

bindMod(keyCombo, callback) {
    mod := getModKey()
    Hotkey(mod . " & " . keyCombo, callback)
}

bindRun(keyCombo, appPath) {
    mod := getModKey()
    Hotkey(mod . " & " . keyCombo, (*) => Run(appPath))
}

isModShiftPressed(*) {
    return GetKeyState(getModKey(), "P") && GetKeyState("Shift", "P")
}

bindModShift(keyCombo, callback) {
    HotIf isModShiftPressed
    Hotkey(keyCombo, callback)
    HotIf  ; limpa a condição após registrar
}
