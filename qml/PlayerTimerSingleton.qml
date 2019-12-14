pragma Singleton
import QtQuick 2.0

Timer {
	property int currentTime
	property QtObject player

	interval: 1000;
	running: false
	repeat: true
	onTriggered: currentTime = player.position() / 1000
}
