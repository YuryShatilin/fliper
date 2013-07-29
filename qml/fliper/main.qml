// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

import "logic.js" as Logic

Rectangle {
    width: 500
    height: 500

    Rectangle {
        id: board
        anchors.fill: parent
        color: "#a0b3c6"

    }

    Grid {
        id: gridGame
        anchors.centerIn: parent
        columns: 5
        rows: 5
//        spacing: 10
        Repeater {
            model: 25
            Chip {
                state: 'RED'
                width: board.width/5 - 10
                height: board.height / 5 - 10
                onClicked: {
                    Logic.flip(index);

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
/*
        anchors.centerIn: parent
        color: "blue"
        style: Text.Outline; styleColor: "white"
        font.pixelSize: 50; font.bold: true
        visible: false

        Timer {
            running: messageDisplay.visible
            onTriggered: {
                messageDisplay.visible = false;
                Logic.restartGame();
            }
        }
  */
}
