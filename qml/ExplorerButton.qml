import QtQuick 2.0

Rectangle {
	id:root
	signal clicked()

	height: parent.height
	width: parent.width / 2

	Text {
		anchors.centerIn: parent
		text: qsTr(controlElement[model.index])
		font.pixelSize: 30
	}

	MouseArea {
		id:mouseArea
		anchors.fill: parent
		onClicked: root.clicked()
	}
}
