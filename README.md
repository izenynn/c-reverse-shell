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

2. Compile for Linux and Windows with `make` (equivalent to `make all`):
```sh
make
```

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
