import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page
    property string result
    onResultChanged: updateState(page.result)

    function updateState(result) {
        if (result == "unflipped") {
            return;
        }

        // hard-set angle if necessary when flipping was done from cover
        if (result == "heads" && (rot.angle / 180) % 2 != 0) {
            rot.angle = 0;
        }
        if (result == "tails" && (rot.angle / 180) % 2 == 0) {
            rot.angle = 180;
        }

        // update text
        theResult.text = qsTr("Rolling..");
        timer.start();
    }

    // used to do stuff AFTER an animation cycle
    Timer {
        id: timer
        interval: 1500
        running: false
        repeat: false
        onTriggered: theResult.text = qsTr("You rolled ") + app.resultUserString(page.result)
    }

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("FLIP!")
                onClicked:  {
                    var coinImageState = app.result == "unflipped" ? "heads" : app.result;
                    app.result = "tmp"; // force-trigger change handlers
                    app.result = (Math.random() * 2 > 1 ? "heads" : "tails");
                    rot.angle += (app.result == coinImageState ? 1800 : 1980);
                }
            }
        }

        contentHeight: column.height

        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Flip a Coin")
            }
            Flipable {
                width: page.width
                height: coinimg.height
                front: Image {
                    id: coinimg
                    width: page.width - 20
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    source: "../img/heads.png"
                }
                back: Image {
                    id: coinimg2
                    width: page.width - 20
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    source: "../img/tails.png"
                }
                transform: Rotation {
                    id: rot
                    origin.x: page.width / 2
                    axis.x: 0
                    axis.y: 1
                    axis.z: 0
                    angle: 0

                    Behavior on angle { PropertyAnimation{ duration: 1500 } }
                }
            }

            Label {
                id: theResult
                width: page.width
                text: qsTr("Use the pulley menu to flip!")
                wrapMode: Text.Wrap
                horizontalAlignment: Text.AlignHCenter
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
        }
    }
}


