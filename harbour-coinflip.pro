# The name of your application
TARGET = harbour-coinflip

CONFIG += sailfishapp

SOURCES += src/harbour-coinflip.cpp

OTHER_FILES += qml/harbour-coinflip.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    rpm/harbour-coinflip.changes.in \
    rpm/harbour-coinflip.spec \
    rpm/harbour-coinflip.yaml \
    translations/*.ts \
    harbour-coinflip.desktop \
    qml/img/tails.png \
    qml/img/heads.png \
    qml/img/cover.png

CONFIG += sailfishapp_i18n

DISTFILES += \
    qml/img/cover.jpg

