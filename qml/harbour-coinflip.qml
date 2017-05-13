import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import "cover"

ApplicationWindow
{
    id: app
    // takes "heads", "tails", "unflipped". Basically an enum
    property string result: "unflipped"
    cover: Component {
        CoverPage {
            result: app.result
        }
    }

    initialPage: Component{
        FirstPage {
            result: app.result
        }
    }

    function resultUserString(result) {
        if (result == "heads") {
            return qsTr("Heads!");
        } else {
            return qsTr("Tails!");
        }
    }
}


