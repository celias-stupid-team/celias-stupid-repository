EventScript_UseSurf::
	goto_if_questlog EventScript_UseSurfEnd
	checkfieldmove MOVE_SURF
	goto_if_eq VAR_RESULT, FIELD_MOVE_USE_PC_MON, EventScript_UseSurfAfterBuffer
	goto_if_eq VAR_RESULT, PARTY_SIZE, EventScript_UseSurfEnd
	bufferpartymonnick STR_VAR_1, VAR_RESULT
	setfieldeffectargument 0, VAR_RESULT
@ fallthrough
EventScript_UseSurfAfterBuffer::
	lockall
	msgbox Text_WantToSurf, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, EventScript_UseSurfRelease
	msgbox Text_UsedSurf
	dofieldeffect FLDEFF_USE_SURF
EventScript_UseSurfRelease:
	releaseall
EventScript_UseSurfEnd:
	end

EventScript_CurrentTooFast::
	lockall
	msgbox Text_CurrentTooFast
	releaseall
	end

@ added this for next demo
EventScript_UseSurfActual::
	goto_if_questlog EventScript_UseSurfEnd
	checkfieldmove MOVE_SURF
	goto_if_eq VAR_RESULT, FIELD_MOVE_USE_PC_MON, EventScript_UseSurfAfterBuffer
	goto_if_eq VAR_RESULT, PARTY_SIZE, EventScript_UseSurfEnd
	bufferpartymonnick STR_VAR_1, VAR_RESULT
	setfieldeffectargument 0, VAR_RESULT
@ fallthrough
EventScript_UseSurfActualAfterBuffer::
	lockall
	msgbox Text_WantToSurf, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, EventScript_UseSurfRelease
	msgbox Text_UsedSurf
	dofieldeffect FLDEFF_USE_SURF
