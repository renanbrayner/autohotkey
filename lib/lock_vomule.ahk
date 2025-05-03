#Requires AutoHotkey v2.0
#SingleInstance Force

; Define a função de manipulação de mensagens antes de registrá-la
WM_WTSSESSION_CHANGE(wParam, lParam, msg, hwnd) {
    if wParam = 0x7 { ; WTS_SESSION_LOCK
        SoundSetMute true
    } else if wParam = 0x8 { ; WTS_SESSION_UNLOCK
        SoundSetMute false
    }
    return true
}

; Registra para receber notificações de sessão (bloqueio/desbloqueio)
DllCall("Wtsapi32\WTSRegisterSessionNotification", "Ptr", A_ScriptHwnd, "UInt", 0)

; Registra a função de retorno para a mensagem WM_WTSSESSION_CHANGE (0x02B1)
OnMessage(0x02B1, WM_WTSSESSION_CHANGE)