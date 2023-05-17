#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;Warlock Class Spells
warlock_darkness = Images\Warlock\Class Spells\darkness.bmp
warlock_hiedra_masa = Images\Warlock\Class Spells\hiedra_masa.bmp
warlock_meteor = Images\Warlock\Class Spells\meteor.bmp
warlock_stalagmite = Images\Warlock\Class Spells\stalagmite.bmp
warlock_sultar_terror = Images\Warlock\Class Spells\sultar_terror.bmp

;Warlock Weapons
warlock_ranged_staff = Images\Warlock\Weapons\ranged30_staff.bmp

IsWarlockClass() {
    global warlock_darkness, warlock_hiedra_masa, warlock_meteor, warlock_stalagmite, warlock_sultar_terror
    if (FindImageQuickBar(warlock_darkness) or FindImageQuickBar(warlock_hiedra_masa) or FindImageQuickBar(warlock_meteor) or FindImageQuickBar(warlock_stalagmite) or FindImageQuickBar(warlock_sultar_terror)) {
        return True
    }
    return False
}

; ---------- Barbarian Configurations -------------

WarlockConfigF1(wm_melee_damage_ring) {
    global character_button_hotkey, character_window_path, currentF
    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }
    if (!FindImageCharacter(wm_melee_damage_ring)) {
        Send, {f3}{1}{2}{3}{%currentF%} ;Switch to Damage Amulet and Rings
    }
    setGUIJewelry("Damage")
}

WarlockConfigF2(wm_melee_ring, gold_ranged_amulet) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
			Send, {%character_button_hotkey%}
	}

	if (!FindImageCharacter(wm_melee_ring)) {
        Send, {f3}{4}{5}{6}{%currentF%}
    }
    else {
        if (!FindImageCharacter(gold_ranged_amulet)) {
            Send, {f4}{9}{%currentF%}
        } 
        else {
            Send, {f3}{4}{%currentF%}
        }
    }
    setGUIJewelry("Tank")
}

