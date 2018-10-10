import QtQuick 2.2
import Qt.labs.settings 1.0
import QtQuick.Layouts 1.0

Rectangle {
    anchors.centerIn: parent
    id: death

    signal gameStopped
    signal gameStarted

    Image {
        id:deathbg
        width: 960
        height: 720
        source: "sprites/backg.png"
        fillMode: Image.Tile
        anchors.fill: parent
    }
    Column {
        id: die
        width: 300
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 5
        Text {
            id: text1
            width: 50
            height: 37
            color: "#ffffff"
            text: qsTr("Ты мертв!")
            horizontalAlignment: Text.AlignHCenter
            renderType: Text.NativeRendering
            font.pixelSize: 45
        }
        Button {
            id: button; text: "Начать сначала"
            onClicked: death.gameStarted()
        }

        Button {
            id: button1; text: "Выйти в меню"
            onClicked: death.gameStoped()
        }

}
}
