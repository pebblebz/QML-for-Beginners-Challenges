import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


Page {
        id: menuSection
        background: Rectangle { color: "transparent"}

        property SectionObject sectionInfo
        property int sectionTotal:
           (option1.itemPrice * option1.itemQuantity) +
           (option2.itemPrice * option2.itemQuantity) +
           (option3.itemPrice * option3.itemQuantity)

        component MenuOption: RowLayout {

                property string itemName
                property int itemPrice
                property int itemQuantity

                id: menuOption
                spacing: 5
                Label {
                        text: `${itemName}: $${itemPrice}`
                        font.pixelSize: 18

                        Layout.fillWidth: true
                }

                SpinBox {
                        id: spinBox
                        Layout.alignment: Qt.AlignRight
                        onValueChanged: () => {
                                menuOption.itemQuantity = value
                        }
                }
        }

        header: Pane {
                padding: 2
                background: Rectangle { color: "transparent"}
                Label {
                    text: sectionInfo.sectionTitle
                    anchors.left: parent.left
                    font.pixelSize: 32

                }
        }

        ColumnLayout {
                spacing:5

                MenuOption {
                        id: option1
                        itemName: sectionInfo.sectionOptions[0]
                        itemPrice: sectionInfo.optionPrices[0]
                }
                MenuOption {
                        id: option2
                        itemName: sectionInfo.sectionOptions[1]
                        itemPrice: sectionInfo.optionPrices[1]
                }
                MenuOption {
                        id: option3
                        itemName: sectionInfo.sectionOptions[2]
                        itemPrice: sectionInfo.optionPrices[2]
                }
        }
}
