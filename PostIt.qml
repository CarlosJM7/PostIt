import QtQuick 2.0

Item {
    width: 375
    height: 668

    Rectangle {
        id: rectangle
        x: 63
        y: 209
        width: 250
        height: 250
        color: "#f6df32"


        TextEdit {
            id: textEdit
            width: parent.width
            height: parent.height
            text: qsTr("Write here")
            textFormat: Text.AutoText
            font.pixelSize: 12
            anchors.fill: parent
            wrapMode: TextEdit.Wrap
        }
    }

    Image {
        id: image1
        x: 256
        y: 405
        width: 75
        height: 74
        source: "Tick.png"

        MouseArea {
            id: mouseArea
            x: 19
            y: 24
            width: 38
            height: 30
            onClicked: {
                main.switch_to_page(main_page)
                main_page.add_new_note();
            }
        }
    }

}
