pragma Singleton
import QtQuick

QtObject {
    readonly property color nc: "#121414"
    readonly property color bg: Qt.alpha(black, 0.9)
    readonly property color surface: "#242b2e"
    readonly property color overlay: "#303e45"

    readonly property color fg: "#d6d9e0"
    readonly property color muted: "#494b4d"
    readonly property color subtle: "#969399"

    readonly property color black: "#17191a"
    readonly property color red: "#f84a12"
    readonly property color green: "#36994e"
    readonly property color yellow: "#ffaf0a"
    readonly property color blue: "#558ba6"
    readonly property color magenta: "#a82a5f"
    readonly property color cyan: "#1da89d"

    readonly property color red2: "#fa835c"
    readonly property color green2: "#5ecc79"
    readonly property color yellow2: "#ffb724"
    readonly property color blue2: "#79b9d9"
    readonly property color magenta2: "#db4282"
    readonly property color cyan2: "#30dbcd"

    readonly property color red3: "#330f04"
    readonly property color green3: "#12331a"
    readonly property color yellow3: "#332302"
    readonly property color blue3: "#1a2b33"

    readonly property color error: "#d93b55"
    readonly property color hl1: "#1f2224"
    readonly property color hl2: "#293033"
    readonly property color hl3: "#39464d"

    // --- Sizing & Layout ---
    readonly property int height: 32
    readonly property int padding: 8
    readonly property int spacing: 4
    readonly property int radius: 8

    // --- Typography ---
    readonly property string fontFamily: "JetBrainsMono Nerd Font Propo"
    readonly property int fontSize: 14

    // --- Animations ---
    readonly property int animSpeed: 150
}
