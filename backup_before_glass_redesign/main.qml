
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

Rectangle {
    id: root

    width: 1200
    height: 760
    color: assetBackend.themeColor("#101522", assetBackend.theme)
    clip: true

    property string activeSection: "Overview"

    // BACKGROUND
    Item {
        id: backgroundScene
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent

            gradient: Gradient {
                GradientStop { position: 0.0; color: assetBackend.themeColor("#111827", assetBackend.theme) }
                GradientStop { position: 0.52; color: assetBackend.themeColor("#19263D", assetBackend.theme) }
                GradientStop { position: 1.0; color: assetBackend.themeColor("#17172C", assetBackend.theme) }
            }
        }

        Rectangle {
            width: 650
            height: 650
            radius: 325
            x: root.width - 440
            y: -330
            opacity: 0.22

            gradient: Gradient {
                GradientStop { position: 0.0; color: assetBackend.themeColor("#6659C9", assetBackend.theme) }
                GradientStop { position: 1.0; color: assetBackend.themeColor("#152B50", assetBackend.theme) }
            }
        }

        Rectangle {
            width: 550
            height: 550
            radius: 275
            x: -280
            y: root.height - 390
            opacity: 0.20

            gradient: Gradient {
                GradientStop { position: 0.0; color: assetBackend.themeColor("#168FAF", assetBackend.theme) }
                GradientStop { position: 1.0; color: assetBackend.themeColor("#17243D", assetBackend.theme) }
            }
        }

        Rectangle {
            width: 380
            height: 380
            radius: 190
            x: root.width * 0.40
            y: root.height * 0.35
            opacity: 0.09

            gradient: Gradient {
                GradientStop { position: 0.0; color: assetBackend.themeColor("#4B76C8", assetBackend.theme) }
                GradientStop { position: 1.0; color: assetBackend.themeColor("#25213F", assetBackend.theme) }
            }
        }
    }

    // MAIN APPLICATION LAYOUT
    RowLayout {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 18

        // SIDEBAR
        GlassPanel {
            id: sidebar

            backdropSource: backgroundScene
            glassTint: 0.12

            Layout.preferredWidth: 218
            Layout.fillHeight: true

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 19
                spacing: 0

                // BRAND
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 11

                    Rectangle {
                        width: 39
                        height: 39
                        radius: 12

                        gradient: Gradient {
                            GradientStop { position: 0.0; color: assetBackend.themeColor("#6989D8", assetBackend.theme) }
                            GradientStop { position: 1.0; color: assetBackend.themeColor("#4357A2", assetBackend.theme) }
                        }

                        Text {
                            anchors.centerIn: parent
                            text: assetBackend.translateText("B", assetBackend.language)
                            color: "white"
                            font.pixelSize: 22 * assetBackend.fontScale
                            font.weight: Font.Bold
                        }
                    }

                    ColumnLayout {
                        spacing: 1

                        Text {
                            text: assetBackend.applicationName
                            color: assetBackend.themeColor("#FFFFFF", assetBackend.theme)
                            font.pixelSize: 19 * assetBackend.fontScale
                            font.weight: Font.Bold
                        }

                        Text {
                            text: assetBackend.translateText("CAMPUS OPERATIONS", assetBackend.language)
                            color: assetBackend.themeColor("#8292B1", assetBackend.theme)
                            font.pixelSize: 8 * assetBackend.fontScale
                            font.letterSpacing: 1.1
                        }
                    }
                }

                Item { Layout.preferredHeight: 34 }

                Text {
                    text: assetBackend.translateText("WORKSPACE", assetBackend.language)
                    color: assetBackend.themeColor("#7585A3", assetBackend.theme)
                    font.pixelSize: 9 * assetBackend.fontScale
                    font.weight: Font.DemiBold
                    font.letterSpacing: 1.5
                }

                Item { Layout.preferredHeight: 12 }

                // NAVIGATION
                Repeater {
                    model: [
                        { name: "Overview", symbol: "◈" },
                        { name: "Asset Registry", symbol: "▦" },
                        { name: "Locations", symbol: "⌖" },
                        { name: "Maintenance", symbol: "⌁" },
                        { name: "Reports", symbol: "▤" }
                    ]

                    delegate: Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 43
                        Layout.bottomMargin: 5

                        radius: 11

                        property bool selected:
                            root.activeSection === modelData.name

                        color: selected
                               ? "#344C76A0"
                               : navMouse.containsMouse
                                 ? "#1EFFFFFF"
                                 : "transparent"

                        border.width: selected ? 1 : 0
                        border.color: assetBackend.themeColor("#526FA4C7", assetBackend.theme)

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 12
                            anchors.rightMargin: 10
                            spacing: 12

                            Text {
                                text: modelData.symbol
                                color: parent.parent.selected
                                       ? "#B9DBFF"
                                       : "#899AB8"
                                font.pixelSize: 17 * assetBackend.fontScale
                                Layout.preferredWidth: 19
                                horizontalAlignment: Text.AlignHCenter
                            }

                            Text {
                                text: modelData.name
                                color: parent.parent.selected
                                       ? "#FFFFFF"
                                       : "#AAB6CC"
                                font.pixelSize: 11 * assetBackend.fontScale
                                font.weight: parent.parent.selected
                                             ? Font.DemiBold
                                             : Font.Medium

                                Layout.fillWidth: true
                            }
                        }

                        MouseArea {
                            id: navMouse
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor

                            onClicked: {
                                root.activeSection = modelData.name
                                console.log("Selected:", modelData.name)
                            }
                        }

                        Behavior on color {
                            ColorAnimation { duration: 140 }
                        }
                    }
                }

                Item { Layout.fillHeight: true }

                // OFFLINE STATUS
                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 65
                    radius: 13
                    color: assetBackend.themeColor("#172D4B43", assetBackend.theme)
                    border.width: 1
                    border.color: assetBackend.themeColor("#365D9C82", assetBackend.theme)

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 11
                        spacing: 5

                        RowLayout {
                            spacing: 7

                            Rectangle {
                                width: 7
                                height: 7
                                radius: 4
                                color: assetBackend.themeColor("#70DDB3", assetBackend.theme)
                            }

                            Text {
                                text: assetBackend.translateText("SYSTEM OPERATIONAL", assetBackend.language)
                                color: assetBackend.themeColor("#C2E9D8", assetBackend.theme)
                                font.pixelSize: 9 * assetBackend.fontScale
                                font.weight: Font.DemiBold
                            }
                        }

                        Text {
                            text: assetBackend.translateText("Local database active", assetBackend.language)
                            color: assetBackend.themeColor("#819AAB", assetBackend.theme)
                            font.pixelSize: 9 * assetBackend.fontScale
                        }
                    }
                }

                Item { Layout.preferredHeight: 12 }

                Text {
                    text: assetBackend.translateText("BUBTOPS  •  DESKTOP", assetBackend.language)
                    color: assetBackend.themeColor("#64738F", assetBackend.theme)
                    font.pixelSize: 8 * assetBackend.fontScale
                    font.letterSpacing: 1
                }
            }
        }

        // MAIN CONTENT
        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 17

            // HEADER
            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 61

                ColumnLayout {
                    spacing: 4

                    Text {
                        text: root.activeSection
                        color: assetBackend.themeColor("#FFFFFF", assetBackend.theme)
                        font.pixelSize: 25 * assetBackend.fontScale
                        font.weight: Font.Bold
                    }

                    Text {
                        text: assetBackend.translateText("Your campus operations at a glance.", assetBackend.language)
                        color: assetBackend.themeColor("#98A7C0", assetBackend.theme)
                        font.pixelSize: 11 * assetBackend.fontScale
                    }
                }

                Item { Layout.fillWidth: true }

                Rectangle {
                    Layout.preferredWidth: 116
                    Layout.preferredHeight: 35
                    radius: 18

                    color: assetBackend.themeColor("#192D8067", assetBackend.theme)
                    border.width: 1
                    border.color: assetBackend.themeColor("#4567A994", assetBackend.theme)

                    RowLayout {
                        anchors.centerIn: parent
                        spacing: 7

                        Rectangle {
                            width: 6
                            height: 6
                            radius: 3
                            color: assetBackend.themeColor("#75DEB4", assetBackend.theme)
                        }

                        Text {
                            text: assetBackend.translateText("OFFLINE MODE", assetBackend.language)
                            color: assetBackend.themeColor("#D3E8E1", assetBackend.theme)
                            font.pixelSize: 9 * assetBackend.fontScale
                            font.weight: Font.DemiBold
                        }
                    }
                }
            }

            // SUMMARY CARDS
            RowLayout {
                Layout.fillWidth: true
                spacing: 12

                Repeater {
                    model: [
                        {
                            title: "REGISTERED ASSETS",
                            value: "128",
                            note: "Total campus assets",
                            symbol: "▦",
                            tint: "#81B9F5"
                        },
                        {
                            title: "IN SERVICE",
                            value: "112",
                            note: "Currently operational",
                            symbol: "✓",
                            tint: "#7ADDB6"
                        },
                        {
                            title: "NEEDS ATTENTION",
                            value: "09",
                            note: "Requires inspection",
                            symbol: "!",
                            tint: "#E8BE7B"
                        },
                        {
                            title: "MAINTENANCE COST",
                            value: "৳ 24.8K",
                            note: "Recorded expenses",
                            symbol: "↗",
                            tint: "#B5A2F4"
                        }
                    ]

                    delegate: GlassPanel {
                        property var info: modelData

                        backdropSource: backgroundScene
                        glassTint: 0.10

                        Layout.fillWidth: true
                        Layout.preferredHeight: 137

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 15
                            spacing: 7

                            RowLayout {
                                Layout.fillWidth: true

                                Text {
                                    text: info.title
                                    color: assetBackend.themeColor("#A2B0C9", assetBackend.theme)
                                    font.pixelSize: 8 * assetBackend.fontScale
                                    font.weight: Font.DemiBold
                                    font.letterSpacing: 0.7

                                    Layout.fillWidth: true
                                }

                                Rectangle {
                                    width: 27
                                    height: 27
                                    radius: 9
                                    color: assetBackend.themeColor("#20FFFFFF", assetBackend.theme)
                                    border.width: 1
                                    border.color: assetBackend.themeColor("#30FFFFFF", assetBackend.theme)

                                    Text {
                                        anchors.centerIn: parent
                                        text: info.symbol
                                        color: info.tint
                                        font.pixelSize: 14 * assetBackend.fontScale
                                        font.weight: Font.DemiBold
                                    }
                                }
                            }

                            Text {
                                text: info.value
                                color: assetBackend.themeColor("#FFFFFF", assetBackend.theme)
                                font.pixelSize: 26 * assetBackend.fontScale
                                font.weight: Font.DemiBold
                            }

                            Text {
                                text: info.note
                                color: assetBackend.themeColor("#8798B5", assetBackend.theme)
                                font.pixelSize: 9 * assetBackend.fontScale
                            }
                        }
                    }
                }
            }

            // LOWER CONTENT AREA
            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 12

                // ASSET CONDITION
                GlassPanel {
                    backdropSource: backgroundScene
                    glassTint: 0.11

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.minimumWidth: 270

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 19
                        spacing: 14

                        RowLayout {
                            Layout.fillWidth: true

                            ColumnLayout {
                                spacing: 4

                                Text {
                                    text: assetBackend.translateText("Asset condition", assetBackend.language)
                                    color: assetBackend.themeColor("#FFFFFF", assetBackend.theme)
                                    font.pixelSize: 15 * assetBackend.fontScale
                                    font.weight: Font.DemiBold
                                }

                                Text {
                                    text: assetBackend.translateText("Current equipment overview", assetBackend.language)
                                    color: assetBackend.themeColor("#8E9DB7", assetBackend.theme)
                                    font.pixelSize: 9 * assetBackend.fontScale
                                }
                            }

                            Item { Layout.fillWidth: true }

                            Text {
                                text: assetBackend.translateText("OVERVIEW", assetBackend.language)
                                color: assetBackend.themeColor("#8FA9D0", assetBackend.theme)
                                font.pixelSize: 8 * assetBackend.fontScale
                                font.weight: Font.DemiBold
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 1
                            color: assetBackend.themeColor("#24FFFFFF", assetBackend.theme)
                        }

                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 10

                            ColumnLayout {
                                spacing: 3

                                Text {
                                    text: assetBackend.translateText("87.5%", assetBackend.language)
                                    color: assetBackend.themeColor("#FFFFFF", assetBackend.theme)
                                    font.pixelSize: 31 * assetBackend.fontScale
                                    font.weight: Font.DemiBold
                                }

                                Text {
                                    text: assetBackend.translateText("Assets operational", assetBackend.language)
                                    color: assetBackend.themeColor("#9CAAC2", assetBackend.theme)
                                    font.pixelSize: 10 * assetBackend.fontScale
                                }
                            }

                            Item { Layout.fillWidth: true }

                            Rectangle {
                                width: 64
                                height: 64
                                radius: 32
                                color: assetBackend.themeColor("#244D806D", assetBackend.theme)
                                border.width: 3
                                border.color: assetBackend.themeColor("#72DDB5", assetBackend.theme)

                                Text {
                                    anchors.centerIn: parent
                                    text: assetBackend.translateText("88", assetBackend.language)
                                    color: assetBackend.themeColor("#B8F0D7", assetBackend.theme)
                                    font.pixelSize: 20 * assetBackend.fontScale
                                    font.weight: Font.Bold
                                }
                            }
                        }

                        Item { Layout.preferredHeight: 2 }

                        // CONDITION BARS
                        Repeater {
                            model: [
                                {
                                    label: "Operational",
                                    count: "112",
                                    amount: 0.875,
                                    color: assetBackend.themeColor("#70D9B0", assetBackend.theme)
                                },
                                {
                                    label: "Under maintenance",
                                    count: "07",
                                    amount: 0.055,
                                    color: assetBackend.themeColor("#83B8F1", assetBackend.theme)
                                },
                                {
                                    label: "Needs inspection",
                                    count: "09",
                                    amount: 0.070,
                                    color: assetBackend.themeColor("#E7BD79", assetBackend.theme)
                                }
                            ]

                            delegate: ColumnLayout {
                                Layout.fillWidth: true
                                spacing: 7

                                RowLayout {
                                    Layout.fillWidth: true

                                    Text {
                                        text: modelData.label
                                        color: assetBackend.themeColor("#B7C3D7", assetBackend.theme)
                                        font.pixelSize: 10 * assetBackend.fontScale
                                    }

                                    Item { Layout.fillWidth: true }

                                    Text {
                                        text: modelData.count
                                        color: assetBackend.themeColor("#FFFFFF", assetBackend.theme)
                                        font.pixelSize: 10 * assetBackend.fontScale
                                        font.weight: Font.DemiBold
                                    }
                                }

                                Rectangle {
                                    Layout.fillWidth: true
                                    height: 6
                                    radius: 3
                                    color: assetBackend.themeColor("#263B526B", assetBackend.theme)

                                    Rectangle {
                                        width: parent.width * modelData.amount
                                        height: parent.height
                                        radius: 3
                                        color: modelData.color

                                        Behavior on width {
                                            NumberAnimation { duration: 450 }
                                        }
                                    }
                                }
                            }
                        }

                        Item { Layout.fillHeight: true }

                        Text {
                            text: assetBackend.translateText("Illustrative preview data — database connection comes next.", assetBackend.language)
                            color: assetBackend.themeColor("#71829F", assetBackend.theme)
                            font.pixelSize: 8 * assetBackend.fontScale
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                        }
                    }
                }

                // MAINTENANCE QUEUE
                GlassPanel {
                    backdropSource: backgroundScene
                    glassTint: 0.11

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.minimumWidth: 270

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 19
                        spacing: 13

                        RowLayout {
                            Layout.fillWidth: true

                            ColumnLayout {
                                spacing: 4

                                Text {
                                    text: assetBackend.translateText("Maintenance queue", assetBackend.language)
                                    color: assetBackend.themeColor("#FFFFFF", assetBackend.theme)
                                    font.pixelSize: 15 * assetBackend.fontScale
                                    font.weight: Font.DemiBold
                                }

                                Text {
                                    text: assetBackend.translateText("Items requiring attention", assetBackend.language)
                                    color: assetBackend.themeColor("#8E9DB7", assetBackend.theme)
                                    font.pixelSize: 9 * assetBackend.fontScale
                                }
                            }

                            Item { Layout.fillWidth: true }

                            Text {
                                text: assetBackend.translateText("VIEW ALL  →", assetBackend.language)
                                color: assetBackend.themeColor("#A9C9F3", assetBackend.theme)
                                font.pixelSize: 8 * assetBackend.fontScale
                                font.weight: Font.DemiBold
                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 1
                            color: assetBackend.themeColor("#24FFFFFF", assetBackend.theme)
                        }

                        Repeater {
                            model: [
                                {
                                    name: "Projector — Room 302",
                                    detail: "Academic building • 2 hours ago",
                                    status: "Pending",
                                    tint: "#E8BF7B"
                                },
                                {
                                    name: "Air conditioner — Lab 04",
                                    detail: "Engineering block • Yesterday",
                                    status: "Review",
                                    tint: "#8BBDF2"
                                },
                                {
                                    name: "Desktop PC — Office 12",
                                    detail: "Administration • 2 days ago",
                                    status: "Scheduled",
                                    tint: "#91D8BB"
                                }
                            ]

                            delegate: RowLayout {
                                Layout.fillWidth: true
                                spacing: 10

                                Rectangle {
                                    width: 34
                                    height: 34
                                    radius: 11
                                    color: assetBackend.themeColor("#20FFFFFF", assetBackend.theme)
                                    border.width: 1
                                    border.color: assetBackend.themeColor("#24FFFFFF", assetBackend.theme)

                                    Text {
                                        anchors.centerIn: parent
                                        text: assetBackend.translateText("⌁", assetBackend.language)
                                        color: modelData.tint
                                        font.pixelSize: 18 * assetBackend.fontScale
                                    }
                                }

                                ColumnLayout {
                                    spacing: 4
                                    Layout.fillWidth: true

                                    Text {
                                        text: modelData.name
                                        color: assetBackend.themeColor("#EAF0FB", assetBackend.theme)
                                        font.pixelSize: 10 * assetBackend.fontScale
                                        font.weight: Font.DemiBold
                                        elide: Text.ElideRight
                                        Layout.fillWidth: true
                                    }

                                    Text {
                                        text: modelData.detail
                                        color: assetBackend.themeColor("#8293AF", assetBackend.theme)
                                        font.pixelSize: 8 * assetBackend.fontScale
                                        elide: Text.ElideRight
                                        Layout.fillWidth: true
                                    }
                                }

                                Rectangle {
                                    radius: 8
                                    color: assetBackend.themeColor("#20FFFFFF", assetBackend.theme)
                                    border.width: 1
                                    border.color: assetBackend.themeColor("#32FFFFFF", assetBackend.theme)

                                    Layout.preferredWidth: 65
                                    Layout.preferredHeight: 23

                                    Text {
                                        anchors.centerIn: parent
                                        text: modelData.status
                                        color: modelData.tint
                                        font.pixelSize: 8 * assetBackend.fontScale
                                        font.weight: Font.DemiBold
                                    }
                                }
                            }
                        }

                        Item { Layout.fillHeight: true }

                        GlassButton {
                            Layout.fillWidth: true
                            label: "Open maintenance records"
                            primary: true

                            onClicked: {
                                root.activeSection = "Maintenance"
                            }
                        }
                    }
                }
            }

            // FOOTER
            RowLayout {
                Layout.fillWidth: true
                Layout.preferredHeight: 20

                Text {
                    text: assetBackend.translateText("BUBTOPS DESKTOP", assetBackend.language)
                    color: assetBackend.themeColor("#687A98", assetBackend.theme)
                    font.pixelSize: 8 * assetBackend.fontScale
                    font.letterSpacing: 1
                }

                Item { Layout.fillWidth: true }

                Text {
                    text: assetBackend.translateText("LOCAL • PRIVATE • OFFLINE", assetBackend.language)
                    color: assetBackend.themeColor("#7185A3", assetBackend.theme)
                    font.pixelSize: 8 * assetBackend.fontScale
                    font.letterSpacing: 0.8
                }
            }
        }
    }
}
