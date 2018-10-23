import QtQuick 2.2
import QtQuick.Window 2.3

Window {
    id: mainWindow

    title: qsTr("x-file")
    visible: true
    width: 960
    height: 720
    Item{
      id: item1
    Menu {
        id: menu
        onGameStarted: parent.state = "gameplay"
        onGameSettings: parent.state = "settings"
    }

    Gameplay {
        id: gameplay
        onGameStopped: parent.state = "menu"
    }

    Settings {
        id: settings
        onGameStopped: parent.state = "menu"
    }

    Death {
        id: death
        onGameStopped: parent.state = "menu"
        onGameStarted: parent.state = "gameplay"
    }

    states: [
        State {
            name: "menu"
            PropertyChanges {
                target: menu
                visible: true
            }

            PropertyChanges {
                target: gameplay
                visible: false
            }
            PropertyChanges {
                target: settings
                visible: false
            }
            PropertyChanges {
                target: death
                visible: false
            }
        },
        State {
            name: "gameplay"
            PropertyChanges {
                target: menu
                visible: false
            }
            PropertyChanges {
                target: gameplay
                visible: true
            }
            PropertyChanges {
                target: settings
                visible: false
            }
            PropertyChanges {
                target: death
                visible: false
            }
        },
        State {
            name: "settings"
            PropertyChanges {
                target: menu
                visible: false
            }

            PropertyChanges {
                target: gameplay
                visible: false
            }

            PropertyChanges {
                target: settings
                visible: true
            }
            PropertyChanges {
                target: death
                visible: false
            }
        },
        State {
            name: "death"
            PropertyChanges {
                target: menu
                visible: false
            }

            PropertyChanges {
                target: gameplay
                visible: false
            }

            PropertyChanges {
                target: settings
                visible: false
            }
            PropertyChanges {
                target: death
                visible: true
            }
        }

    ]

    state: "menu"
    }
}














