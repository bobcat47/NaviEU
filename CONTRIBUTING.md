# Contributing to NaviEU

First off: **thank you** for considering contributing to NaviEU. Every issue reported, bug fixed, feature implemented, and documentation improvement helps make privacy-first offline navigation available to everyone in Europe.

We are committed to providing a welcoming and inclusive experience for everyone. Please read our [Code of Conduct](CODE_OF_CONDUCT.md) before participating.

---

## 📋 Table of Contents

- [Development Setup](#development-setup)
- [Project Structure](#project-structure)
- [How to Contribute](#how-to-contribute)
- [Coding Standards](#coding-standards)
- [Commit Message Convention](#commit-message-convention)
- [Pull Request Process](#pull-request-process)
- [Areas Needing Help](#areas-needing-help)

---

## Development Setup

### Prerequisites

| Tool | Minimum Version | Notes |
|------|----------------|-------|
| Flutter | 3.22.0 | [Install Guide](https://docs.flutter.dev/get-started/install) |
| Dart | 3.4.0 | Bundled with Flutter |
| Android SDK | 34+ | For Android builds |
| Xcode | 15+ | For iOS/macOS builds (macOS only) |
| CMake | 3.22+ | For native tooling builds |
| Git LFS | 3.0+ | For large map test fixtures |

### Environment Setup

```bash
# 1. Clone your fork
git clone https://github.com/YOUR_USERNAME/NaviEU.git
cd NaviEU

# 2. Install Flutter dependencies
flutter pub get

# 3. Install Git hooks (optional but recommended)
./scripts/install_hooks.sh

# 4. Build native tooling
cd native && ./build.sh && cd ..

# 5. Verify your setup
flutter doctor
flutter test
```

### IDE Configuration

We recommend **VS Code** or **Android Studio** with the following extensions/plugins:

- Flutter & Dart extensions
- `dart_code_metrics` for additional linting
- Bracket Pair Colorizer (optional)

Pre-configured settings are provided in `.vscode/settings.json` and `.idea/` for consistent formatting across contributors.

---

## Project Structure

```
NaviEU/
├── android/              # Android-specific configuration
├── ios/                  # iOS-specific configuration
├── lib/                  # Main Dart source code
│   ├── core/             # Shared utilities, constants, extensions
│   ├── data/             # Data layer: repositories, local DB, API clients
│   ├── domain/           # Business logic: entities, use cases
│   ├── navigation/       # Navigation engine: routing, GPS, sensors
│   ├── map/              # Map rendering and interaction
│   ├── exploration/      # Trail memory, exploration tracking
│   ├── ui/               # Presentation layer: screens, widgets, themes
│   └── main.dart         # Application entry point
├── native/               # C/C++ native code (Valhalla bindings, IMU fusion)
├── packages/             # Local Dart packages
│   ├── navieu_router/    # Routing engine wrapper
│   ├── navieu_map/       # Map rendering package
│   └── navieu_trail/     # Trail memory system
├── test/                 # Unit and widget tests
├── integration_test/     # Integration and E2E tests
├── docs/                 # Documentation
├── scripts/              # Build and utility scripts
└── assets/               # Static assets (icons, fonts, default data)
```

### Architecture

NaviEU follows **Clean Architecture** with:

- **Presentation Layer** (`ui/`) — Widgets, state management (Riverpod)
- **Domain Layer** (`domain/`) — Entities, use cases, repository interfaces
- **Data Layer** (`data/`) — Repository implementations, data sources

Dependencies only point inward. The domain layer has zero external dependencies.

---

## How to Contribute

### Reporting Bugs

Before creating a bug report, please:

1. Check [existing issues](https://github.com/bobcat47/NaviEU/issues) to avoid duplicates
2. Update to the latest version to verify the bug still exists
3. Collect relevant information: device model, OS version, app version, steps to reproduce

Use our [Bug Report Template](.github/ISSUE_TEMPLATE/bug_report.md) when opening an issue.

A good bug report includes:

- **Clear title** — Summarize the problem in one line
- **Steps to reproduce** — Numbered, specific, minimal steps
- **Expected behavior** — What should have happened
- **Actual behavior** — What actually happened (with screenshots/video if UI-related)
- **Environment** — Device, OS version, app version, offline vs online
- **Logs** — Relevant log output (sanitized of personal data)

### Suggesting Features

We love feature ideas! Before suggesting:

1. Check the [Roadmap](ROADMAP.md) — your idea might already be planned
2. Search [existing issues](https://github.com/bobcat47/NaviEU/issues) for similar requests
3. Consider whether the feature aligns with NaviEU's core principles (offline-first, privacy-first, European focus)

Use our [Feature Request Template](.github/ISSUE_TEMPLATE/feature_request.md). A strong feature request explains:

- **The problem** — What user need or pain point this addresses
- **The solution** — Your proposed approach (open to iteration)
- **Alternatives considered** — Other ways to solve the problem
- **Offline impact** — How this works without internet connectivity

### Contributing Code

#### Finding Issues to Work On

| Label | Description | Skill Level |
|-------|-------------|-------------|
| `good first issue` | Great for newcomers | Beginner |
| `help wanted` | Active priority for maintainers | Any |
| `bug` | Something is broken | Any |
| `enhancement` | New feature or improvement | Intermediate |
| `performance` | Speed or battery optimization | Advanced |
| `documentation` | Docs, comments, guides | Any |
| `localization` | Translations for European languages | Any |

#### Workflow

1. **Comment on the issue** expressing your intent to work on it
2. **Fork the repository** and create a feature branch:
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/issue-number-short-description
   ```
3. **Make your changes** following our coding standards
4. **Write or update tests** — All code changes need tests
5. **Update documentation** — README, inline docs, or `/docs` as needed
6. **Run the test suite**:
   ```bash
   flutter test
   flutter analyze
   dart format --set-exit-if-changed .
   ```
7. **Commit** using our [convention](#commit-message-convention)
8. **Push** to your fork and [open a Pull Request](#pull-request-process)

---

## Coding Standards

### Dart Style

We follow the [Dart Effective Style Guide](https://dart.dev/effective-dart/style) with a few project-specific rules:

- **Line length**: 100 characters max
- **Trailing commas**: Required for multi-line parameter lists and collections
- **Explicit types**: Public API must have explicit return types; local variables can use `var`/`final`
- **Null safety**: Fully leverage null safety; no nullable parameters without `@Nullable` annotation reason

### Code Organization

```dart
// Ordering within a file:
// 1. Imports (dart:, package:, relative — each group sorted alphabetically)
// 2. Part directives
// 3. Exports
// 4. Constants
// 5. Class/enum declarations
// 6. Extension methods

// Example:
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../core/constants.dart';
import 'route_model.dart';

/// Calculates the great-circle distance between two coordinates using
/// the Haversine formula.
/// 
/// Returns distance in meters.
double haversineDistance(LatLng a, LatLng b) {
  // ...
}
```

### Testing Requirements

| Code Type | Test Requirement |
|-----------|-----------------|
| Business logic (use cases) | Unit tests mandatory |
| Repository implementations | Unit tests with mocked data sources |
| UI widgets | Widget tests for complex interactions |
| Navigation flows | Integration tests |
| Performance-critical code | Benchmark tests |

**Test coverage target**: 80%+ for new code.

```bash
# Run tests with coverage
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### Documentation

- **Public APIs** must have Dartdoc comments explaining parameters, return values, and thrown exceptions
- **Complex algorithms** (routing, sensor fusion) need inline comments explaining the approach
- **Architecture decisions** are documented in `/docs/adr/` (Architecture Decision Records)

---

## Commit Message Convention

We follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Types

| Type | Use For |
|------|---------|
| `feat` | New features |
| `fix` | Bug fixes |
| `docs` | Documentation only changes |
| `style` | Code style changes (formatting, semicolons, etc.) |
| `refactor` | Code changes that neither fix bugs nor add features |
| `perf` | Performance improvements |
| `test` | Adding or correcting tests |
| `chore` | Build process, dependencies, tooling |

### Scopes

Common scopes: `map`, `routing`, `trail`, `ui`, `gps`, `storage`, `deps`, `ci`, `docs`

### Examples

```
feat(routing): add multi-stop route planning

Implements support for up to 10 waypoints in route calculation.
Uses Valhalla's optimized_route action for TSP-style ordering.

fix(gps): correct bearing calculation at low speeds

docs(trail): add architecture diagram for coverage tracker

perf(map): reduce vector tile parse time by 40%
```

---

## Pull Request Process

1. **Open a PR** against the `main` branch with a clear title following our commit convention
2. **Fill out the PR template** — Description, changes, testing, screenshots
3. **Ensure CI passes** — Tests, analysis, and formatting checks must be green
4. **Request review** from at least one maintainer
5. **Address feedback** — Changes may be requested; please be responsive
6. **Approval & Merge** — Maintainers will merge once approved

### PR Checklist

- [ ] Code follows style guidelines (`flutter analyze` passes)
- [ ] Code is formatted (`dart format` applied)
- [ ] Tests added/updated and passing (`flutter test`)
- [ ] Documentation updated (inline, README, or `/docs`)
- [ ] No breaking changes (or clearly documented if unavoidable)
- [ ] Commit messages follow convention
- [ ] PR description references related issues (`Closes #123`)

---

## Areas Needing Help

### High Priority

- **Map Data Pipeline** — Automating OpenStreetMap → MBTiles conversion for European regions
- **Routing Engine Optimization** — Valhalla tuning for European road networks and trail paths
- **Battery Optimization** — Sensor fusion improvements, GPS polling strategies
- **iOS Performance** — Metal backend optimization for map rendering

### Medium Priority

- **Trail Memory System** — Coverage algorithms, heatmap generation, storage efficiency
- **POI Database** — European points of interest categorization and local scoring
- **Accessibility** — Voice guidance, screen reader support, high-contrast modes
- **Localization** — Translations for major European languages

### Research & Experimental

- **Mesh Networking** — Reticulum protocol integration for V4 (see [docs/MESH_VISION.md](docs/MESH_VISION.md))
- **On-Device ML** — TensorFlow Lite models for route preference learning
- **Indoor Navigation** — BLE beacon-based indoor positioning for transit hubs

---

## Getting Help

- **Discord**: [Join our community](https://discord.gg/navieu) (coming soon)
- **GitHub Discussions**: [Ask questions, share ideas](https://github.com/bobcat47/NaviEU/discussions)
- **Matrix**: `#navieu:matrix.org` (coming soon)

---

## Recognition

Contributors will be:

- Listed in our [Contributors](https://github.com/bobcat47/NaviEU/graphs/contributors) page
- Mentioned in release notes for significant contributions
- Invited to the maintainer team after sustained, quality contributions

Thank you for helping build navigation that respects its users. 🗺️
