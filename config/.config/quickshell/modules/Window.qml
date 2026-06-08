import QtQuick
import Quickshell.Hyprland
import "../theme"

Rectangle {
    id: root

    property var title: Hyprland.activeToplevel?.title ?? ""

    Connections {
        target: Hyprland
        function onRawEvent(event) {
            if (event.name === "activewindow") {
                root.title = event.parse(2)[1];
            }
        }
    }

    implicitWidth: title !== "" ? winText.implicitWidth + 16 : 0
    implicitHeight: Theme.height

    bottomRightRadius: 8
    topRightRadius: 8
    color: Theme.bg
    clip: true
    opacity: title !== "" ? 1 : 0

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 200
            easing.type: Easing.OutCubic
        }
    }
    Behavior on opacity {
        NumberAnimation {
            duration: 150
        }
    }

    Text {
        id: winText
        anchors.centerIn: parent
        font {
            family: Theme.fontFamily
            pixelSize: Theme.fontSize
            bold: true
        }

        text: root.title.length > 45 ? root.title.slice(0, 46) + "…" : root.title
        color: Theme.cyan
    }
}
