import QtQuick 2.0

Rectangle {
	id: root
	width: parent.width
	color: "#512023" // crimson
	property var icons: ["/icons/pause", "/icons/play", "/icons/stop"]

	Row {
		height: parent.height
		width: parent.width
		anchors.centerIn: parent
		spacing: 3

		Repeater {
			model: icons
			delegate: MasterButton {
				height: parent.height
				width: parent.width / icons.length
			}
		}
	}
}
