#ifndef PLAYERLIST_H
#define PLAYERLIST_H

#include "data.h"

#include <QObject>
#include <QAbstractListModel>
#include <QDir>
#include <QFileSystemWatcher>

class PlayerList : public QAbstractListModel
{
	Q_OBJECT
public:
	enum Roles {
		Name,
		Path
	};

	PlayerList(QObject *parent = nullptr);

	int rowCount(const QModelIndex &parent) const override;
	QVariant data(const QModelIndex &index, int Role = Qt::DisplayRole) const override;
	QHash<int, QByteArray> roleNames() const override;

    void updateData();
    void listOfPath();

    static void updateDataAnother();

private:
	QList<Data> m_data;
    QFileSystemWatcher object;

private slots:
    void updateDir();
};

#endif // PLAYERLIST_H
