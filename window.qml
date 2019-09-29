import QtQuick 2.0
import QtQuick.Window 2.1
import "./"
import "../qml_demo/"

Window{
    width: 800
    height: 600
    visible: true
    
    
    Rectangle {
        id:page
        width: 800
        height: 600
        color: "lightgray"
        Text {
            id: helloText
            text: qsTr("Hello World!")
            y: 30
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 24
            font.bold: true
            MouseArea{
                id: mouseArea
                anchors.fill: parent
            }
            states: State {
                name: "down"
                when: mouseArea.pressed === true
                PropertyChanges {
                    target: helloText
                    y: 160
                    rotation: 180
                    color: "red"
                }
            }
            transitions: Transition {
                from: ""
                to: "down"
                reversible: true
                ParallelAnimation{
                    
                    NumberAnimation {
                        properties: "y,rotation"
                        duration: 500
                        easing.type: Easing.InOutQuad
                    }
                    ColorAnimation{
                        duration: 500
                    }
                }
            }
            
        }
        Grid{
            id: colorPicker
            x: 4
            anchors.bottom: page.bottom
            anchors.bottomMargin: 4
            rows: 2
            columns: 8
            spacing: 3
            Cell {cellColor: "red";onClicked:helloText.color = cellColor}
            Cell {cellColor: "green";onClicked:helloText.color = cellColor}
            Cell {cellColor: "blue";onClicked:helloText.color = cellColor}
            Cell {cellColor: "yellow";onClicked:helloText.color = cellColor}
            Cell {cellColor: "steelblue";onClicked:helloText.color = cellColor}
            Cell {cellColor: "black";onClicked:helloText.color = cellColor}
            Cell {cellColor: "orange";onClicked:helloText.color = cellColor}
            Cell {cellColor: "pink";onClicked:helloText.color = cellColor}
            
            Cell {cellColor: "#f11111";onClicked:helloText.color = cellColor}
            Cell {cellColor: "#e22222";onClicked:helloText.color = cellColor}
            Cell {cellColor: "#833333";onClicked:helloText.color = cellColor}
            Cell {cellColor: "#944444";onClicked:helloText.color = cellColor}
            Cell {cellColor: "#d55555";onClicked:helloText.color = cellColor}
            Cell {cellColor: "#c66666";onClicked:helloText.color = cellColor}
            Cell {cellColor: "#b77777";onClicked:helloText.color = cellColor}
            Cell {cellColor: "#a88888";onClicked:helloText.color = cellColor}
            
        }
    }
}
