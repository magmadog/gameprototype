
QT += quick
CONFIG += c++11
CONFIG += resources_big
DEFINES += QT_DEPRECATED_WARNINGS



SOURCES += \
main.cpp \
Controlers/herocontrol.cpp \
Controlers/coordinatesofobjects.cpp \
 Controlers/statusofobject.cpp \
 Controlers/enemy.cpp



RESOURCES +=\
 qml.qrc


QML_IMPORT_PATH =


QML_DESIGNER_IMPORT_PATH =


HEADERS +=Controlers/herocontrol.h \
        Controlers/coordinatesofobjects.h \
        Controlers/statusofobject.h \
        Controlers/enemy.h



qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    sprites/123.jpg \
    sprites/backg.png \
    sprites/idleleft.png \
    sprites/idleright.png \
    sprites/runleft.png \
    sprites/runright.png
