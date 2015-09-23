TEMPLATE = app

QT += qml quick

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

ios {
  QMAKE_TARGET_BUNDLE_PREFIX = "net.vplay.plugins"
  TARGET = ChartboostSample

  QMAKE_LFLAGS += -ObjC
  LIBS += -F$$PWD/ios

  # Chartboost framework
  LIBS += -F$$PWD/ios
  LIBS += -framework Chartboost

  # Chartboost dependencies
  LIBS += -framework SystemConfiguration
  LIBS += -framework StoreKit
  LIBS += -framework AdSupport
}

android {
  LIBS += -lChartboostPlugin
}

# Default rules for deployment.
include(deployment.pri)

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

OTHER_FILES += \
    android/AndroidManifest.xml
