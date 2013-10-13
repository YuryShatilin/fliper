// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 2.0

import "logic.js" as Logic

// TODO: N x M game
// TODO: win event
// TDOO: table of records

Rectangle {
    id: root

    property int N: 10
    property int M: 10

    // TOP panel
    Rectangle {
        id: topPanel
        height: 70
        width: parent.width
        border.width: 2
        border.color: "black"
        anchors.top: root.top
        anchors.bottom: board.top

        color: "#eed"

        Button {
            id:undoButton
            anchors.left: parent.left
            anchors.leftMargin: 15

            text: "←"
            font.pixelSize: 50; font.bold: true
            width: 50
            height: 50

            onClicked: {
                Logic.undo({"undoQue": Logic.undoQue, "redoQue": Logic.redoQue});
            }
        }

        Button {
            id:redoButton
            anchors.left: undoButton.right
            anchors.leftMargin: 1
            text: "→"
            font.pixelSize: 50; font.bold: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Logic.redo({"undoQue": Logic.undoQue, "redoQue": Logic.redoQue});
                }
            }
        }

    }

    // BOARD
    Rectangle {
        id: board
        height: parent.height - topPanel.height
        width:  parent.width
        anchors.top: topPanel.bottom

        anchors.bottom: root.bottom
        color: "#eed"
        visible: true

        Grid {
            id: gridGame

            anchors.centerIn: board
            columns: root.N
            rows: root.M

            Repeater {
                model: parent.columns * parent.rows
                Chip {
                    state: 'RED'
                    width: board.width/5 - 10
                    height: board.height / 5 - 10

                    onClicked: {
                        Logic.undoQue.push(index);
                       //undoButton.color = "#888";

                        Logic.redoQue = [];
                       //redoButton.color = "#ccc";

                        if (Logic.isWin()) {
                            console.log("Победа");
                            winsMessage.visible = true;
                        }
                    }
                }
            }
        }
    }

    Text {
        id: winsMessage
        x: 245
        y: -49
        text: "WIN!!!"
        color: "pink"
        style: Text.Outline; styleColor: "white"
        font.pixelSize: 50; font.bold: true
        visible: false
        MouseArea {
            x: 0
            y: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            onClicked: {
                Logic.restartGame();
            }
        }
    }
}
