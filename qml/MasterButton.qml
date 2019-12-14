import QtQuick 2.0
import QtGraphicalEffects 1.12

Rectangle {
	id: root
	signal clicked()
	color: "transparent"
	height: icon.height

	RadialGradient {
		anchors.fill: parent
		gradient: Gradient {
			GradientStop { position: 0.0; color: "transparent" }
			GradientStop { position: 0.99; color: mouseArea.pressed ? "#A85C60" :  "transparent"}
		}
	}

	Image {
		id: icon
		anchors.centerIn: parent
		fillMode: Image.PreserveAspectFit
		source: icons[model.index]
	}

	MouseArea {
		id: mouseArea
		anchors.fill: parent
		onClicked: root.clicked()
	}
}
