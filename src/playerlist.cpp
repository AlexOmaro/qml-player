#include "playerlist.h"

#include <QStandardPaths>
#include <QDebug>
#include <QStringList>

static QString PATH = QStandardPaths::writableLocation(QStandardPaths::MusicLocation);

PlayerList::PlayerList(QObject *parent) : QAbstractListModel(parent)
{
    m_watcher.addPath(PATH);
    QObject::connect(&m_watcher, &QFileSystemWatcher::directoryChanged, this, &PlayerList::updateData);
	updateData();
}

QVariant PlayerList::data(const QModelIndex &index, int role) const
{
	if (!index.isValid()) {
		return QVariant();
	}

	switch (role) {
	case Name:
		return m_data[index.row()].m_name;
	case Path:
		return m_data[index.row()].m_path;
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
    m_data.clear();
	QDir way(PATH);
	QStringList filters;
	filters << "*.mp3" << "*.flac";

	QList<QFileInfo>list = way.entryInfoList(filters, QDir::AllEntries | QDir::NoDotAndDotDot);
	for(auto iter: list)
        m_data.append(Data(iter.fileName(), iter.filePath()));
    beginResetModel();
    endResetModel();
}
