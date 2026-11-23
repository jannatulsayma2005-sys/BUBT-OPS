
import QtQuick
import QtQuick.Effects

Item {
    id: aurora

    clip: true

    // =========================================
    // MIDNIGHT PASTEL AURORA BASE
    // =========================================

    Rectangle {
        anchors.fill: parent

        gradient: Gradient {
            GradientStop { position: 0.0; color: assetBackend.themeColor("#10131F", assetBackend.theme) }
            GradientStop { position: 0.48; color: assetBackend.themeColor("#202033", assetBackend.theme) }
            GradientStop { position: 1.0; color: assetBackend.themeColor("#10131C", assetBackend.theme) }
        }
    }

    // =========================================
    // SOFT AMBIENT LIGHT
    // =========================================

    Rectangle {
        width: aurora.width * 0.75
        height: aurora.height * 0.75

        x: -width * 0.28
        y: -height * 0.20

        radius: width * 0.5
        opacity: 0.32

        gradient: Gradient {
            GradientStop { position: 0.0; color: assetBackend.themeColor("#668DBD", assetBackend.theme) }
            GradientStop { position: 0.55; color: assetBackend.themeColor("#394C78", assetBackend.theme) }
            GradientStop { position: 1.0; color: assetBackend.themeColor("#00394C78", assetBackend.theme) }
        }
    }

    Rectangle {
        width: aurora.width * 0.85
        height: aurora.height * 0.70

        x: aurora.width * 0.50
        y: aurora.height * 0.35

        radius: width * 0.5
        opacity: 0.25

        gradient: Gradient {
            GradientStop { position: 0.0; color: assetBackend.themeColor("#B58CA8", assetBackend.theme) }
            GradientStop { position: 0.55; color: assetBackend.themeColor("#66506F", assetBackend.theme) }
            GradientStop { position: 1.0; color: assetBackend.themeColor("#0066506F", assetBackend.theme) }
        }
    }

    // =========================================
    // LARGE FROSTED GLASS SURFACE
    // =========================================

    Item {
        id: upperGlass

        width: aurora.width * 1.25
        height: aurora.height * 0.85

        x: -aurora.width * 0.12
        y: -aurora.height * 0.30

        rotation: -12

        Rectangle {
            anchors.fill: parent
            radius: height * 0.48
            opacity: 0.48

            gradient: Gradient {
                GradientStop { position: 0.0; color: assetBackend.themeColor("#829DBF", assetBackend.theme) }
                GradientStop { position: 0.28; color: assetBackend.themeColor("#647FAD", assetBackend.theme) }
                GradientStop { position: 0.65; color: assetBackend.themeColor("#455C85", assetBackend.theme) }
                GradientStop { position: 1.0; color: assetBackend.themeColor("#25364F", assetBackend.theme) }
            }
        }

        Rectangle {
            anchors.fill: parent
            anchors.margins: parent.height * 0.10
            radius: height * 0.48
            opacity: 0.22

            gradient: Gradient {
                GradientStop { position: 0.0; color: assetBackend.themeColor("#D3E1EF", assetBackend.theme) }
                GradientStop { position: 0.45; color: assetBackend.themeColor("#9AB6D1", assetBackend.theme) }
                GradientStop { position: 1.0; color: assetBackend.themeColor("#354B6C", assetBackend.theme) }
            }
        }

        SequentialAnimation on y {
            running: true
            loops: Animation.Infinite

            NumberAnimation {
                to: -aurora.height * 0.24
                duration: 8500
                easing.type: Easing.InOutSine
            }

            NumberAnimation {
                to: -aurora.height * 0.34
                duration: 8500
                easing.type: Easing.InOutSine
            }
        }

        SequentialAnimation on rotation {
            running: true
            loops: Animation.Infinite

            NumberAnimation {
                to: -9
                duration: 10000
                easing.type: Easing.InOutSine
            }

            NumberAnimation {
                to: -14
                duration: 10000
                easing.type: Easing.InOutSine
            }
        }
    }

    // =========================================
    // CENTRAL FLOWING GLASS FORM
    // =========================================

    Item {
        id: centralGlass

        width: aurora.width * 1.35
        height: aurora.height * 0.78

        x: -aurora.width * 0.16
        y: aurora.height * 0.18

        rotation: 8

        Rectangle {
            anchors.fill: parent
            radius: height * 0.48
            opacity: 0.58

            gradient: Gradient {
                GradientStop { position: 0.0; color: assetBackend.themeColor("#485A85", assetBackend.theme) }
                GradientStop { position: 0.30; color: assetBackend.themeColor("#9A9ABF", assetBackend.theme) }
                GradientStop { position: 0.58; color: assetBackend.themeColor("#9B819F", assetBackend.theme) }
                GradientStop { position: 1.0; color: assetBackend.themeColor("#3F405F", assetBackend.theme) }
            }
        }

        Rectangle {
            width: parent.width * 0.88
            height: parent.height * 0.70

            x: parent.width * 0.06
            y: parent.height * 0.13

            radius: height * 0.48
            opacity: 0.28

            gradient: Gradient {
                GradientStop { position: 0.0; color: assetBackend.themeColor("#E4D8EA", assetBackend.theme) }
                GradientStop { position: 0.35; color: assetBackend.themeColor("#B5B5D9", assetBackend.theme) }
                GradientStop { position: 1.0; color: assetBackend.themeColor("#465875", assetBackend.theme) }
            }
        }

        SequentialAnimation on y {
            running: true
            loops: Animation.Infinite

            NumberAnimation {
                to: aurora.height * 0.12
                duration: 11000
                easing.type: Easing.InOutSine
            }

            NumberAnimation {
                to: aurora.height * 0.23
                duration: 11000
                easing.type: Easing.InOutSine
            }
        }

        SequentialAnimation on rotation {
            running: true
            loops: Animation.Infinite

            NumberAnimation {
                to: 11
                duration: 12000
                easing.type: Easing.InOutSine
            }

            NumberAnimation {
                to: 5
                duration: 12000
                easing.type: Easing.InOutSine
            }
        }
    }

    // =========================================
    // LOWER PEARL GLASS SURFACE
    // =========================================

    Item {
        id: lowerGlass

        width: aurora.width * 1.20
        height: aurora.height * 0.70

        x: aurora.width * 0.12
        y: aurora.height * 0.55

        rotation: -14

        Rectangle {
            anchors.fill: parent
            radius: height * 0.48
            opacity: 0.42

            gradient: Gradient {
                GradientStop { position: 0.0; color: assetBackend.themeColor("#D4C7D1", assetBackend.theme) }
                GradientStop { position: 0.25; color: assetBackend.themeColor("#B2A8C1", assetBackend.theme) }
                GradientStop { position: 0.62; color: assetBackend.themeColor("#78849F", assetBackend.theme) }
                GradientStop { position: 1.0; color: assetBackend.themeColor("#303D56", assetBackend.theme) }
            }
        }

        Rectangle {
            anchors.fill: parent
            anchors.margins: parent.height * 0.12
            radius: height * 0.48
            opacity: 0.20

            gradient: Gradient {
                GradientStop { position: 0.0; color: assetBackend.themeColor("#F0E5DD", assetBackend.theme) }
                GradientStop { position: 0.35; color: assetBackend.themeColor("#D4C5D7", assetBackend.theme) }
                GradientStop { position: 1.0; color: assetBackend.themeColor("#56647D", assetBackend.theme) }
            }
        }

        SequentialAnimation on y {
            running: true
            loops: Animation.Infinite

            NumberAnimation {
                to: aurora.height * 0.50
                duration: 9500
                easing.type: Easing.InOutSine
            }

            NumberAnimation {
                to: aurora.height * 0.61
                duration: 9500
                easing.type: Easing.InOutSine
            }
        }

        SequentialAnimation on rotation {
            running: true
            loops: Animation.Infinite

            NumberAnimation {
                to: -10
                duration: 13000
                easing.type: Easing.InOutSine
            }

            NumberAnimation {
                to: -17
                duration: 13000
                easing.type: Easing.InOutSine
            }
        }
    }

    // =========================================
    // SOFT ATMOSPHERIC LIGHT
    // =========================================

    Rectangle {
        width: aurora.width * 0.70
        height: aurora.height * 0.38

        x: aurora.width * 0.12
        y: aurora.height * 0.28

        radius: width * 0.5
        opacity: 0.14

        gradient: Gradient {
            GradientStop { position: 0.0; color: assetBackend.themeColor("#F0D8DF", assetBackend.theme) }
            GradientStop { position: 0.45; color: assetBackend.themeColor("#B9B6E0", assetBackend.theme) }
            GradientStop { position: 1.0; color: assetBackend.themeColor("#00B9B6E0", assetBackend.theme) }
        }

        SequentialAnimation on x {
            running: true
            loops: Animation.Infinite

            NumberAnimation {
                to: aurora.width * 0.20
                duration: 14000
                easing.type: Easing.InOutSine
            }

            NumberAnimation {
                to: aurora.width * 0.08
                duration: 14000
                easing.type: Easing.InOutSine
            }
        }
    }

    // =========================================
    // SUBTLE CYAN AND WARM PEARL ACCENTS
    // =========================================

    Rectangle {
        width: aurora.width * 0.55
        height: aurora.height * 0.30

        x: aurora.width * 0.48
        y: aurora.height * 0.08

        radius: width * 0.5
        opacity: 0.10

        gradient: Gradient {
            GradientStop { position: 0.0; color: assetBackend.themeColor("#A4E2E6", assetBackend.theme) }
            GradientStop { position: 0.50; color: assetBackend.themeColor("#7DBBCF", assetBackend.theme) }
            GradientStop { position: 1.0; color: assetBackend.themeColor("#007DBBCF", assetBackend.theme) }
        }
    }

    Rectangle {
        width: aurora.width * 0.42
        height: aurora.height * 0.24

        x: aurora.width * 0.45
        y: aurora.height * 0.63

        radius: width * 0.5
        opacity: 0.09

        gradient: Gradient {
            GradientStop { position: 0.0; color: assetBackend.themeColor("#F0C9A8", assetBackend.theme) }
            GradientStop { position: 0.55; color: assetBackend.themeColor("#D9B9B2", assetBackend.theme) }
            GradientStop { position: 1.0; color: assetBackend.themeColor("#00D9B9B2", assetBackend.theme) }
        }
    }

    // =========================================
    // DARK EDGE DEPTH
    // =========================================

    Rectangle {
        anchors.fill: parent

        gradient: Gradient {
            GradientStop { position: 0.0; color: assetBackend.themeColor("#00101825", assetBackend.theme) }
            GradientStop { position: 0.55; color: assetBackend.themeColor("#00101825", assetBackend.theme) }
            GradientStop { position: 1.0; color: assetBackend.themeColor("#9A080F19", assetBackend.theme) }
        }
    }
}
