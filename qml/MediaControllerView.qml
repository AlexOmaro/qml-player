import QtQuick 2.0

Column {
    property var icons: ["/icons/pause", "/icons/play", "/icons/stop"]
    property color backgroundColor: "transparent"
    Row {
        spacing: 3
        width: parent.width
        Repeater {
            model: icons
            delegate: MasterButton {
                width: parent.width / icons.length

                onClicked: executeButtonEvent(model.index)
            }
        }
    }

    Row {
        height: 60
        width: parent.width

        TimeWatcher {
            height: parent.height
            width: parent.width / 2
        }

        VolumeSlider {
            height: parent.height
            width: parent.width / 2
        }
    }

    function executeButtonEvent(index) {
        switch (index) {
              case 0://pause bottom
                  player.pause()
                  PlayerTimerSingleton.stop()
                break
              case 1://resume bottom
                  player.resume()
                  PlayerTimerSingleton.start()
                break
              case 2://stop bottom
                  player.stop()
                  PlayerTimerSingleton.stop()
                break
        }
    }
}
