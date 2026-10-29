#include <QtQml/qqmlprivate.h>
#include <QtCore/qdir.h>
#include <QtCore/qurl.h>
#include <QtCore/qhash.h>
#include <QtCore/qstring.h>

namespace QmlCacheGeneratedCode {
namespace _qt_qml_QMLBestPracticeSolution_Book_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QMLBestPracticeSolution_BookPage_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QMLBestPracticeSolution_DarkModeSwitch_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QMLBestPracticeSolution_FontSizeSlider_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QMLBestPracticeSolution_GreatNightIn_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QMLBestPracticeSolution_Main_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QMLBestPracticeSolution_SettingsButton_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_QMLBestPracticeSolution_Theme_qml { 
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
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QMLBestPracticeSolution/Book.qml"), &QmlCacheGeneratedCode::_qt_qml_QMLBestPracticeSolution_Book_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QMLBestPracticeSolution/BookPage.qml"), &QmlCacheGeneratedCode::_qt_qml_QMLBestPracticeSolution_BookPage_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QMLBestPracticeSolution/DarkModeSwitch.qml"), &QmlCacheGeneratedCode::_qt_qml_QMLBestPracticeSolution_DarkModeSwitch_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QMLBestPracticeSolution/FontSizeSlider.qml"), &QmlCacheGeneratedCode::_qt_qml_QMLBestPracticeSolution_FontSizeSlider_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QMLBestPracticeSolution/GreatNightIn.qml"), &QmlCacheGeneratedCode::_qt_qml_QMLBestPracticeSolution_GreatNightIn_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QMLBestPracticeSolution/Main.qml"), &QmlCacheGeneratedCode::_qt_qml_QMLBestPracticeSolution_Main_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QMLBestPracticeSolution/SettingsButton.qml"), &QmlCacheGeneratedCode::_qt_qml_QMLBestPracticeSolution_SettingsButton_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/QMLBestPracticeSolution/Theme.qml"), &QmlCacheGeneratedCode::_qt_qml_QMLBestPracticeSolution_Theme_qml::unit);
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
int QT_MANGLE_NAMESPACE(qInitResources_qmlcache_appQMLBestPracticeSolution)() {
    ::unitRegistry();
    return 1;
}
Q_CONSTRUCTOR_FUNCTION(QT_MANGLE_NAMESPACE(qInitResources_qmlcache_appQMLBestPracticeSolution))
int QT_MANGLE_NAMESPACE(qCleanupResources_qmlcache_appQMLBestPracticeSolution)() {
    return 1;
}
