import QtQuick 2.2
import Qt.labs.settings 1.0
import QtQuick.Layouts 1.0

Rectangle {
    anchors.centerIn: parent
    id: settings
    height: 720
    width: 960
    anchors.verticalCenterOffset: 360
    anchors.horizontalCenterOffset: 480
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    Image
        {
            height: 720
            width: 960
            id: back
            source: "sprites/123.jpg"
            anchors.centerIn: parent
        }

    signal gameStopped

    Column {
        id: setts
        width: 300
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 5
        Button {id: button; text: "Изображение"
            onClicked: settings.state = "graphics"
        }

        Button {
            id: button1; text: "Звук"
            onClicked: settings.state = "music"
        }

        Button {
            id: button3; text: "Назад";
            onClicked: settings.gameStopped()
        }
    }


    Column{
            id: music
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
                text: qsTr("Музыка")
                horizontalAlignment: Text.AlignHCenter
                renderType: Text.NativeRendering
                font.pixelSize: 45
            }

            Button {
                id: buttonM1; text: "Назад"
                onClicked: settings.state = "setts"
            }
    }
    Column {
        id: graphics
        width: 300
        height: 182
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 5

        Text {
            id: text2
            x: 90
            width: 100
            color: "#ffffff"
            text: qsTr("Изображение")
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.NoWrap
            font.pixelSize: 32
        }

        Button {
            id: buttonG1; text: "Назад"
            onClicked: settings.state = "setts"
        }


    }

    states: [
        State {
            name: "setts"
            PropertyChanges {target: setts; visible: true}
            PropertyChanges {target: graphics; visible: false}
            PropertyChanges {target: music; visible: false}
        },
        State {
            name: "graphics"
            PropertyChanges {target: setts; visible: false}
            PropertyChanges {target: graphics; visible: true}
            PropertyChanges {target: music; visible: false}
        },
        State {
            name: "music"
            PropertyChanges {target: setts; visible: false}
            PropertyChanges {target: graphics; visible: false}
            PropertyChanges {target: music; visible: true}
        }
    ]
    state: "setts"
}


