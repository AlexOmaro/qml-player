#include "fileengine.h"

#include <QFile>
#include <QDebug>

FileEngine::FileEngine(QObject *parent) : QObject(parent)
{

}

void FileEngine::removeFile(const QString &path)
{
    if(!QFile::remove(path))
        qDebug() << "File not found";
}

void FileEngine::renameFile(const QString &path, const QString &newName)
{
    QString temp = path;
    int k, t, n = 0;
    for (int i = temp.size(); (QChar)temp[i] != "/"; i--) {
        k = i;
        if (((QChar)temp[i] == ".") && (n == 0)) {
            t = i;
            n = 1;
        }
    }
    if (k == t) {
        temp.remove(k, temp.size() - k);
    } else {
        temp.remove(k, t - k);
    }
    temp.insert(k, newName);

    if(!QFile::rename(path, temp))
        qDebug() << "File not found";
}
