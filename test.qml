import QtQuick 2.9
import QtQuick.Window 2.2

Window{
    width: 640
    height: 480
    visible: true
    
    MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log(qsTr('Clicked on background. Text: "' + textEdit.text + '"'))  //在控制台显示消息
            }
        }
     
        //一个文本框
        TextEdit {
            id: textEdit
            text: qsTr("Enter some text...")
            verticalAlignment: Text.AlignVCenter
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20
            Rectangle {
                anchors.fill: parent
                anchors.margins: -10
                color: "transparent"
                border.width: 1
            }
            
            MouseArea{
                anchors.fill: parent
//                onClicked: textEdit.clear()
            }
        }
    

}
