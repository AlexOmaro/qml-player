#ifndef FILEENGINE_H
#define FILEENGINE_H

#include <QObject>

class FileEngine : public QObject
{
    Q_OBJECT

public:
    FileEngine(QObject *parent = nullptr);

    Q_INVOKABLE void removeFile(const QString &path);
    Q_INVOKABLE void renameFile(const QString &path, const QString &newName);
};

#endif // FILEENGINE_H
