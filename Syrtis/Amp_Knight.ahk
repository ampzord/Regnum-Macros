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

; Knight Armour
vesper_dragon_bp = Images\Knight\Armour\vesper_dragon_bp.bmp

IsKnightClass() {
    global knight_protect_ally, knight_defensive_stance
    if (FindImageQuickBar(knight_protect_ally) or FindImageQuickBar(knight_defensive_stance)) {
        return True
    }
    return False
}

; ---------- Knight Configurations -------------

KnightSpear(knight_spear) {
    global character_button_hotkey, character_window_path

    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }
    if (!FindImageCharacter(knight_spear)) {
        Send, {LShift Down}{3}{LShift Up}
    }
}

KnightHammer(knight_hammer) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }
    if (!FindImageCharacter(knight_hammer)) {
        Send, {LShift Down}{4}{LShift Up}
    }
}

KnightSword(knight_sword) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
			Send, {%character_button_hotkey%}
	}
	if (!FindImageCharacter(knight_sword)) {
			Send, {f4}{6}{%currentF%}
	}
}

KnightConfigF1(quest_ring_of_lightning) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }
    if (!FindImageCharacter(quest_ring_of_lightning)) {
        Send, {f3}{1}{2}{3}{%currentF%} ;Switch to Damage Amulet and Rings
    }
    setGUIJewelry("Damage")
}

KnightConfigF2(wm_melee_ring, gold_ranged_amulet) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
			Send, {%character_button_hotkey%}
	}

	if (!FindImageCharacter(wm_melee_ring)) {
        Send, {f3}{4}{5}{6}{%currentF%}
    }
    else {
        if (!FindImageCharacter(gold_ranged_amulet)) {
            Send, {f4}{2}{%currentF%}
        } 
        else {
            Send, {f3}{4}{%currentF%}
        }
    }
    setGUIJewelry("Tank")
}

KnightConfigTAB(vesper_dragon_bp) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
			Send, {%character_button_hotkey%}
	}

	if (!FindImageCharacter(vesper_dragon_bp)) {
        Send, {f3}{7}{8}{9}{0}{SC00C}{%currentF%}
    }
    else {
        Send, {f4}{7}{8}{9}{0}{SC00C}{%currentF%}
    }
}

