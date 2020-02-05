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

                onClicked:{
                    switch(model.index)
                          {
                          case 0:
                              player.pause()
                              PlayerTimerSingleton.start()
                          break;
                          case 1:
                              player.resume()
                              PlayerTimerSingleton.start()
                          break;
                          case 2:
                              player.stop()
                          break;

                          }
                }

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
}
