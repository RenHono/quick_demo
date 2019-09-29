import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Rectangle{

        id: rect1
        width: 200
        height: 200
        color: "purple"
        Text {
            id: hw
            text: qsTr("HelloWorld")
        }
        Timer{
            interval: 500
            running: true
            repeat: true
            onTriggered: time.text = Date().toString()
        }
        Text {
            anchors.top: hw.bottom
            id: time
//            wrapMode: Text.WordWrap
//            text: qsTr("text")
        }
    }
    Rectangle{
        id: rect2
        width: 200
        height: 200
        color: "green"
        anchors.left: rect1.right
     
        Text {
            id: pm
            text: qsTr("Press Me")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            MouseArea{
                anchors.fill: parent
                onPressed: parent.color = "purple"
                onReleased: parent.color = "black"
//                onHoveredChanged: parent.color = "blue"
//                onHoverEnabledChanged: parent.color = "yellow"
            }
        }
    }
    Rectangle{
        id: rect3
        width: 200
        height: 200
        color: "blue"
        anchors.left: rect2.right
        
        Rectangle{
            x: 50
            y: 50
            width: 100
            height: 100
            color: mo_area.containsMouse ? "green" : "white"
            MouseArea{
                id: mo_area
                anchors.fill: parent
                hoverEnabled: true
            }
        }     

    }
    Rectangle{
        id: rect4
        width: 600
        height: 200
        anchors.top: rect1.bottom
        Image {
            id: front
            source: "qrc:/../qml_demo/pic/1.jpeg"
            Image {
                id: back
                source: "qrc:/../qml_demo/pic/2.jpeg"
                SequentialAnimation on x {
                    id: ani2
                    running: false
                    NumberAnimation{
                        to: 600
                        duration: 3500
                    }
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: ani2.running=true
            }
        }
        
    }
    
}
