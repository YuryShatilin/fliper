// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "logic.js" as Logic

Item {
    signal clicked

    width: 100
    height: 100

    states: [
        State { name: 'RED'},
        State { name: 'WHITE'}
    ]

    function toWhite(){
        toWhiteAnim.start()
    }
    function toRed(){
        toRedAnim.start()
    }

    Rectangle {
        id: image
        anchors.centerIn: rect
        color: "red"
        height: rect.height - 20
        width: rect.width - 20
        // radius: width*0.5

        gradient: gradient
        border.color: "#999"
    }

    Rectangle {
       id: rect
       anchors.fill: parent
       color: Qt.rgba(0,0,0,0)
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true;

        onClicked: {
            parent.clicked();
            Logic.toRed = toRedAnim;
            Logic.toWhite = toWhiteAnim;
            Logic.flip(index);

        }

    }

    Gradient {
        id: gradient
        GradientStop {
            id: gradientStop0;
            position: 0.0; 
            color: "#ffc5c5"
        }
        GradientStop {
            id: gradientStop1;
            position: 1.0; 
            color: "#ffaaaa"
        }
        
    }

    ParallelAnimation {
        id: toRedAnim
        PropertyAnimation {
            target: gradientStop0
            properties: "color"
            to: "#ffc5c5"
            duration: 200
        }
        PropertyAnimation {
            target: gradientStop1
            properties: "color"
            to: "#ffaaaa"
            duration: 200
        }
    }
    ParallelAnimation {
        id: toWhiteAnim
        PropertyAnimation {
            target: gradientStop0
            properties: "color"
            to: "#fff"
            duration: 200
        }
        PropertyAnimation {
            target: gradientStop1
            properties: "color"
            to: "#ddd"
            duration: 200
        }
    }

}
