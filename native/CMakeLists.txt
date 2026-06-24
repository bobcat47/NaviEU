# Native build configuration for NaviEU
# Builds Valhalla routing engine bindings and sensor fusion libraries

cmake_minimum_required(VERSION 3.22)
project(navieu_native VERSION 0.1.0 LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Options
option(BUILD_VALHALLA "Build Valhalla routing engine" ON)
option(BUILD_SENSOR_FUSION "Build IMU sensor fusion library" ON)
option(BUILD_TESTS "Build native unit tests" OFF)

# Valhalla routing engine
if(BUILD_VALHALLA)
    add_subdirectory(valhalla)
endif()

# Sensor fusion library (Kalman filter, Madgwick AHRS)
if(BUILD_SENSOR_FUSION)
    add_subdirectory(sensor_fusion)
endif()

# FFI bindings for Dart
add_subdirectory(ffi)

if(BUILD_TESTS)
    enable_testing()
    add_subdirectory(tests)
endif()
