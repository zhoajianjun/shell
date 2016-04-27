//import QtQuick 1.0

//Rectangle {
//  width: 400; height: 200; color: "lightblue"

//  Item {
//    anchors.fill: parent
//    effect: Colorize { color: "darkGreen" }

//    Text {
//      anchors.horizontalCenter: parent.horizontalCenter
//      anchors.verticalCenter: parent.verticalCenter
//      text: "Qt Quick"; font.pixelSize: 64
//      effect: Blur { blurRadius: 3 }
//    }
//  }
//}

import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1

//window containing the application
ApplicationWindow {

    //title of the application
    title: qsTr("Hello World")
    width: 640
    height: 480

    //menu containing two menu items
    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }
    toolBar:ToolBar{
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: qsTr("open")
                onClicked: console.log("open")
            }
            Item { Layout.fillWidth: true }
            ToolButton {
                text: qsTr("quit")
                onClicked: Qt.quit()
            }
        }
    }

    statusBar: StatusBar{
        RowLayout {
            anchors.fill: parent
            Label { text: "Read Only" }
        }
    }

    Button {
        text: qsTr("Hello World")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
}
