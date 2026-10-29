pragma ComponentBehavior: Bound
// for permitting access to window.themeColor
// from inside any component declarations in this file

import QtQuick

Window {
    id: window
    title: "TV Remote"

    /* Your solution should contain these key features:

    - Add a Window with dimensions which resemble the kind of
      remote control shape you want

    - Using components from the Qt Quick module such as Text,
      Image, Rectangle and any other components you want to use
      in your design, construct your shape, colors and layout of
      the elements you need.

    - You should include a number of Buttons providing features
      such as Volume +/-, Mute, Channel +/-, Power on/off, and
      perhaps even some cursor arrows.

    - Add image resources to your project and use them in your
      design and try to show how the image URL might be changed
      using bindings inside a string template expression.

    - Add a font to your project and use a FontLoader to be able
      to use the font in your Text components.

    - Create re-usable items using inline components adding any
      "required" properties where necessary

    - Using bindings and signal handlers to connect your UI
      elements to the provided tvControl object (below) so that
      interacting with your Buttons for example, could change
      the visible, enabled, or color of some of the other
      elements based on the changed state of the tvControl
      object’s properties.

    */

    // Here we have chosen a reasonable shape for your
    // remote control, but feel free to design your own.
    minimumHeight: 740
    minimumWidth: 240
    maximumHeight: minimumHeight
    maximumWidth: minimumWidth
    visible: true
    color: "transparent"
    flags: Qt.FramelessWindowHint

    // the window provides a themeColor property which you
    // may use wherever you need to refer to the same color
    property color themeColor: "silver"

    /* Here are a few components you can use to get you going */

    MouseArea {
        anchors.fill: parent
        onPressedChanged: if(pressed) window.startSystemMove()
    }

    FontLoader {
        id: silkscreenFont
        source: Qt.resolvedUrl("fonts/Silkscreen/Silkscreen-Regular.ttf")
    }

    component BorderGradient: Rectangle {
        id: borderGradientRectangle

        // BorderGradient:
        // A simple Rectangle with a 2-color gradient

        // We use the Rectangle's own color property as
        // the first gradient stop color (so we upgrade the
        // color property to a required property)
        property color color2: borderGradientRectangle.color.darker()

        color: window.themeColor

        gradient: Gradient {
            GradientStop {
                position: 0
                color: borderGradientRectangle.color
            }
            GradientStop {
                position: 1
                color: borderGradientRectangle.color2
            }
        }
    }

    component DoubleBorderGradient: BorderGradient {
        id: doubleBorderGradient

        // DoubleBorderGradient:
        // A BorderGradient with another one nested inside
        // with a specified innerMargin

        property int innerMargin: 2

        BorderGradient {
            // inner gradient
            anchors {
                fill: parent
                margins: doubleBorderGradient.innerMargin
            }

            radius: doubleBorderGradient.radius - doubleBorderGradient.innerMargin

            // swap the colors around
            color: doubleBorderGradient.color2
            color2: doubleBorderGradient.color
        }
    }

    component Button: DoubleBorderGradient {
        id: button

        // Button:
        // A clickable DoubleBorderGradient with a useful
        // clicked signal and a pressed property alias

        readonly property alias pressed: tapHandler.pressed
        signal clicked

        implicitWidth: 100
        implicitHeight: 40

        radius: Math.min(width, height) / 2

        color: tapHandler.pressed ? window.themeColor : window.themeColor.darker()
        color2: tapHandler.pressed ? window.themeColor.darker() : window.themeColor

        TapHandler {
            id: tapHandler
            gesturePolicy: TapHandler.WithinBounds
            onTapped: button.clicked()
        }
    }

    component CircleButton: Button {
        id: circleButton

        // CircleButton:
        // A circular Button for convenience

        width: 200
        height: width // a circle

        // The CircleButton uses Item's containmentMask
        // property to return the boolean result of a
        // simplified test to check if the point is inside
        // the circle or not.
        containmentMask: QtObject {
            function contains(clickPoint: point) : bool {
                return (Math.pow(clickPoint.x - circleButton.radius, 2) +
                        Math.pow(clickPoint.y - circleButton.radius, 2))
                        < Math.pow(circleButton.radius, 2)
            }
        }
    }

    component VerticalButton: Button {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        width: 40
        height: 150

        property alias topSource: topImage.source
        property alias bottomSource: bottomImage.source
        property var onHitUp: function() {}
        property var onHitDown: function() {}

        Image {
            id: topImage
            scale: 0.5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 5

            TapHandler {
                onTapped: onHitUp()
            }
        }

        Image {
            id: bottomImage
            scale: 0.5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5

            TapHandler {
                onTapped: onHitDown()
            }
        }
    }

    component OptionButton: Button {
        id: optionButton
        width: height * 1.1

        property alias imageSource: image.source
        property var onHit: function() {
            optionButton.checked = !optionButton.checked
        }

        Image {
            id:image
            anchors.fill: parent
            scale: 0.5
        }

        TapHandler {
            onTapped: onHit()
        }
    }

    component WedgeButton: Item {

        id: wedgeButton

        property alias imageSource: wedgeImage.source
        property alias buttonHorizontalCenter: button.anchors.horizontalCenter
        property alias buttonVerticalCenter: button.anchors.verticalCenter

        width: 100
        height: 100

        clip: true

        CircleButton {
            id: button
            rotation: -45

            Image {
                id: wedgeImage
                anchors {
                    top: parent.top
                    topMargin: 10
                    horizontalCenter: parent.horizontalCenter
                }
                rotation: -(wedgeButton.rotation)
                width: 32
                height: 32
                fillMode: Image.PreserveAspectFit
            }
        }


    }

    QtObject {
        id: tvControl

        // The tvControl object is provided for you to use as a
        // mock back-end providing a number of typical properties
        // and features you might find on a remote control.
        // There are even 5 channels with sample channelNames.

        property int channelNumber: 0
        readonly property string channelName: channelNames[channelNumber]

        // TV Features
        property bool closedCaptionsEnabled: true
        property bool hdrEnabled: true
        property bool castConnected: true
        property bool listening: false
        property bool muted: false
        property real volume: 0.75
        readonly property bool soundOn: !muted && volume > 0

        function incrementVolume() {
            volume = Math.min(1, volume + 0.1)
        }

        function decrementVolume() {
            volume = Math.max(0, volume - 0.1)
        }

        function incrementChannel() {
            channelNumber = Math.min(channelNames.length - 1, channelNumber + 1)
        }

        function decrementChannel() {
            channelNumber = Math.max(0, channelNumber - 1)
        }

        property list<string> channelNames: [
            "News Station",
            "Comedy Cable",
            "Eats and Beats",
            "Weather",
            "Cartoons",
            "Reality TV"
        ]
    }

    // Here we provide a suggested remote control background
    DoubleBorderGradient {
        id: remoteControlBackground

        anchors.fill: parent
        innerMargin: 8
        radius: 40
    }

    // As a demonstration of one of the Button types,
    // we add a power button.
    CircleButton {
        id: powerButton

        anchors {
            top: parent.top
            right: parent.right
            topMargin: 20
            rightMargin: 20
        }
        width: 40
        height: 40
        color: "darkred"

        Image {
            source: "images/power.svg"
            anchors.fill: parent
            anchors.margins: 10
        }

        onClicked: window.close()
    }


    Item {
        anchors.fill: parent
        anchors.topMargin: 70

        DoubleBorderGradient {
            id: remoteScreen
            height: 100
            width: 200
            color: "#88CE36"
            color2: "#256F3B"
            radius: 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

            Column {
                id: channelText
                spacing: 4
                anchors.top: parent.top
                anchors.fill: parent
                anchors.margins: 10

                Text {
                    text: `Channel 0${tvControl.channelNumber}`
                    font.family: silkscreenFont.font.family
                    font.pixelSize: 20
                }

                Text {
                    text: tvControl.channelName
                    font.family: silkscreenFont.font.family
                }
            }

            Item {
                id: optionImages
                anchors.bottom: remoteScreen.bottom
                anchors.bottomMargin: 45

                Row {
                    spacing: -20

                    Image {
                        id: ccOn
                        opacity: tvControl.closedCaptionsEnabled ? 1.0 : 0.0
                        source: "images/closed_caption.svg"
                        scale: 0.5
                    }

                    Image {
                        id: hdrOn
                        opacity: tvControl.hdrEnabled ? 1.0 : 0.0
                        source: "images/hdr_on.svg"
                        scale: 0.5
                    }

                    Image {
                        id: castOn
                        opacity: tvControl.castConnected ? 1.0 : 0.0
                        source: "images/cast_connected.svg"
                        scale: 0.5
                    }

                    Image {
                        id: listening
                        opacity: tvControl.listening ? 1.0 : 0.0
                        source: "images/mic.svg"
                        scale: 0.5
                    }
                }
            }

            Item {
                id: volumeIndicator
                anchors.fill: parent
                anchors.rightMargin: 8
                anchors.bottomMargin: 7

                Image {
                    source: `images/speaker${tvControl.muted ? "_muted" : ""}.svg`
                    scale: 0.5
                    anchors.bottom: volumeRectangle.bottom
                    anchors.bottomMargin: -10
                    anchors.right: parent.right
                }

                Rectangle {
                  id: volumeRectangle
                  height: 60
                  width: 10
                  color: 'transparent'
                  opacity: 0.9

                  border.color: tvControl.muted ? "#7A8268" : "#27350D"
                  border.width: 1

                  anchors.right: parent.right
                  anchors.bottom: parent.bottom

                  Rectangle {
                      width: 10
                      z: -1
                      opacity: 0.9
                      height: tvControl.volume * 60
                      anchors.bottom: parent.bottom
                      anchors.horizontalCenter: parent.horizontalCenter
                      color: tvControl.muted ? "#5A604D" : "black"
                  }
                }
            }
        }

        Row {
            id: topButtons
            spacing: 4
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: remoteScreen.bottom
            anchors.topMargin: 20

            OptionButton {
                id: ccButton
                imageSource: "images/closed_caption_white.svg"
                onHit: () => tvControl.closedCaptionsEnabled = !tvControl.closedCaptionsEnabled
            }
            OptionButton {
                id: hdrButton
                imageSource: "images/hdr_on_white.svg"
                onHit: () => tvControl.hdrEnabled = !tvControl.hdrEnabled
            }
            OptionButton {
                id: castButton
                imageSource: "images/cast_white.svg"
                onHit: () => tvControl.castConnected = !tvControl.castConnected
            }
            OptionButton {
                id: muteButton
                imageSource: "images/speaker_muted_white.svg"
                onHit: () => tvControl.muted = !tvControl.muted
            }
        }

        Item {
            id: dpad
            anchors {
                top: topButtons.bottom
                topMargin: 20
                horizontalCenter: parent.horizontalCenter
            }

            width: 200
            height: 200

            Item {
                id: rotatedButtons

                anchors.fill: parent
                rotation: 45

                WedgeButton {
                    id: topButton
                    imageSource: Qt.resolvedUrl("images/settings.svg")
                    anchors {
                        left: parent.left
                        top: parent.top
                    }
                }

                WedgeButton {
                    id: rightButton
                    anchors {
                        right: parent.right
                        top: parent.top
                    }
                    rotation: 90
                    imageSource: Qt.resolvedUrl("images/fast_forward.svg")

                }

                WedgeButton {
                    id: bottomButton
                    anchors {
                        right: parent.right
                        bottom: parent.bottom
                    }
                    rotation: 180
                    imageSource: Qt.resolvedUrl("images/play_pause.svg")
                }

                WedgeButton {
                    id: leftButton
                    anchors {
                        left: parent.left
                        bottom: parent.bottom
                    }
                    imageSource: Qt.resolvedUrl("images/fast_rewind.svg")
                    rotation: -90
                }

                Rectangle {
                    // a horizontal line (rotated by 45 degrees)

                    //visible: false

                    anchors {
                        left: parent.left
                        right: parent.right
                        verticalCenter: parent.verticalCenter
                        margins: 2
                    }

                    height: 2
                    color: window.themeColor
                    opacity: 0.5

                    Rectangle {
                        y: 1
                        width: parent.width
                        height: 2
                        color: window.themeColor.darker()
                    }
                }

                Rectangle {
                    // a vertical line (rotated by 45 degrees)

                    //visible: false

                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                        horizontalCenter: parent.horizontalCenter
                        margins: 2
                    }
                    width: 2
                    color: window.themeColor
                    opacity: 0.5

                    Rectangle {
                        x: -1
                        height: parent.height
                        width: 2
                        color: window.themeColor.darker()
                    }
                }
            }

            CircleButton {
                id: centerButton

                anchors.centerIn: parent
                width: 100
                height: 100
                onClicked: () => {
                    if(listeningTimer.running){
                        listeningTimer.stop()
                        tvControl.listening = false
                    }else{
                        listeningTimer.start()
                    }
                }

                Image {
                    anchors.centerIn: parent
                    width: 48
                    height: 48
                    source: Qt.resolvedUrl("images/mic_white.svg")
                    fillMode: Image.PreserveAspectFit
                }

                Timer {
                    id: listeningTimer
                    interval: 500
                    repeat: true
                    onTriggered: () => {
                        tvControl.listening = !tvControl.listening
                    }
                }
            }
        }

        Row{
            id: channelAndVolumeButtons
            spacing: 50

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            VerticalButton {
                topSource: "images/plus.svg"
                bottomSource: "images/minus.svg"
                onHitUp: () => { tvControl.incrementChannel()}
                onHitDown: () => { tvControl.decrementChannel()}
            }

            VerticalButton {
                topSource: "images/volume_up.svg"
                bottomSource: "images/volume_down.svg"
                onHitUp: () => {
                    if(tvControl.muted == true && tvControl.volume >= 0){
                        tvControl.muted = false
                    }
                    tvControl.incrementVolume()
                }
                onHitDown: () => {

                   if(tvControl.muted == true && tvControl.volume > 0){
                       tvControl.muted = false
                   }
                    tvControl.decrementVolume()
                    if(tvControl.volume == 0){
                        tvControl.muted = true
                    }
                }
            }
        }
    }
}
