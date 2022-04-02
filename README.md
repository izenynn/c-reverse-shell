# c-reverse-shell

## Info

A reverse shell for Windows and Linux written in C.

Features:
- Linux and Windows version.
- Runs in the background (on both, Linux and Windows, no blocking terminal or black screen).
- You can choose between waiting for the client (if it's no listening) or not.
- Compile with just one command (see at the bottom of the `README.md`), there is also a `Makefile`.

## Dependencies

For Windows you will need `mingw-w64` compiler (the `.exe` binary is compiled in linux):
```sh
sudo apt install gcc-mingw-w64
```

## How to use

1. Clone repo:
```sh
git clone https://github.com/izenynn/c-reverse-shell.git
```

2. Change client IP and client PORT with `change_client.sh` (you can change it manually inside `linux.c` and `windows.c` if you prefer):
```sh
./change_client.sh [CLIENT_IP] [CLIENT_PORT]
```

3. Compile for Linux and Windows with `make` (equivalent to `make all`):
```sh
make
```

4. And ✨ magic ✨ compile the program in your target, or just send the binary, and execute it, make sure your client is listening 😊.

Additionally you can compile with `WAIT_FOR_CLIENT` true, this will make the program loop until the connection to the client is established, instead of returning an error in the connection:
```sh
make WAIT_FOR_CLIENT=TRUE
```
*NOTE: this doen't work on windows, not sure why, but I'm sleepy, so maybe I fix it another day (or pull request if you fix it please 😊).*

Other `Makefile` rules:
- `make all`
- `make linux`
- `make windows`
- `make re`
-
- `make all WAIT_FOR_CLIENT=TRUE`
- `make linux WAIT_FOR_CLIENT=TRUE`
- `make windows WAIT_FOR_CLIENT=TRUE`
- `make re WAIT_FOR_CLIENT=TRUE`
-
- `make clean`

In case you don't have the `Makefile`, just copy the `reverse-shell.c` file and compile it with the following command:
- Linux
```sh
gcc -std=c99 linux.c -o rsh.out
```
```sh
gcc -std=c99 linux.c -o rsh.out -D WAIT_FOR_CLIENT
```
- Windows:
```sh
i686-w64-mingw32-gcc-win32 -std=c99 windows.c -o rsh.exe -lws2_32
```
```sh
i686-w64-mingw32-gcc-win32 -std=c99 windows.c -o rsh.exe -lws2_32 -D WAIT_FOR_CLIENT
```

##
[![forthebadge](https://forthebadge.com/images/badges/made-with-c.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/thats-how-they-get-you.svg)](https://forthebadge.com)
