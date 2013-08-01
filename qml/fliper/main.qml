// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

import "logic.js" as Logic

Rectangle {
    width: 500
    height: 500

    Rectangle {
        id: board
        anchors.fill: parent
        color: "#eed"

    }

    Grid {
        id: gridGame
        anchors.centerIn: parent
        columns: 5
        rows: 5
        Repeater {
            model: 25
            Chip {
                state: 'RED'
                width: board.width/5 - 10
                height: board.height / 5 - 10

                onClicked: {
                    if (Logic.isWin()) {
                        console.log("Победа");
                        winsMessage.visible = true;
                    }
                }
            }
        }
    }

    Text {
        id: winsMessage
        text: "WIN!!!"
        color: "pink"
        style: Text.Outline; styleColor: "white"
        font.pixelSize: 50; font.bold: true
        visible: false
        MouseArea {
            anchors.fill: parent
            onClicked: {
                Logic.restartGame();
            }
        }
    }
}
