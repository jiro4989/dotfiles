#Include ime.ahk

!h::Send {Left}
!j::Send {Down}
!k::Send {Up}
!l::Send {Right}

!+h::Send +{Left}
!+j::Send +{Down}
!+k::Send +{Up}
!+l::Send +{Right}

; �㕔���j���[���A�N�e�B�u�ɂȂ�̂�}��
*~LAlt::Send {Blind}{vk07}
*~RAlt::Send {Blind}{vk07}

; �� Alt ��ł��� IME �� OFF
LAlt up::
    if (A_PriorHotkey == "*~LAlt") {
        IME_SET(0)
    }
    Return

; �E Alt ��ł��� IME �� ON
RAlt up::
    if (A_PriorHotkey == "*~RAlt") {
        IME_SET(1)
    }
    Return

return
