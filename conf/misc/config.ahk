#Include ime.ahk

!h::Send {Left}
!j::Send {Down}
!k::Send {Up}
!l::Send {Right}

!+h::Send +{Left}
!+j::Send +{Down}
!+k::Send +{Up}
!+l::Send +{Right}

; disable selection menu bar with alt key
*~LAlt::Send {Blind}{vk07}
*~RAlt::Send {Blind}{vk07}

; IME OFF with left alt key
LAlt up::
    if (A_PriorHotkey == "*~LAlt") {
        IME_SET(0)
    }
    Return

; IME ON with right alt key
RAlt up::
    if (A_PriorHotkey == "*~RAlt") {
        IME_SET(1)
    }
    Return

return
