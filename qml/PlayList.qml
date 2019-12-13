import QtQuick 2.0

Rectangle {
	id: root
	color: "#512023" // crimson

	ListView {
		model: dataModel
		width: parent.width
		height: parent.height
		clip: true

		delegate: ListItem {

		}
	}
}
