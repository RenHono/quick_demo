import QtQuick 2.0


FocusScope{
    
    id: scope
    property alias color: rectangle.color
    x: rectangle.x
    y: rectangle.y
    width: rectangle.width
    height: rectangle.height
    
    Rectangle{
        id: rectangle
        anchors.centerIn: parent
        color: "lightsteelblue"
        width: 80
        height: 30
        radius: 10
        antialiasing: true
        Text {
            id: labels
            text: "i am label"
            anchors.centerIn: parent
        }
        focus: true
        Keys.onPressed: {
            if(event.key === Qt.Key_A)
                labels.text = 'Key A was pressed'
            else if(event.key === Qt.Key_B)
                labels.text = 'Key B was pressed'
            else if(event.key === Qt.Key_C)
                labels.text = 'Key C was pressed'
            else if(event.key === Qt.Key_1)
                labels.text = 'Key 1 was pressed'
        }
    }
    
    MouseArea{
        anchors.fill: parent
        onClicked: {
            scope.focus = true
        }
    }
}
