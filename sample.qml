import QtQuick 2.0
import QtQuick.Window 2.3
import "/"

Window{
    width: 800
    height: 600
    visible: true
    
    Item {
        id: s1
        x: 0
        y: 0
        width: 100
        height: 100
    }
    
    Rectangle{
        id: s2
        anchors.top: s1.bottom
        x: 0
        y: 0
        width: 100
        height: 100
        color: "red"
    }
    
    Rectangle{
        id: s3
        anchors.top: s2.bottom
        width: 100 
        height: 100
        gradient: Gradient{
            GradientStop{
                position: 0.0
                color: "red"
            }
            GradientStop{
                position: 0.33
                color: "yellow"
            }
            GradientStop{
                position: 1.0
                color: "green"
            }
        }
    }
    
    Image {
        id: s4
        anchors.top: s3.bottom
        width: 100
        height: 100
        source: "qrc:/../qml_demo/pic/1.jpeg"
    }
    
    BorderImage {
        id: s5
        anchors.top: s4.bottom
        source: "qrc:/../qml_demo/pic/2.jpeg"
        width: 100; height: 100
        border.left: 5; border.top: 5
        border.right: 5; border.bottom: 5
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        
    }
    
    Rectangle{
        id: s6
        anchors.left: s1.right
        width: animation.width
        //        height: animation.height
        height: 100
        AnimatedImage{
            id: animation
            source: "pic/g1.gif"
            width: 100
            height: 92
        }
        Rectangle{
            property int frames: animation.frameCount
            width: 4
            height: 8
            x: (animation.width-width)*animation.currentFrame/frames
            y: animation.height
            color: "red"
        }
        
    }
    
    Text {
        id: s7
        anchors.top: s6.bottom
        anchors.left: s2.right
        width: 100
        height: 100
        text: qsTr("text")
    }
    
    TextInput{
        id: s8
        anchors.top: s7.bottom
        anchors.left: s3.right
        width: 100
        height: 100
        text: "input"
        selectByMouse: true
    }
    
    TextInput{
        id: s9
        anchors.top: s8.bottom
        anchors.left: s4.right
        width: 100
        height: 100
        IntValidator{
            id: s9_intval
            bottom: 10
            top: 100
        }
        validator: s9_intval
        text: "int_val"
    }
    
    TextInput{
        id: s10
        anchors.top: s9.bottom
        anchors.left: s5.right
        width: 100
        height: 100
        DoubleValidator{
            id: s10_wval
            bottom: 10
            top: 100
            decimals: 4
            notation: DoubleValidator.StandardNotation
        }
        validator: s10_wval
        text: "w_val"
    }
    
    TextInput{
        id: s11
        anchors.left: s6.right
        width: 100
        height: 100
        RegExpValidator{
            id: s11_regval
            regExp: /^[a-zA-Z]{1}[0-9]{0,2}[a-z]{1,3}$/
        }
        validator: s11_regval
        text: "reg_val"
    }
    
    TextEdit{
        id: s12
        anchors.top: s11.bottom
        anchors.left: s7.right
        width: 100
        height: 100
        text: "<b>Hello</b>
 <i>World</i>"
        font.family: "Helvetica"
        font.pointSize: 10
        color: "blue"
        focus: true
    }
    
    Rectangle{
        id: s13
        anchors.top: s12.bottom
        anchors.left: s8.right
        width: 100
        height: 100
        color: "pink"
        Rectangle{
            id: mousrect
            x:20
            y:20
            width: 20
            height: 20
            color: "green"
            MouseArea{
                anchors.fill: parent
                onPressed: mousrect.color = "red"
                onReleased: mousrect.color = "yellow"
            }
        }
    }
    
    Rectangle{
        id: s14
        anchors.top: s13.bottom
        anchors.left: s9.right
        width: 100
        height: 100
        color: "grey"
        
        Column{
            anchors.centerIn: parent
            spacing: 15
            FocusWidgetF{
                color:"lightblue"
            }
            FocusWidgetF{
                color:"palegreen"
            }
        }
    }
    
    
    Flickable{
        id: s15
        anchors.top: s14.bottom
        anchors.left: s10.right
        width: 100
        height: 100
        contentWidth: p_w_picpath.width
        contentHeight: p_w_picpath.height
        clip: true
        Image {
            //            width: 10
            //            height: 10
            id: p_w_picpath
            source: "pic/2.jpeg"
        }
    }
    
    Flipable{
        id: s16
        anchors.left: s11.right
        width: 100
        height: 100
        property bool flipped: false
        
        front: Image {
            id: f
            width: 100
            height: 100
            source: "pic/1.jpeg"
            anchors.centerIn: parent
        }
        back: Image {
            id: b
            width: 100
            height: 100
            source: "pic/2.jpeg"
            anchors.centerIn: parent
        }
        transform: Rotation{
            id:rotation
            origin.x: s16.width/2
            origin.y: s16.height/2
            axis.x: 0 
            axis.y: 1
            axis.z: 0
            angle: 0
        }
        states: State {
            name: "back"
            PropertyChanges {
                target: rotation
                angle: 180
            }
            when: s16.flipped
        }
        transitions: Transition {
            
            NumberAnimation {
                target: rotation
                property: "angle"
                duration: 800
                //                easing.type: Easing.InOutQuad
            }
            
        }
        MouseArea{
            anchors.fill: parent
            onClicked: s16.flipped = !s16.flipped
        }   
    }
    
    Rectangle{
        id: s17
        width: 100
        height: 100
        anchors.top: s16.bottom
        anchors.left: s12.right
        color: "black"
        MouseArea{
            id: s17_ma
            anchors.fill: parent
            onClicked: s17.state == 'clicked' ? s17.state = "" : s17.state = 'clicked';
        }        
        states: [
            State {
                name: "clicked"
                PropertyChanges {
                    target: s17
                    color: "pink"
                }
            }
        ]
        
    }
    
    Rectangle{
        id: s18
        width: 100
        height: 100
        anchors.top: s17.bottom
        anchors.left: s13.right
        color: "lightgrey"
        
        Text {
            width: 100
            height: 100
            id: s18_text
            text: qsTr("Hello")
            
            states: State {
                name: "s18_State"
                PropertyChanges {
                    target: s18_text
                    text: "Goodbye"
                    color: "lightyellow"
                    
                }
            }
            MouseArea{
                anchors.fill: parent 
                onClicked: s18_text.state = 's18_State'
            }
        }
        
    }
    
    Item {
        id: s19
        width: 100
        height: 100
        anchors.top: s18.bottom
        anchors.left: s14.right
        
        Rectangle{
            id: s19_rect1
            width: 50
            height: 100
            color: "red"
            
        }
        Rectangle{
            id: s19_rect2
            x: s19_rect1.width
            width: 25
            height: 50
            color: "blue"
            states: State {
                name: "s19_reparented"
                ParentChange{
                    target: s19_rect2
                    parent: s19_rect1
                    x: 10
                    y: 10
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: s19_rect2.state = "s19_reparented"
            }
        }
        
    }
    
    Rectangle{
        id: s20
        width: 100
        height: 100
        anchors.top:s19.bottom
        anchors.left: s14.right
        color: "steelblue"
        Rectangle{
            id:s20_rect
            width: 50
            height: 50
            color: "red"
        }
        states: State {
            name: "reanchored"
            AnchorChanges {
                target: s20_rect
                anchors.top: s20.top
                anchors.bottom: s20.bottom
                
            }
            PropertyChanges {
                target: s20_rect
                anchors.topMargin: 10
                anchors.bottomMargin: 10
                
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: s20.state = "reanchored"
        }
        
    }
    
    Rectangle{
        id: s21
        width: 100
        height: 100
        anchors.left: s16.right
        color: "red"
        property bool cedx: true
        Behavior on width {
            
            NumberAnimation {
                //                target: object
                //                property: "name"
                duration: 1000
                //                easing.type: Easing.InOutQuad
            }
        }
        MouseArea{
            //            property bool ced: true
            anchors.fill: parent
            onClicked:{
                //                if(ced == true){    
                //                    s21.width = 50
                //                    ced = false
                //                }
                //                else {
                //                    s21.width = 100
                //                    ced = true
                //                }
                
                s21.cedx == true ?s21.width = 50:s21.width = 100
                s21.cedx == true ?s21.cedx = false:s21.cedx = true
            }
        }
    }
    
    Rectangle{
        id: s22
        width: 100
        height: 100
        anchors.top: s21.bottom
        anchors.left: s17.right
        
        Rectangle{
            id: s22_rect
            color: "orange"
            width: 10
            height: 10
            SequentialAnimation{
                running: true
                id: s22_ani
                
                
                NumberAnimation {
                    target: s22_rect
                    //                    property: "name"
                    properties: "x"
                    to: 10
                    duration: 1200
                    //                    easing.type: Easing.InOutQuad
                }
                
                NumberAnimation {
                    target: s22_rect
                    //                    property: "name"
                    properties: "y"
                    to: 10
                    duration: 1200
                    //                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: s22_rect
                    //                    property: "name"
                    properties: "x"
                    to: 0
                    duration: 1200
                    //                    easing.type: Easing.InOutQuad
                }
                
                NumberAnimation {
                    target: s22_rect
                    //                    property: "name"
                    properties: "y"
                    to: 0
                    duration: 1200
                    //                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: s22_rect
                    //                    property: "name"
                    properties: "x"
                    to: 90
                    duration: 1200
                    //                    easing.type: Easing.InOutQuad
                }
                
                NumberAnimation {
                    target: s22_rect
                    //                    property: "name"
                    properties: "y"
                    to: 90
                    duration: 1200
                    //                    easing.type: Easing.InOutQuad
                }
                
            }
        }
    }
    
    Rectangle{
        id: s23
        width: 100
        height: 100
        anchors.top: s22.bottom
        anchors.left: s17.right
        Rectangle{
            id: s23_rect
            color: "green"
            width: 10
            height: 10
            ParallelAnimation{
                running: true
                
                NumberAnimation {
                    target: s23_rect
                    //                    property: "name"
                    properties: "x"                    
                    duration: 1200
                    to: 90
                    //                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: s23_rect
                    //                    property: "name"
                    properties: "y"                    
                    duration: 1200
                    to: 90
                    //                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
    
    Item{
        id: s24
        width: 100
        height: 100
        anchors.top: s23.bottom
        anchors.left: s18.right        
        BorderImage {
            id: s24_bi
            source: "pic/1.jpeg"
            width: 100; height: 100
            border.left: 5; border.top: 5
            border.right: 5; border.bottom: 5
        }
        Rectangle{
            id: s24_rect
            width: 50
            height: 50
            color: "red"
            states: State {
                name: "s24_mov"
                PropertyChanges {
                    target: s24_rect
                    x: 50
                    
                }
            }
            transitions: Transition {
                PropertyAnimation{
                    properties: "x,y"
                    easing.type: Easing.InOutQuad
                }
                
            }
            MouseArea{
                anchors.fill: parent
                onClicked: s24_rect.state = "s24_mov"
            }
        }
    }
    
    Rectangle{
        id: s25
        width: 100
        height: 100
        anchors.top: s24.bottom
        anchors.left: s19.right 
        color: "blue"
        Rectangle{
            id: s25_rect
            width: 30
            height: 30
            color: "purple"
            NumberAnimation on x { to: 50; duration: 1000 }
        }
    }
    
    Rectangle{
        id: s26
        width: 100
        height: 100
        anchors.left: s21.right
        //        color: "#26262626"
        Rectangle{
            id: s26_rect
            width: 100
            height: 100
            color: "purple"
            ColorAnimation on color { to: "lightgrey"; duration: 1000 }
        }
    }
    
    Item{
        id: s27
        width: 100
        height: 100
        anchors.top: s26.bottom
        anchors.left: s22.right
        
        Rectangle{
            id: s27_rect
            width: 50
            height: 50
            anchors.centerIn: parent
            color: "orange"
            states: State {
                name: "s27_rotated"
                PropertyChanges {
                    target: s27_rect
                    rotation: 180
                    
                }
            }
            transitions: Transition {
                RotationAnimation{
                    duration: 1000
                    direction: RotationAnimation.Counterclockwise
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: s27_rect.state = "s27_rotated"
            }
        }
    }
    
    Item {
        id: s28
        width: 100
        height: 100
        anchors.top: s27.bottom
        anchors.left: s23.right
        
        Rectangle{
            id: s28_rect1
            width: 50
            height: 100
            color: "yellow"
            
            
        }
        
        
        Rectangle{
            id: s28_rect2
            width: 30
            height: 30
            color: "GREEN"
            
            states: State {
                name: "s28_reparented"
                ParentChange {
                    target: s28_rect2
                    parent: s28_rect1
                    x: 10
                    y: 50
                }
            }
            
            transitions: Transition {
                ParentAnimation{
                    
                    NumberAnimation {
                        properties: "x,y"
                        duration: 1200
                        easing.type: Easing.InOutQuad
                    }
                }
            }
            
            MouseArea{
                anchors.fill: parent
                onClicked: s28_rect2.state = "s28_reparented"
            }
        }
    }
    
    Item {
        id: s29
        width: 100
        height: 100
        anchors.top: s28.bottom
        anchors.left: s24.right
        
        Rectangle{
            id: s29_rect
            width: 50
            height: 50
            color: "pink"
            
        }
        states: State {
            name: "s29_reanchored"
            AnchorChanges {
                target: s29_rect
                anchors.right: s29.right
                
            }
            AnchorChanges {
                target: s29_rect
                anchors.bottom: s29.bottom
            }
        }
        transitions: Transition {
            AnchorAnimation{
                duration: 1000
            }
        }
        
        Component.onCompleted: s29.state = "s29_reanchored"
    }
    
    Item {
        id: s30
        width: 100 
        height: 100
        anchors.top: s29.bottom
        anchors.left: s25.right
        
        MouseArea{
            anchors.fill: s30
            onClicked: s30_seq_ani.start()
        }
        
        Rectangle{
            id: s30_rect
            width: 20
            height: 20
            color: "red"
            
            
            SequentialAnimation{
                //                running: true
                id: s30_seq_ani
                NumberAnimation {
                    target: s30_rect
                    //                    property: "name"
                    properties: "x"
                    to: 50
                    duration: 1200
                    
                    //                    easing.type: Easing.InOutQuad
                }
                
                PauseAnimation {
                    duration: 2000
                }
                
                NumberAnimation {
                    target: s30_rect
                    //                    property: "name"
                    duration: 1200
                    to: 50
                    properties: "y"
                    //                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
    
    FocusScope{
        id: s31
        width: 100
        height: 100
        anchors.left: s26.right
        
        //        color: "blue"
        MouseArea{
            
            anchors.fill: parent
            onClicked: {
                
                //                s31_rect1s.focus = true
                s31.focus = true
                console.log("s31_clicked")
            }
        }
        
        Rectangle{
            width: 20
            height: 20
            x: s31_rect1.x-5
            y: s31_rect1.y-5
            color: "green"
            Behavior on x{
                SmoothedAnimation{
                    velocity: 200
                }
            }
            Behavior on y{
                SmoothedAnimation{
                    velocity: 200
                }
            }
            
        }
        Rectangle{
            
            id: s31_rect1
            width: 10
            height: 10
            color: "red"
            
            
            focus: true
            Keys.onRightPressed: {
                
                s31_rect1.x+=5
                //                s31_rect1.width = 50
                s31_rect1.color = "purple"
                console.log("s31 Right Pressed")
            }
            Keys.onLeftPressed: {
                
                s31_rect1.x-=5
                s31_rect1.color = "yellow"
            }
            Keys.onUpPressed: {
                
                s31_rect1.y-=5
                s31_rect1.color = "blue"
            }
            Keys.onDownPressed: {
                
                s31_rect1.y+=5
                s31_rect1.color = "red"
            }
        }
    }
    
    Item {
        id: s32
        width: 100
        height: 100
        anchors.top: s31.bottom
        anchors.left: s27.right
        Rectangle{
            id: s32_rect
            width: 30
            height: 30
            color: "red"
            Behavior on x{
                SpringAnimation {
                    spring: 2
                    damping: 0.2
                }
            }
            Behavior on y{
                SpringAnimation {
                    spring: 2
                    damping: 0.2
                }
            }
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                s32_rect.x = mouse.x - s32_rect.width/2
                s32_rect.y = mouse.y - s32_rect.height/2
                
            }
        }
    }
    
    Item {
        id: s33
        width: 100
        height: 100
        anchors.top: s22.bottom
        anchors.left: s28.right
        
        Flipable{
            id: s33_flip
            width: 100
            height: 100
            property bool flipped: false
            
            front: Image {
                id: s33_f
                width: 100
                height: 100
                source: "pic/1.jpeg"
                anchors.centerIn: parent
            }
            back: Image {
                id: s33_b
                width: 100
                height: 100
                source: "pic/2.jpeg"
                anchors.centerIn: parent
            }
            transform: Rotation{
                id:s33_rotation
                origin.x: s33.width/2
                origin.y: s33.height/2
                axis.x: 0 
                axis.y: 1
                axis.z: 0
                angle: 0
            }
            states: State {
                name: "back"
                PropertyChanges {
                    target: s33_rotation
                    angle: 180
                }
                when: s33_flip.flipped
            }
            transitions: Transition {
                
                SequentialAnimation{  
                    PropertyAction {
                        
                        target: s33_f; property: "opacity";value: 0.2 }
                    
                    PropertyAction {
                        target: s33_b; property: "opacity";value: 0.2 }
                    
                    
                    NumberAnimation {
                        target: s33_rotation
                        property: "angle"
                        duration: 800
                        //                easing.type: Easing.InOutQuad
                    }
                    
                    //                    PropertyAction {
                    //                        target: s33_f; property: "opacity";value: 1 }
                    
                    
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: s33_flip.flipped = !s33_flip.flipped
            }   
        }
    }
    
    Item {
        id: s34
        anchors.top: s33.bottom
        anchors.left: s29.right
        width: 100; height: 100
        
        Rectangle {
            id: s34_rect
            width: 20; height: 10
            color: "red"
            
            states: State {
                name: "rotated"
                PropertyChanges { target: s34_rect; rotation: 180; transformOrigin: Item.BottomRight }
            }
            
            transitions: Transition {
                SequentialAnimation {
                    PropertyAction { target: s34_rect; property: "transformOrigin" }
                    ScriptAction { script: pro_action_finished(s34_rect.state); }
                    RotationAnimation { duration: 1000; direction: RotationAnimation.Counterclockwise }
                }
            }
            
            MouseArea {
                anchors.fill: parent
                onClicked: s34_rect.state = "rotated";
            }
            
            
        }
    }
    
    function pro_action_finished(stat){
        console.log("pro action finished "+stat)
    }
    
    
    Item{
        id: s35
        width: 100
        height: 100
        anchors.left: s30.right
        anchors.top: s34.bottom
        
        
        Rectangle{
            id: s35_rect
            width: 50
            height: 50
            
            color: "lightpink"
            MouseArea{
                id: s35_ma
                anchors.fill: parent
            }
            states: State {
                name: "s35_moved"
                when: s35_ma.pressed
                PropertyChanges {
                    target: s35_rect
                    x: 50
                    y: 50
                    
                }
            }
            transitions: [
                Transition {
                    
                    NumberAnimation {
                        
                        properties:  "x,y"
                        easing.type: Easing.InOutQuad
                    }
                }
            ]
        }
        
    }
    
    Item {
        id: s36
        width: 100
        height: 100
        anchors.left: s31.right
        Text {
            id: s36_app
            text: "xxxfa"
        }
        TextEdit{
            anchors.top: s36_app.bottom
            id: s36_textedit
            text: "please type here .."
        }
        Binding{
            target: s36_app
            property: "enteredText"
            value: s36_textedit.text
        }
    }
    
    
    
}
