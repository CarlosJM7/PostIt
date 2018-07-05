import QtQuick 2.11
import QtQuick.Window 2.11

Image {
    id: image
    width: 375
    height: 667
    anchors.fill: parent
    source: "WallPaper.jpg"
    visible: true

    Rectangle {
        id: new_note
        width: 34
        height: 34
        z: 1
        radius: 90
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 8
        color: "#00000000"
        border.width: 3
        border.color: "black"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                pst.change_text()
                write_new(pst)
            }
        }

        Text{
            text: "+"
            color: "black"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: 1
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Courier"
            font.pointSize: 28
            font.bold: true
        }
    }

    Image{
        id: save_progress
        source: "Save.png"
        width: 50
        height: 50
        anchors.top: parent.top
        anchors.left: parent.left

        MouseArea{
            height: 34
            width: 34
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    GridView{
        id:mygrid
        height: parent.height*0.85
        width: parent.width
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalAlignment
        delegate: mydelegate
        model: model
        cellWidth: image.width/3
        cellHeight: 100
    }

    Component{
        id: mydelegate

        Rectangle{
            color: "#f6df32"
            border.color: "black"
            border.width: 1
            width: image.width/4
            height: 80
            radius: 5

            Text{
                width: parent.width*0.95
                height: parent.height*0.95
                text: textoEscrito /*"Pst " + index*/ /*Aqui escribire el titulo de la nota*/
                color: "black"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: TextEdit.Wrap
                font.pixelSize: 8
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    pst.posicion = index
                    show_note(index)
                }
            }
        }
    }

    ListModel{
        id: model
    }

    PostIt{
        id: pst
        height: parent.height
        width: parent.width
        visible: false
    }


    function add_new_note(texto){
        model.append({textoEscrito: texto})
    }

    function write_new(note){
        note.visible = true
        pst.creado = false
    }

    function delete_note(nota_id){
        model.remove(nota_id)
    }

    function show_note(nota_id){
        pst.visible = true
        pst.show_change_text(model.get(nota_id).textoEscrito)
    }

    function update_text(nota_id, texto){
        model.setProperty(nota_id,"textoEscrito", texto)
    }
}
