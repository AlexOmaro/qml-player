import QtQuick 2.0

Item {
    signal signalExit()
    width: parent.width * 3 / 5
    height: parent.height * 3 / 5
    anchors {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
    }

    Rectangle {
        id: mainMenu
        width: parent.width
        height: parent.height
        color: "#474343"
        radius: 10

        Grid {
            id: grid
            rows: 3
            columns: 1
            anchors.centerIn: parent
            spacing: 5
            z: 1

            MenuButton {
                heightButton: (mainMenu.height - (grid.rows + 1) * grid.spacing) / grid.rows
                widthButton: mainMenu.width - grid.spacing * 2
                radiusButton: mainMenu.radius
                textButton: "Remove"
                colorButton: "white"
                colorText: "black"
                onButtonClicked: {
                    fileEngine.removeFile(PathItemSingleton.itemPath)
                    signalExit()
                }
            }

            MenuButton {
                heightButton: (mainMenu.height - (grid.rows + 1) * grid.spacing) / grid.rows
                widthButton: mainMenu.width - grid.spacing * 2
                radiusButton: mainMenu.radius
                textButton: "Rename"
                colorButton: "blue"
                colorText: "black"
                onButtonClicked: {
                    renameWindow.visible = true;
                    signalExit()
                }
            }

            MenuButton {
                heightButton: (mainMenu.height - (grid.rows + 1) * grid.spacing) / grid.rows
                widthButton: mainMenu.width - grid.spacing * 2
                radiusButton: mainMenu.radius
                textButton: "Exit"
                colorButton: "red"
                colorText: "black"
                onButtonClicked: {
                    signalExit()
                }
            }
        }
    }
}
