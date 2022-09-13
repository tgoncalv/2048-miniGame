import QtQuick 2.0

Item {
    id: button
    width: 150
    height: 50
    property alias text1Text: text1.text
    property alias buttonMouseArea: mouseArea

    Rectangle {
        id: rectangle
        color: "#2b9e42"
        radius: 7
        border.width: 0
        anchors.fill: parent

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onPressed: rectangle.state = "PRESSED"
            onReleased: rectangle.state = "RELEASED"

            Text {
                id: text1
                text: qsTr("Start")
                anchors.fill: parent
                font.pixelSize: 30
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                focus: true
            }

        }


        states: [
            State {
                name: "PRESSED"
                PropertyChanges { target: rectangle; color: "#1e8533"}
            },
            State {
                name: "RELEASED"
                PropertyChanges { target: rectangle; color: "#2b9e42"}
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
    D{i:0;height:50;width:150}D{i:3}D{i:4}D{i:2}D{i:1}
}
##^##*/
