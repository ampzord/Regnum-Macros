; *******************************************************************************************
; **************************************   General   ****************************************
; *******************************************************************************************
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;#InstallKeybdHook
;#InstallMouseHook
;#KeyHistory 100

; *******************************************************************************************
; ****************************************   RO   *******************************************
; *******************************************************************************************

; USER INPUT
character_button_hotkey = x
character_window_path = Images\character_window2.bmp
gold_mana_vi_ring = Images\Jewelry\Rings\Lvl50\lvl50_mana_vi_ring.bmp
gold_melee_ring = Images\Jewelry\Rings\Lvl50\lvl50_melee_ring.bmp
gold_ranged_amulet = Images\Jewelry\Amulets\Lvl50\lvl50_ranged_amulet.bmp
gold_melee_amulet = Images\Jewelry\Amulets\Lvl50\lvl50_melee_amulet.bmp
quest_health_ring = Images\Jewelry\Rings\Quest\quest_health_ring.bmp
deadly_sight_ring = Images\Jewelry\Rings\Quest\quest_deadly_sight_ring.bmp
ring_of_lightning = Images\Jewelry\Rings\Quest\quest_ring_of_lightning.bmp

knight_spear = Images\Knight\Weapons\spear.bmp
knight_sword = Images\Knight\Weapons\sword.bmp
knight_hammer = Images\Knight\Weapons\hammer.bmp


#IfWinActive Champions of Regnum

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

FindImage(x, y, new_x, new_y, path_to_file) {
    CoordMode Pixel
    ImageSearch, FoundX, FoundY, x, y, new_x, new_y, %A_ScriptDir%\%path_to_file%
    if (ErrorLevel = 2) {
        MsgBox Could not find picture in files.
    }
    ; Didn't find Image
    else if (ErrorLevel = 1) {
        Return 0
    }
    ;Found Image
    else {
        Return 1
    }
}



XButton1 & 1::
  Send, {LShift Down}{1}{LShift Up}
return

XButton1 & 2::
  Send, {LShift Down}{2}{LShift Up}
return

; SPEAR
XButton1 & 3::
	if (!FindImage(1400, 458, 1910, 1040, character_window_path)) {
			Send, {%character_button_hotkey%}
	}
	if (!FindImage(1515, 458, 1910, 1040, knight_spear)) {
		Send, {LShift Down}{3}{LShift Up}
	}
return

; HAMMER
XButton1 & 4::
	if (!FindImage(1400, 458, 1910, 1040, character_window_path)) {
			Send, {%character_button_hotkey%}
	}
	if (!FindImage(1515, 458, 1910, 1040, knight_hammer)) {
			Send, {LShift Down}{4}{LShift Up}
	}
return

XButton1 & 5::
  Send, {LShift Down}{5}{LShift Up}
return

XButton1 & 6::
  Send, {LShift Down}{6}{LShift Up}
return

XButton1 & 7::
  Send, {LShift Down}{7}{LShift Up}
return

XButton1 & 8::
  Send, {LShift Down}{8}{LShift Up}
return

XButton1 & 9::
  Send, {LShift Down}{9}{LShift Up}
return

XButton1 & 0::
  Send, {LShift Down}{0}{LShift Up}
return

; 11
XButton1 & SC00C::
  Send, {LShift Down}{SC00C}{LShift Up}
return

; 12
XButton1 & SC00D::
  Send, {LShift Down}{SC00D}{LShift Up}
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

; JEWELRY CHANGING ---------------------------------------------------

;{SC00C}{SC00D}

; MANA SET
;LAlt::
;  Send, {f4}{1}{2}{3}{%currentF%}
;return

; DAMAGE RINGS
;XButton1 & F1::
;  CoordMode Pixel
;	ImageSearch, FoundX, FoundY, 1515, 458, 1910, 1040, C:\Users\Amp-PC\Documents\Regnum\Macros\macros\macro-amp\Images\Knight\damage_ring.bmp
;	if (ErrorLevel = 2) {
;		MsgBox Could not conduct the search.
;	}
;	else if (ErrorLevel = 1) {
;		;switch to damage rings
;		  Send, {f3}{1}{2}{3}{%currentF%}
;	}
;	else {
;		;DO NOTHING
;	}
;return

; TANK RINGS
XButton1 & F2::
	if (!FindImage(1400, 458, 1910, 1040, character_window_path)) {
			Send, {%character_button_hotkey%}
	}
	if (!FindImage(1515, 458, 1910, 1040, quest_health_ring)) {
			Send, {f3}{4}{5}{6}{%currentF%}
	}
return

; DRAGON SET & CHAMPION SET
;XButton1 & TAB::
;  CoordMode Pixel
;	ImageSearch, FoundX, FoundY, 1515, 458, 1910, 1040, C:\Users\Amp-PC\Documents\Regnum\Macros\macros\macro-amp\Images\Knight\dragon_bp.bmp
;	if (ErrorLevel = 2) {
;		MsgBox Could not conduct the search.
;	}
;	else if (ErrorLevel = 1) {
;		;Dragon Set
;		Send, {f3}{7}{8}{9}{0}{SC00C}{%currentF%}
;	}
;	else {
;		;Champion Set
;		Send, {f4}{7}{8}{9}{0}{SC00C}{%currentF%}
;	}
;return

; MANA SET
;XButton1 & F3::
;  CoordMode Pixel
;	ImageSearch, FoundX, FoundY, 1515, 458, 1910, 1040, C:\Users\Amp-PC\Documents\Regnum\Macros\macros\macro-amp\Alsius\Images\Knight\quest_amulet_mana.bmp
;	if (ErrorLevel = 2) {
;		MsgBox Could not conduct the search.
;	}
;	else if (ErrorLevel = 1) {
;		;switch to mana set
;		Send, {f4}{4}{5}{6}{%currentF%}
;	}
;	else {
;		;DO NOTHING
;	}
;return


; MOUSE KEYBIND ----------------

; SWORD
XButton2::
	if (!FindImage(1400, 458, 1910, 1040, character_window_path)) {
			Send, {%character_button_hotkey%}
	}
	if (!FindImage(1515, 458, 1910, 1040, knight_sword)) {
			Send, {f4}{0}{%currentF%}
	}
return

;------------------------


