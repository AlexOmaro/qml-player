import QtQuick 2.12
import QtQuick.Window 2.12

import space.developers 1.0

Window {
    visible: true
    minimumWidth: 300
    minimumHeight: 600
    width: 600
    height: 800
    title: qsTr("Player")
    color: "#3E0105"

    HomePage {
        anchors.fill: parent
    }

    Player {
        id: player
        Component.onCompleted: PlayerTimerSingleton.player = player
    }

    PlayerList {
        id: dataModel
    }

    FileEngine {
        id: fileEngine
    }

    RightButtonMenu {
        id: menu
        visible: false
        onSignalExit: {
            menu.visible = false
        }
    }

    RenameWindow {
        id: renameWindow
        widthRenameWindow: parent.width / 2
        heightRenameWindow: parent.height / 2
        visible: false
        onSignalRenameWindowExit: {
            fileEngine.renameFile(PathItemSingleton.itemPath, textForRename)
            renameWindow.visible = false
        }
    }
}
