import QtQuick 2.12
import QtQuick.Window 2.12

import space.developers 1.0

Window {
	visible: true
	width: 600
	height: 800
	title: qsTr("Player")
	color: "#3E0105"

	HomePage {
		id: homePage
		anchors.fill: parent
	}

	Player {
		id: player
	}

	PlayerList {
		id: dataModel
	}
}
