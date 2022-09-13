import QtQuick 2.0

Item {
    width: 50
    height: 50
    property alias mouseArea: mouseArea
    property alias text1Text: text1.text

    Rectangle {
        id: rectangle
        color: "#f8a66c"
        radius: 16
        border.width: 0
        anchors.fill: parent

        Text {
            id: text1
            text: "+"
            anchors.fill: parent
            font.pixelSize: 60
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 0
            anchors.bottomMargin: 15
            anchors.leftMargin: 0
            anchors.topMargin: 8
            transformOrigin: Item.Center
            focus: true
            font.hintingPreference: Font.PreferDefaultHinting
            style: Text.Normal
            font.capitalization: Font.MixedCase
            font.kerning: true
            font.styleName: "Gras"
            font.family: "Tahoma"
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onPressed: rectangle.state = "PRESSED"
            onReleased: rectangle.state = "RELEASED"
        }


        states: [
            State {
                name: "PRESSED"
                PropertyChanges { target: rectangle; color: "#eb8d4b"}
            },
            State {
                name: "RELEASED"
                PropertyChanges { target: rectangle; color: "#f8a66c"}
            }
        ]

        transitions: [
                 Transition {
                     from: "PRESSED"
                     to: "RELEASED"
                     ColorAnimation { target: rectangle; duration: 75}
                 },
                 Transition {
                     from: "RELEASED"
                     to: "PRESSED"
                     ColorAnimation { target: rectangle; duration: 75}
                 }
             ]
    }

}

/*##^##
Designer {
    D{i:0;height:50;width:50}D{i:2}D{i:3}D{i:1}
}
##^##*/
