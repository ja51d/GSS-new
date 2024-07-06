#include "mainwindow.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFile>
#include <QtGui>
#include <QtQuick3D/qquick3d.h>
#include <QApplication>

int main(int argc, char *argv[])
{



    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);


    QSurfaceFormat::setDefaultFormat(QQuick3D::idealSurfaceFormat());

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/testqml.qml")));
     engine.load(QUrl(QStringLiteral("qrc:/model.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;







    QApplication a(argc, argv);


    MainWindow w;
    w.show();
    return a.exec();
}
