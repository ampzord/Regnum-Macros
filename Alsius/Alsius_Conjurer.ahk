#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Conjurer Class Spells
conjurer_heal_ally = Images\Conjurer\Class Spells\heal_ally.bmp
conjurer_heal_self = Images\Conjurer\Class Spells\heal_self.bmp
conjurer_divine_intervention = Images\Conjurer\Class Spells\divine_intervention.bmp

;Conjurer Armour
alas_gloves = Images\Conjurer\Armour\alas_gloves.bmp ; no more
mana_gloves = Images\Conjurer\Armour\mana_gloves.bmp

;Conjurer Weapons
health_staff = Images\Conjurer\Weapons\health_staff.bmp
cast_speed_staff = Images\Conjurer\Weapons\cast_speed_staff.bmp


; VI_MANA_RINGS := "{f3}{1}{2}{3}{%currentF%}" 
vi_mana_rings := "{f3}{1}{2}{3}{f1}"
MELEE_JEWELRY := "{f3}{4}{5}{6}{%currentF%}"
MELEE_AMULET := "{f3}{4}{%currentF%}"
RANGED_AMULET := "{f3}{0}{%currentF%}"

IsConjurerClass() {
    global conjurer_heal_ally, conjurer_heal_self, conjurer_divine_intervention
    if (FindImageQuickBar(conjurer_heal_ally) or FindImageQuickBar(conjurer_heal_self) or FindImageQuickBar(conjurer_divine_intervention)) {
        return True
    }
    return False
}

; ---------- Conjurer Configurations -------------

ConjurerConfigF1(gold_mana_vi_ring) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }
    if (!FindImageCharacter(gold_mana_vi_ring)) {
        Send, {f3}{1}{2}{3}{%currentF%}
    }

    if (!FindImageCharacter(gold_mana_vi_ring)) {
        Send, {f3}{1}{2}{3}{%currentF%}
    }
    setGUIJewelry("VI / MANA")
}

ConjurerConfigF2(gold_melee_ring, gold_ranged_amulet) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }

    if (!FindImageCharacter(gold_melee_ring)) {
        Send, {f3}{4}{5}{6}{%currentF%}
    }
    else {
        if (!FindImageCharacter(gold_ranged_amulet)) {
            Send, {f3}{0}{%currentF%}
        }
        else {
            Send, {f3}{4}{%currentF%}
        }
    }
    setGUIJewelry("TANK")
}

; Mana and Tank Set
ConjurerConfigTAB(mana_gloves, cast_speed_staff, health_staff) {
    /*
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }

    ;TANK SET
    if (!FindImageCharacter(mana_gloves)) {
        if (!FindImageCharacter(health_staff) and !FindImageCharacter(cast_speed_staff)) { ; no staff
            Send, {f3}{7}{8}{9}{%currentF%} 
        }
        if (FindImageCharacter(cast_speed_staff)) { ; TANK SET + VI STAFF
            Send, {f3}{7}{8}{%currentF%}  ; mana set
        }
        if (FindImageCharacter(health_staff)) { ; TANK SET + TANK STAFF
            Send, {f3}{7}{8}{9}{%currentF%} ; mana set + cs staff
        }
    }
    ; MANA SET
    else {
        if (!FindImageCharacter(health_staff) and !FindImageCharacter(cast_speed_staff)) { ; no staff
            Send, {f4}{7}{8}{9}{%currentF%} 
        }
        if (FindImageCharacter(cast_speed_staff)) { ; MANA SET + VI STAFF
            Send, {f4}{7}{8}{9}{%currentF%}  ; tank set + tank staff
        }
        if (FindImageCharacter(health_staff)) { ; MANA SET + TANK STAFF
            Send, {f4}{7}{8}{%currentF%} ; tank set
        }
	}
    */
}

;review at 04/07/2022
ConjurerConfigRangedStaff(health_staff) {
   global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }

    if (!FindImageCharacter(health_staff)) {
        Send, {f4}{9}{%currentF%} ; ranged 30 staff
    }
    else {
        Send, {f3}{9}{%currentF%} ; health staff
    }
}