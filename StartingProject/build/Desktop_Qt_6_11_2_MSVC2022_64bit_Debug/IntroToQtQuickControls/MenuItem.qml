import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

RowLayout {
    spacing: 5
    anchors.fill: parent
    Label {
        text: "MENU ITEM $X :"
        color: "white"
        Layout.fillHeight: true
    }

    SpinBox {
        Layout.fillHeight: true
    }
}
