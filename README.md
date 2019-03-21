# install-GLFW

- [Dependencies]()
- [Execute](#Execute)

## Dependencies

GLFWのインストールが必要


## Execute

```
 % make
make check_version
make[1]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Learning_OpenGL/install-GLEW' に入ります
make[2]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Learning_OpenGL/install-GLEW' に入ります
make[2]: 'preprocess' に対して行うべき事はありません.
make[2]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Learning_OpenGL/install-GLEW' から出ます
g++ -g -Wall -std=c++11  check_version.cpp -I/home/pollenjp/.glfw/install/GLFW-3.2.1/include -I/home/pollenjp/.glew/install/GLEW-2.1.0/include -L/home/pollenjp/.glfw/install/GLFW-3.2.1/lib -L/home/pollenjp/.glew/install/GLEW-2.1.0/lib -lGL -lglfw3 -lGLEW -ldl -lX11 -lXxf86vm -lXinerama -lXrandr -lXcursor -lXi -lpthread -c -o check_version.o
make[2]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Learning_OpenGL/install-GLEW' に入ります
make[2]: 'preprocess' に対して行うべき事はありません.
make[2]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Learning_OpenGL/install-GLEW' から出ます
g++ -g -Wall -std=c++11     check_version.o -L/home/pollenjp/.glfw/install/GLFW-3.2.1/lib -L/home/pollenjp/.glew/install/GLEW-2.1.0/lib -lGL -lglfw3 -lGLEW -ldl -lX11 -lXxf86vm -lXinerama -lXrandr -lXcursor -lXi -lpthread -o check_version
make[1]: ディレクトリ '/media/pollenjp/DATA2TB/workdir/git/Learning_OpenGL/install-GLEW' から出ます
./check_version
GLEW version      : 2.1.0
GLEW_VERSION_MAJOR: 2
GLEW_VERSION_MINOR: 1
GLEW_VERSION_MICRO: 0


GLFW_VERSION_MAJOR    : 3
GLFW_VERSION_MINOR    : 2
GLFW_VERSION_REVISION : 1

Initialized GLFW!

GLFW version          : 3.2.1 X11 GLX EGL clock_gettime /dev/js Xf86vm

Created GLFW window!
Set the window as the current!

OpenGL version    : 4.5.0 NVIDIA 384.130

```
