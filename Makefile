SHELL := /bin/bash

GLFW_VERSION := 3.2.1
GLEW_VERSION := 2.1.0
# "static" or "shared"
GLFW_LIBS := static
GLEW_LIBS := static

CXX := g++
CXXFLAGS = -g -Wall -std=c++11
LINK.cc := $(CXX) $(CXXFLAGS) $(CPPFLAGS) ${LDFLAGS} $(TARGET_ARCH)

INC :=
LDLIBS  :=
OBJECTS := $(patsubst %.cpp,%.o,$(wildcard *.cpp))
TARGET := main

#===============================================================================
#===============================================================================
#===============================================================================
ifneq (${GLFW_LIBS}, static)
ifneq (${GLFW_LIBS}, shared)
$(error "'GLFW_LIBS' variable should be set. ('static' or 'shared')")
endif
endif
ifneq (${GLEW_LIBS}, static)
ifneq (${GLEW_LIBS}, shared)
$(error "'GLEW_LIBS' variable should be set. ('static' or 'shared')")
endif
endif

#===============================================================================
# GLFW
PKG_CONFIG_PATH := ${HOME}/.glfw/install/GLFW-${GLFW_VERSION}/${GLFW_LIBS}/lib/pkgconfig
#=======================================
# v3.*
ifneq ($(shell echo ${GLFW_VERSION} | grep -E "3\.[0-9]+\.[0-9]+"), )
INC := ${INC} `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --cflags glfw3`
# Select `static` or 'shared' OPENCV LIB 
# --static : static library (.a)
ifeq (${GLFW_LIBS}, shared)
LDLIBS := ${LDLIBS} `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --libs glfw3`
else ifeq (${GLFW_LIBS}, static)
LDLIBS := ${LDLIBS} `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --static --libs glfw3`
else
ERROR_MESSAGE := 'GLFW_LIBS' variable should be 'static' or 'shared'.
$(error "${ERROR_MESSAGE}")
endif
#=======================================
# Others
else
ERROR_MESSAGE := 'GLFW_VERSION' variable (${GLFW_VERSION}) is not supported.
$(error "${ERROR_MESSAGE}")
endif
#===============================================================================
# GLEW
PKG_CONFIG_PATH := ${HOME}/.glew/install/GLEW-${GLEW_VERSION}/${GLEW_LIBS}/lib/pkgconfig
#=======================================
# v2.*
ifneq ($(shell echo ${GLEW_VERSION} | grep -E "2\.[0-9]+\.[0-9]+"), )
INC := ${INC} `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --cflags glew`
# Select `static` or 'shared' OPENCV LIB 
# --static : static library (.a)
ifeq (${GLEW_LIBS}, shared)
LDLIBS := ${LDLIBS} `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --libs glew`
else ifeq (${GLEW_LIBS}, static)
LDLIBS := ${LDLIBS} `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --static --libs glew`
else
ERROR_MESSAGE := 'GLEW_LIBS' variable should be 'static' or 'shared'.
$(error "${ERROR_MESSAGE}")
endif
#=======================================
# Others
else
ERROR_MESSAGE := 'GLEW_VERSION' variable (${GLEW_VERSION}) is not supported.
$(error "${ERROR_MESSAGE}")
endif

export

#===============================================================================
.DEFAULT_GOAL := run

.PHONY : debug
debug:
	echo ${INC}
	echo ${LDLIBS}

%.o : %.cpp
	@$(MAKE) preprocess
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $^ ${INC} ${LDLIBS} -c -o $@

${TARGET} : ${OBJECTS}
	@$(MAKE) preprocess
	$(LINK.cc) $(TARGET_ARCH) $^ ${LDLIBS} -o $@

.PHONY : run
run :  # 要件チェック
	${MAKE} ${TARGET}
	./${TARGET}

#===============================================================================
.PHONY : preprocess
preprocess :
# [Bash - adding color - NoskeWiki printf zsh](http://www.andrewnoske.com/wiki/Bash_-_adding_color)
ifndef GLFW_VERSION
	@printf "\e[101m Variable GLFW_VERSION does not set. \e[0m \n"
	@${MAKE} error ERROR_MESSAGE="GLFW_VERSION"
endif
ifndef GLEW_VERSION
	@printf "\e[101m Variable GLEW_VERSION does not set. \e[0m \n"
	@${MAKE} error ERROR_MESSAGE="GLEW_VERSION"
endif

.PHONY : error
error :  ## errors処理を外部に記述することで好きなエラーメッセージをprintfで記述可能.
	$(error "${ERROR_MESSAGE}")

.PHONY : clean
clean :
	-${RM} ${TARGET} ${OBJECTS} *~ .*~ core


#===============================================================================
.PHONY : install-glew
install-glew :
	@$(MAKE) preprocess
	GLEW_VERSION=${GLEW_VERSION} GLEW_LIBS=${GLEW_LIBS} ./install-glew.bash.sh


