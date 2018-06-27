import QtQuick 2.11
import QtQuick.Window 2.11

Image {
    id: image
    width: 375
    height: 667
    clip: false
    anchors.fill: parent
    source: "WallPaper.jpg"
    visible: true

        Rectangle {
            id: rectangle
            x: 333
            y: 8
            radius: 90
            width: 34
            height: 34
            color: "#00000000"
            border.width: 3
            border.color: "black"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    main.switch_to_page(pst)
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

        Item {

            id: example_page
            visible: true

            GridView{
                id:mygrid
                anchors.fill: parent
                delegate: mydelegate
                model: model
                cellWidth: example_page.width/5
            }

            Component{
                id: mydelegate
                Rectangle{
                    color: "#f6df32"
                    border.color: "transparent"
                    border.width: 2
                    width: example_page.width/4
                    height: 100
                    Text{
                        text: "Pst " + index
                        color: "black"
                        anchors.top: parent.top
                    }
                   /*MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            console.log("the id: "+index)
                            add_new_note()
                        }
                    }*/
                }
            }

            ListModel{
                id: model
                /*ListElement{
                }*/
            }
        }


        function add_new_note(){
            model.append({})
        }
    }
