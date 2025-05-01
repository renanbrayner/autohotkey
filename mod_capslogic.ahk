#Requires AutoHotkey v2.0

if (getModKey() = "CapsLock") {
    ; Desativa completamente o comportamento do CapsLock em qualquer contexto
    SetCapsLockState("AlwaysOff")
    *CapsLock:: return

    ; Usa Shift + Tab como toggle manual do CapsLock
    +Tab:: toggleCaps()

    toggleCaps(*) {
        current := GetKeyState("CapsLock", "T")
        SetCapsLockState(current ? "Off" : "On")
    }
}
