#ifndef TABLE_H
#define TABLE_H

#include <QObject>
#include <QList>
#include <vector>
#include <string>
using namespace std ;

class Table : public QObject
{
    Q_OBJECT
public:
    explicit Table(QObject *parent = nullptr);

    Q_INVOKABLE void moveLeft();
    Q_INVOKABLE void moveRight();
    Q_INVOKABLE void moveUp();
    Q_INVOKABLE void moveDown();
    Q_INVOKABLE void addRow();
    Q_INVOKABLE void delRow();
    Q_INVOKABLE void addCol();
    Q_INVOKABLE void delCol();
    Q_INVOKABLE void reset();

    Q_PROPERTY(QList<QString> tableQML READ readTable NOTIFY tableChanged)
    Q_PROPERTY(QString scoreText READ readScore NOTIFY scoreChanged)
    Q_PROPERTY(bool gameStatus READ readStatus NOTIFY gameOver)

signals:
    void tableChanged();
    void scoreChanged();
    void gameOver();

private:
    int rows;
    int cols;
    int** T;
    string getColor(int num);
    QList<QString> stringT;
    QList<QString> readTable();
    QString readScore();
    bool readStatus();

    void Alloc(int l, int c);
    void Free();
    int** Copy();
    void Redim(int l, int c);
    bool canMove();
    void moveCells();
    void compress(int dir);
    void merge(int dir);
    void addCell();
    bool changed(int** D);
};

#endif // TABLE_H
