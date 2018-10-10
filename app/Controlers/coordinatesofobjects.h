#ifndef COORDINATESOFOBJECTS_H
#define COORDINATESOFOBJECTS_H
#include <QObject>

class coordinatesofobjects:public QObject
{
Q_OBJECT
private:
    struct coordinates
    {
        int x=0, y=0;
    }
    pos;
 public:
  Q_INVOKABLE  void setPos(int xVal, int yVal);
public:
    Q_INVOKABLE
    int getPosX();
    Q_INVOKABLE
    int getPosY();
    Q_INVOKABLE
    void take(int up, int down);
};



#endif // COORDINATESOFOBJECTS_H


