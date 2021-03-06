# ----------------------------------------------------------------------------
#         ATMEL Microcontroller Software Support 
# ----------------------------------------------------------------------------
# Copyright (c) 2010, Atmel Corporation
#
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# - Redistributions of source code must retain the above copyright notice,
# this list of conditions and the disclaimer below.
#
# Atmel's name may not be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# DISCLAIMER: THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
# DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
# OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# ----------------------------------------------------------------------------
SERIE = sam3s
#CHIP = sam3s2
BUILDDIR = $(CONTIKI_CPU)/libchip_sam3s/build/gcc
USBDIR = $(CONTIKI_CPU)/usb/build/gcc
# Makefile for compiling libchip

SUBMAKE_FILES=debug.mk gcc.mk iar.mk mdk.mk release.mk win.mk linux.mk atsam3s.mk
#SUBMAKE_OPTIONS=--no-builtin-rules --no-builtin-variables -d -p
SUBMAKE_OPTIONS=--no-builtin-rules --no-builtin-variables
SUBMAKE_VARS=

#-------------------------------------------------------------------------------
# Rules
#-------------------------------------------------------------------------------
.PHONY: chiplib
chiplib:
	echo maekin chiplib
	$(MAKE) -C $(BUILDDIR) CHIP=$(CHIP) DEBUG=1 $(SUBMAKE_OPTIONS) -f $(SERIE).mk
	$(MAKE) -C $(BUILDDIR) CHIP=$(CHIP) $(SUBMAKE_OPTIONS) -f $(SERIE).mk
	echo done maekin chiplib

.PHONY: clean-chiplib
clean-chiplib:
	echo --- Cleaning $(CHIP)
	$(MAKE) -C $(BUILDDIR) CHIP=$(CHIP) $(SUBMAKE_OPTIONS) -f $(SERIE).mk $@
	$(MAKE) -C $(BUILDDIR) CHIP=$(CHIP) DEBUG=1 $(SUBMAKE_OPTIONS) -f $(SERIE).mk $@

.PHONY: usblib
usblib:
	$(MAKE) -C $(USBDIR) CHIP=$(CHIP) EXTRAINCLUDES=-I../../../$(CONTIKI_CPU)/../../platform/muccc-sam3s/libboard_sam3s-muccc -f Makefile

