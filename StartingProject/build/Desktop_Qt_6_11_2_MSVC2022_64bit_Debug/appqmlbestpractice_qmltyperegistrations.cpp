/****************************************************************************
** Generated QML type registration code
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <QtQml/qqml.h>
#include <QtQml/qqmlmoduleregistration.h>

#if __has_include(<Chapter.h>)
#  include <Chapter.h>
#endif


#if !defined(QT_STATIC)
#define Q_QMLTYPE_EXPORT Q_DECL_EXPORT
#else
#define Q_QMLTYPE_EXPORT
#endif
Q_QMLTYPE_EXPORT void qml_register_types_QMLBestPractice()
{
    QT_WARNING_PUSH QT_WARNING_DISABLE_DEPRECATED
    qmlRegisterTypesAndRevisions<Chapter>("QMLBestPractice", 1);
    QT_WARNING_POP
    qmlRegisterModule("QMLBestPractice", 1, 0);
}

static const QQmlModuleRegistration qMLBestPracticeRegistration("QMLBestPractice", qml_register_types_QMLBestPractice);
