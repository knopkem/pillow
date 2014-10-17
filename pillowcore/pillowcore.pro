include(../config.pri)

TARGET = $$PILLOWCORE_LIB_NAME
TEMPLATE = lib
DESTDIR = ../lib

QT       += core network script
QT       -= gui

CONFIG   += precompile_header

PRECOMPILED_HEADER = pch.h

DEPENDPATH = .
INCLUDEPATH = .

DEFINES += PILLOWCORE_BUILD

pillow_static {
	CONFIG += static
	DEFINES += PILLOWCORE_BUILD_STATIC
}

SOURCES += \
	parser/parser.c \
	parser/http_parser.c \
	HttpServer.cpp \
	HttpHandler.cpp \
	HttpHandlerQtScript.cpp \
	HttpHelpers.cpp \
	HttpsServer.cpp \
	HttpHandlerSimpleRouter.cpp \
	HttpConnection.cpp \
	HttpHandlerProxy.cpp \
	HttpClient.cpp \
	HttpHeader.cpp

HEADERS += \
	parser/parser.h \
	parser/http_parser.h \
	HttpServer.h \
	HttpHandler.h \
	HttpHandlerQtScript.h \
	HttpHelpers.h \
	HttpsServer.h \
	HttpHandlerSimpleRouter.h \
	HttpConnection.h \
	HttpHandlerProxy.h \
	ByteArrayHelpers.h \
	private/ByteArray.h \
	HttpClient.h \
	pch.h \
	HttpHeader.h \
	PillowCore.h

OTHER_FILES += \
    pillowcore.qbs

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../zlib-win64/build/release/ -lzlibstaticd
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../zlib-win64/build/debug/ -lzlibstaticd
else:unix: LIBS += -L$$PWD/../../zlib-win64/build/ -lzlibstaticd

INCLUDEPATH += $$PWD/../../zlib-win64/build/Debug
DEPENDPATH += $$PWD/../../zlib-win64/build/Debug

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../zlib-win64/build/release/libzlibstaticd.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../zlib-win64/build/debug/libzlibstaticd.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../zlib-win64/build/release/zlibstaticd.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../zlib-win64/build/debug/zlibstaticd.lib
else:unix: PRE_TARGETDEPS += $$PWD/../../zlib-win64/build/libzlibstaticd.a
