QT += quick
CONFIG += c++11

QT += quickcontrols2


#QT += core gui webkit webkitwidgets  network

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp

RESOURCES += qml.qrc \
    pic.qrc \
    picx.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

#DISTFILES +=


#HEADERS += \
#    mainwindow.h \
#    thread.h \
#    ListHeaders/BtBookListItem.h \
#    ListHeaders/BtRecordListItem.h \
#    ListHeaders/RadioCollectListItem.h \
#    ListHeaders/RadioStationListItem.h \
#    ListHeaders/titlelistitem.h \
#    i18n.h \
#    DbusHeaders/appMsgManager_interface.h \
#    DbusHeaders/sourceManager_interface.h \
#    DbusHeaders/tuner_interface.h \
#    ListHeaders/BtPairListItem.h \
#    chineseletterhelper.h \
#    DbusHeaders/memtaskd_interface.h \
#    common/common.h \
#    ListHeaders/FileListItem.h \
#    common/hardkeyeventmsg.h \
#    DbusHeaders/caninterface.h \
#    ThreadHeaders/BackDataAnalyzeThread.h \
#    DbusHeaders/gps_interface.h \
#    common/common.h \
#    common/hardkeyeventmsg.h \
#    DbusHeaders/layermgr_interface.h \
#    common/userdatadefined.h \
#    lib/libffmpeg.h \
#    DbusHeaders/bt_interface.h \
#    ThreadHeaders/monitorusbthread.h \
#    lunardate.h \
#    DbusHeaders/interface.h \
#    Etal/i2c-util.h \
#    Etal/public.h \
#    Etal/TDA7708_CM.h \
#    Etal/TDA7708LX_OM_v2.4.0.boot.h \
#    Etal/TDA7708LX_OM_v2.4.0.h \
#    Etal/Tuner_Star.h \
#    Etal/Tuner_User.h \
#    ThreadHeaders/analyzeid3thread.h \
#    ListHeaders/textlistitem.h \
#    imageprovider.h \
#    imgviewmanager.h \
#    ThreadHeaders/SDFileListSearchThread.h \
#    ThreadHeaders/USBFileListSearchThread.h \
#    SSPLink/SSPLinkClient.h \
#    ssp_assistant_fun.h \
#    FilePathManagerUsb.h \
#    FilePathManagerSd.h \
#    videoplay.h \
#    valuestoremanager.h \
#    audioplay.h \
#    proxyservermanager.h

#TRANSLATIONS += /home/tywl/sxdWork/WULING-HMI/I18N/lang_zh.ts \
#               /home/tywl/sxdWork/WULING-HMI/I18N/lang_en.ts

##lupdate_only{
##    FORMS += /home/chen/work/text/WULING-HMI/Qml/*.qml \
##             /home/chen/work/text/WULING-HMI/Qml/LauncherQml/*.qml \
##             /home/chen/work/text/WULING-HMI/Qml/PlayerQml/*.qml \
##             /home/chen/work/text/WULING-HMI/Qml/RadioQml/*.qml \
##             /home/chen/work/text/WULING-HMI/Qml/BtQml/*.qml \
##             /home/chen/work/text/WULING-HMI/Qml/SettingsQml/*.qml \
##             /home/chen/work/text/WULING-HMI/Qml/SoundEffectQml/*.qml \
##}

#INCLUDEPATH += $$(SDKTARGETSYSROOT)/usr/include/gstreamer-1.0
#INCLUDEPATH += $$(SDKTARGETSYSROOT)/usr/lib/glib-2.0/include
#INCLUDEPATH += $$(SDKTARGETSYSROOT)/usr/include/glib-2.0
##INCLUDEPATH += $$(SDKTARGETSYSROOT)/usr/include

#unix:!macx: LIBS += -L$$PWD/../../../../../opt/poky-st/2.4.2/sysroots/cortexa7hf-neon-poky-linux-gnueabi/usr/lib/ -lsqlite3 -ltag#-lasound -lcurl -lavcodec -lavformat -lswresample -lavutil -lpthread

#unix:!macx: LIBS += -L$$PWD/SSPLink/lib/ -lSSP_SDK_Core -lSSPLinkClient
#unix:!mac:QMAKE_LFLAGS += -Wl,-rpath=/var/applink/lib
##unix:!macx: LIBS += -L$$PWD/lib/ -lffmpeg
#unix:!macx: LIBS += -ludev

#LIBS += -L$$(SDKTARGETSYSROOT)/usr/lib/glib-2.0 -lglib-2.0 -lgobject-2.0
#LIBS += -L$$(SDKTARGETSYSROOT)/usr/lib/gstreamer-1.0 -lgstreamer-1.0 -lgstpbutils-1.0

##unix:!macx: LIBS += -L$$PWD/lib/ -lprocessingmoduleproxyserver

#INCLUDEPATH += $$PWD/include
#DEPENDPATH += $$PWD/include

##unix:!macx: PRE_TARGETDEPS += $$PWD/lib/libprocessingmoduleproxyserver.a
