import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Window 2.1

Window{
    width: 800
    height: 600
    visible: true
    Item {
        x: 20
        id: letterItem
        width: 40; height: 300
        //    anchors.top: searchTitle.bottom
        anchors.topMargin: 55
        //    anchors.left: searchTitle.left
        anchors.leftMargin: 15
        //    visible: contactView.count !== 0 ? true:false
        
        
        
        Text {
            anchors.bottom: letterSlider.top
            anchors.horizontalCenter: letterSlider.horizontalCenter
            //        font.family: fontFamily
            font.pixelSize: 18
            color: "#1E77D5"
            text: "A"
            renderType: Text.NativeRendering
        }
        
        Rectangle {
            width: 60
            height: letterSlider.height
            anchors.top: letterSlider.top
            anchors.horizontalCenter: letterSlider.horizontalCenter
            color: "transparent"
            
            MouseArea {
                id: rMouse
                anchors.fill: parent
                drag.target: letterHandle
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY: lBackRect.y + lBackRect.height - letterHandle.height
                
                onPressed: {
                    console.log("rMouse pressed")
                    //globalObject.playBeep();
                    bHandle = true;
                    if(rMouse.mouseY - letterHandle.height/2 < lBackRect.y){
                        letterHandle.y = lBackRect.y;
                    } else if(rMouse.mouseY + letterHandle.height/2 > lBackRect.y + lBackRect.height){
                        letterHandle.y = lBackRect.y + lBackRect.height - letterHandle.height
                    } else {
                        letterHandle.y = rMouse.mouseY - letterHandle.height/2
                    }
                }
                onReleased: {
                    console.log("rMouse Released")
                    bHandle = false;

                }
            }
        }
        
        Slider {
            id: letterSlider
            width: 3; height: 243
            anchors.top: parent.top
            anchors.left: parent.left
            orientation: Qt.Vertical
            topPadding: 0
            bottomPadding: 0
            leftPadding: 0
            rightPadding: 0
            from: 1; to: 27
            
            background: Rectangle {
                id: lBackRect
                implicitWidth: letterSlider.width
                implicitHeight: letterSlider.height
                radius: 3
                color: "#1E77D5"
                
                MouseArea {
                    id: bMouse
                    anchors.fill: parent
                    drag.target: letterHandle
                    drag.axis: Drag.YAxis
                    drag.minimumY: 0
                    drag.maximumY: lBackRect.y + lBackRect.height - letterHandle.height
                    
                    onPressed: {
                        console.log("bMouse Pressed")
                        globalObject.playBeep();
                        bHandle = true;
                        if(bMouse.mouseY - letterHandle.height/2 < lBackRect.y){
                            letterHandle.y = lBackRect.y;
                        } else if(bMouse.mouseY + letterHandle.height/2 > lBackRect.y + lBackRect.height){
                            letterHandle.y = lBackRect.y + lBackRect.height - letterHandle.height
                        } else {
                            letterHandle.y = bMouse.mouseY - letterHandle.height/2
                        }
                    }
                    onReleased: {
                        console.log("bMouse Released")
                        bHandle = false;
                    }
                }
            }
            
            handle: Rectangle {
                id: letterHandle
                x: (letterSlider.availableWidth - width)/2
                //y: letterSlider.visualPosition * (letterSlider.availableHeight - height)
                implicitWidth: 30
                implicitHeight: 30
                radius: height/2
                opacity: 0.85
                color: "#1E77D5"
                
                Text {
                    id: curLetter
                    anchors.centerIn: parent
                    //                font.family: fontFamily
                    font.pixelSize: 19
                    color: "#ffffff"
                    text: qsTr("A")
                    renderType: Text.NativeRendering
                }
                
                MouseArea {
                    anchors.fill: parent
                    drag.target: letterHandle
                    drag.axis: Drag.YAxis
                    drag.minimumY: 0
                    drag.maximumY: lBackRect.y + lBackRect.height - letterHandle.height
                    
                    onPressed: {
                        console.log("curLetter Pressed")
                        globalObject.playBeep();
                        bHandle = true;
                    }
                    onReleased: {
                        console.log("curLetter Released")
                        bHandle = false;
                    }
                    
                }
                
                onYChanged: {
                    var tmp = parseInt(y/8);
                    if(tmp >=0 && tmp < 26)
                        curLetter.text = String.fromCharCode(65+tmp);
                    else if(tmp >= 26)
                        curLetter.text = "#";
                    if(bHandle){
                        onLetterChange(curLetter.text);
                    }
                }
            }
        }
        
        Text {
            anchors.top: letterSlider.bottom
            anchors.horizontalCenter: letterSlider.horizontalCenter
            //        font.family: fontFamily
            font.pixelSize: 18
            color: "#1E77D5"
            text: "#"
            renderType: Text.NativeRendering
        }
    }
}
