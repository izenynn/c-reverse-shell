##################################################
#                    PROGRAM                     #
##################################################

NAME_LIN = rsh.out
NAME_WIN = rsh.exe

##################################################
#                    COMPILER                    #
##################################################

CC_LIN = gcc
CC_WIN = i686-w64-mingw32-gcc-win32

LDFLAGS_LIN = -D LINUX
LDFLAGS_WIN = -D WIN32 -lws2_32

CFLAGS_LIN = -std=c99
CFLAGS_WIN = $(CFLAGS_LIN)

##################################################
#                    SOURCES                     #
##################################################

SRC_LIN = linux.c
SRC_WIN = windows.c

##################################################
#                     RULES                      #
##################################################

PHONY := all
all: linux windows

PHONY += linux
linux: $(NAME_LIN)

PHONY += windows
windows: $(NAME_WIN)

ifeq ($(WAIT_FOR_CLIENT),TRUE)
$(NAME_LIN): LDFLAGS_LIN += -D WAIT_FOR_CLIENT
endif
$(NAME_LIN): $(SRC_LIN)
	$(CC_LIN) $(CFLAGS_LIN) -o $@ $^ $(LDFLAGS_LIN)

ifeq ($(WAIT_FOR_CLIENT),TRUE)
$(NAME_WIN): LDFLAGS_WIN += -D WAIT_FOR_CLIENT
endif
$(NAME_WIN): $(SRC_WIN)
	$(CC_WIN) $(CFLAGS_WIN) -o $@ $^ $(LDFLAGS_WIN)

PHONY += clean
clean:
	rm -rf $(NAME_WIN)
	rm -rf $(NAME_LIN)

PHONY += re
re: clean all

.PHONY: $(PHONY)
