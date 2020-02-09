import QtQuick 2.0
import QtGraphicalEffects 1.12

Rectangle {
    id: root
    signal clicked()
    signal rightClicked()
    width: parent.width
    height: text.height + 0.9 * text.height
    color: "transparent"
    border.color: "#A85C60"

    RadialGradient {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "transparent" }
            GradientStop { position: 0.99; color: targetArea.pressed ? "#A85C60" :  "transparent"}
        }
    }

    Text {
        id: text
        anchors {
            left: parent.left
            leftMargin: 15
            verticalCenter: parent.verticalCenter
        }
        font.pixelSize: 30
        color: "#A98971"
        text: model.name
    }

    MouseArea {
        id: targetArea
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked:  {
            if (mouse.button === Qt.RightButton)
            {
                menu.visible = true;
                root.rightClicked()
            }
            else
                root.clicked();
        }
    }
}
