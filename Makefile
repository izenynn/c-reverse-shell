##################################################
#                    PROGRAM                     #
##################################################

NAME_LIN = reverse.elf
NAME_WIN = reverse.exe

##################################################
#                    COMPILER                    #
##################################################

CC_LIN = gcc
CC_WIN = i686-w64-mingw32-gcc-win32

CFLAGS = -std=c99

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
$(NAME_LIN): CFLAGS += -D WAIT_FOR_CLIENT
endif
$(NAME_LIN): $(SRC_LIN)
	$(CC_LIN) $(CFLAGS) $^ -o $@

ifeq ($(WAIT_FOR_CLIENT),TRUE)
$(NAME_WIN): CFLAGS += -D WAIT_FOR_CLIENT
endif
$(NAME_WIN): $(SRC_WIN)
	$(CC_WIN) $(CFLAGS) $^ -o $@ -lws2_32

PHONY += clean
clean:
	rm -rf $(NAME_WIN)
	rm -rf $(NAME_LIN)

PHONY += re
re: clean all

.PHONY: $(PHONY)
