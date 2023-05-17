#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Conjurer Class Spells
conjurer_heal_ally = Images\Conjurer\Class Spells\heal_ally.bmp
conjurer_heal_self = Images\Conjurer\Class Spells\heal_self.bmp
conjurer_divine_intervention = Images\Conjurer\Class Spells\divine_intervention.bmp

; Conjurer Armour
conj_champ_gloves = Images\Conjurer\Armour\champion_gloves.bmp
conj_mana_gloves = Images\Conjurer\Armour\mana_gloves.bmp
conju_dragon_gloves = Images\Conjurer\Armour\dragon_gloves.bmp

; Conjurer Weapons
conj_health_staff = Images\Conjurer\Weapons\health_staff.bmp
conj_cast_speed_staf = Images\Conjurer\Weapons\cast_speed_staff.bmp
conj_damage_staf = Images\Conjurer\Weapons\damage_staff.bmp
conj_ranged_staf = Images\Conjurer\Weapons\ranged_staff.bmp

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

ConjurerConfigF1(gold_mana_vi_ring, wm_melee_amulet, wm_melee_ring, gold_ranged_amulet, quest_deadly_sight_ring, pet_physical_damage) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }

    if (FindImageCharacter(wm_melee_ring) && FindImageCharacter(wm_melee_amulet)) {
        Send, {f3}{2}{3}{%currentF%}
        setGUIJewelry("VI / MANA")
    }
    else if (FindImageCharacter(wm_melee_ring) && FindImageCharacter(gold_ranged_amulet)) {
        Send, {f3}{2}{3}{4}{%currentF%}
        setGUIJewelry("VI / MANA")
    }

    if (FindImageCharacter(gold_mana_vi_ring)) {
        if (FindImageCharacter(wm_melee_amulet)) {
            Send, {f4}{2}{3}{4}{5}{%currentF%}
            
            if (FindImageActiveBuffs(pet_physical_damage)) {
                Send, {f2}{SC00C}{%currentF%}
            }
            setGUIJewelry("DAMAGE")
        }
        else {
            Send, {f3}{2}{3}{4}{%currentF%}
            setGUIJewelry("VI / MANA")
        }
    }
    else if (FindImageCharacter(quest_deadly_sight_ring)) {
        Send, {f3}{2}{3}{4}{%currentF%}
        setGUIJewelry("VI / MANA")
    }


    
}

ConjurerConfigF2(wm_melee_ring, gold_ranged_amulet, wm_melee_amulet, pet_physical_damage) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }

    if (!FindImageCharacter(wm_melee_ring) && !FindImageCharacter(wm_melee_amulet)) {
        Send, {f3}{4}{5}{6}{%currentF%}
    }
    else if (!FindImageCharacter(wm_melee_ring) && FindImageCharacter(wm_melee_amulet)) {
        Send, {f3}{5}{6}{%currentF%}
    }
    else {
        if (!FindImageCharacter(gold_ranged_amulet)) {
            Send, {f4}{0}{%currentF%}
        } 
        else {
            Send, {f3}{4}{%currentF%}
        }
    }
    setGUIJewelry("TANK")

    if (!FindImageActiveBuffs(pet_physical_damage)) {
        Send, {f2}{SC00C}{%currentF%}
    }
}

ConjurerConfigTAB(conju_dragon_gloves, conj_health_staff, conj_cast_speed_staf) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }

    ;Dragon SET -> TANK SET
    if (FindImageCharacter(conju_dragon_gloves)) {
        if (!FindImageCharacter(conj_health_staff) and !FindImageCharacter(conj_cast_speed_staf)) { ; no staff
            Send, {f3}{7}{8}{9}{f4}{SC00D}{%currentF%} ; send set + tank staff
        }
        if (FindImageCharacter(conj_cast_speed_staf)) { ; TANK SET + VI STAFF
            Send, {f3}{7}{8}{9}{f4}{SC00D}{%currentF%}  ; mana set
        }
        if (FindImageCharacter(conj_health_staff)) { ; TANK SET + TANK STAFF
            Send, {f3}{7}{8}{9}{%currentF%} ; mana set + cs staff
        }
    }
    ; TANK SET -> DRAGON
    else {
        if (!FindImageCharacter(conj_health_staff) and !FindImageCharacter(conj_cast_speed_staf)) { ; no staff
            Send, {f4}{7}{8}{9}{6}{%currentF%} 
        }
        if (FindImageCharacter(conj_cast_speed_staf)) { ; MANA SET + VI STAFF
            Send, {f4}{7}{8}{9}{%currentF%}  ; tank set + tank staff
        }
        if (FindImageCharacter(conj_health_staff)) { ; MANA SET + TANK STAFF
            Send, {f4}{7}{8}{9}{6}{%currentF%} ; tank set
        }
	}
}

ConjurerRangedStaff(conj_ranged_staf) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }

    if (!FindImageCharacter(conj_ranged_staf)) {
        Send, {f4}{SC00C}{%currentF%} ;Health Staff
    }
    else {
		Send, {f4}{SC00D}{%currentF%} ;Range 30 Staff
	}
}

