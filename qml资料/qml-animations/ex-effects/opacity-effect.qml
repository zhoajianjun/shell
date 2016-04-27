//import QtQuick 2.5

//Rectangle {
//    width: 365; height: 200; color: "black"

//    Image { x: 20; y: 30
//            source: "../images/rocket.svg"
//             opacity: 0.5
//    }
//    Image { x: 130; y: 30
//            source: "../images/rocket.svg"
//    }
//    Image { x: 240; y: 30
//            source: "../images/rocket.svg"
//            opacity: 1.0
//    }
//}

import QtQuick 2.0
import QtQuick.Controls 1.1

Rectangle {
    width: 320;
    height: 240;
    color: "gray";
    QtObject{
        id: attrs;
        property int counter;
        Component.onCompleted:{
            attrs.counter = 10;
        }
    }

    Text {
        id: countShow;
        anchors.centerIn: parent;
        color: "blue";
        font.pixelSize: 40;
    }

    Timer {
        id: countDown;
        interval: 1000;
        repeat: true;
        triggeredOnStart: true;
        onTriggered:{
            countShow.text = attrs.counter;
            attrs.counter -= 1;
            console.log("attrs.counter:"+attrs.counter)
            if(attrs.counter < 0)
            {
                countDown.stop();
                countShow.text = "Clap Now!";
                attrs.counter = 10
            }
        }
    }

    Button {
        id: startButton;
        anchors.top: countShow.bottom;
        anchors.topMargin: 20;
        anchors.horizontalCenter: countShow.horizontalCenter;
        text: "Start";
        onClicked: {
            countDown.start();
        }
    }
}
