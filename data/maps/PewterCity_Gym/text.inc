PewterCity_Gym_Text_BrockIntro::
    .string "So, you're here. I'm BROCK.\n"
    .string "I'm PEWTER's GYM LEADER.\p"
    .string "My POKéMON is rock-hard, and\n"
    .string "has true-grit determination.\p"
    .string "That's right - my POKéMON is\n"
    .string "immune to physical attacks!\p"
    .string "Fuhaha! Do you have what it'll\n"
    .string "take to get through me?\p"
    .string "Fine, then!\n"
    .string "Show me your best!{PLAY_BGM}{MUS_ENCOUNTER_GYM_LEADER}$"

@ NOTE: This defeat text actually causes a buffer overflow. It's too long for the gDisplayedStringBattle
@ buffer that it's put into, and it stomps all over the gBattleTextBuffs after, as well as the otherwise
@ unused array after that, sFlickerArray. Perhaps that's the reason why said array exists.
PewterCity_Gym_Text_BrockDefeat::
    .string "I took you for granite, and so\n"
    .string "I lost.\p"
    .string "As proof of your victory, behold!\n"
    .string "I confer on you this… the official\l"
    .string "POKéMON LEAGUE BOULDERBADGE.\p"
    .string "{FONT_NORMAL}{PLAYER} received the BOULDERBADGE\n"
    .string "from BROCK!{PAUSE_MUSIC}{PLAY_BGM}{MUS_OBTAIN_BADGE}{PAUSE 0xFE}{PAUSE 0x56}{RESUME_MUSIC}$"

PewterCity_Gym_Text_TakeThisWithYou::
    .string "Oh!\n"
    .string "Take this with you.$"

PewterCity_Gym_Text_ReceivedTM39FromBrock::
    .string "{PLAYER} received TM39\n"
    .string "from BROCK.$"

PewterCity_Gym_Text_ExplainTM39::
    .string "A TM, TRADEMARK, contains a\n"
    .string "copyrighted attack.\p"
    .string "Using a TM teaches the move it\n"
    .string "contains to a POKéMON.\p"
    .string "A TM can't be copied, so you can\n"
    .string "only use it once!\p"
    .string "Otherwise you might get a strike.\p"
    .string "Anyways…\n"
    .string "TM39 contains BIDE.\p"
    .string "It is a move that definitely\n"
    .string "exists.$"

PewterCity_Gym_Text_BrockPostBattle::
    .string "Time to grab my frying pan.$"

PewterCity_Gym_Text_DontHaveRoomForThis::
    .string "You don't have room for this.$"

PewterCity_Gym_Text_LiamIntro::
	.string "Stop right there, kid!\p"
	.string "You're ten thousand light-years\n"
	.string "from facing BROCK!$"

PewterCity_Gym_Text_LiamDefeat::
	.string "Shit!\p"
	.string "You're more than ten feet older\n"
	.string "than me!$"

PewterCity_Gym_Text_LiamPostBattle::
    .string "You're pretty hot.\n"
    .string "…Wanna go out for dinner?$"

PewterCity_Gym_Text_LetMeTakeYouToTheTop::
    .string "Hiya!\n"
    .string "Do you want to dream big?\p"
    .string "Do you dare to dream of becoming\n"
    .string "the POKéMON champ?\p"
    .string "I'm no TRAINER, but I can advise\n"
    .string "you on how to win!$"

PewterCity_Gym_Text_LetsGetHappening::
    .string "All right!\n"
    .string "Let's get happening!$"

PewterCity_Gym_Text_TryDifferentPartyOrders::
    .string "They say that BROCK here can't\n"
    .string "be defeated using Physical attacks.\p"
    .string "His ONIX also loves WATER so\n"
    .string "WATER GUN won't work on it.\p"
    .string "You'll have to find a different\n"
    .string "Special move to use instead!$"

PewterCity_Gym_Text_ItsFreeLetsGetHappening::
    .string "It's a free service!\n"
    .string "Let's get happening!$"

PewterCity_Gym_Text_YoureChampMaterial::
    .string "Just as I thought!\n"
    .string "You're POKéMON champ material!$"

PewterCity_Gym_Text_GymStatue::
    .string "PEWTER POKéMON GYM\n"
    .string "LEADER: BROCK\p"
    .string "WINNING TRAINERS:\n"
    .string "GARY, LARRY$"

PewterCity_Gym_Text_GymStatuePlayerWon::
    .string "PEWTER POKéMON GYM\n"
    .string "LEADER: BROCK\p"
    .string "WINNING TRAINERS:\n"
    .string "GARY, LARRY, {PLAYER}$"

PewterCity_Gym_Text_LightYears::
    .string "58,786,253,730,000,000 miles\n"
    .string "later…$"

PewterCity_Gym_Text_Sprinklers::
	.string "Oh shoot.\p"
	.string "There go the sprinklers again.\n$"

PewterCity_Gym_Text_DryingPan::
	.string "Whelp.\n"
	.string "Time to grab my frying pan.$"
