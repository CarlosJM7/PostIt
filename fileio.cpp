#include "fileio.h"
#include <QFile>
#include <QTextStream>
#include <QStandardPaths>
#include <QDebug>

FileIO::FileIO(QObject *parent) : QObject(parent){

}

QString FileIO::read(){
    if (mSource.isEmpty()){
        emit error("source is empty");
        return QString();
    }

    QFile file(mSource);
    QString fileContent;
    if ( file.open(QIODevice::ReadOnly) ) {
        QString line;
        QTextStream t( &file );
        do {
            line = t.readLine();
            fileContent += line;
        } while (!line.isNull());

        file.close();
    } else {
        emit error("Unable to open the file");
        return QString();
    }
    return fileContent;
}

bool FileIO::write(const QString& data){
    QString fulldir;

    if (mSource.isEmpty())
        return false;
    qDebug() << "URL: " << QStandardPaths::DesktopLocation;

    #if defined(Q_OS_ANDROID)
        fulldir = QStandardPaths::ApplicationsLocation + mSource;
    #elif defined(Q_OS_MACOS)
        //fulldir = QStandardPaths::DesktopLocation + "/QtWorkspace/PostIt/" + mSource;
        fulldir = "/Users/carlos/Desktop/QtWorkspace/PostIt/databox.json";
    #else
        //fulldir = QStandardPaths::DesktopLocation + "/QtWorkspace/PostIt/" + mSource;

    #endif

    qDebug() << "fulldir: " << fulldir;

    QFile file(fulldir);

    if (!file.open(QFile::WriteOnly | QFile::Truncate))
        return false;

    QTextStream out(&file);
    out << data;

    file.close();

    return true;
}


/*QString Get::osName()
{
#if defined(Q_OS_ANDROID)
    return QLatin1String("android");
#elif defined(Q_OS_BLACKBERRY)
    return QLatin1String("blackberry");
#elif defined(Q_OS_IOS)
    return QLatin1String("ios");
#elif defined(Q_OS_MACOS)
    return QLatin1String("macos");
#elif defined(Q_OS_TVOS)
    return QLatin1String("tvos");
#elif defined(Q_OS_WATCHOS)
    return QLatin1String("watchos");
#elif defined(Q_OS_WINCE)
    return QLatin1String("wince");
#elif defined(Q_OS_WIN)
    return QLatin1String("windows");
#elif defined(Q_OS_LINUX)
    return QLatin1String("linux");
#elif defined(Q_OS_UNIX)
    return QLatin1String("unix");
#else
    return QLatin1String("unknown");
#endif
}*/


