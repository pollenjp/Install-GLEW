# install-GLFW

- [Prerequisite](#prerequisite)
- [Execute](#execute)

---


## Prerequisite

- GLFWのインストールが必要
    - https://github.com/pollenjp/Install-GLFW

---


## Execute

若干変わってるかも知れないが概ね以下のような感じ

```
 % make GLFW_VERSION=3.1.2 GLFW_LIB=static GLEW_VERSION=2.1.0 GLEW_LIB=static
make main
make[1]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Install-GLEW' に入ります
make[2]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Install-GLEW' に入ります
make[2]: 'preprocess' に対して行うべき事はありません.
make[2]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Install-GLEW' から出ます
g++ -g -Wall -std=c++11  check_version.cpp  `PKG_CONFIG_PATH=/home/pollenjp/.glfw/install/GLFW-3.1.2/lib/pkgconfig pkg-config --cflags glfw3` `PKG_CONFIG_PATH=/home/pollenjp/.glew/install/GLEW-2.1.0/lib/pkgconfig pkg-config --cflags glew`  `PKG_CONFIG_PATH=/home/pollenjp/.glfw/install/GLFW-3.1.2/lib/pkgconfig pkg-config --static --libs glfw3` `PKG_CONFIG_PATH=/home/pollenjp/.glew/install/GLEW-2.1.0/lib/pkgconfig pkg-config --static --libs glew` -c -o check_version.o
make[2]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Install-GLEW' に入ります
make[2]: 'preprocess' に対して行うべき事はありません.
make[2]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Install-GLEW' から出ます
g++ -g -Wall -std=c++11     check_version.o  `PKG_CONFIG_PATH=/home/pollenjp/.glfw/install/GLFW-3.1.2/lib/pkgconfig pkg-config --static --libs glfw3` `PKG_CONFIG_PATH=/home/pollenjp/.glew/install/GLEW-2.1.0/lib/pkgconfig pkg-config --static --libs glew` -o main
make[1]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Install-GLEW' から出ます
./main
GLEW version      : 2.1.0
GLEW_VERSION_MAJOR: 2
GLEW_VERSION_MINOR: 1
GLEW_VERSION_MICRO: 0


GLFW_VERSION_MAJOR    : 3
GLFW_VERSION_MINOR    : 1
GLFW_VERSION_REVISION : 2

Initialized GLFW!

GLFW version          : 3.1.2 X11 GLX clock_gettime /dev/js XI Xf86vm

Created GLFW window!
Set the window as the current!

OpenGL version    : 4.5.0 NVIDIA 384.130

```

---
