#ifndef GUARD_HELP_SYSTEM_H
#define GUARD_HELP_SYSTEM_H

#include "global.h"
#include "list_menu.h"
#include "blit.h"
#include "constants/help_system.h"

#define MENU_INPUT_IDLE -1
#define MENU_INPUT_B    -2
#define MENU_INPUT_LR   -6
#define MENU_INPUT_UP   -4
#define MENU_INPUT_DOWN -5

#define NUM_CHAPTERS_GENESIS 50
#define NUM_CHAPTERS_EXODUS 40
#define NUM_CHAPTERS_LEVITICUS 27
#define NUM_CHAPTERS_NUMBERS 36
#define NUM_CHAPTERS_DEUTERONOMY 34
#define NUM_CHAPTERS_JOSHUA 24
#define NUM_CHAPTERS_JUDGES 21
#define NUM_CHAPTERS_RUTH 4
#define NUM_CHAPTERS_1_SAMUEL 31
#define NUM_CHAPTERS_2_SAMUEL 24
#define NUM_CHAPTERS_1_KINGS 22
#define NUM_CHAPTERS_2_KINGS 25
#define NUM_CHAPTERS_1_CHRONICLES 29
#define NUM_CHAPTERS_2_CHRONICLES 36
#define NUM_CHAPTERS_EZRA 10
#define NUM_CHAPTERS_NEHEMIAH 13
#define NUM_CHAPTERS_ESTHER 10
#define NUM_CHAPTERS_JOB 42
#define NUM_CHAPTERS_PSALMS 150
#define NUM_CHAPTERS_PROVERBS 31
#define NUM_CHAPTERS_ECCLESIASTES 12
#define NUM_CHAPTERS_SONG_OF_SOLOMON 8
#define NUM_CHAPTERS_ISAIAH 66
#define NUM_CHAPTERS_JEREMIAH 52
#define NUM_CHAPTERS_LAMENTATIONS 5
#define NUM_CHAPTERS_EZEKIEL 48
#define NUM_CHAPTERS_DANIEL 12
#define NUM_CHAPTERS_HOSEA 14
#define NUM_CHAPTERS_JOEL 3
#define NUM_CHAPTERS_AMOS 9
#define NUM_CHAPTERS_OBADIAH 1
#define NUM_CHAPTERS_JONAH 4
#define NUM_CHAPTERS_MICAH 7
#define NUM_CHAPTERS_NAHUM 3
#define NUM_CHAPTERS_HABAKKUK 3
#define NUM_CHAPTERS_ZEPHANIAH 3
#define NUM_CHAPTERS_HAGGAI 2
#define NUM_CHAPTERS_ZECHARIAH 14
#define NUM_CHAPTERS_MALACHI 4
#define NUM_CHAPTERS_MATTHEW 28
#define NUM_CHAPTERS_MARK 16
#define NUM_CHAPTERS_LUKE 24
#define NUM_CHAPTERS_JOHN 21
#define NUM_CHAPTERS_ACTS 28
#define NUM_CHAPTERS_PAUL 16
#define NUM_CHAPTERS_1_CORINTHIANS 16
#define NUM_CHAPTERS_2_CORINTHIANS 13
#define NUM_CHAPTERS_GALATIANS 6
#define NUM_CHAPTERS_EPHESIANS 6
#define NUM_CHAPTERS_PHILIPPIANS 4
#define NUM_CHAPTERS_COLOSSIANS 4
#define NUM_CHAPTERS_1_THESSALONIANS 5
#define NUM_CHAPTERS_2_THESSALONIANS 3
#define NUM_CHAPTERS_1_TIMOTHY 6
#define NUM_CHAPTERS_2_TIMOTHY 4
#define NUM_CHAPTERS_TITUS 3
#define NUM_CHAPTERS_PHILEMON 1
#define NUM_CHAPTERS_HEBREWS 13
#define NUM_CHAPTERS_JAMES 5
#define NUM_CHAPTERS_1_PETER 5
#define NUM_CHAPTERS_2_PETER 3
#define NUM_CHAPTERS_1_JOHN 5
#define NUM_CHAPTERS_2_JOHN 1
#define NUM_CHAPTERS_3_JOHN 1
#define NUM_CHAPTERS_JUDE 1
#define NUM_CHAPTERS_REVELATION 22

struct HelpSystemListMenu_sub
{
    struct ListMenuItem * items;
    u16 totalItems;
    u16 maxShowed;
    u8 left;
    u8 top;
};

struct HelpSystemListMenu
{
    struct HelpSystemListMenu_sub sub;
    u8 itemsAbove;
    u8 cursorPos;
    u8 state;
    u8 filler_10[0xC];
};

extern struct HelpSystemListMenu gHelpSystemListMenu;
extern struct ListMenuItem gHelpSystemListMenuItems[];
extern bool8 gHelpSystemEnabled;
extern bool8 gHelpSystemToggleWithRButtonDisabled;

// help_system_812B1E0
void SetHelpContextDontCheckBattle(u8);
void SetHelpContextForMap(void);
void SetHelpContext(u8);
bool8 HelpSystem_UpdateHasntSeenIntro(void);
bool8 HelpSystem_IsSinglePlayer(void);
void HelpSystem_Disable(void);
void HelpSystem_Enable(void);
void HelpSystem_EnableToggleWithRButton(void);
bool8 RunHelpMenuSubroutine(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);
bool8 HelpSystemSubroutine_PrintWelcomeMessage(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);
bool8 HelpSystemSubroutine_PrintSecondWelcomeMessage(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);
//bool8 HelpSystemSubroutine_WelcomeWaitButtonFirst(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);

bool8 HelpSystemSubroutine_WelcomeWaitButton(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);
bool8 HelpSystemSubroutine_SecondWelcomeWaitButton(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);

bool8 HelpSystemSubroutine_WelcomeEndGotoMenu(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);
bool8 HelpSystemSubroutine_MenuInputHandlerLayer1(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);
bool8 HelpMenuSubroutine_InitLayer1(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);
bool8 HelpMenuSubroutine_InitLayer2(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);
bool8 HelpMenuSubroutine_ReturnToLayer0(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);
bool8 HelpMenuSubroutine_ReturnToLayer1(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);
bool8 HelpMenuSubroutine_ReturnToLayer2(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);
bool8 HelpMenuSubroutine_SubmenuInputHandlerLayer1(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);
bool8 HelpMenuSubroutine_SubmenuInputHandlerLayer2(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);
void HelpSystem_PrintTopicLabel(void);
bool8 HelpMenuSubroutine_HelpItemPrintLayer2(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);
bool8 HelpMenuSubroutine_HelpItemPrintLayer3(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);
bool8 HelpMenuSubroutine_VerseDetails_WaitButton(struct HelpSystemListMenu * helpListMenu, struct ListMenuItem * listMenuItemsBuffer);
bool8 GetHelpSystemMenuLevel(void);

// help_system
bool8 RunHelpSystemCallback(void);
void SaveCallbacks(void);
void SaveMapGPURegs(void);
void SaveMapTiles(void);
void SaveMapTextColors(void);
void RestoreCallbacks(void);
void RestoreGPURegs(void);
void RestoreMapTiles(void);
void RestoreMapTextColors(void);
void CommitTilemap(void);
void HS_BufferFillMapWithTile1FF(void);
void HS_ShowOrHideWordHELPinTopLeft(u8 mode);
void HS_ShowOrHideControlsGuideInTopRight(u8 mode);
void HS_ShowOrHideMainWindowText(u8 mode);
void HS_SetMainWindowBgBrightness(u8 mode);
void HS_ShowOrHideToplevelTooltipWindow(u8 mode);
void HS_ShowOrHideHeaderAndFooterLines_Lighter(u8 mode);
void HS_ShowOrHideHeaderAndFooterLines_Darker(u8 mode);
void HS_ShowOrHideVerticalBlackBarsAlongSides(u8 mode);
void HS_ShowOrHideHeaderLine_Darker_FooterStyle(u8 mode);
void HS_ShowOrHideScrollArrows(u8 which, u8 mode);
void HelpSystem_PrintTextRightAlign_Row52(const u8 *str);
void HelpSystem_PrintTextAt(const u8 *, u8, u8);
void HelpSystem_PrintQuestionAndAnswerPair(const u8 *a0, const u8 *a1);
void HelpSystem_PrintTopicMouseoverDescription(const u8 *str);
void HelpSystem_FillPanel2(void);
void HelpSystem_FillPanel1(void);
void HelpSystem_InitListMenuController(struct HelpSystemListMenu *, u8, u8);
void HelpSystem_SetInputDelay(u8);
s32 HelpSystem_GetMenuInput(void);
void HS_UpdateMenuScrollArrows(void);

void DecompressAndRenderGlyph(u8 fontId, u16 glyph, struct Bitmap *srcBlit, struct Bitmap *destBlit, u8 *destBuffer, u8 x, u8 y, u8 width, u8 height);
void HelpSystem_PrintTextInTopLeftCorner(const u8 * str);
void HelpSystem_FillPanel3(void);
void PrintListMenuItems(void);
void PlaceListMenuCursor(void);
bool8 MoveCursor(u8 by, u8 dirn);
void BackupHelpContext(void);
void RestoreHelpContext(void);
void HelpSystemRenderText(u8 fontId, u8 * dest, const u8 * src, u8 x, u8 y, u8 width, u8 height);
void HelpSystem_DisableToggleWithRButton(void);

u8 GetHelpSystemStateLevel(void);

#endif //GUARD_HELP_SYSTEM_H
