import QtQuick 2.0

Column {
	id: root

	PlayerView {
		height: parent.height / 10 * 2
		width: parent.width
	}

	PlayTimer {
		height: parent.height / 10 * 1
		width: parent.width
	}

	PlayList {
		height: parent.height / 10 * 7
		width: parent.width
	}
}
