import QtQuick 2.0

Item {
    signal buttonClicked();
    property int widthButton: 100
    property int heightButton: 100
    property int radiusButton: 100
    property color colorButton: "red"
    property string textButton: "Button"
    property color colorText: "blue"

    id: button
    width: widthButton
    height: heightButton

    Rectangle {
        id: rectButton
        width: parent.width
        height: parent.height
        radius: radiusButton
        color: colorButton
        opacity: 0.5
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        font {
            pixelSize: 40
            bold: true
        }
        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
        text: qsTr(textButton)
        color: colorText
        font {
            pixelSize: parent.width / 8
            bold: true
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            buttonClicked();
        }
    }
}
