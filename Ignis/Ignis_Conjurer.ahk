#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Conjurer Class Spells
conjurer_heal_ally = Images\Conjurer\Class Spells\heal_ally.bmp
conjurer_heal_self = Images\Conjurer\Class Spells\heal_self.bmp
conjurer_divine_intervention = Images\Conjurer\Class Spells\divine_intervention.bmp

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
    else { ;Do Nothing
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