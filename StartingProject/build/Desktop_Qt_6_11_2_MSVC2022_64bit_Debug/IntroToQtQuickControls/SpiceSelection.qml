import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Page {

    background: Rectangle { color: "transparent"}

    header: Label{
        text: "Spice Level"
        anchors.left: parent.left
        font.pixelSize: 32

    }
    RowLayout {
        Image {
            source: Qt.resolvedUrl("images/light/mild.svg")
            Layout.alignment: Qt.AlignBottom
        }
        Dial {
            Layout.alignment: Qt.AlignCenter
            from: 0
            to: 100
        }
        Image{
            source: Qt.resolvedUrl("images/light/very_hot.svg")
            Layout.alignment: Qt.AlignBottom
        }
    }
}
