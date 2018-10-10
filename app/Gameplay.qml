import QtQuick 2.0
import Qt.labs.settings 1.0
import QtQuick.Window 2.3

Rectangle {

    width: 960
    height: 720

    signal gameStopped



    Item {
        id: board
        width: 960
        height: 720

        Image {
            id:s
            source: "sprites/backg.png"
            z: -5
            fillMode: Image.Tile
            anchors.fill: parent
        }

        Actor {
            id: actor
            anchors.horizontalCenter: parent.horizontalCenter
            x: 128
            y: 6*128 - 240
            z: 1
            focus: true

            onXwChanged: {t.tiles.forEach(function(obj){
                obj.x = obj.xw - xw
            })}
        }

        Component.onCompleted: {

            t.createSpriteObjects()
        }

        TileManager {
            id: t
        }
    }
}

