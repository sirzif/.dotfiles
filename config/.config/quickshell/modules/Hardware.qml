import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import "../theme"

Rectangle {
    width: content.implicitWidth + Theme.padding * 2
    height: Theme.height
    color: Theme.bg
    bottomLeftRadius: Theme.radius
    topLeftRadius: Theme.radius

    Behavior on width {
        NumberAnimation {
            duration: 150
            easing.type: Easing.OutCubic
        }
    }

    RowLayout {
        id: content
        anchors.fill: parent
        anchors.leftMargin: Theme.padding
        anchors.rightMargin: Theme.padding
        spacing: 8

        Component.onCompleted: timer.triggered()

        FileView {
            id: memInfo
            path: "/proc/meminfo"
        }

        FileView {
            id: cpuInfo
            path: "/proc/stat"
        }

        property var lastCpuValues: ({
                "total": 0,
                "idle": 0
            })
        property string cpuUsage: " 0%"
        property string memUsage: " 0G/0G"

        Timer {
            id: timer
            interval: 2000
            running: true
            repeat: true
            onTriggered: {
                cpuInfo.reload();
                memInfo.reload();
                const lines = memInfo.text().split('\n');
                let available = 0, total = 0;
                for (let line of lines) {
                    if (line.startsWith('MemAvailable:')) {
                        available = parseInt(line.split(/\s+/)[1], 10);
                    }
                    if (line.startsWith('MemTotal:')) {
                        total = parseInt(line.split(/\s+/)[1], 10);
                    }
                    if (available && total)
                        break;
                }

                if (total == 0) {
                    content.memUsage = "";
                    return;
                }

                const usage = ((total - available) / 1024 / 1024).toFixed(1);
                total = (total / 1024 / 1024).toFixed(1);

                content.memUsage = " " + usage + "G/" + total + "G";
            }
        }

        Text {
            id: cpu
            font {
                family: Theme.fontFamily
                pixelSize: Theme.fontSize
                bold: true
            }
            text: content.cpuUsage
            color: Theme.cyan
        }

        Text {
            id: memory
            font {
                family: Theme.fontFamily
                pixelSize: Theme.fontSize
                bold: true
            }
            text: content.memUsage
            color: Theme.cyan
        }
    }
}
