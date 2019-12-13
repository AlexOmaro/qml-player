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

	connect (&m_player, SIGNAL(positionChanged(qint64)), this, SLOT (setCount(qint64)));
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

qint64 Player::count() const
{
	return m_count;
}

void Player::setCount(qint64 count)
{
	if (m_count == count)
		return;

	m_count = m_player.position();
	emit countChanged(m_count);
}
