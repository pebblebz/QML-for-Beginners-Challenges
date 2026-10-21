import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Pane {
    id: fullMenu
    property int tipAmount
    property int foodAmount: mainsSection.sectionTotal + breadsSection.sectionTotal +
    startersSection.sectionTotal + sidesSection.sectionTotal

    anchors.fill: parent
    background: Rectangle {
        color: "white"
        opacity: 0.5
        border.color: "black"
        border.width: 1
    }

    RowLayout {
        anchors.fill: parent

        Pane {
            Layout.fillHeight: true
            Layout.fillWidth: true

            background: Rectangle {
                color: "transparent"
            }
            ColumnLayout {
                MenuSection {
                    id:startersSection
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    sectionInfo: SectionObject {
                        sectionTitle: "Starters"
                        sectionOptions: ["Onion Bhaji", "Meat Samosa", "Nargis Kebab"]
                        optionPrices: [10,12,15]
                    }
                }
                MenuSection {
                    id:mainsSection
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    sectionInfo: SectionObject {
                        sectionTitle: "Mains"
                        sectionOptions: ["Paneer Tikka", "Lamb Bhuna", "Murgh Tikka"]
                        optionPrices: [20,25,28]
                    }
                }
                SpiceSelection {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
        }

        Pane {
            Layout.fillHeight: true
            Layout.fillWidth: true

            background: Rectangle {
                color: "transparent"
            }

            ColumnLayout {
                MenuSection {
                    id: sidesSection
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    sectionInfo: SectionObject {
                        sectionTitle: "Sides"
                        sectionOptions: ["Pilau Rice", "Aloo Ghobi", "Ahji Bahji"]
                        optionPrices: [10,12,15]
                    }
                }
                MenuSection {
                    id: breadsSection
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    sectionInfo: SectionObject {
                        sectionTitle: "Breads"
                        sectionOptions: ["Garlic Naan", "Keema Naan", "Naan at all"]
                        optionPrices: [15,18,1]
                    }
                }
                Page {
                    background: Rectangle { color: "transparent"}

                    header: Label{
                        text: "Dining Options"
                        anchors.left: parent.left
                        font.pixelSize: 32

                    }

                    RowLayout {
                        RadioButton {
                            checked: true
                            text: qsTr("Eat In")
                        }
                        RadioButton {
                            text: qsTr("Take Away")
                        }
                    }
                }
                Page {
                    background: Rectangle { color: "transparent"}

                    header: Label{
                        text: "Tip Amount"
                        anchors.left: parent.left
                        font.pixelSize: 32

                    }
                    RowLayout {
                        Slider {
                            id: tipSlider
                            from: 0
                            stepSize: 1
                            to: 100
                            snapMode: Slider.SnapOnRelease
                            onValueChanged: () => {tipAmount = tipSlider.value}
                        }
                        Label {
                            text: `$${tipSlider.value}`
                            font.pixelSize: 25
                        }
                    }
                }
            }
        }
    }
}
