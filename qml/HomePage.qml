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
			height: parent.height
			width: parent.width / 2
		}

		VolumeSlider {
			height: parent.height
			width: parent.width / 2
		}
	}

	PlayList {
		height: parent.height - playerView.height - timer.height
		width: parent.width
	}
}
