import QtQuick 2.0

Column {
	id: root

	PlayerView {
		id: playerView
		height: 100
		width: parent.width
	}

	Row {
		id: timer
		height: 60
		width: parent.width

		TimeWatcher {
			anchors.fill:parent
		}
		//Here will be volume slider
	}

	PlayList {
		height: parent.height - playerView.height - timer.height
		width: parent.width
	}
}
