import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 850
    height: 850
    visible: true
    property alias gridHeight: grid.height
    property alias gridWidth: grid.width
    property alias gridRows: grid.rows
    property alias gridColumns: grid.columns
    title: "2048 Taïga & Denis"
    
    function backgroundColor(text) {
        
        var color0    = "#cdc1b4";
        var color2    = "#eee4da";
        var color4    = "#eee1c9";
        var color8    = "#f3b27a";
        var color16   = "#f69664";
        var color32   = "#f77c5f";
        var color64   = "#f75f3b";
        var color128  = "#edd073";
        var color256  = "#edcc62";
        var color512  = "#edc950";
        var color1024 = "#edc53f";
        var color2048 = "#edc22e";
        var color4096 = "#3c3a33";
        
        
        if (text==="")
            return color0;
        else if (text==="2")
            return color2;
        else if (text==="4")
            return color4;
        else if (text==="8")
            return color8;
        else if (text==="16")
            return color16;
        else if (text==="32")
            return color32;
        else if (text==="64")
            return color64;
        else if (text==="128")
            return color128;
        else if (text==="256")
            return color256;
        else if (text==="512")
            return color512;
        else if (text==="1024")
            return color1024;
        else if (text==="2048")
            return color2048;
        else
            return color4096;
    }
    
    function textColor(text) {
        let blackTexts = ["","2","4","8","16","32","64","128","256","512","1024","2048"];
        if(blackTexts.includes(text)){
            return "#000000";
        } else {
            return "#dedede";
        }
    }

    function refreshCellsSize() {
        let w = (600 - (gridColumns-1)*10)/gridColumns;
        let h = (600 - (gridRows-1)*10)/gridRows;
        let size = w;
        if(h<w){
            size = h;
        }

        for (var i=0; i<gridColumns*gridRows; i++) {
            cells.get(i)._cellHeight = size;
            cells.get(i)._cellWidth = size;
        }
        grid.width = size*gridColumns+(gridColumns-1)*10+30;
        grid.height = size*gridRows+(gridRows-1)*10+30;
    }
    
    Rectangle {
        focus: true
        id: rectangle
        color: "#ebe6cf"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        
        Text {
            id: title
            x: 8
            y: 10
            width: 246
            height: 102
            text: qsTr("2048")
            font.pixelSize: 110
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        
        Text {
            id: credits
            x: 130
            y: 810
            width: 587
            height: 39
            text: qsTr("Created by Denis Bakhoum and Taïga Gonçalves")
            font.pixelSize: 27
        }
        
        Button {
            id: buttonReset
            x: 350
            y: 73
            text1Text: "Reset"
            buttonMouseArea.onClicked: ObjetTable.reset()
        }

        ListModel {
            id: cells
            
            ListElement {
                _id: "cell0"
                _cellHeight: 142.5
                _cellWidth: 142.5
                _text1Text: ""
                _rectangleColor: "#3c3a33"
                _pos: 0
            }
            ListElement {
                _id: "cell1"
                _cellHeight: 142.5
                _cellWidth: 142.5
                _text1Text: ""
                _rectangleColor: "#3c3a33"
                _pos: 1
            }
            ListElement {
                _id: "cell2"
                _cellHeight: 142.5
                _cellWidth: 142.5
                _text1Text: ""
                _rectangleColor: "#3c3a33"
                _pos: 2
            }
            ListElement {
                _id: "cell3"
                _cellHeight: 142.5
                _cellWidth: 142.5
                _text1Text: ""
                _rectangleColor: "#3c3a33"
                _pos: 3
            }
            ListElement {
                _id: "cell4"
                _cellHeight: 142.5
                _cellWidth: 142.5
                _text1Text: ""
                _rectangleColor: "#3c3a33"
                _pos: 4
            }
            ListElement {
                _id: "cell5"
                _cellHeight: 142.5
                _cellWidth: 142.5
                _text1Text: ""
                _rectangleColor: "#3c3a33"
                _pos: 5
            }
            ListElement {
                _id: "cell6"
                _cellHeight: 142.5
                _cellWidth: 142.5
                _text1Text: ""
                _rectangleColor: "#3c3a33"
                _pos: 6
            }
            ListElement {
                _id: "cell7"
                _cellHeight: 142.5
                _cellWidth: 142.5
                _text1Text: ""
                _rectangleColor: "#3c3a33"
                _pos: 7
            }
            ListElement {
                _id: "cell8"
                _cellHeight: 142.5
                _cellWidth: 142.5
                _text1Text: ""
                _rectangleColor: "#3c3a33"
                _pos: 8
            }
            ListElement {
                _id: "cell9"
                _cellHeight: 142.5
                _cellWidth: 142.5
                _text1Text: ""
                _rectangleColor: "#3c3a33"
                _pos: 9
            }
            ListElement {
                _id: "cell10"
                _cellHeight: 142.5
                _cellWidth: 142.5
                _text1Text: ""
                _rectangleColor: "#3c3a33"
                _pos: 10
            }
            ListElement {
                _id: "cell11"
                _cellHeight: 142.5
                _cellWidth: 142.5
                _text1Text: ""
                _rectangleColor: "#3c3a33"
                _pos: 11
            }
            ListElement {
                _id: "cell12"
                _cellHeight: 142.5
                _cellWidth: 142.5
                _text1Text: ""
                _rectangleColor: "#3c3a33"
                _pos: 12
            }
            ListElement {
                _id: "cell13"
                _cellHeight: 142.5
                _cellWidth: 142.5
                _text1Text: ""
                _rectangleColor: "#3c3a33"
                _pos: 13
            }
            ListElement {
                _id: "cell14"
                _cellHeight: 142.5
                _cellWidth: 142.5
                _text1Text: ""
                _rectangleColor: "#3c3a33"
                _pos: 14
            }
            ListElement {
                _id: "cell15"
                _cellHeight: 142.5
                _cellWidth: 142.5
                _text1Text: ""
                _rectangleColor: "#3c3a33"
                _pos: 15
            }
            
        }

        Rectangle {
            id: table
            x: 110
            y: 135
            width: 630
            height: 630
            color: "#bbada0"
            radius: 11
            border.color: "#bbada0"
            
            Grid {
                id: grid
                visible: true
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                bottomPadding: 15
                spacing: 10
                clip: false
                rightPadding: 15
                verticalItemAlignment: Grid.AlignVCenter
                horizontalItemAlignment: Grid.AlignHCenter
                flow: Grid.LeftToRight
                padding: 0
                leftPadding: 15
                topPadding: 15
                rows: 4
                columns: 4
                
                Repeater {
                    model: cells
                    delegate: Cell {
                        id: _id
                        cellHeight: _cellHeight
                        cellWidth: _cellWidth
                        text1Text: ObjetTable.tableQML[_pos]
                        rectangleColor: backgroundColor(text1Text)
                        text1Color: textColor(text1Text)
                    }
                }
            }

            Rectangle {
                id: gameOver
                x: 18
                y: 232
                width: 594
                height: 166
                opacity: 0.529
                visible: !ObjetTable.gameStatus
                color: "#c37e3a"
                radius: 11
                border.width: 2

                Text {
                    id: gameOverText
                    color: "#000000"
                    text: qsTr("Game over !")
                    anchors.fill: parent
                    font.pixelSize: 110
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
        
        
        Add_remove_cells {
            id: add_row
            x: 48
            y: 393
            height: 51
            mouseArea.enabled: ObjetTable.gameStatus
            mouseArea.onClicked: {
                if (gridRows < 9) {
                    ObjetTable.addRow();
                    let pos = gridRows*gridColumns;
                    gridRows += 1;
                    for (var i=0; i<gridColumns; i++,pos++) {
                        cells.append({_id: "cell" + String(pos),
                                         _cellHeight: 0,
                                         _cellWidth: 0,
                                         _text1Text: ObjetTable.tableQML[pos],
                                         _rectangleColor: backgroundColor(text1Text),
                                         _pos: pos
                                     });
                    }
                    refreshCellsSize();
                }
            }
        }
        
        Add_remove_cells {
            id: remove_row
            x: 48
            y: 456
            text1Text: "-"
            mouseArea.enabled: ObjetTable.gameStatus
            mouseArea.onClicked: {
                if (gridRows > 3) {
                    gridRows -= 1;
                    let pos = gridRows*gridColumns;
                    cells.remove(pos,gridColumns);
                    refreshCellsSize();
                    ObjetTable.delRow();
                }
            }
        }
        
        Add_remove_cells {
            id: add_column
            x: 506
            y: 73
            mouseArea.enabled: ObjetTable.gameStatus
            mouseArea.onClicked: {
                if (gridColumns < 9) {
                    ObjetTable.addCol();
                    gridColumns += 1;
                    let pos = gridColumns-1;
                    for (var i=0; i<gridRows; i++) {
                        cells.insert(pos, {_id: "cell" + String(pos),
                                         _cellHeight: 0,
                                         _cellWidth: 0,
                                         _text1Text: ObjetTable.tableQML[pos],
                                         _rectangleColor: backgroundColor(text1Text),
                                         _pos: pos
                                     });
                    }
                    pos += gridColumns;
                    for (i=0; i<gridRows*gridColumns; i++) {
                        cells.set(i, {_id: "cell" + String(i),
                                      _text1Text: ObjetTable.tableQML[i],
                                      _pos: i
                                  });
                    }
                    refreshCellsSize();
                }
            }
        }
        
        Add_remove_cells {
            id: remove_column
            x: 294
            y: 73
            text1Text: "-"
            mouseArea.enabled: ObjetTable.gameStatus
            mouseArea.onClicked: {
                if (gridColumns > 3) {
                    let pos = gridRows*gridColumns-1;
                    for (var i=0; i<gridRows; i++) {
                        cells.remove(pos);
                        pos -= gridColumns;
                    }
                    gridColumns -= 1;
                    for (i=0; i<gridRows*gridColumns; i++) {
                        cells.set(i, {_id: "cell" + String(i),
                                      _text1Text: ObjetTable.tableQML[i],
                                      _pos: i
                                  });
                    }
                    refreshCellsSize();
                    ObjetTable.delCol();
                }
            }
        }

        Rectangle {
            id: score
            x: 635
            y: 10
            width: 200
            height: 113
            color: "#6bffffff"
            radius: 7
            border.width: 1

            Text {
                id: text3
                x: 0
                y: 0
                width: 200
                height: 56
                text: qsTr("Score:")
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: scoreText
                x: 8
                y: 55
                width: 184
                height: 49
                text: ObjetTable.scoreText
                font.pixelSize: 42
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.underline: false
                font.strikeout: false
                font.italic: false
                font.bold: false
            }
        }

        Text {
            id: tips
            x: 110
            y: 758
            width: 630
            height: 39
            text: qsTr("Tips: you can modify the number of rows/columns by clicking on +/- buttons.")
            font.pixelSize: 17
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: tips1
            x: 235
            y: 779
            width: 381
            height: 39
            text: qsTr("(The new cells will always be empty when created)")
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.italic: true
        }


        
        
        Keys.onPressed: {
            switch (event.key) {
            case Qt.Key_Left:
                ObjetTable.moveLeft();
                break;
            case Qt.Key_Right:
                ObjetTable.moveRight();
                break;
            case Qt.Key_Up:
                ObjetTable.moveUp();
                break;
            case Qt.Key_Down:
                ObjetTable.moveDown();
                break;
            }
        }

    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:2}D{i:3}D{i:4}D{i:5}D{i:24}D{i:23}D{i:27}D{i:26}D{i:22}
D{i:28}D{i:29}D{i:30}D{i:31}D{i:33}D{i:34}D{i:32}D{i:35}D{i:36}D{i:1}
}
##^##*/
