import QtQuick 2.0
import playerlistModule 1.0
import QtGraphicalEffects 1.12

Rectangle {
	height: parent.height / 5 * 4
	width: parent.width
	color: "#512023"

	PlayerList {
		id: dataModel
	}

	ListView{
		model: dataModel
		width: parent.width
		height: parent.height

		delegate: Rectangle {
			id: fileTarget
			width: parent.width
			height: 70
			color: "transparent"
			border.color: "#A85C60"

			RadialGradient {
				anchors.fill: parent
				gradient: Gradient {
					GradientStop { position: 0.0; color: "transparent" }
					GradientStop { position: 0.99; color: targetArea.pressed? "#A85C60" :  "transparent"}
				}
			}

			Text {
				id: textDelegate
				anchors.left: parent.left
				font.pixelSize: 30
				color: "#A98971"
				text: model.name
			}

			MouseArea{
				id: targetArea
				anchors.fill: parent
				onClicked: {
					console.log(model.name)
					console.log(model.path)
				}
			}
		}
	}
}
