import QtQuick 2.0

Rectangle {
    width: 500
    height: 550

    Loader {
        anchors.fill: parent
        id: loader
        source: "board.qml"
    }
}

