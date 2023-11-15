cmake_minimum_required(VERSION 3.16)

project(KIdleTest)

set(QT_MIN_VERSION "5.15.0")
set(KF5_MIN_VERSION "5.85.0")

find_package(ECM ${KF5_MIN_VERSION} REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(FeatureSummary)
include(ECMSetupVersion)
include(ECMGenerateHeaders)
include(ECMAddQch)

find_package(Qt5 ${QT_MIN_VERSION} CONFIG REQUIRED COMPONENTS
    Core    # QCoreApplication
    Gui     # QWindow
)

find_package(KF5 ${KF5_MIN_VERSION} REQUIRED COMPONENTS
    IdleTime    # KIdleTime
)

add_executable(kidletest main.cpp)

target_link_libraries(kidletest
    Qt5::Core
    Qt5::Gui
    KF5::IdleTime
)

