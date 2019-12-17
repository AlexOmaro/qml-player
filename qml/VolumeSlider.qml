import QtQuick 2.0
import QtQuick.Controls 2.5

Rectangle {
	color: "#512023" // crimson

	Slider {
		id: volumeSlider
		anchors.fill: parent
		from:1
		value: 100
		to: 100
		onPositionChanged: player.setVolume(position * 100)
	}
}
