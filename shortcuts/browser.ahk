#Requires AutoHotkey v2.0
#Include "../lib/bind.ahk"

openDefaultBrowser(*) {
    Run("https://")
}
bindMod("W", openDefaultBrowser)