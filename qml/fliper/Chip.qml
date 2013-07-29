// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    signal clicked

    width: 100
    height: 100

    states: [
        State { name: 'RED'; PropertyChanges { target: image; gradient: redGradient } },
        State { name: 'WHITE'; PropertyChanges { target: image; gradient: whiteGradient } }
    ]

    Rectangle {
        id: image
        anchors.centerIn: rect
        color: "red"
        radius: 60
        height: rect.height - 20
        width: rect.width - 20
        gradient: redGradient
    }

    Rectangle {
       id: rect
       anchors.fill: parent
//       color: "white"
       color: Qt.rgba(0,0,0,0)
       border.color: "black"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            parent.clicked();
        }
    }

    Gradient {
        id: redGradient
        GradientStop {position: 0.0; color: "gray" }
        GradientStop {position: 1.0; color: "red" }
        //GradientStop {position: 0.0; color: "red" }
    }

    Gradient {
        id: whiteGradient
        GradientStop {position: 0.0; color: "gray" }
        GradientStop {position: 1.0; color: "white" }
    }

}
