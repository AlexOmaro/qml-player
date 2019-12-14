import QtQuick 2.0

Rectangle {
	id: root
	color: "#512023" // crimson

	ListView {
		model: dataModel
		anchors.fill: parent
		clip: true

		delegate: ListItem {

		}
	}
}
