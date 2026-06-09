#!/usr/bin/env make
#
# 2025/dogon Fun Challenge 2 version

################################################################################
#
# IOCCC winning entry code may not work on your system.  What was liked/allowed
# and worked in the past may no longer be liked/allowed or compile/run today.
#
# Bug fixes, corrections and typo fixes are VERY WELCOME.  If you see a problem,
# first check this URL for a list of known bugs and (mis)features of IOCCC entries:
#
#	https://www.ioccc.org/bugs.html
#
################################################################################
#
# Original version This file is Copyright (c) 2026 by Landon Curt Noll.  
# All Rights Reserved.
# You are free to share and adapt this file under the terms of this license:
#
#	Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
#
# For more information, see: https://creativecommons.org/licenses/by-sa/4.0/
# 
# Some small changes have been made for the Fun Challenge 2 code to sit in this
# repository alongside the original.
# 
# These changes are Copyright (c) 2026 by Samantha Howard and are shared under
# the same CC-by-SA 4.0 license linked above.


#############################
# shell used by this Makefile
#############################

SHELL= bash

#####################
# C compiler settings
#####################

# Common C compiler warnings to silence
#
# Example: CSILENCE= -Wno-some-thing -Wno-another-thing
#
CSILENCE= -Wno-format-security -Wno-implicit-int -Wno-shift-op-parentheses \
	-Wno-tautological-compare -Wno-unused-value

# Attempt to silence unknown warnings
#
CUNKNOWN= -Wno-unknown-warning-option

# Common C compiler warning flags
#
CWARN=

# The standard to compile against
#
CSTD= -std=gnu17

# Compiler bit architecture
#
ARCH= -m64

# Defines that are needed to compile
#
# Example: -Dfoo -Dbar=baz
#
CDEFINE=

# Include files that are needed to compile
#
# Example: CINCLUDE= -include stdio.h
#
CINCLUDE=

# Other flags to pass to the C compiler
#
# Example: COTHER= -fno-math-errno
#
COTHER=

# Optimization
#
OPT= -O0

# Default flags for ANSI C compilation
#
CFLAGS= ${CSTD} ${CWARN} ${ARCH} ${CDEFINE} ${CINCLUDE} ${CSILENCE} ${COTHER} ${OPT}

# Libraries needed to build
#
LDFLAGS=

###########################################
# Special Makefile variables for this entry
###########################################

# what to build
#
ENTRY= prog
PROG= ${ENTRY}
#
OBJ= ${PROG}.o
TARGET= ${PROG}
#
ORIG_OBJ= ${PROG}.orig.o
ORIG_TARGET= ${PROG}.orig

# list any data files supplied with your submission
#
# Example: DATA= curds whey
#
DATA=

# shell scripts
#
SH_TOOLS= try.sh 

#################
# build the entry
#################

all: data ${SH_TOOLS} ${TARGET} 
	@${TRUE}

.PHONY: all data everything clean clobber

# how to compile
#
${PROG}: ${PROG}.c
	${CC} ${CFLAGS} ${PROG}.c -o $@ ${LDFLAGS}

# original version executable
#
orig: data ${ORIG_TARGET}
	@${TRUE}

${PROG}.orig: ${PROG}.orig.c
	${CC} ${CFLAGS} ${PROG}.orig.c -o $@ ${LDFLAGS}

# data files
#
data: ${DATA}
	@${TRUE}

# both all and orig
#
everything: all orig
	@${TRUE}

###############
# utility rules
###############
#
clean:
	${RM} -f ${OBJ} ${ORIG_OBJ}

clobber: clean
	${RM} -f ${TARGET} ${ORIG_TARGET}
	${RM} -rf *.dSYM
	${RM} -f bar foo out
