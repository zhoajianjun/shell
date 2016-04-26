import QtQuick 2.5

Rectangle {
    width: 400; height: 400; color: "lightblue"

    Rectangle {
        id: rect
        color: "green"
        x: 0; y: 150; width: 100; height: 100
    }

    NumberAnimation {
        target: rect
        properties: "x"
        from: 0; to: 150; duration: 1000
        running: true
    }
}
