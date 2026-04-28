# Default variables

GAME_VERSION  ?= FIRERED
GAME_REVISION ?= 1
GAME_LANGUAGE ?= ENGLISH

# Builds the ROM using a modern compiler
MODERN        ?= 1
# Compares the ROM to a checksum of the original - only makes sense using when non-modern
COMPARE       ?= 0

KEEP_TEMPS    ?= 0

# Release build - turn off debugging
RELEASE       ?= 0

ifeq (classic,$(MAKECMDGOALS))
  MODERN := 0
endif
ifeq (compare,$(MAKECMDGOALS))
  COMPARE := 1
endif
ifeq (release,$(MAKECMDGOALS))
  RELEASE := 1
endif

# For gbafix
MAKER_CODE := 01

BUILD_DIR := build

# Version
ifeq ($(GAME_VERSION),FIRERED)
  TITLE       := dumb hack
  GAME_CODE   := BPR
  BUILD_NAME  := firered
else
ifeq ($(GAME_VERSION),LEAFGREEN)
  TITLE       := POKEMON LEAF
  GAME_CODE   := BPG
  BUILD_NAME  := leafgreen
else
  $(error unknown version $(GAME_VERSION))
endif
endif

# Revision
ifeq ($(GAME_REVISION),0)
  BUILD_NAME  := $(BUILD_NAME)_rev0
endif

# Modern GCC
ifeq ($(MODERN),0)
  BUILD_NAME := $(BUILD_NAME)_classic
endif

# Language
ifeq ($(GAME_LANGUAGE),ENGLISH)
  GAME_CODE  := $(GAME_CODE)E
endif
