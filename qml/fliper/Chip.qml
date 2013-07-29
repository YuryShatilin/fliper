// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    signal clicked

    states: [
        State { name: "RED"; PropertyChanges { target: image; source: "pics/x.png" } },
        State { name: "WHITE"; PropertyChanges { target: image; source: "pics/o.png" } }
    ]

    Rectangle {
        anchors.centerIn: parent
        color: "red"
        radius: 50
        width: 100
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            parent.clicked();
        }
    }

}
