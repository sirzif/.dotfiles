pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import "../theme"

Rectangle {
    id: root

    required property var targetScreen

    anchors.left: parent.left
    implicitWidth: rowLayout.implicitWidth + 16
    height: Theme.height
    radius: Theme.radius
    color: Theme.bg

    RowLayout {
        id: rowLayout
        anchors.centerIn: parent
        spacing: 0

        Repeater {
            model: Hyprland.workspaces

            Rectangle {
                id: rect
                required property var modelData

                visible: modelData.monitor && modelData.monitor.name === root.targetScreen.name
                width: 24
                height: 24
                // radius: 4
                color: "transparent"

                property var w: Hyprland.workspaces.values.find(ws => ws.id === modelData.id) ?? null
                property bool hasWindows: w !== null

                Text {
                    anchors.centerIn: parent
                    anchors.verticalCenterOffset: 1
                    font {
                        family: Theme.fontFamily
                        pixelSize: Theme.fontSize
                        bold: true
                    }

                    text: rect.modelData.id
                    color: rect.modelData.focused || mouseArea.containsMouse ? Theme.cyan2 : Theme.cyan
                    scale: rect.modelData.focused ? 1.25 : 1
                    opacity: rect.modelData.focused ? 1 : 0.8

                    Behavior on scale {
                        NumberAnimation {
                            duration: 150
                            easing.type: Easing.OutCubic
                        }
                    }

                    Behavior on opacity {
                        NumberAnimation {
                            duration: 150
                        }
                    }

                    Behavior on color {
                        ColorAnimation {
                            duration: 150
                        }
                    }
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    onClicked: rect.modelData.activate()
                    hoverEnabled: true
                }
            }
        }
    }
}
