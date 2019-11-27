#include "playerlist.h"
#include <QStandardPaths>
#include <QDebug>
#include <QStringList>

static QString PATH = QStandardPaths::writableLocation(QStandardPaths::MusicLocation);

PlayerList::PlayerList(QObject *parent) : QAbstractListModel(parent)
{
    updateData();
}

QVariant PlayerList::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (role) {
    case Name:
        return m_data[index.row()].fileName();
    case Path:
        return m_data[index.row()].filePath();
    default:
        return QVariant();
    }
}

int PlayerList::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }
    return m_data.size();
}


QHash<int, QByteArray> PlayerList::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[Name] = "name";
    roles[Path] = "path";
    return roles;
}

void PlayerList::updateData()
{
    QDir way(PATH);
    QStringList filters;
    filters << "*.mp3";
    m_data = way.entryInfoList(filters, QDir::AllEntries | QDir::NoDotAndDotDot);
}
