.SUFFIXES: .c

SHELL = /bin/sh
CC    = gcc
CFLAGS += -O3 -flto -Wall -ffast-math -std=gnu90
RM_F = rm -f
INSTALL = install
INSTALL_DIR     = $(INSTALL) -p -d -o root -g root  -m  755
INSTALL_PROGRAM = $(INSTALL) -p    -o root -g root  -m  755
INSTALL_DATA    = $(INSTALL) -p    -o root -g root  -m  644

prefix = /usr
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin

export

all: unlzx$(EXEEXT)

unlzx$(EXEEXT): unlzx.c
	 $(CC) -flto -x c unlzx.c  $(CFLAGS) -o unlzx$(EXEEXT)

clean:
	-$(RM_F) unlzx$(EXEEXT)

install: unlzx$(EXEEXT)
	 $(INSTALL_DIR)  $(DESTDIR)$(bindir)
	 $(INSTALL_DIR) $(DESTDIR)$(man1dir)
	-@$(RM_F) $(DESTDIR)$(bindir)/unlzx$(EXEEXT)
	-@$(RM_F) $(DESTDIR)$(man1dir)/unlzx.1
	$(INSTALL_PROGRAM) unlzx$(EXEEXT) $(DESTDIR)$(bindir)

uninstall:
	-$(RM_F) $(DESTDIR)$(bindir)/unlzx$(EXEEXT)
