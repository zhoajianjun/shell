import QtQuick 2.5
import QtGraphicalEffects 1.0

Rectangle {
    width: 400; height: 400
    color: "lightblue"

    Text {
        id:text
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.baseline: parent.verticalCenter
        text: "Qt Quick"; font.pixelSize: 64
        FastBlur {
            id: blu
            anchors.fill: text
            source: text
            radius: 32
        }

        PropertyAnimation {
            from: 100; to: 0;
            duration: 2500
            target: blu
            properties: "radius"
            running: true
        }
    }
}
