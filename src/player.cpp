#include "player.h"

#include <QString>
#include <QDir>
#include <QUrl>

Player::Player(QObject *parent) : QObject(parent)
{

}

void Player::start(const QString &path)
{
    if( m_state != IdleState)
		m_player.stop();

	m_player.setMedia(QUrl::fromLocalFile(path));
	m_player.play();
    setState (PlayingState);
}

void Player::stop()
{
    if( m_state != IdleState)
		m_player.stop();

    setState (IdleState);
}

void Player::pause()
{
    if(m_state == PlayingState)
		m_player.pause();

    setState (PausedState);
}

void Player::resume()
{
    if(m_state == PausedState)
		m_player.play();

    setState (PlayingState);
}

qint64 Player::position() const
{
	return m_player.position();
}

void Player::setVolume(const int &value)
{
    m_player.setVolume(value);
}

int Player::volume() const
{
    return m_player.volume();
}

Player::State Player::getState() const
{
    return m_state;
}

void Player::setState(Player::State state)
{
    if (m_state == state)
        return;

    m_state = state;
    emit stateChanged(m_state);
}





