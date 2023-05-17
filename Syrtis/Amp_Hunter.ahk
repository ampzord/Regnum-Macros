#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Hunter Class Spells
hunter_horn = Images\Hunter\Class Spells\horn_of_the_wind.bmp
hunter_enredora = Images\Hunter\Class Spells\enredora.bmp
hunter_confuse = Images\Hunter\Class Spells\confuse.bmp

;Hunter Armour
hunter_champion_gauntlets = Images\Hunter\Armour\champion_gauntlets.bmp
hunter_champion_leggings = Images\Hunter\Armour\champion_leggings.bmp
hunter_dragon_set = Images\Hunter\Armour\dragon_set.bmp

;Hunter Weapons
hunter_vi_bow = Images\Hunter\Weapons\vi_bow.bmp
hunter_magna_long_bow = Images\Hunter\Weapons\magna_long_bow.bmp
hunter_short_bow = Images\Hunter\Weapons\hunter_short_bow.bmp

IsHunterClass() {
    global hunter_horn, hunter_enredora, hunter_confuse
    if (FindImageQuickBar(hunter_horn) or FindImageQuickBar(hunter_enredora) or FindImageQuickBar(hunter_confuse)) {
        return True
    }
    return False
}

; ---------- Hunter Configurations -------------

HunterVIConfig(wm_vi_ring, hunter_dragon_set, hunter_champion_leggings, hunter_champion_gauntlets) {
	global character_button_hotkey, character_window_path, currentF

	if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }

	if (!FindImageCharacter(wm_vi_ring)) {
		Send, {f4}{2}{3}{4}{%currentF%}
	}

	; Normal Set
	if (!FindImageCharacter(hunter_dragon_set)) {
		if (!FindImageCharacter(hunter_champion_leggings)) {
			Send, {f4}{5}{%currentF%} ; send champ leggings
		}
		if (FindImageCharacter(hunter_champion_gauntlets)) {
			Send, {f4}{6}{%currentF%} ; send tank gauntlets
		}
	}
	;Dragon Set
	else {
		Send, {f3}{7}{8}{9}{f4}{5}{6}{%currentF%} ; send normal cast speed set
	}
	setGUIJewelry("VI")
}

; DAMAGE RINGS + LEGGINGS
HunterConfigF1(wm_archer_damage_ring, hunter_dragon_set, hunter_champion_leggings, hunter_champion_gauntlets) {
	global character_button_hotkey, character_window_path, currentF

	if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }

	if (!FindImageCharacter(wm_archer_damage_ring)) {
		Send, {f3}{1}{2}{3}
	}

	; Normal Set
	if (!FindImageCharacter(hunter_dragon_set)) {
		if (FindImageCharacter(hunter_champion_leggings)) {
			Send, {f3}{SC00C}{%currentF%} ; send damage leggings
		}
		if (!FindImageCharacter(hunter_champion_gauntlets)) {
			Send, {f3}{0}{%currentF%} ; send champ gauntlets
		}
	}
	;Dragon Set
	else {
		Send, {f3}{7}{8}{9}{0}{SC00C}{%currentF%} ; send normal damage set
	}
	setGUIJewelry("Damage")
}

; Tank
HunterConfigF2(gold_melee_ring, wm_ranged_amulet) {
	global character_button_hotkey, character_window_path, currentF

	if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }

    if (!FindImageCharacter(gold_melee_ring)) {
        Send, {f3}{4}{5}{6}{%currentF%}
    }
    else {
        if (!FindImageCharacter(wm_ranged_amulet)) {
            Send, {f2}{SC00D}{%currentF%}
        } 
        else {
            Send, {f3}{4}{%currentF%}
        }
    }
	setGUIJewelry("TANK")
}

HunterConfigTAB(hunter_dragon_set) {
	global character_button_hotkey, character_window_path, currentF

	if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }

	if (!FindImageCharacter(hunter_dragon_set)) {
		Send, {f4}{7}{8}{9}{0}{SC00C}{%currentF%} ;switch to dragon set 
	}
	else {
		Send, {f3}{7}{8}{9}{0}{SC00C}{%currentF%} ;switch to lvl60 set
	}
}

; Hunter Weapons

HunterLongBow(hunter_magna_long_bow) {
	global character_button_hotkey, character_window_path, currentF

	if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }

	if (!FindImageCharacter(hunter_magna_long_bow)) {
        Send, {LShift Down}{3}{LShift Up}
    }
}

HunterShortBow(hunter_shortbow) {
	global character_button_hotkey, character_window_path, currentF

	if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }

	if (!FindImageCharacter(hunter_shortbow)) {
        Send, {LShift Down}{4}{LShift Up}
    }
}

HunterVIBow(hunter_vi_bow) {
	global character_button_hotkey, character_window_path, currentF

	if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }

	if (!FindImageCharacter(hunter_vi_bow)) {
        Send, {f4}{SC00D}{%currentF%}
    }
}