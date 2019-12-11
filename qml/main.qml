import QtQuick 2.12
import QtQuick.Window 2.12
import playerlistModule 1.0

Window {
	visible: true
	width: 600
	height: 800
	title: qsTr("Player")
	color: "#3E0105"

	Column {
		height: parent.height
		width: parent.width
		spacing: 2

		PlayerFace {

		}

		PlayList {

		}
	}
}
