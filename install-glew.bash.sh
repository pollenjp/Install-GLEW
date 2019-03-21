#!/bin/bash -eux
#GLEW_VERSION=2.1.0
GLEW_DIR="${HOME}/.glew"
CMAKE_INSTALL_PREFIX=${GLEW_DIR}/install/GLEW-${GLEW_VERSION}
# current working directory
CWD=$(pwd)

# [nigels-com/glew: The OpenGL Extension Wrangler Library](https://github.com/nigels-com/glew)
# github - master build will fail.
# https://github.com/nigels-com/glew/releases
#   - `Source code (tar.gz)` build will fail.
#   - `glew-2.1.0.tgz` build is good!
#   - fail issues
#     - https://github.com/nigels-com/glew/issues/87
#     - https://github.com/nigels-com/glew/issues/31
#     - https://github.com/nigels-com/glew/issues/13

#=======================================
# Dependencies
sudo apt update -y
sudo apt install -y build-essential libxmu-dev libxi-dev libgl-dev

if [ ! -d "${GLEW_DIR}" ] && [ ! -L "${GLEW_DIR}" ]; then
  mkdir ${GLEW_DIR}
fi
cd ${GLEW_DIR}

#=======================================
if [ ! -d "${GLEW_DIR}/glew" ]; then
  git clone https://github.com/nigels-com/glew.git
fi

#cd "${GLEW_DIR}/glew"
#git checkout glew-${GLEW_VERSION}
#cd ..

#if [ ! -d "${GLEW_DIR}/archive" ]; then
#  mkdir ${GLEW_DIR}/archive
#fi
#cd ${GLEW_DIR}/archive

#if [ ! -d "${GLEW_DIR}/archive/glew-glew-${GLEW_VERSION}" ]; then
#  wget https://github.com/nigels-com/glew/archive/glew-${GLEW_VERSION}.tar.gz
#  tar -zxvf glew-${GLEW_VERSION}.tar.gz
#fi

if [ ! -d "${GLEW_DIR}/download" ]; then
  mkdir ${GLEW_DIR}/download
fi
cd ${GLEW_DIR}/download

if [ ! -d "${GLEW_DIR}/download/glew-${GLEW_VERSION}" ]; then
  wget https://github.com/nigels-com/glew/releases/download/glew-${GLEW_VERSION}/glew-${GLEW_VERSION}.tgz
  tar -zxvf glew-${GLEW_VERSION}.tgz
fi

if [ -d "${CMAKE_INSTALL_PREFIX}" ]; then
  rm -rf ${CMAKE_INSTALL_PREFIX}
fi
 
#=======================================
#directory1=${GLEW_DIR}/glew/build/cmake/build
#directory1=${GLEW_DIR}/archive/glew-glew-${GLEW_VERSION}/build/cmake/build
directory1=${GLEW_DIR}/download/glew-${GLEW_VERSION}/build/cmake/build
if [ -d "${directory1}" ]; then
  rm -rf ${directory1}
  mkdir ${directory1}
fi
if [ ! -d "${directory1}" ] && [ ! -L "${directory1}" ]; then
  mkdir ${directory1}
fi
cd ${directory1}
cmake \
      -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} \
      -D BUILD_UTILS=ON \
      -D BUILD_SHARED_LIBS=OFF \
      ..
make -j4
if [ -d "${CMAKE_INSTALL_PREFIX}" ]; then
  rm -rf ${CMAKE_INSTALL_PREFIX}
fi
make install

#=======================================
#  Back to working directory
cd ${CWD}

