#include <iostream>
#include <GL/glew.h>
#include <GLFW/glfw3.h>

int main(int argc, char** argv)
{
  //========================================================
  // これらはなぜか初期化前に実行できる
  // ref : [C++ - OpenGL - Checking the FreeGLUT, GLEW and OpenGL version | BadproG.com](https://www.badprog.com/c-opengl-checking-the-freeglut-glew-and-opengl-version)
  std::cout << "GLEW version      : " << glewGetString(GLEW_VERSION)       << std::endl;
  std::cout << "GLEW_VERSION_MAJOR: " << glewGetString(GLEW_VERSION_MAJOR) << std::endl;
  std::cout << "GLEW_VERSION_MINOR: " << glewGetString(GLEW_VERSION_MINOR) << std::endl;
  std::cout << "GLEW_VERSION_MICRO: " << glewGetString(GLEW_VERSION_MICRO) << std::endl << std::endl;
  std::cout << std::endl;
  std::cout << "GLFW_VERSION_MAJOR    : " << GLFW_VERSION_MAJOR     << std::endl;
  std::cout << "GLFW_VERSION_MINOR    : " << GLFW_VERSION_MINOR     << std::endl;
  std::cout << "GLFW_VERSION_REVISION : " << GLFW_VERSION_REVISION  << std::endl;
  //========================================================

  std::cout << std::endl;

  //========================================================
  // GLFW の初期化 (GLFW)
  if (!/* int */glfwInit()){  // 初期化に失敗した処理
    std::cerr << "Can't initialize GLFW" << std::endl;
    return 1;
  }
  std::cout << "Initialized GLFW!" << std::endl;
  // 終了時の処理登録
  std::atexit(/* *func= */ glfwTerminate);  // [std::atexit - cppreference.com](https://en.cppreference.com/w/cpp/utility/program/atexit)
  //========================================================

  std::cout << std::endl;

  //========================================================
  // GLFW の初期化が必要
  std::cout << "GLFW version          : " << glfwGetVersionString() << std::endl;
  //========================================================

  std::cout << std::endl;

  //========================================================
  // ウィンドウを作成
  GLFWwindow * const window(glfwCreateWindow(/* int          width  = */ 640,
                                             /* int          height = */ 480,
                                             /* const char  *title  = */ "Hello!",
                                             /* GLFWmonitor *monitor= */ NULL,
                                             /* GLFWwindow  *share  = */ NULL));
  if (window == NULL){  // ウィンドウ作成に失敗した処理
    std::cerr << "Can't create GLFW window." << std::endl;
    return 1;
  }
  std::cout << "Created GLFW window!" << std::endl;

  // 作成したウィンドウを現在のウィンドウ(処理対象)とする
  glfwMakeContextCurrent(/* GLFWwindow *window= */ window);
  std::cout << "Set the window as the current!" << std::endl;
  //========================================================

  std::cout << std::endl;

  //========================================================
  // 初期化後出ないと実行できない
  //char *versionGL = "\0";
  std::cout << "OpenGL version    : " << (char *)glGetString(/* GLenum name= */ GL_VERSION) << std::endl << std::endl;
  //========================================================



  // GLEWの初期化は不要だった
  ////========================================================
  //// GLEW を初期化する
  ////glewExperimental = GL_TRUE;  // > この代入を行わないと, GLFW と GLEW を組み合わせたときに一部の API が有効になりませんでした
  //if (glewInit() != GLEW_OK) {
  //  // GLEW の初期化に失敗した
  //  std::cerr << "Can't initialize GLEW" << std::endl;
  //  return 1;
  //}
  //std::cerr << "Initialized GLEW" << std::endl;
  ////========================================================

  return 0;
}
