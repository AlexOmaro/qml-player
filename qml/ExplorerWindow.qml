import QtQuick 2.0
import Qt.labs.platform 1.1
import QtQuick.Window 2.12

import space.developers 1.0

Window {
	id: root
	visible: true
	minimumWidth: 300
	minimumHeight: 600
	width: 600
	height: 800
	title: qsTr("File Explorer")
	property var controlElement: ["BACK", "HOME", "SELECT"]

	Column {
		anchors.fill: parent
		Row {
			id: hat
			height: 100
			width: parent.width
			Repeater {
				model: controlElement
				delegate: ExplorerButton {
					width: parent.width / controlElement.length
					onClicked: executeButtonEvent(model.index)
				}
			}
		}

		ExplorerList {
			width: parent.width
			height: parent.height - hat.height
		}
	}

	PlayerList {
		id:dataModel
	}

	function executeButtonEvent(index) {
		switch (index) {
		case 0: // back button
			dataModel.goBack()
			break
		case 1: // home button
			dataModel.goHome()
			break
		case 2:
			//HERE will  be method
			root.close()
			break
		}
	}
	onClosing: loader.active = false
}
