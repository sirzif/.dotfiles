import Quickshell
import QtQuick
import QtQuick.Shapes
import QtQuick.Layouts

import "./modules"
import "./theme"

ShellRoot {
    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: root
            property var modelData
            screen: modelData
            implicitHeight: Theme.height
            color: "transparent"
            anchors {
                top: true
                left: true
                right: true
            }

            margins {
                top: 4
                right: 4
                left: 4
            }

            // Shape {
            //     width: 200
            //     height: 100
            //
            //     ShapePath {
            //         strokeWidth: 2
            //         strokeColor: "black"
            //         fillColor: "lightblue"
            //
            //         startX: 20
            //         startY: 0
            //         PathLine {
            //             x: 200
            //             y: 0
            //         }
            //         PathLine {
            //             x: 180
            //             y: 100
            //         }
            //         PathLine {
            //             x: 0
            //             y: 100
            //         }
            //         PathLine {
            //             x: 20
            //             y: 0
            //         }
            //     }
            // }

            Workspaces {
                id: ws
                targetScreen: root.modelData
                bottomRightRadius: window.width > 45 ? 0 : Theme.radius
                topRightRadius: window.width > 45 ? 0 : Theme.radius

                Behavior on bottomRightRadius {
                    NumberAnimation {
                        duration: 150
                        easing.type: Easing.OutCubic
                    }
                }
                Behavior on topRightRadius {
                    NumberAnimation {
                        duration: 150
                        easing.type: Easing.OutCubic
                    }
                }
            }

            Rectangle {
                id: sep1
                width: 1
                opacity: window.width > 20 ? 1 : 0
                height: Theme.height
                color: Theme.cyan
                anchors.left: ws.right
            }

            Window {
                id: window
                anchors.left: sep1.right
                height: parent.height
            }

            // Workspaces {
            //     anchors.centerIn: parent
            //     targetScreen: root.modelData
            // }
            //
            // Window {
            //     anchors.left: parent.left
            //     height: parent.height
            // }

            Hardware {
                id: hardwarePanel
                anchors.right: sep2.left
            }

            Rectangle {
                id: sep2
                width: 1
                // opacity: window.width > 20 ? 1 : 0
                height: Theme.height
                color: Theme.cyan
                anchors.right: startPanel.left
            }

            Rectangle {
                id: startPanel
                anchors {
                    right: parent.right
                }

                width: rowLayout.width
                height: Theme.height
                bottomRightRadius: Theme.radius
                topRightRadius: Theme.radius
                color: Theme.bg

                RowLayout {
                    id: rowLayout
                    anchors.centerIn: parent
                    spacing: Theme.padding

                    Text {
                        id: clock
                        text: Qt.formatDateTime(new Date(), "HH:mm")
                        color: Theme.cyan
                        leftPadding: Theme.padding

                        font {
                            family: Theme.fontFamily
                            pixelSize: Theme.fontSize
                            bold: true
                        }

                        Timer {
                            interval: 1000
                            running: true
                            repeat: true
                            onTriggered: clock.text = Qt.formatDateTime(new Date(), "HH:mm")
                        }
                    }

                    Start {}
                }
            }
        }
    }
}
