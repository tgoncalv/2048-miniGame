#include "table.h"
#include <QString>
#include <QList>
#include <iostream>
using namespace std;

Table::Table(QObject *parent)
    : QObject{parent}
{
    rows = 4;
    cols = 4;
    Alloc(rows, cols);
    addCell();
    addCell();
}

void Table::Alloc(int l, int c) {
    rows = l;
    cols = c;
    T = new int*[rows];
    for(int i=0; i<rows; i++){
        T[i] = new int[cols];
    }
    for(int i=0; i<rows; i++){
        for(int j=0; j<cols; j++){
            T[i][j] = 0;
        }
    }
}

void Table::Free(){
    stringT.clear();
    for (int i=0; i<rows; i++) {
        delete [] T[i];
    }
    delete [] T;
}

int** Table::Copy()
{
    int** D = new int*[rows];
    for(int i=0; i<rows; i++){
        D[i] = new int[cols];
    }
    for(int i=0; i<rows; i++){
        for(int j=0; j<cols; j++){
            D[i][j] = T[i][j];
        }
    }
    return D;
}

void Table::Redim(int l, int c) {
    int** D = Copy();
    Free();
    int D_rows=rows;
    int min_rows=l, min_cols=c;
    if(rows < min_rows)
        min_rows = rows;
    if(cols < min_cols)
        min_cols = cols;
    Alloc(l,c);
    for(int i=0; i<min_rows; i++){
        for (int j=0; j<min_cols; j++){
            T[i][j] = D[i][j];
        }
    }
    for (int i=0; i<D_rows; i++){
        delete [] D[i];
    }
    delete [] D;
    emit tableChanged();
    emit scoreChanged();
}

void Table::addRow() {
    if(rows<9)
        Redim(rows+1,cols);
}

void Table::delRow() {
    if(rows>3)
        Redim(rows-1,cols);
}

void Table::addCol() {
    if(cols<9)
        Redim(rows,cols+1);
}

void Table::delCol() {
    if(cols>3)
        Redim(rows,cols-1);
}

void Table::addCell(){
    emit tableChanged();
    for(int i =0; i < rows;i++){
        for(int j=0; j < cols; j++){
            if(T[i][j] == 0){
                int a, b;
                do {
                    a = rand() % rows;
                    b = rand() % cols;
                }
                while (T[a][b] != 0);
                int s = rand() % 100;
                if (s > 89 ) {
                    T[a][b] = 4;
                }
                else {
                    T[a][b] = 2;
                }
                if(canMove()) return;
            }
        }
    }
}

bool Table::canMove(){
    for(int i =0; i < rows;i++){
        for(int j=0; j < cols; j++){
            if(T[i][j] == 0){
                return true;
            }
            else if(j>0 && T[i][j-1] == T[i][j]){
                return true;
            }
            else if(i>0 && T[i-1][j] == T[i][j]){
                return true;
            }
        }
    }
    return false;
}


void Table::compress(int dir){
    //Create empty array of same dimensions
    int** D = Copy();
        for(int i =0; i<rows;i++){
            for(int j=0; j < cols; j++){
                T[i][j]=0;
            }
        }
    switch(dir){
        case 1:
//         Move the cells left
        for(int i =0; i<rows;i++){
            int pfill=0;
            for(int j=0; j < cols; j++){
                if(D[i][j] != 0) {
                    T[i][pfill]=D[i][j];
                    pfill++;
                }
            }
        }break;
        case 2:
//         Move the cells right
        for(int i =0; i<rows;i++){
            int pfill=cols-1;
            for(int j=cols-1; j >= 0; j--){
                if(D[i][j] != 0) {
                    T[i][pfill]=D[i][j];
                    pfill--;
                }
            }
        }break;
        case 3:
//         Move the cells up
        for(int j =0; j<cols;j++){
            int pfill=0;
            for(int i=0; i < rows; i++){
                if(D[i][j] != 0) {
                    T[pfill][j]=D[i][j];
                    pfill++;
                }
            }
        }break;


        case 4:
//         Move the cells down
        for(int j =0; j<cols;j++){
            int pfill=rows-1;
            for(int i=rows-1; i >= 0; i--){
                if(D[i][j] != 0) {
                    T[pfill][j]=D[i][j];
                    pfill--;
                }
            }
        }
    }

    for (int i=0; i< rows; i++){
        delete [] D[i];
    }
    delete [] D;
}

void Table::merge(int dir){
    switch(dir){
        case 1:
    //    merge left
        for(int i =0; i< rows;i++){
            for(int j=0; j < cols-1; j++){
                if(T[i][j] !=0 && T[i][j] == T[i][j+1]){
                    T[i][j] *=2;
                    T[i][j+1]=0;
                }
            }
        }
        break;
        case 2:
        //    merge right
            for(int i =0; i< rows;i++){
                for(int j=cols-1; j > 0; j--){
                    if(T[i][j] !=0 && T[i][j] == T[i][j-1]){
                        T[i][j] *=2;
                        T[i][j-1]=0;
                    }
                }
            }

        break;
        case 3:
        //    merge up
            for(int j =0; j< cols;j++){
                for(int i=0; i < rows-1; i++){
                    if(T[i][j] !=0 && T[i][j] == T[i+1][j]){
                        T[i][j] *=2;
                        T[i+1][j]=0;
                    }
                }
            }
        break;
        case 4:
        //    merge down
            for(int j =0; j< cols;j++){
                for(int i=rows-1; i > 0; i--){
                    if(T[i][j] !=0 && T[i][j] == T[i-1][j]){
                        T[i][j] *=2;
                        T[i-1][j]=0;
                    }
                }
            }
    }
}

bool Table::changed(int** D){
    for(int i=0; i<rows; i++){
        for(int j=0; j<cols; j++){
            if(T[i][j] != D[i][j]){
                return true;
            }
        }
    }
    return false;
}

void Table::moveLeft() {
    int** D = Copy();
    compress(1);
    merge(1);
    compress(1);
    if(changed(D)){
        addCell();
        emit tableChanged();
        emit scoreChanged();
        emit gameOver();
    }

    for (int i=0; i< rows; i++){
        delete [] D[i];
    }
    delete [] D;
}

void Table::moveRight() {
    int** D = Copy();
    compress(2);
    merge(2);
    compress(2);
    if(changed(D)){
        addCell();
        emit tableChanged();
        emit scoreChanged();
        emit gameOver();
    }

    for (int i=0; i< rows; i++){
        delete [] D[i];
    }
    delete [] D;
}

void Table::moveUp() {
    int** D = Copy();
    compress(3);
    merge(3);
    compress(3);
    if(changed(D)){
        addCell();
        emit tableChanged();
        emit scoreChanged();
        emit gameOver();
    }

    for (int i=0; i< rows; i++){
        delete [] D[i];
    }
    delete [] D;
}

void Table::moveDown() {
    int** D = Copy();
    compress(4);
    merge(4);
    compress(4);
    if(changed(D)){
        addCell();
        emit tableChanged();
        emit scoreChanged();
        emit gameOver();
    }

    for (int i=0; i< rows; i++){
        delete [] D[i];
    }
    delete [] D;

}

void Table::reset() {
    for (int i=0; i<rows; i++) {
        for (int j=0; j<cols; j++) {
            T[i][j] = 0;
        }
    }

    addCell();
    addCell();
    emit tableChanged();
    emit scoreChanged();
    emit gameOver();
}

QList<QString> Table::readTable() {
    int num=0;
    stringT.clear();
    for(int i=0; i<rows; i++){
        for(int j=0; j<cols; j++){
            num = T[i][j];
            if(num==0){
                stringT.push_back(QString::fromUtf8(""));
            } else {
                stringT.push_back(QString::number(num));
            }
        }
    }
    return(stringT);
}

QString Table::readScore() {
     int score = 0;
     for(int i=0; i<rows; i++){
         for(int j=0; j<cols; j++){
             score += T[i][j];
         }
     }
     return(QString::number(score));
}

bool Table::readStatus() {
    return canMove();
}
