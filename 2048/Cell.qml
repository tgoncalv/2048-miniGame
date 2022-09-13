import QtQuick 2.0

Item {
    id: item1
    width: 112
    height: 112
    property alias cellHeight: item1.height
    property alias cellWidth: item1.width
    property alias text1Text: cell.text
    property alias text1Color: cell.color
    property alias rectangleColor: rectangle.color

    Rectangle {
        id: rectangle
        color: "#cdc1b4"
        radius: 7
        border.width: 0
        anchors.fill: parent

        Text {
            id: cell
            color: "#000000"
            text: qsTr("2048")
            elide: Text.ElideNone
            anchors.fill: parent
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.NoWrap
            layer.format: ShaderEffectSource.RGBA
            renderType: Text.QtRendering
            textFormat: Text.AutoText
            font.hintingPreference: Font.PreferDefaultHinting
            styleColor: "#000000"
            style: Text.Normal
            font.family: "Arial"
            font.styleName: "Gras"
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:3;height:100;width:100}D{i:2}D{i:1}
}
##^##*/
