#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

;Marksman Class Spells
ethereal_arrow = Images\Marksman\Class Spells\ethereal_arrow.bmp
rafaga = Images\Marksman\Class Spells\rafaga.bmp
winter_stroke = Images\Marksman\Class Spells\winter_stroke.bmp

;Warlock Weapons
warlock_ranged_staff = Images\Warlock\Weapons\ranged30_staff.bmp

IsMarksmanClass() {
    global ethereal_arrow, rafaga, winter_stroke
    if (FindImageQuickBar(ethereal_arrow) or FindImageQuickBar(rafaga) or FindImageQuickBar(winter_stroke)) {
        return True
    }
    return False
}

; ---------- Marksman Configurations -------------

MarksmanConfigF1(quest_ring_of_lightning) {
    global character_button_hotkey, character_window_path, currentF
    if (!FindImageCharacter(character_window_path)) {
        Send, {%character_button_hotkey%}
    }
    if (!FindImageCharacter(quest_ring_of_lightning)) {
        Send, {f3}{1}{2}{3}{%currentF%} ;Switch to Damage Amulet and Rings
    }
    setGUIJewelry("Damage")
}

MarksmanConfigF2(quest_health_ring, gold_ranged_amulet) {
    global character_button_hotkey, character_window_path, currentF

    if (!FindImageCharacter(character_window_path)) {
			Send, {%character_button_hotkey%}
	}

	if (!FindImageCharacter(quest_health_ring)) {
        Send, {f3}{4}{5}{6}{%currentF%}
    }
    setGUIJewelry("Tank")
}

