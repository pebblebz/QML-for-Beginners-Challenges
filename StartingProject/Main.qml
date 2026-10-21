import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: window
    property string restaurantName: "Ahji-Bhaji"

    FontLoader {
        id: kalamFont
        source: Qt.resolvedUrl("fonts/Kalam-Regular.ttf")
    }

    font {
        family: kalamFont.font.family
        pixelSize: 20
    }

    Palette {
        id: lightPalette
        dark: "black"
        window: "white"
        windowText: "black"
        button: "lightGrey"
        buttonText: "black"
        base: "white"
        text: "black"
    }

    palette: lightPalette

    /* Your menu ordering application should contain the following:

        - A variety of Controls from the Qt Quick Controls module
          such as Page, Pane, Button, Slider, RadioButton or Dials.
        - An ApplicationWindow that has a suitably appetising background
        - A cuisine-themed font to use across your whole design.
        - A restaurant name that you can put in the ApplicationWindow header.
        - Customise the ApplicationWindow palette to adjust your Controls' colors
        - Organise your menu into visual Pages with titles for Starters, Mains and Desserts,
          listing some menu items, showing a price and a quantity selection.
        - The total cost of the selected items should be shown in the ApplicationWindow footer
        - Consider how your design could be made from re-usable components as QML Files
        - Add a Button for "submitting" the order and show a visual status that the order
          is busy being processed, and then completed. A Timer can be used to simulate this.
        - If using anchors to arrange your design becomes complex, try using
          RowLayout and ColumnLayout from the Qt Quick Layouts module.
    */

    width: 724
    minimumWidth: 650
    height: 800
    minimumHeight: window.height
    visible: true
    title: qsTr(window.restaurantName)

    background: Image {
        source: Qt.resolvedUrl("images/curry.jpg")
        fillMode: Image.PreserveAspectCrop
    }

    header: Pane {
        padding: 8
        background: Rectangle {
            color: lightPalette.window
            opacity: 0.7
        }

        Label {
            text: window.restaurantName
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }

    footer: Pane {
        padding: 8
        background: Rectangle {
            color: lightPalette.window
            opacity: 0.7
        }

        Label {
            text: `ORDER TOTAL: $${fullMenu.tipAmount + fullMenu.foodAmount}`
            anchors.left: parent.left
            font.pixelSize: 30
        }
    }

    FullMenu {
        id: fullMenu
        anchors.fill: parent
    }
}
