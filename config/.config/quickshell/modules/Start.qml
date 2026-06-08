import Quickshell.Io
import QtQuick
import "../theme"

Rectangle {
    width: this.height
    height: Theme.height
    radius: Theme.radius
    color: mouseArea.containsMouse ? Theme.cyan : "transparent"
    border.width: 2
    border.color: Theme.cyan

    Behavior on color {
        ColorAnimation {
            duration: 200
            easing.type: Easing.InOutCubic
        }
    }

    Text {
        anchors {
            centerIn: parent
        }
        font {
            family: Theme.fontFamily
            pixelSize: 20
        }

        text: "󰣇"
        color: mouseArea.containsMouse ? Theme.bg : Theme.cyan
        Behavior on color {
            ColorAnimation {
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    }

    Process {
        id: swaync
        command: ["swaync-client", "-t"]
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: swaync.running = true
        hoverEnabled: true
    }
}
