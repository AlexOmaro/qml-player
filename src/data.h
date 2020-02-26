#ifndef DATA_H
#define DATA_H

#include <QString>

struct Data {
	Data(const QString &name, const QString &path, bool isDir) {
		m_name = name;
		m_path = path;
		m_isDir = isDir;
	}

	QString m_name;
	QString m_path;
	bool m_isDir;
};

#endif // DATA_H
