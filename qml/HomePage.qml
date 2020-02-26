import QtQuick 2.0
import QtQuick.Controls 2.0

Column {
	Loader {
		id: loader
	}

	MediaControllerView {
		id: mediaControllerView
		width: parent.width
	}

	Button {
		id: fileManagerButton

		height: 70
		width: parent.width

		Text {
			anchors.centerIn: parent
			text: qsTr("File Explorer")
			font.pixelSize: 30
		}

		onClicked: {
			loader.sourceComponent = windowComponent
			loader.active = true
		}
	}

	PlayList {
		height: parent.height - mediaControllerView.height - fileManagerButton.height
		width: parent.width
	}

	Component {
		id: windowComponent

		ExplorerWindow {
			id: window
		}
	}
}

