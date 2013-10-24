// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 2.0

import "logic.js" as Logic

// TODO: N x M game
// TODO: win event
// TDOO: table of records

Rectangle {
    id: root

    property int sizeGame: 5
    property int maxSize: 100
    property int minSize: 3


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
            anchors.verticalCenter: topPanel.verticalCenter
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
            anchors.leftMargin: 20
            anchors.verticalCenter: topPanel.verticalCenter
            text: "→"
            font.pixelSize: 50; font.bold: true
            width: 50
            height: 50

//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                    Logic.redo({"undoQue": Logic.undoQue, "redoQue": Logic.redoQue});
//                }
//            }
            onClicked: {
                Logic.redo({"undoQue": Logic.undoQue, "redoQue": Logic.redoQue});
            }
        }

        Button {
            id: incSizeButton
            anchors.verticalCenter: topPanel.verticalCenter
            anchors.right: topPanel.right
            anchors.rightMargin: 20
            text: "INC+"
            font.pixelSize: 14; font.bold: true
            width: 50
            height: 50
            onClicked:  {
                if (sizeGame < maxSize)
                    sizeGame += 1;

                Logic.restartGame();
            }
        }

        Button {
            id: decSizeButton
            anchors.verticalCenter: topPanel.verticalCenter
            anchors.right: incSizeButton.left
            anchors.rightMargin: 20
            text: "DEC-"
            font.pixelSize: 14; font.bold: true
            width: 50
            height: 50
            onClicked:  {
                if (sizeGame > minSize)
                    sizeGame -= 1;

                Logic.restartGame();
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

            height: (board.height > board.width) ? board.width : board.height
            width: height
            columns: root.sizeGame
            rows: root.sizeGame
            property int chipHeight : height / rows
            property int chipWidth : width / columns
            Repeater {
                anchors.centerIn: parent
                model: parent.columns * parent.rows
                Chip {
                    state: 'RED'
                    width: gridGame.chipWidth
                    height: gridGame.chipHeight

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
