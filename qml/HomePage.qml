import QtQuick 2.0

Column {
	id: root
	spacing: 2

	PlayerView {
		height: parent.height / 5
	}

	PlayList {
		height: parent.height / 5 * 4
		width: parent.width
	}
}
