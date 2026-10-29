// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

Window {

    // TODO: change the size to ensure it forms the standard business card ratio of approx 1:1.586
    // HINT: you may wish to use a binding
    id: root
    width: root.height * 1.586
    height: 300

    visible: true
    title: qsTr("Business Card")

    component ContactInfo: QtObject {

        // This is a ContactInfo object which provides the properties to fill in.
        // You can create as many instances of this as you like with different property values.

        // show these properties all the time:
        property string name
        property url photo

        // Basic Info properties:
        property string occupation
        property string company

        // Detailed Info properties:
        property string address
        property string country
        property string phone
        property string email
        property url webSite
    }
    component TitleText: Text {

        font {
            pixelSize: 45
            weight: Font.Bold
            capitalization: Font.AllUppercase
        }

        anchors {
            top: parent.top
            left: parent.left
            margins : 5
        }
    }
    component HeadingText: Text { font.pixelSize: 30 }
    component BodyText: Text { font.pixelSize: 15 }
    component Button: Rectangle {
        property bool checked: false
        property bool checkable: true
        signal clicked
        property alias text: text.text

        width: 120
        height: 40
        radius: height / 2
        color: detailsButton.checked ? "white" : "black"

        anchors {
            left: parent.left
            bottom: parent.bottom
            margins: 10
        }

        border {
            color: "black"
            width: 2
        }

        Text {
            id: text
            anchors.centerIn: parent
            color: detailsButton.checked ? "black" : "white"
            font.weight: Font.Bold
            font.pixelSize: 12
        }

        TapHandler{
            id: tapHandler
            onTapped: {
                if(detailsButton.checkable) {
                    detailsButton.checked = !detailsButton.checked
                }
                detailsButton.clicked()
            }
        }
    }

    ContactInfo {
        id: myContactInfo
        name: "Your Name"
        photo: Qt.resolvedUrl("IDPhoto.png")
        occupation: "QML Enthusiast"
        company: "Indie Soft"
        address: "Candy Cane Lane"
        country: "North Pole"
        phone: "+01 2345 567 890"
        email: "email@server.com"
        webSite: Qt.url("https://www.qt.io")
    }

    Rectangle {

        id: mainBorder
        color: "white"
        radius: 10

        anchors {
            fill: parent
            margins: 10
        }

        border {
            color: "black"
            width: 2
        }

        Item {
            id: imageItem
            anchors {
                fill: parent
                margins: 10
            }

            Rectangle {
                id: photoBorder
                height: 150
                width: photoBorder.height
                color: "transparent"
                radius: 10

                anchors {
                    top: imageItem.top
                    right: imageItem.right
                }

                border {
                    color: "black"
                    width: 2
                }
            }

            Image {

                source: Qt.resolvedUrl("IDPhoto.png")
                fillMode: Image.PreserveAspectFit

                anchors {
                    fill: photoBorder
                    margins: 5
                }
            }
        }

        TitleText {
            id: nameText
            text: myContactInfo.name
        }

        Item {
            id: basicsItem
            visible: !detailsButton.checked

            anchors{
                top: nameText.bottom
                left: parent.left
                margins: 5
            }

            HeadingText {
                id: occupationText
                text: myContactInfo.occupation
            }

            HeadingText {
                id: companyText
                text: myContactInfo.company
                anchors.top: occupationText.bottom
            }
        }

        Item {
            id: detailsItem
            visible: detailsButton.checked
            anchors{
                top: nameText.bottom
                left: parent.left
                margins: 5
            }

            HeadingText {
                id: addressText
                text: myContactInfo.address
            }

            HeadingText {
                id: countryText
                text: myContactInfo.country
                anchors.top: addressText.bottom
            }

            BodyText {
                id: phoneText
                text: myContactInfo.phone
                anchors.top: countryText.bottom
            }

            BodyText {
                id: emailText
                text: myContactInfo.email
                anchors.top: phoneText.bottom
            }

            Text {
                id: websiteText
                text: myContactInfo.webSite
                anchors.top: emailText.bottom

                TapHandler {
                    onTapped: {
                        Qt.openUrlExternally(myContactInfo.webSite)
                    }
                }
            }
        }

        Button {
            id: detailsButton
            text: "Details"
        }
    }

    /* Your solution should contain these key features:

        - A Text element for each of the ContactInfo properties.
        - The name and photo image should be shown all the time.
        - These should be grouped into two categories "Basic Info" and "Details".
        - Create a button using a MouseArea or TapHandler that can be used to
          toggle between showing the two categories of information.
        - Use a larger font size for the name
    */
}
