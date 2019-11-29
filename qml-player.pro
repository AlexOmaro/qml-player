QT += quick multimedia
CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
        main.cpp \
        playerlist.cpp \
        player.cpp


RESOURCES += qml.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    playerlist.h \
    player.h
