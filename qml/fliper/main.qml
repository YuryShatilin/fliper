// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

import "logic.js" as Logic
Rectangle {
    width: 500
    height: 550

    Rectangle {
        width: 500
        height: 500
        x: 0
        y: 50

        Rectangle {
            id: board
            x: 0
            y: -49
            width: 500
            height: 549
            anchors.fill: parent
            color: "#eed"
            anchors.topMargin: -49
            anchors.leftMargin: 0

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
                        Logic.undoQue.push(index);
                       undoButton.color = "#888";

                        Logic.redoQue = [];
                       redoButton.color = "#ccc";

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

        Text {
            id:undoButton
            x: 32
            y: -49
            text: "←"
            color: "#ccc"
//            style: Text.Outline; styleColor: "#aaa"
            font.pixelSize: 50; font.bold: true

            MouseArea {
                x: 0
                y: 0
                anchors.rightMargin: 0
                anchors.bottomMargin: -7
                anchors.leftMargin: 0
                anchors.topMargin: 7
                anchors.fill: parent
                onClicked: {

                    Logic.undo({"undoQue": Logic.undoQue, "redoQue": Logic.redoQue});

                }
            }
        }

        Text {
            id:redoButton
            x: 82
            y: -49
            text: "→"
            color: "#ccc"
//            style: Text.Outline; styleColor: "#aaa"
            font.pixelSize: 50; font.bold: true

            MouseArea {
                x: 0
                y: 0
                anchors.rightMargin: 0
                anchors.bottomMargin: -7
                anchors.leftMargin: 0
                anchors.topMargin: 7
                anchors.fill: parent
                onClicked: {

                    Logic.redo({"undoQue": Logic.undoQue, "redoQue": Logic.redoQue});


                }
            }
        }

    }
}
