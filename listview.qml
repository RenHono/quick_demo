import QtQuick 2.0

Rectangle {
    width: 300
    height: 300
    color: "lightgray"
    id: rect 
    Text {
        anchors.centerIn: parent
        text: "Hello, QML!"
        MouseArea{
            anchors.fill: parent
            onClicked: rect.color = "navy" 
        }
    }
}

