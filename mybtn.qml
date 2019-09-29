import QtQuick 2.0
import MyItems 1.0
Item {
    width: 300
    height: 200
    MyButton{
        id:muButton
        x:50
        y:50
        width:600
        height:100
        color:"grey"
        onMySignals:color="red"
        MouseArea{
            anchors.fill: parent
            onClicked: parent.myColor()
        }
    }
}
