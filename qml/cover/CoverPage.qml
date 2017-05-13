import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    id: thecover
    property string result
    onResultChanged: updateCover(thecover.result)

    Image {
        source: "../img/cover.png"
        opacity: 0.1
        width: parent.width
        height: sourceSize.height * width / sourceSize.width
    }

    Label {
        id: covertitle
        font.pixelSize: Theme.fontSizeLarge
        anchors.top: parent.top
        anchors.topMargin: Theme.paddingLarge
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Coinflip"
    }

    Label {
        id: covertext
        anchors.centerIn: parent
        font.pixelSize: Theme.fontSizeExtraLarge
        text: qsTr("Flip")
    }

    function updateCover(result) {
        if (result == "unflipped") {
            return;
        }
        covertext.text = app.resultUserString(result);
    }

    CoverActionList {
        id: coverAction

        CoverAction {
            iconSource: "image://theme/icon-cover-next"
            onTriggered: app.result = (Math.random() * 2 > 1 ? "heads" : "tails");
        }
    }
}


