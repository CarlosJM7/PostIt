import QtQuick 2.11
import QtQuick.Window 2.11
import FileIO 1.0

Window {
    id: main
    visible: true
    width: 375
    height: 667
    title: qsTr("PostIt")

    FileIO{
        id: fileIO
        source: "/Users/carlos/Desktop/QtWorkspace/PostIt/dataBox.json"
    }

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

    Component.onCompleted: {
        main_page.load_storage()
    }

    Component.onDestruction: {
        main_page.save_storage()
    }
}
