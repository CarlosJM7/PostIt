import QtQuick 2.0

Item {
    id: general_pst
    width: 375
    height: 668

    property bool creado : false
    property int posicion : 0

    Rectangle {
        id: rectangle
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1
        width: 250
        height: 250
        color: "#f6df32"
        border.width: 2
        border.color: "black"
        radius: 5

        TextEdit{
            id: textEdit
            width: parent.width*0.95
            height: parent.height*0.95
            font.pixelSize: 12
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            wrapMode: TextEdit.Wrap

            Text{
                id: textInside
                visible: !textEdit.text
            }
        }
    }

    Image {
        id: image1
        x: 256
        y: 405
        z: 2
        width: 75
        height: 74
        //anchors.right: general_pst.right
        //anchors.rightMargin: 0
        //anchors.bottom: general_pst.bottom
        //anchors.bottomMargin: 0
        source: "Tick.png"

        MouseArea {
            id: mouseArea
            x: 19
            y: 24
            width: 38
            height: 30
            onClicked: {
                if(!creado){
                    parent.parent.visible = false
                    main_page.add_new_note(textEdit.text);
                    creado = true
                }
                else{
                    main_page.update_text(posicion, textEdit.text)
                    parent.parent.visible = false
                }
            }
        }
    }

    Image {
        id: image
        x: 242
        y: 419
        z: 2
        width: 38
        height: 35
        source: "TrashBucket.png"

        MouseArea{
            id: mouseAreaTB
            width: parent.width
            height: parent.height
            onClicked: {
                parent.parent.visible = false
                main_page.delete_note(textEdit.text)

            }
        }
    }

    MouseArea {
        id: mouseAreaExit
        width: parent.width
        height: parent.height
        onClicked: {
            parent.visible = false
        }
    }

    function change_text(){
        textEdit.text = null
        textInside.text = "Write here..."
    }

    function show_change_text(texto_cambiado){
        textEdit.text = texto_cambiado
    }
}
