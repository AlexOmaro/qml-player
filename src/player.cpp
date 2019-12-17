#include "player.h"

#include <QString>
#include <QDir>
#include <QUrl>

Player::Player(QObject *parent) : QObject(parent)
{

}

void Player::start(const QString &path)
{
	if(m_player.state() == QMediaPlayer::PlayingState)
		m_player.stop();

	m_player.setMedia(QUrl::fromLocalFile(path));
	m_player.play();
}

void Player::stop()
{
	if(!(m_player.state() == QMediaPlayer::StoppedState))
		m_player.stop();
}

void Player::pause()
{
	if(m_player.state() == QMediaPlayer::PlayingState)
		m_player.pause();
}

void Player::resume()
{
	if(m_player.state() == QMediaPlayer::PausedState)
		m_player.play();
}

qint64 Player::position() const
{
	return m_player.position();
}

void Player::setVolume(const int value)
{
	m_player.setVolume(value);
}
