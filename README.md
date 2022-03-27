# c-reverse-shell

## Info

A reverse shell for Windows and Linux written in C.

## Dependencies

For Windows you will need `mingw-w64` compiler (the `.exe` file is compiled in linux):
```sh
sudo apt install gcc-mingw-w64
```

## How to use

1. Clone repo:
```sh
git clone https://github.com/izenynn/c-reverse-shell.git
```

2. Change the `CLIENT_IP` and `CLIENT_PORT` in the file `reverse-shell.c` (lines 20 and 21):
```diff
 /* ================================================== */
 /* |      CHANGE THIS TO YOUR IP AND YOUR PORT      | */
 /* ================================================== */
-#define CLIENT_IP "0.0.0.0"
-#define CLIENT_PORT (int)0
+#define CLIENT_IP "XXX.XXX.XXX.XXX"
+#define CLIENT_PORT (int)XXXX
 /* ================================================== */
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

Other Make rules:
- `make all`
- `make linux`
- `make windows`
- `make clean`
- `make re`

##
[![forthebadge](https://forthebadge.com/images/badges/made-with-c.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/thats-how-they-get-you.svg)](https://forthebadge.com)
