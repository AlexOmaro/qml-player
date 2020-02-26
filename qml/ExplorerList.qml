import QtQuick 2.4

Rectangle {
	color: "#512023" // crimson

	ListView {
		model: dataModel
		anchors.fill: parent
		clip: true

		delegate: ListItem {
			onDoubleClicked: model.isDir ? dataModel.goToDir(model.path) :
										   console.log('not dir')
		}
	}
}
