#include <QtQml/qqmlprivate.h>
#include <QtCore/qdir.h>
#include <QtCore/qurl.h>
#include <QtCore/qhash.h>
#include <QtCore/qstring.h>

namespace QmlCacheGeneratedCode {
namespace _qt_qml_QMLBestPractice_Book_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QMLBestPractice_BookPage_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QMLBestPractice_DarkModeSwitch_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QMLBestPractice_FontSizeSlider_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QMLBestPractice_GreatNightIn_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QMLBestPractice_Main_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QMLBestPractice_SettingsButton_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QMLBestPractice_Theme_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}

}
namespace {
struct Registry {
    Registry();
    ~Registry();
    QHash<QString, const QQmlPrivate::CachedQmlUnit*> resourcePathToCachedUnit;
    static const QQmlPrivate::CachedQmlUnit *lookupCachedUnit(const QUrl &url);
};

Q_GLOBAL_STATIC(Registry, unitRegistry)


Registry::Registry() {
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QMLBestPractice/Book.qml"), &QmlCacheGeneratedCode::_qt_qml_QMLBestPractice_Book_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QMLBestPractice/BookPage.qml"), &QmlCacheGeneratedCode::_qt_qml_QMLBestPractice_BookPage_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QMLBestPractice/DarkModeSwitch.qml"), &QmlCacheGeneratedCode::_qt_qml_QMLBestPractice_DarkModeSwitch_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QMLBestPractice/FontSizeSlider.qml"), &QmlCacheGeneratedCode::_qt_qml_QMLBestPractice_FontSizeSlider_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QMLBestPractice/GreatNightIn.qml"), &QmlCacheGeneratedCode::_qt_qml_QMLBestPractice_GreatNightIn_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QMLBestPractice/Main.qml"), &QmlCacheGeneratedCode::_qt_qml_QMLBestPractice_Main_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QMLBestPractice/SettingsButton.qml"), &QmlCacheGeneratedCode::_qt_qml_QMLBestPractice_SettingsButton_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QMLBestPractice/Theme.qml"), &QmlCacheGeneratedCode::_qt_qml_QMLBestPractice_Theme_qml::unit);
    QQmlPrivate::RegisterQmlUnitCacheHook registration;
    registration.structVersion = 0;
    registration.lookupCachedQmlUnit = &lookupCachedUnit;
    QQmlPrivate::qmlregister(QQmlPrivate::QmlUnitCacheHookRegistration, &registration);
}

Registry::~Registry() {
    QQmlPrivate::qmlunregister(QQmlPrivate::QmlUnitCacheHookRegistration, quintptr(&lookupCachedUnit));
}

const QQmlPrivate::CachedQmlUnit *Registry::lookupCachedUnit(const QUrl &url) {
    if (url.scheme() != QLatin1String("qrc"))
        return nullptr;
    QString resourcePath = QDir::cleanPath(url.path());
    if (resourcePath.isEmpty())
        return nullptr;
    if (!resourcePath.startsWith(QLatin1Char('/')))
        resourcePath.prepend(QLatin1Char('/'));
    return unitRegistry()->resourcePathToCachedUnit.value(resourcePath, nullptr);
}
}
int QT_MANGLE_NAMESPACE(qInitResources_qmlcache_appQMLBestPractice)() {
    ::unitRegistry();
    return 1;
}
Q_CONSTRUCTOR_FUNCTION(QT_MANGLE_NAMESPACE(qInitResources_qmlcache_appQMLBestPractice))
int QT_MANGLE_NAMESPACE(qCleanupResources_qmlcache_appQMLBestPractice)() {
    return 1;
}
