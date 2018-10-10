import QtQuick 2.0
import com.Coord 1.0
import com.Hero 1.0

Item {
    id: actor
    property int xVelocity: 0
    property int yVelocity: 0

    property int xSpeed: 3
    property int s: (leveldata.y_Data[Math.round(xw/64)])
    property int xw: x
    property int yw: y
    width: 118
    height: 118

    signal gameDeath
    SpriteSequence {
        id: r
        width: 60
        height: 120
        interpolate: false
        Sprite {
            name: "idleright"
            source: "sprites/idleright.png"
            frameWidth: 81
            frameHeight: 141
            frameCount: 21
            frameX: 0
            frameY: 0
            frameDuration: 120
            reverse: true
        }

        Sprite  {
            name: "right"
            source: "sprites/runright.png"
            frameCount: 26
            frameWidth: 120
            frameHeight: 136
            frameX: 0
            frameY: 0
            frameDuration: 40
            to: {"right":1}
        }



        Sprite {
            name: "idleleft"
            source: "sprites/idleleft.png"
            frameCount: 22
            frameWidth: 81
            frameHeight: 141
            frameX: 0
            frameY: 0
            frameDuration: 120
        }

        Sprite {
            name: "jumpright"
            source: "sprites/jumpright.png"
            frameCount: 15
            frameWidth: 120
            frameHeight: 138
            frameX: 0
            frameY: 0
            frameDuration: 70
            to: {"idleright":1}
        }
        Sprite {
            name: "left"
            source: "sprites/runleft.png"
            frameCount: 26
            frameWidth: 120
            frameHeight: 136
            frameX: 120
            frameY: 0
            frameDuration: 40
        }
        Sprite {
            name: "jumpleft"
            source: "sprites/jumpleft.png"
            frameCount: 15
            frameWidth: 120
            frameHeight: 138
            frameX: 0
            frameY: 0
            frameDuration: 70
            to: {"idleleft":1}
        }
    }

    SequentialAnimation {id: an
        alwaysRunToEnd: false
        PropertyAnimation {
            target: actor
            properties: "y"
            from: (s - 1) *128 + 20
            to: (s - 2)*128 - 10
            easing.type: Easing.OutQuad
            easing.period: 1.5
            duration: 1200
        }
        PropertyAnimation {
            target: actor
            properties: "y"
            from: (s - 2)*128 - 10
            to: (s - 1)*128 + 20
            easing.type: Easing.OutQuad
            duration: 1200
        }
    }
    SequentialAnimation {id: down
        alwaysRunToEnd: true
        PropertyAnimation {
            target: actor
            properties: "y"
            from: (s - 1) *128 + 20
            to: ( s - 1 )*128 + 20
            easing.type: Easing.OutQuad
            easing.period: 1.5
            duration: 800

        }
    }

//SequentialAnimation {id: ad
//    alwaysRunToEnd: true
//    PropertyAnimation {
//        target: actor
//        properties: "y"
//        from: (s - 2)*128 - 10
//        to: (s - 1)*128 + 20
//        easing.type: Easing.OutQuad
//        duration: 1200
//    }
//}


    LevelData {
        id : leveldata
    }

    focus: true

    Keys.onPressed: {
        if (event.isAutoRepeat) {
            return;
        }

        switch (event.key) {
        case Qt.Key_Left:
            xVelocity -= xSpeed
            break;
        case Qt.Key_Right:
            xVelocity += xSpeed
            break;
        case Qt.Key_Up:
            an.start()
            break;
        }

    }

    Keys.onReleased: {
        if (event.isAutoRepeat) {
            return;
        }
        switch (event.key) {
        case Qt.Key_Left:
            xVelocity += xSpeed
            if (xVelocity == 0 && yVelocity == 0) r.jumpTo("idleleft");
            break;
        case Qt.Key_Right:
            xVelocity -= xSpeed
            if (xVelocity == 0 && yVelocity == 0) r.jumpTo("idleright");
            break;
        case Qt.Key_Up:
            break;
        case Qt.Key_Escape:
            gameStopped()
            break;
        }
    }

        Timer {
            interval: 10
            triggeredOnStart: true
            running: true
            repeat: true
            onTriggered: {
                actor.xw += xVelocity;
                actor.yw += yVelocity;
                if (xVelocity < 0 && yVelocity == 0) r.jumpTo("left");
                else if(xVelocity < 0 && yVelocity < 0) r.jumpTo("jumpleft");
                else if(xVelocity > 0 & yVelocity < 0) r.jumpTo("jumpright");
                else if (xVelocity > 0 && yVelocity == 0) r.jumpTo("right");
                else if (xVelocity == 0 && yVelocity < 0) r.jumpTo("jumpright");

                if(xw <= 0){
                    if (xVelocity == 0 && yVelocity == 0) r.jumpTo("idleleft");
                    xw = 0;
                }
                if(xw >= 1941){
                    if (xVelocity == 0 && yVelocity == 0) r.jumpTo("idleright");
                    xw = 1941;
                }

                if(!an.running){
                    down.start()
                }

                if(!an.running){
                    if (actor.yw > 530){
                        r.jumpTo("idleright");
                        xVelocity = 0;yVelocity = 0;
                        if(!an.running) an.stop()
                    }
                }
            }
    }
}
