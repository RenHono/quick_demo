#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQuickView>

int main(int argc, char *argv[])
{
    QQuickStyle::setStyle("Material");
    
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    
    QGuiApplication app(argc, argv);
    
    QQmlApplicationEngine engine;
    //    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    engine.load(QUrl(QStringLiteral("qrc:/sample.qml")));
//        engine.load(QUrl(QStringLiteral("qrc:/test4.qml")));
    
    if (engine.rootObjects().isEmpty())
        return -1;
    
//    QQuickView view;
//    view.setSource(QUrl(QStringLiteral("qrc:/sample.qml")));
//    view.show();
    
    
    return app.exec();
}
