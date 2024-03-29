import QtQuick 2.0
import QtQuick.Window 2.1
Window{
    width: 800
    height: 600
    visible: true
    
    Rectangle
    {
        width: 800; height: 600
        color: "blue"
        Rectangle
        {
            width: 60; height: 60
            x: rect1.x - 5; y: rect1.y - 5
            color: "green"
            Behavior on x { SmoothedAnimation { velocity: 200 } }
            Behavior on y { SmoothedAnimation { velocity: 200 } }
        }
        Rectangle
        {
            id: rect1
            width: 50; height: 50
            color: "red"
        }
        focus: true
        Keys.onRightPressed: rect1.x = rect1.x + 100
        Keys.onLeftPressed: rect1.x = rect1.x - 100
        Keys.onUpPressed: rect1.y = rect1.y - 100
        Keys.onDownPressed: rect1.y = rect1.y + 100
    }
}
