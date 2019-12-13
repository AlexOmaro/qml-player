#ifndef PLAYER_H
#define PLAYER_H

#pragma once

#include <QObject>
#include <QMediaPlayer>

class Player : public QObject
{
	Q_OBJECT
	Q_PROPERTY(qint64 count READ count WRITE setCount NOTIFY countChanged)

public:
	explicit Player(QObject *parent = nullptr);

	Q_INVOKABLE void start(const QString &path);
	Q_INVOKABLE void stop();
	Q_INVOKABLE void pause();
	Q_INVOKABLE void resume();

	qint64 count() const;

public slots:
	void setCount(qint64 count);

signals:
	void countChanged(qint64 count);

private:
	QMediaPlayer m_player;
	qint64 m_count;
};

#endif // PLAYER_H
