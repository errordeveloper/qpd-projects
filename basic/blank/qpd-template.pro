## I need to investigate what is the best way to do it using QT plugins ...

TEMPLATE = app

QT += network

CONFIG += release debug build_all

## I wish it could be just this:
# TARGET ?= $$system(basename $$_PRO_FILE_PWD_)

## But seems like we can do this and use `qmake PROJECT=test`
# TARGET = $(PROJECT)
# isEmpty(TARGET):TARGET=$$system(basename $$_PRO_FILE_PWD_)

## However, this seems more intellegent:
_PRO_FILE_BASENAME_ = $$system(basename $$basename(_PRO_FILE_) .pro)
equals(TARGET, $$_PRO_FILE_BASENAME_):TARGET=$$basename(_PRO_FILE_PWD_)

## And now drop the .git bit if it's there ...
## well, it will become what it was but still it's based on the
## name of thee dirctory and not the project file!
## I much prefer to move dirctories rather then project files.
TARGET ~= s/.git//

## This makes the TARGET become the name of work dir at the end :)

message(TARGET=$$TARGET)


SOURCES += main.cpp mainwindow.cpp
HEADERS += mainwindow.h

FORMS += mainwindow.ui

PLUGIN_SOURCE = $$PWD../widgets/
SELECT_PLUGIN = basic

PDIR = $$PLUGIN_SOURCE/$$SELECT_PLUGIN

LIBS += -L$$PDIR
LIBS += -L$$[QT_INSTALL_PLUGINS]/designer/

LIBS += -lqpd_$$SELECT_PLUGIN

DEPENDPATH += $$PDIR

INCLUDEPATH += $$PDIR

INCLUDEPATH += $$[QT_INSTALL_PLUGINS]/designer/libqpd_basic_plugin.src/

## Or it should it's gonna be this instead:
# INCLUDEPATH += $$[QT_INSTALL_PLUGINS]/designer/libqpd_basic_plugin.src/
