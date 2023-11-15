#include <QCoreApplication>
#include <KIdleTime>
#include <QDebug>

class KIdleTest : public QObject
{
    Q_OBJECT
public:
    KIdleTest();
private Q_SLOTS:
    void timeoutReached(int id, int timeout);
    void resumeEvent();
};

KIdleTest::KIdleTest()
{
    // connect to idle events
    connect(KIdleTime::instance(), &KIdleTime::resumingFromIdle, this, &KIdleTest::resumeEvent);
    connect(KIdleTime::instance(), qOverload<int, int>(&KIdleTime::timeoutReached), this, &KIdleTest::timeoutReached);

    // register a 10-second idle timeout
    KIdleTime::instance()->addIdleTimeout(10000);

    qDebug() << "Your idle time is" << KIdleTime::instance()->idleTime();
    qDebug() << "Welcome! Stay idle for 10 seconds to get a message. Move your mouse or do something to resume.";
}

void KIdleTest::timeoutReached(int id, int timeout)
{
    Q_UNUSED(id)
    if (timeout == 10000) {
        qDebug() << "You have been idle for 10 seconds.";
    }
}

void KIdleTest::resumeEvent()
{
    qDebug() << "You are back!";
}

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);
    KIdleTest test;
    return app.exec();
}

#include "main.moc"
