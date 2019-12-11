import QtQuick 2.0

Rectangle {
	height: parent.height / 5
	width: parent.width
	color: "#512023"

	Row {
		height: parent.height
		width: parent.width
		anchors.centerIn: parent
		spacing: 3

		StartButton {

		}
		StopButton {

		}
		PauseButton {

		}
	}
}
