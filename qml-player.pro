QT += quick core gui multimedia

CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
        src/fileengine.cpp \
        src/main.cpp \
        src/playerlist.cpp \
        src/player.cpp


RESOURCES += qml/qml.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    src/data.h \
    src/fileengine.h \
    src/playerlist.h \
    src/player.h

INCLUDEPATH += src
