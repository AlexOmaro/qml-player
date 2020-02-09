import QtQuick 2.0

Item {
    id: renameWindow
    signal signalRenameWindowExit()
    property int widthRenameWindow: 100
    property int heightRenameWindow: 100
    property string textForRename: ""

    width: widthRenameWindow
    height: heightRenameWindow
    anchors {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
    }

    Rectangle {
        width: parent.width
        height: parent.height
        color: "red"
        radius: 10
        opacity: 0.5
        border {
            color: "black"
            width: 5
        }
    }

    Column {
        id: column
        width: parent.width
        height: parent.height
        spacing: 10
        anchors.centerIn: parent.Center

        TextEdit {
            id: textEdirRenameWindow
            width: parent.width - parent.spacing * 2
            height: parent.height / 2 - parent.spacing * 2
            color: "black"
            horizontalAlignment: TextEdit.AlignHCenter
            verticalAlignment: TextEdit.AlignVCenter
            font {
                pixelSize: 40
                bold: true
            }
        }

        MenuButton {
            widthButton: parent.width - parent.spacing * 2
            heightButton: parent.height / 2 - parent.spacing * 2
            colorButton: "pink"
            textButton: "Rename"
            radiusButton: 10
            anchors.horizontalCenter: parent.horizontalCenter

            onButtonClicked: {
                textForRename = textEdirRenameWindow.text;
                signalRenameWindowExit();
                textEdirRenameWindow.text = "";
            }
        }
    }
}
