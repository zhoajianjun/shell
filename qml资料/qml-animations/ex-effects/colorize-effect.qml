//import QtQuick 1.0
//import QtGraphicalEffects 1.0
//Rectangle {
//    width: 200; height: 500; color: "black"

//    Image { x: 30; y: 30
//            source: "../images/rocket.svg" }

//    Image { x: 50; y: 185
//            source: "../images/rocket.svg"
//            effect: Colorize { color: "blue" } }

//    Image { x: 70; y: 340
//            source: "../images/rocket.svg"
//            effect: Colorize { color: "blue" } }
//}

import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    width: 300
    height: 300

    Image {
        id: bug
        source: "../images/rocket.svg"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    Colorize {
        anchors.fill: bug
        source: bug
        hue: 1.0
        saturation: 0.5
        lightness: -0.2
    }
}
