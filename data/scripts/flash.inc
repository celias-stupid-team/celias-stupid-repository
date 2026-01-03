EventScript_FldEffFlash::
	animateflash 0
	setflashlevel 0
	end

EventScript_TooDarkToSee::
	lockall
	msgbox Text_TooDarkToSee
	releaseall
	end

Text_TooDarkToSee::
	.string "Uh oh!\n"
	.string "It's too dark to see it!$"
