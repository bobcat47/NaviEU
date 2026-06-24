#!/bin/bash
# NaviEU Native Build Script
# Builds Valhalla routing engine and sensor fusion libraries

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="${SCRIPT_DIR}/build"
INSTALL_DIR="${SCRIPT_DIR}/install"

ANDROID_ABI="${ANDROID_ABI:-arm64-v8a}"
ANDROID_API_LEVEL="${ANDROID_API_LEVEL:-28}"
BUILD_TYPE="${BUILD_TYPE:-Release}"

echo "========================================"
echo "NaviEU Native Build"
echo "========================================"
echo "Build Type: ${BUILD_TYPE}"
echo "Script Dir: ${SCRIPT_DIR}"
echo ""

# Detect platform
if [[ "$OSTYPE" == "linux-android"* ]] || [[ -n "$ANDROID_NDK" ]]; then
    PLATFORM="android"
elif [[ "$OSTYPE" == "linux"* ]]; then
    PLATFORM="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    PLATFORM="darwin"
else
    echo "Unsupported platform: $OSTYPE"
    exit 1
fi

echo "Detected Platform: ${PLATFORM}"

# Clean and create directories
rm -rf "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}"
mkdir -p "${INSTALL_DIR}"

# Configure
echo ""
echo "Configuring CMake..."

CMAKE_ARGS=(
    -S "${SCRIPT_DIR}"
    -B "${BUILD_DIR}"
    -DCMAKE_BUILD_TYPE="${BUILD_TYPE}"
    -DCMAKE_INSTALL_PREFIX="${INSTALL_DIR}"
    -DBUILD_TESTS=OFF
)

if [[ "$PLATFORM" == "android" ]]; then
    CMAKE_ARGS+=(-DANDROID_ABI="${ANDROID_ABI}")
    CMAKE_ARGS+=(-DANDROID_PLATFORM="android-${ANDROID_API_LEVEL}")
    CMAKE_ARGS+=(-DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK}/build/cmake/android.toolchain.chain")
fi

cmake "${CMAKE_ARGS[@]}"

# Build
echo ""
echo "Building native libraries..."
cmake --build "${BUILD_DIR}" --parallel "$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)"

# Install
echo ""
echo "Installing to ${INSTALL_DIR}..."
cmake --install "${BUILD_DIR}"

echo ""
echo "========================================"
echo "Native build complete!"
echo "Libraries installed to: ${INSTALL_DIR}"
echo "========================================"
