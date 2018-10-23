#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <Qt>
#include "Controlers/coordinatesofobjects.h"
#include "Controlers/statusofobject.h"
#include "Controlers/enemy.h"
#include "Controlers/herocontrol.h"
#include "qqml.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
        qmlRegisterType<coordinatesofobjects>("com.Coord",1,0,"Coordinatesofobjects");
        qmlRegisterType<statusofobject>("com.Status",1,0,"Statusofobject");
        qmlRegisterType<Enemy>("com.Enemy",1,0,"Enemy");
        qmlRegisterType<herocontrol>("com.Hero",1,0,"Herocontrol");

    engine.load(QUrl(QStringLiteral("qrc:/game.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();

}

