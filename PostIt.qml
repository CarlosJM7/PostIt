import QtQuick 2.0

Item {
    width: 375
    height: 668

    property bool creado : false

    Rectangle {
        id: rectangle
        x: 63
        y: 209
        z: 1
        width: 250
        height: 250
        color: "#f6df32"
        border.width: 2
        border.color: "black"


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
        z: 2
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
                if(!creado){
                    parent.parent.visible = false
                    main_page.add_new_note(textEdit.text);
                    creado = true
                }
                else{
                    parent.parent.visible = false
                    //Otra funcion que cambie el texto
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
        textEdit.text = "Write here"
    }

    function show_change_text(texto_cambiado){
        textEdit.text = texto_cambiado
    }
}
