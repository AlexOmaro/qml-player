#ifndef PLAYER_H
#define PLAYER_H

#pragma once

#include <QObject>
#include <QMediaPlayer>

class Player : public QObject
{
	Q_OBJECT
public:
	explicit Player(QObject *parent = nullptr);

	Q_INVOKABLE void start(const QString &path);
	Q_INVOKABLE void stop();
	Q_INVOKABLE void pause();
	Q_INVOKABLE void resume();

	Q_INVOKABLE qint64 position() const; // Get current position

    Q_INVOKABLE void setVolume(const int &value);

	int volume() const;

    enum State {
        IdleState,
        PausedState,
        PlayingState
    };

    Q_ENUM(State)

    State state() const;

private:
    void setState(State state);

signals:
    void stateChanged(State state);

private:
    QMediaPlayer m_player;

    State m_state;

    Q_PROPERTY(State state READ state NOTIFY stateChanged)
};

#endif // PLAYER_H
