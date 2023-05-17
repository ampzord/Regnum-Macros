#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;Barbarian Class Spells
barb_spiritual_blow = Images\Barbarian\Class Spells\barbarian_spiritual_blow.bmp
barb_berserk = Images\Barbarian\Class Spells\barbarian_berserk.bmp
barb_colossus = Images\Barbarian\Class Spells\barbarian_colossus.bmp
barb_frenzy = Images\Barbarian\Class Spells\barbarian_frenzy.bmp

;Barbarian Weapons
barb_two_handed_hammer = Images\Barbarian\Weapons\two_handed_hammer.bmp
barb_two_handed_spear = Images\Barbarian\Weapons\two_handed_spear.bmp
barb_off_hand = Images\Barbarian\Weapons\off_hand.bmp
barb_sword = Images\Barbarian\Weapons\sword.bmp
barb_axe = Images\Barbarian\Weapons\axe.bmp
barb_eve_spear = Images\Barbarian\Weapons\eve_spear.bmp

IsBarbarianClass() {
    global barb_spiritual_blow, barb_berserk, barb_colossus, barb_frenzy
    if (FindImageQuickBar(barb_spiritual_blow) or FindImageQuickBar(barb_berserk) or FindImageQuickBar(barb_colossus) or FindImageQuickBar(barb_frenzy)) {
        return True
    }
    return False
}

; ---------- Barbarian Configurations -------------

BarbarianConfigF1(wm_melee_damage_ring) {
    global character_button_hotkey, character_window_path, currentF
    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }
    if (!FindImageCharacter(wm_melee_damage_ring)) {
        Send, {f3}{1}{2}{3}{%currentF%} ;Switch to Damage Amulet and Rings
    }
    setGUIJewelry("Damage")
}

BarbarianConfigF2(wm_melee_ring, gold_ranged_amulet) {
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

BarbarianAxe(barb_axe) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
			Send, {%character_button_hotkey%}
	}
	if (!FindImageCharacter(barb_axe)) {
			Send, {f4}{0}{%currentF%}
	}
}

