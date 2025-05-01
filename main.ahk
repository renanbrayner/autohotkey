#Requires AutoHotkey v2.0

#Include "config.ahk"
#Include "mod_capslogic.ahk"
#Include "./shortcuts/apps.ahk"
#Include "./shortcuts/windows.ahk"
#Include "./shortcuts/browser.ahk"

reloadConfig(*) {
    Run(A_AhkPath . ' "' . A_ScriptFullPath . '"')
    ExitApp()
}

bindMod("R", reloadConfig)