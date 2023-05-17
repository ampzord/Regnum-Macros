#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#Include Alsius_Conjurer.ahk
#Include Alsius_Knight.ahk

; USER INPUT
character_button_hotkey = x
character_window_path = Images\character_window2.bmp

;Rings and Amulets
gold_mana_vi_ring = Images\Jewelry\Rings\Lvl50\lvl50_mana_vi_ring.bmp
gold_melee_ring = Images\Jewelry\Rings\Lvl50\lvl50_melee_ring.bmp
gold_ranged_amulet = Images\Jewelry\Amulets\Lvl50\lvl50_ranged_amulet.bmp
gold_melee_amulet = Images\Jewelry\Amulets\Lvl50\lvl50_melee_amulet.bmp
quest_health_ring = Images\Jewelry\Rings\Quest\quest_health_ring.bmp
deadly_sight_ring = Images\Jewelry\Rings\Quest\quest_deadly_sight_ring.bmp
ring_of_lightning = Images\Jewelry\Rings\Quest\quest_ring_of_lightning.bmp

#IfWinActive Champions of Regnum

current_class := "UNDEFINED"
current_jewelry := "UNDEFINED"
currentF = F1


if (!WinExist("Info")) {
    Gui MyGui:New, , Info
    Gui MyGui: +Resize +MinSize400x200
    ; Gui MyGui: +AlwaysOnTop
    Gui MyGui: Add, Text, ,Current Macro being used:
    Gui MyGui: font, s18, bold, 
    Gui MyGui: Add, Text, vMyClass, %current_class%
    Gui MyGui: Add, Text, vMyJewelry, %current_jewelry%
    Gui MyGui: Show, x2000 y600, Class Information Display
}

F1::
    currentF = F1
    Send, {f1}
Return

F2::
    currentF = F2
    Send, {f2}
Return

F3::
    currentF = F3
    Send, {f3}
Return

F4::
    currentF = F4
    Send, {f4}
Return

FindImage(path_to_file, x, y, new_x, new_y) {
    CoordMode Pixel
    ; MsgBox %path_to_file%, %x%, %y%, %new_x%, %new_y%
    ImageSearch, FoundX, FoundY, x, y, new_x, new_y, *12 %A_ScriptDir%\%path_to_file%
    if (ErrorLevel = 2) {
        MsgBox Could not find picture in files.
    }
    else if (ErrorLevel = 1) {
        Return False
    }
    else {
        Return True
    }
}

FindImageCharacter(path_to_file) {
    Return FindImage(path_to_file, 1400, 458, 1910, 1040)
}

FindImageQuickBar(path_to_file) {
    Return FindImage(path_to_file, 625, 994, 1098, 1078)
}

; -----------------------------------------------------------------------------

updateGUIClass() {
    global current_class
    GuiControlGet MyClass
	GuiControl MyGui:Text, MyClass, %current_class%
}

setGUIJewelry(jewelry_type) {
    current_jewelry := jewelry_type
    GuiControlGet MyJewelry
    GuiControl MyGui:Text, MyJewelry, %current_jewelry%
}

; Updates current class being used
F9::
    if (IsConjurerClass()) {
        current_class := "Conjurer"
    } 
    else if (isKnightClass()) {
        current_class := "Knight"
    }
    updateGUIClass()
return

XButton1 & 1::
    switch current_class
    {
        case "Conjurer", "Knight": Send, {LShift Down}{1}{LShift Up}
        Default: Send, {LShift Down}{1}{LShift Up}
    }
return

XButton1 & 2::
    switch current_class
    {
        case "Conjurer", "Knight": Send, {LShift Down}{2}{LShift Up}
        Default: Send, {LShift Down}{2}{LShift Up}
    }
return

XButton1 & 3::
    switch current_class
    {
        case "Conjurer": Send, {LShift Down}{3}{LShift Up}
        case "Knight": KnightSpearConfig(knight_spear)
        Default: Send, {LShift Down}{3}{LShift Up}
    }
return

XButton1 & 4::
    switch current_class
    {
        case "Conjurer": Send, {LShift Down}{4}{LShift Up}
        case "Knight": KnightHammerConfig(knight_hammer)
        Default: Send, {LShift Down}{4}{LShift Up}
    }
return

XButton1 & 5::
    switch current_class
    {
        case "Conjurer", "Knight": Send, {LShift Down}{5}{LShift Up}
        Default: Send, {LShift Down}{5}{LShift Up}
    }
return

XButton1 & 6::
    switch current_class
    {
        case "Conjurer", "Knight": Send, {LShift Down}{6}{LShift Up}
        Default: Send, {LShift Down}{6}{LShift Up}
    }
return

XButton1 & 7::
    switch current_class
    {
        case "Conjurer", "Knight": Send, {LShift Down}{7}{LShift Up}
        Default: Send, {LShift Down}{7}{LShift Up}
    }
return

XButton1 & 8::
    switch current_class
    {
        case "Conjurer", "Knight": Send, {LShift Down}{8}{LShift Up}
        Default: Send, {LShift Down}{8}{LShift Up}
    }
return

XButton1 & 9::
    switch current_class
    {
        case "Conjurer", "Knight": Send, {LShift Down}{9}{LShift Up}
        Default: Send, {LShift Down}{9}{LShift Up}
    }
return

XButton1 & 0::
    switch current_class
    {
        case "Conjurer", "Knight": Send, {LShift Down}{0}{LShift Up}
        Default: Send, {LShift Down}{0}{LShift Up}
    }
return

; 11
XButton1 & SC00C::
    switch current_class
    {
        case "Conjurer", "Knight": Send, {LShift Down}{SC00C}{LShift Up}
        Default: Send, {LShift Down}{SC00C}{LShift Up}
    }
return

; 12
XButton1 & SC00D::
    switch current_class
    {
        case "Conjurer", "Knight": Send, {LShift Down}{SC00D}{LShift Up}
        Default: Send, {LShift Down}{SC00D}{LShift Up}
    }
return

; EXTRA KEYS ----------------------------------------------

XButton1 & r::
    Send, {8}
return

XButton1 & f::
    Send, {9}
return

XButton1 & t::
    Send, {0}
return

XButton1 & c::
    Send, {LShift Down}{8}{LShift Up}
return

\::
    Send, {LShift Down}{9}{LShift Up}
return

XButton1 & b::
    Send, {LShift Down}{0}{LShift Up}
return

; ---------------------------------------------------------

LAlt::
    switch current_class
    {
        case "Conjurer": Send, {LShift Down}{SC00D}{LShift Up}
        case "Knight": Send, {LShift Down}{SC00D}{LShift Up}
        Default: Send, {LShift Down}{SC00D}{LShift Up}
    }
return

XButton1 & F1::
    switch current_class
    {
        case "Conjurer": ConjurerConfigF1(gold_mana_vi_ring) 
        case "Knight": KnightConfigF1(deadly_sight_ring) 
        Default: return
    }
return

XButton1 & F2::
    switch current_class
    {
        case "Conjurer": ConjurerConfigF2(gold_melee_ring, gold_ranged_amulet) 
        case "Knight": KnightConfigF2(quest_health_ring) 
        Default: return
    }
return

TAB::
XButton1 & TAB::
    switch current_class
    {
        case "Conjurer": ConjurerConfigTAB(mana_gloves, cast_speed_staff, health_staff)
        Default: return
    }
return

XButton2::
    switch current_class
    {
        case "Conjurer": ConjurerConfigRangedStaff(health_staff)
        case "Knight": KnightSwordConfig(knight_sword)
        Default: return
    }
return


/*
Halv MACROS
MButton::
    switch current_class
    {
        Default: return
    }
return

~RButton::
    If (A_ThisHotkey = A_PriorHotkey and A_TimeSincePriorHotkey < 150)
    {
        Send, {f4}
    }
Return
*/

#IfWinActive