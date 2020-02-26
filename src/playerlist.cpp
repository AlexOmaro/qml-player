#include "playerlist.h"

#include <QStandardPaths>
#include <QDebug>
#include <QStringList>

static QString PATH = QStandardPaths::writableLocation(QStandardPaths::MusicLocation);

PlayerList::PlayerList(QObject *parent) : QAbstractListModel(parent)
{
	updateData(PATH, true);
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
	case IsDir: {
		return m_data[index.row()].m_isDir;
	}
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
	roles[IsDir] = "isDir";
	return roles;
}

void PlayerList::goHome()
{
	updateData(QStandardPaths::writableLocation(QStandardPaths::HomeLocation));
}

void PlayerList::goToDir(const QString &path)
{
	updateData(path);
}

void PlayerList::goBack()
{
	QDir way(currentPath());
	way.cdUp();
	updateData(way.path());
}

void PlayerList::selectDir()
{
	qDebug() << "dir selected";
	updateData(currentPath(), true);
}

void PlayerList::setCurrentPath(QString currentPath)
{
	if (m_currentPath == currentPath)
		return;

	m_currentPath = currentPath;
	emit currentPathChanged(m_currentPath);
}

void PlayerList::updateData(const QString &path, bool isApplyFilter)
{
	beginResetModel();

	m_data.clear();
	setCurrentPath(path);
	QDir way(currentPath());
	QList<QFileInfo> list;

	if (isApplyFilter) {
		QStringList filters;
		filters << "*.mp3" << "*.flac";
		list = way.entryInfoList(filters, QDir::AllEntries | QDir::NoDotAndDotDot);
	}
	else {
		list = way.entryInfoList(QDir::AllEntries | QDir::NoDotAndDotDot);
	}

	for(auto iter: list)
		m_data.append(Data(iter.fileName(), iter.filePath(), iter.isDir()));

	endResetModel();
}

QString PlayerList::currentPath() const
{
	return m_currentPath;
}
