import QtQuick 1.0

Item {
    width: 600; height: 300

    Image {
        source: "images/ball.png"
        anchors.horizontalCenter: parent.horizontalCenter

        NumberAnimation on y {
            from: 20; to: 200
            easing.type: "OutBounce"
            duration: 1000
        }
    }
}
