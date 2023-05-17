#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;Knight Class Spells
knight_protect_ally = Images\Knight\Class Spells\protect_ally.bmp
knight_defensive_stance = Images\Knight\Class Spells\defensive_stance.bmp

;Knight Weapons
knight_spear = Images\Knight\Weapons\spear.bmp
knight_sword = Images\Knight\Weapons\sword.bmp
knight_hammer = Images\Knight\Weapons\hammer.bmp

IsKnightClass() {
    global knight_protect_ally, knight_defensive_stance
    if (FindImageQuickBar(knight_protect_ally) or FindImageQuickBar(knight_defensive_stance)) {
        return True
    }
    return False
}

; ---------- Knight Configurations -------------

KnightSpearConfig(knight_spear) {
    global character_button_hotkey, character_window_path

    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }
    if (!FindImageCharacter(knight_spear)) {
        Send, {LShift Down}{3}{LShift Up}
    }
}

KnightHammerConfig(knight_hammer) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }
    if (!FindImageCharacter(knight_hammer)) {
        Send, {LShift Down}{4}{LShift Up}
    }
}

KnightSwordConfig(knight_sword) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
			Send, {%character_button_hotkey%}
	}
	if (!FindImageCharacter(knight_sword)) {
			Send, {f4}{0}{%currentF%}
	}
}

KnightConfigF1(deadly_sight_ring) {
    global character_button_hotkey, character_window_path, currentF
    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }
    if (!FindImageCharacter(deadly_sight_ring)) {
        Send, {f3}{1}{2}{3}{%currentF%} ;Switch to Damage Amulet and Rings
    }
    else { ;Do Nothing
    }    
    setGUIJewelry("Damage")
}

KnightConfigF2(quest_health_ring) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
			Send, {%character_button_hotkey%}
	}
	if (!FindImageCharacter(quest_health_ring)) {
			Send, {f3}{4}{5}{6}{%currentF%}
	}
    setGUIJewelry("Tank")
}

