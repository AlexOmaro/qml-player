#ifndef PLAYERLIST_H
#define PLAYERLIST_H

#include "data.h"

#include <QObject>
#include <QAbstractListModel>
#include <QDir>

class PlayerList : public QAbstractListModel
{
	Q_OBJECT

public:
	enum Roles {
		Name,
		Path,
		IsDir
	};

	Q_PROPERTY(QString currentPath READ currentPath WRITE setCurrentPath NOTIFY currentPathChanged)

	PlayerList(QObject *parent = nullptr);

	int rowCount(const QModelIndex &parent) const override;
	QVariant data(const QModelIndex &index, int Role = Qt::DisplayRole) const override;
	QHash<int, QByteArray> roleNames() const override;

	void updateData(const QString &path, bool isApplyFilter = false);

	Q_INVOKABLE void goHome();
	Q_INVOKABLE void goToDir(const QString &path);
	Q_INVOKABLE void goBack();
	Q_INVOKABLE void selectDir();

	QString currentPath() const;

public slots:
	void setCurrentPath(QString currentPath);

signals:
	void currentPathChanged(QString currentPath);

private:
	QList<Data> m_data;
	QString m_currentPath;
};

#endif // PLAYERLIST_H
