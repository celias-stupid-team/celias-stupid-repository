
EventScript_EnableMysteryGift::
	applymovement VAR_0x8008, Common_Movement_FaceDown
	waitmovement 0
	playse SE_PIN
	applymovement VAR_0x8008, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement VAR_0x8008, Common_Movement_Delay48
	waitmovement 0
	msgbox Text_YouKnowThoseWords
	setflag FLAG_SYS_MYSTERY_GIFT_ENABLED
	textcolor NPC_TEXT_COLOR_NEUTRAL
	special DisableMsgBoxWalkaway
	signmsg
	msgbox Text_YouCanAccessMysteryGift
	normalmsg
	releaseall
	end

EventScript_DeclineQuestionnaire::
	releaseall
	end

EventScript_TookQuestionnaire::
	applymovement VAR_0x8008, Common_Movement_FaceDown
	waitmovement 0
	msgbox Text_QuestionnaireThankYou
	releaseall
	end
