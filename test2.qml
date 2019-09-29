import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Material 2.1

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Material Style")
    Material.theme: Material.Dark
    Material.accent: Material.color("red")
    Column{
        anchors.centerIn: parent
        RadioButton{
            text: qsTr("Small")
        }
        RadioButton{
            text: qsTr("Medium")
            checked: true
        }
        RadioButton{
            text: qsTr("Large")
        }
        
    }
    Button{
        text: qsTr("Button")
        highlighted: true
        Material.background: Material.Teal
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
