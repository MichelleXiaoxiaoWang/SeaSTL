################ Build options #######################################

NAME		:= ustl
MAJOR		:= 2
MINOR		:= 8

#DEBUG		:= 1
BUILD_SHARED	:= 1
#BUILD_STATIC	:= 1
NOLIBSTDCPP	:= 1

################ Programs ############################################

CXX		:= g++
LD		:= g++
AR		:= ar
RANLIB		:= ranlib
INSTALL		:= install

INSTALLDATA	:= ${INSTALL} -p -m 644
INSTALLLIB	:= ${INSTALLDATA}
RMPATH		:= rmdir -p --ignore-fail-on-non-empty

################ Destination #########################################

prefix		:= build
INCDIR		:= ${prefix}/include
LIBDIR		:= ${prefix}/lib
PKGCONFIGDIR	:= /usr/lib/pkgconfig

################ Compiler options ####################################

WARNOPTS	:= -Wall -Wextra -Woverloaded-virtual -Wpointer-arith\
		-Wredundant-decls -Wcast-qual
TGTOPTS		:=  -Ibuild/include
INLINEOPTS	:=

CXXFLAGS	:= ${WARNOPTS} ${TGTOPTS} -fPIC
LDFLAGS		:= -Lbuild/lib
LIBS		:=
ifdef DEBUG
    CXXFLAGS	+= -O0 -g
    LDFLAGS	+= -rdynamic
else
    CXXFLAGS	+= -Os -g0 -DNDEBUG=1 -fomit-frame-pointer ${INLINEOPTS}
    LDFLAGS	+= -s -Wl,-gc-sections
endif
ifdef NOLIBSTDCPP
    LD		:= gcc
    STAL_LIBS	:= -lsupc++
    LIBS	:= ${STAL_LIBS}
endif
BUILDDIR	:= /tmp/shvamath/make/${NAME}
O		:= .o/

slib_lnk	= lib$1.so
slib_son	= lib$1.so.${MAJOR}
slib_tgt	= lib$1.so.${MAJOR}.${MINOR}
slib_flags	= -shared -Wl,-soname=$1
