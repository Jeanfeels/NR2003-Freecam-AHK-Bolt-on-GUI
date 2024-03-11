#InstallKeybdHook         ; It breaks if I take this away
#SingleInstance Force     ; Makes sure only one instance is running
SetTitleMatchMode, 3      ; Forces WinActivate to ONLY detect the NR2003 executable
SetKeyDelay, 30, 30       ; Forces Send to hold buttons long enough for Freecam to detect it
/*
Thank you to CrashKZ on the AutoHotkey subreddit for pointing out that SetKeyDelay is a thing.
This script requires you to run Tyler Mallon's Freecam or most buttons won't do anything at all.
Built using SmartGUI for SciTE and Autohotkey v1.1
 */
 ; Layout template via SmartGUI Creator for SciTE
Gui, 1:Add, Pic, +Center, nrlogo.png						; Just so it doesn't look awful
Gui, 1:Add, Button, x46 y85 w90 h30 , TV Cam 1				; Buttons!
Gui, 1:Add, Button, x46 y125 w90 h30 , TV Cam 2
Gui, 1:Add, Button, x46 y165 w90 h30 , Spectator Cam
Gui, 1:Add, Button, x46 y205 w90 h30 , Heli Cam
Gui, 1:Add, Button, x46 y245 w90 h30 , Fix Stuck Heli Cam	; force presses 'c' if heli cam stuck
Gui, 1:Add, Button, x46 y305 w90 h30 , Car Roof
Gui, 1:Add, Button, x46 y345 w90 h30 , Car Front
Gui, 1:Add, Button, x46 y385 w90 h30 , Car Rear
Gui, 1:Add, Button, x46 y425 w90 h30 , Driver POV
Gui, 1:Add, Button, x46 y465 w90 h30 , Pit Lane Front
Gui, 1:Add, Button, x46 y505 w90 h30 , Pit Lane Rear
Gui, 1:Add, Button, x46 y545 w90 h30 , Follow Car Custom	; Use with freecam's ctrl+e
Gui, 1:Add, Button, x46 y605 w90 h30 , Next Vehicle			; probably unnecessary
Gui, 1:Add, Button, x46 y645 w90 h30 , Prev Vehicle			; but i find it useful
Gui, 1:Add, Button, x46 y705 w90 h30 , Exit
Gui, Font, S12 CDefault Bold, Verdana						; Set up font for header
Gui, 1:Add, Text, x12 y9 w160 h20 cFFFFFF +Center +BackgroundTrans, NR2003 Freecam
Gui, 1:Add, Text, x12 y60 w160 h20 cFFFFFF +Center +BackgroundTrans, AHK GUI Utility
Gui, 1:color, 42454a, 87888a 								; button and background colours
Gui, 1: +E0x08000000										; Force GUI click-through
Gui, 1:Show, AutoSize x5 yCenter NoActivate, NR2003 Freecam GUI Utility
WinSet, Style, WS_CAPTION, -1 , NR2003 Freecam GUI Utility	; set window style
Gui +LastFound
WinSet, Transcolor, 42454a									; Transparent background
Gui -Caption +AlwaysOnTop									; Floating window, no border
return

/*
Button press functions  as below:
1. Switch to the Nascar window
2. Wait 30ms to account for slow machines or lag
3. Send a keypress combination
   (the 'c' makes sure we aren't stuck in heli-cam but there's a dedicated button just in case)
4. Make certain the GUI doesn't steal back focus by making sure Nascar is activated
*/

ButtonTVCam1:
WinActivate, NR2023
Sleep, 30
Send, c^1
WinActivate, NR2023
return

ButtonTVCam2:
WinActivate, NR2023
Sleep, 30
Send, c^2
WinActivate, NR2023
return

ButtonSpectatorCam:
WinActivate, NR2023
Sleep, 30
Send, c^3
WinActivate, NR2023
return

ButtonHeliCam:
WinActivate, NR2023
Sleep, 30
Send, c^4
WinActivate, NR2023
return

ButtonFixStuckHeliCam:
WinActivate, NR2023
Sleep, 30
Send, c
WinActivate, NR2023
return

ButtonCarRoof:
WinActivate, NR2023
Sleep, 30
Send, c^5
WinActivate, NR2023
return

ButtonCarFront:
WinActivate, NR2023
Sleep, 30
Send, c^6
return

ButtonCarRear:
WinActivate, NR2023
Sleep, 30
Send, c^7
WinActivate, NR2023
return

ButtonDriverPOV:
WinActivate, NR2023
Sleep, 30
Send, c^8
WinActivate, NR2023
return

ButtonPitLaneFront:
WinActivate, NR2023
Sleep, 30
Send, c^9
WinActivate, NR2023
return

ButtonPitLaneRear:
WinActivate, NR2023
Sleep, 30
Send, c^0
WinActivate, NR2023
return

ButtonFollowCarCustom:
WinActivate, NR2023
Sleep, 30
Send, c^b
WinActivate, NR2023
return

ButtonNextVehicle:
WinActivate, NR2023
Sleep, 30
Send, v
WinActivate, NR2023
return

ButtonPrevVehicle:
WinActivate, NR2023
Sleep, 30
Send, +v
WinActivate, NR2023
return

; finally, the exit button closes the GUI
ButtonExit:
GuiClose:
ExitApp
