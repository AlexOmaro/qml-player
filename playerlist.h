#ifndef PLAYERLIST_H
#define PLAYERLIST_H

#include <QObject>
#include <QAbstractListModel>
#include <QDir>

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
    QVariant data(const QModelIndex& index, int Role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    void updateData();

private:
    QList<QFileInfo> m_data;
};

#endif // PLAYERLIST_H
