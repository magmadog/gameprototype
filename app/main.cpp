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

    engine.load(QUrl(QStringLiteral("qrc:/gameprototype.qmlproject")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();

}
/*
int main(int argc, char *argv[])
{
  QGuiApplication app(argc, argv);
  QQuickView view;
  view.setSource(QUrl("qrc:///main.qml"));
  view.show();
  QQuickItem* child;
  QQmlApplicationEngine engine;
  engine.load(QUrl(QStringLiteral("qrc:///gameprototype.qml")));
  QObject *rootObject = engine.rootObjects().first();
  QQuickItem *qmlObject = rootObject->findChild<QQuickItem*>("grid")->findChild<QQuickItem*>("repeter");
  QMetaObject::invokeMethod(qmlObject,"itemAt",Qt::DirectConnection,   Q_RETURN_ARG (QQuickItem*,child), Q_ARG(int,32));
  child=child->findChild<QQuickItem*>("pleaseWork");
  qDebug() << child->property("visible");
  child->setProperty("visible","true");
  qDebug() << child->property("visible");
  return app.exec();
}
I used qDebug to verify the property changed
*/
