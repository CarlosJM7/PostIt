import QtQuick 2.11
import QtQuick.Window 2.11

Window {
    id: main
    visible: true
    width: 375
    height: 667
    title: qsTr("PostIt")

    /*Example{
        id: example_page
        anchors.fill: parent
    }*/

    MainPage{
        id: main_page
        height: parent.height
        width: parent.width
        visible: true
    }



    function switch_to_page(page){
        main_page.visible = false
        page.visible = true

    }

}
