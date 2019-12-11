import QtQuick 2.0
import QtGraphicalEffects 1.12

Rectangle {
	id: playButton
	height: parent.height
	width: parent.width / 3
	color: "transparent"

	RadialGradient {
		anchors.fill: parent
		gradient: Gradient {
			GradientStop { position: 0.0; color: "transparent" }
			GradientStop { position: 0.99; color: pauseArea.pressed? "#A85C60" :  "transparent"}
		}
	}

	Image {
		anchors.fill: parent
		anchors.centerIn: parent
		fillMode: Image.PreserveAspectFit
		source: "/icons/pause"
	}

	MouseArea {
		id: pauseArea
		anchors.fill: parent
	}
}
