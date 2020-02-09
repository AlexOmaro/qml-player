#include "player.h"
#include "playerlist.h"

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

void Player::removeFile(const QString &path)
{
    QFile mFile(path);
    if (mFile.exists()) {
        mFile.remove();
    } else {
        qDebug() << "Файл не найден!";
    }
}

void Player::renameFile(const QString &path, const QString &newName)
{
    QFile mFile(path);
    if (mFile.exists()) {
        mFile.rename(path + newName);
    } else {
        qDebug() << "Файл не найден!";
    }
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
