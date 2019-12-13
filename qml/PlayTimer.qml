import QtQuick 2.0

Rectangle {
	id: root
	color: "#512023" // crimson

	Text {
		anchors.centerIn: parent
		font.pointSize: Math.min(parent.height, parent.width) - 10
		color: "#A98971"
		text: Qt.formatTime(new Date(0, 0, 0, -1, 0, 0, player.count), "hh:mm:ss.zzz")
	}
}
