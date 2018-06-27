import QtQuick 2.0

Item {


    id: example_page

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
            border.color: "white"
            border.width: 2
            width: example_page.width/5
            height: 100
            color: "#f6df32"
            Text{
                text: "Pst" + index
                color: "white"
                anchors.top: parent.top
            }
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    console.log("the id: "+index)
                    add_new_note()
                }
            }
        }
    }

    ListModel{
        id: model
        ListElement{
        }
    }

    function add_new_note(){
        model.append({/*name: "carlos", age: 100*/})

    }


}
