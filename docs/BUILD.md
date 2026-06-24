# Building NaviEU

This guide covers building NaviEU from source for all supported platforms.

## Prerequisites

| Tool | Version | Installation |
|------|---------|-------------|
| Flutter | 3.22+ | [Official Guide](https://docs.flutter.dev/get-started/install) |
| Dart | 3.4+ | Bundled with Flutter |
| CMake | 3.22+ | `apt install cmake` / `brew install cmake` |
| Git LFS | 3.0+ | `apt install git-lfs` / `brew install git-lfs` |

### Platform-Specific

**Android:**
- Android SDK 34+
- Android NDK (for native builds)
- Set `ANDROID_NDK` environment variable

**iOS:**
- macOS with Xcode 15+
- iOS Simulator or physical device

**Linux:**
- `libsqlite3-dev`
- `libcurl4-openssl-dev`
- Build essentials: `build-essential` or equivalent

## Quick Build

```bash
# Clone
git clone https://github.com/bobcat47/NaviEU.git
cd NaviEU

# Dependencies
flutter pub get

# Native libraries (Valhalla + sensor fusion)
cd native && ./build.sh && cd ..

# Run
flutter run --release
```

## Detailed Build Steps

### 1. Flutter Setup

```bash
# Verify Flutter installation
flutter doctor

# Get dependencies
flutter pub get

# Run code generation (build_runner)
flutter pub run build_runner build --delete-conflicting-outputs
```

### 2. Native Libraries

NaviEU requires native C++ libraries for routing (Valhalla) and sensor fusion.

```bash
cd native

# Option 1: Use the build script
./build.sh

# Option 2: Manual CMake build
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)
```

#### Android Native Build

```bash
cd native
export ANDROID_ABI=arm64-v8a
export ANDROID_API_LEVEL=28
export ANDROID_NDK=/path/to/ndk
./build.sh
```

Supported ABIs: `arm64-v8a`, `armeabi-v7a`, `x86_64`

#### iOS Native Build

```bash
cd native
mkdir -p build-ios && cd build-ios
cmake .. -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_SYSTEM_NAME=iOS \
  -DCMAKE_OSX_ARCHITECTURES=arm64
make -j$(sysctl -n hw.ncpu)
```

### 3. Running

```bash
# Development (debug)
flutter run

# Profile mode
flutter run --profile

# Release mode
flutter run --release
```

## Building Release Artifacts

### Android

```bash
# APK
flutter build apk --release

# App Bundle (for Play Store)
flutter build appbundle --release
```

Outputs:
- `build/app/outputs/flutter-apk/app-release.apk`
- `build/app/outputs/bundle/release/app-release.aab`

### iOS

```bash
# Build (requires signing configuration)
flutter build ios --release

# IPA for distribution
flutter build ipa --release
```

### Linux

```bash
flutter build linux --release
```

Output: `build/linux/x64/release/bundle/`

## Testing

```bash
# Unit tests
flutter test

# With coverage
flutter test --coverage

# Integration tests
flutter test integration_test/

# Specific test file
flutter test test/navigation/routing_test.dart
```

## Troubleshooting

### CMake not found
```bash
# Ubuntu/Debian
sudo apt-get install cmake

# macOS
brew install cmake
```

### NDK not found (Android)
```bash
# Set NDK path
export ANDROID_NDK=$HOME/Android/Sdk/ndk/25.2.9519653

# Or in Android Studio: Tools > SDK Manager > SDK Tools > NDK
```

### Build runner issues
```bash
# Clean and rebuild generated code
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### Valhalla build fails
```bash
# Ensure all dependencies are available
# Ubuntu/Debian:
sudo apt-get install -y libtool pkg-config build-essential \
  libcurl4-openssl-dev liblz4-dev libprotobuf-dev protobuf-compiler \
  libboost-all-dev libsqlite3-dev
```

## IDE Setup

### VS Code

Recommended extensions:
- Dart
- Flutter
- Error Lens
- GitLens

`.vscode/launch.json` is provided for debug configurations.

### Android Studio

1. Install Flutter and Dart plugins
2. Open the project root
3. Run `flutter pub get` from terminal
4. Select target device and run

---

*For build issues not covered here, please [open an issue](https://github.com/bobcat47/NaviEU/issues).*
