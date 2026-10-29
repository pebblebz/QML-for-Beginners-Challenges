// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: window

    width: 440
    height: 480
    visible: true
    title: qsTr("Chat App")
    property int selectedButtonIndex: 0

    Component {
        id: userButton

        Button {
            required property int index

            id:button
            text: "Bob"
            font.pixelSize: 20
            Layout.preferredWidth: 80
            palette.buttonText: selectedButtonIndex == index ? "white" : "black"
            background: Rectangle {
               radius: 10

               color: selectedButtonIndex == index ? "black"
                    : button.down ? "#AAAAAA"
                    : button.hovered ? "#DDDDDD"
                    : "#F0F0F0"

               border.color: button.down ? "#555555" : "#AAAAAA"
               border.width: 1
            }
            onPressed: selectedButtonIndex = index
        }
    }

    ColumnLayout {
        id: buttonColumn
        Repeater {
            id: chatButtons
            delegate: userButton
            model: 3
        }
        Rectangle {
            color: "grey"
            width: 300
            height: 40
            radius: 10
            Label {
                text: `Chatting with ${chatButtons.itemAt(0)}`
            }
        }
    }

    /* Requirements:

    Design and build the basic elements of a chat
    application - focusing on the task of making the design
    responsive rather than making it actually functional.

    Use QUTE Quick Layouts to design a suitable Desktop Layout for your application.
    Using the Layout attached properties such as
    Layout.fillWidth/fillHeight, Layout.alignment,
    Layout.preferredWidth/preferredHeight,
    and Layout.margins to customise the Layouts.

    There should be sections in your application showing
    - the name of the person who you are chatting with
    - a two-way conversation using static “chat bubbles”
    - a text input for writing a potential reply
    - and a send button

    The chat bubble should contain some text, and be
    positioned on the left or right depending on whose chat
    bubble it is, much like popular messaging apps.
    You should consider how to add an alternating color
    for the chat bubbles.

    */
}
