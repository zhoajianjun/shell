//import QtQuick 2.5

//Item {
//    width: 1000
//    height: 250

//    Rectangle {
//        x: 0; y: 0; width: 300; height: 250
//        color: "black"
//        Image {
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.top: parent.top
//            anchors.topMargin: 30
//            source: "../images/rocket.svg"
//            opacity: 0.5
//        }
//        Text {
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.bottom: parent.bottom
//            anchors.bottomMargin: 27
//            text: "opacity: 0.5"; font.pixelSize: 32
//            color: "white"
//        }
//    }

//    Rectangle {
//        x: 350; y: 0; width: 300; height: 250
//        color: "black"
//        Image {
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.top: parent.top
//            anchors.topMargin: 30
//            source: "../images/rocket.svg"
//            //opacity: 0.0
//        }
//        Text {
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.bottom: parent.bottom
//            anchors.bottomMargin: 27
//            text: "default (0.7)"; font.pixelSize: 32
//            color: "white"
//        }
//    }

//    Rectangle {
//        x: 700; y: 0; width: 300; height: 250
//        color: "black"
//        Image {
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.top: parent.top
//            anchors.topMargin: 30
//            source: "../images/rocket.svg"
//            opacity: 1.0
//        }
//        Text {
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.bottom: parent.bottom
//            anchors.bottomMargin: 27
//            text: "opacity: 1.0"; font.pixelSize: 32
//            color: "white"
//        }
//    }
//}

import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2

Window {
    id: appWin;
    visible: true;
    width: 640;
    height: 640;
    minimumWidth: 640;
    minimumHeight: 640;
    color: "lightgray";
    property var currentExample: null;

    Text {
        id: clue;
        text: "Graphical Effects Examples";
        anchors.top: parent.top;
        anchors.left: parent.left;
        anchors.margins: 4;
        font.pointSize: 24;
        font.bold: true;
    }

    Rectangle{
        anchors.left: clue.left;
        anchors.right: parent.right;
        anchors.rightMargin: 4;
        anchors.top: clue.bottom;
        height: 2;
        border.width: 1;
        border.color: "darkgray";
    }

    Component {
        id: exampleDelegate;
        Rectangle {
            id: wrapper;
            width: parent.width;
            height: 40;
            color: "transparent";

            Text {
                anchors.fill: parent;
                text: name;
                color: wrapper.ListView.isCurrentItem ? "blue" : "steelblue";
                font.pointSize: 20;
                verticalAlignment: Text.AlignVCenter;
            }

            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    console.log("current index")
                    wrapper.ListView.view.currentIndex = index;
                }
            }
        }
    }

    ListView {
        id: examples;
        anchors.bottom: quit.top;
        anchors.top: clue.bottom;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.margins: 8;
        clip: true;
        delegate: exampleDelegate;
        highlight: Rectangle {
            color: "lightblue";
            width: parent.width;

        }
        model: ListModel {
            ListElement {
                name: "Blend";
                example: "BlendExample.qml";
            }
            ListElement {
                name: "Color";
                example: "ColorExample.qml";
            }
            ListElement {
                name: "Gradient";
                example: "GradientExample.qml";
            }
            ListElement {
                name: "Distortion";
                example: "DistortionExample.qml";
            }
            ListElement {
                name: "Drop Shadow";
                example: "DropShadowExample.qml";
            }
            ListElement {
                name: "Blur";
                example: "BlurExample.qml";
            }
            ListElement {
                name: "Motion Blur";
                example: "MotionBlurExample.qml";
            }
            ListElement {
                name: "Glow";
                example: "GlowExample.qml";
            }
            ListElement {
                name: "Mask";
                example: "MaskExample.qml";
            }
        }
    }

    Button {
        id: load;
        text: "Load Examples";
        anchors.right: quit.left;
        anchors.top: quit.top;
        anchors.rightMargin: 8;
        onClicked: {
            var data = examples.model.get(examples.currentIndex);
            console.log("example: " , data.example);

            var comp = Qt.createComponent(data.example);
            if(comp.status === Component.Ready){
                appWin.currentExample = comp.createObject(appWin, {"color" : appWin.color});
                appWin.currentExample.back.connect(appWin.closeCurrentExample);
            }
        }
    }

    Button {
        id: quit;
        text: "Quit";
        anchors.bottom: parent.bottom;
        anchors.right: parent.right;
        anchors.margins: 8;
        onClicked: Qt.quit();
    }

    function closeCurrentExample() {
        currentExample.destroy();
    }
}
