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
            id: rectangle
            x: 333
            y: 8
            z: 1
            radius: 90
            width: 34
            height: 34
            color: "#00000000"
            border.width: 3
            border.color: "black"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    write_new(pst)
                    pst.change_text()
                }
            }

            Text{
                color: "black"
                anchors.fill: parent
                text: "+"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Courier"
                font.pointSize: 28
                font.bold: true
            }
        }

            GridView{
                id:mygrid
                anchors.fill: parent
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
                    border.width: 2
                    width: image.width/4
                    height: 80

                    Text{
                        width: parent.width
                        text: textoEscrito /*"Pst " + index*/ /*Aqui escribire el titulo de la nota*/
                        color: "black"
                        anchors.top: parent.top
                        wrapMode: TextEdit.Wrap
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
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
        }

        function delete_note(nota_id){
            model.remove(nota_id)
        }

        function show_note(nota_id){
            pst.visible = true
            pst.show_change_text(model.get(nota_id).textoEscrito)

        }
}
