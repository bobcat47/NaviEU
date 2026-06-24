# Changelog

All notable changes to NaviEU are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [0.1.0] — 2025-06-24

### 🚀 Initial Release

The foundation of NaviEU — privacy-first offline navigation for Europe.

### Added

#### Core Navigation
- **Offline vector map rendering** using MapLibre GL — crisp maps at any zoom, entirely on-device
- **Turn-by-turn navigation** with voice guidance (English, German, French, Spanish, Italian)
- **Multi-modal routing** — car, bicycle, and pedestrian routing via embedded Valhalla engine
- **Route planning** with preview, distance, ETA, and elevation profile
- **Smart rerouting** — automatic route recalculation on deviation, fully offline
- **GPX import/export** — compatibility with existing hiking and cycling workflows

#### Offline Infrastructure
- **Regional map downloads** — download entire countries or custom regions as vector tiles
- **MBTiles storage engine** — efficient, compressed map storage minimizing device space
- **WiFi-only background updates** — optional automatic map updates when connected
- **Storage management** — view, delete, and optimize downloaded map regions

#### Map Features
- **OpenStreetMap base layer** — community-driven, continuously updated map data
- **POI display** — restaurants, accommodations, fuel stations, pharmacies, viewpoints
- **Search functionality** — offline geocoding for downloaded regions
- **Custom map styling** — multiple rendering themes (default, outdoor, dark mode)
- **Layer controls** — toggle POIs, trails, contours, satellite overlay

#### Platform Support
- **Android** — API 28+ (Android 9.0+)
- **iOS** — iOS 15+ (iPhone and iPad)
- **Linux** — experimental desktop builds

#### Privacy & Security
- **Zero telemetry by default** — no location data, usage data, or analytics collected
- **No account required** — completely anonymous usage
- **No network calls during navigation** — 100% offline operation
- **Local-only storage** — all data stays on your device
- **Optional anonymous analytics** — opt-in only, aggregated and anonymized

#### Technical Foundation
- **Flutter 3.22** cross-platform framework
- **Riverpod** state management architecture
- **SQLite** local database for routes, POIs, and settings
- **Clean Architecture** — domain-driven, testable, maintainable
- **CI/CD pipeline** — automated testing and builds via GitHub Actions

### Known Limitations

This is an early release. The following are known and actively being worked on:

- **Map coverage** — Best coverage in Western and Central Europe; Eastern Europe and microstates improving
- **POI search** — Offline search limited to downloaded regions; some remote areas have sparse POI data
- **Trail data** — Hiking and cycling trail coverage varies by region; community mapping ongoing
- **Public transit** — Not yet supported; planned for future release
- **iOS background navigation** — Limited by platform restrictions; optimized for foreground use
- **Voice guidance languages** — 5 languages in v0.1; more European languages coming

### Feedback

Your feedback shapes NaviEU's future. Please report issues, suggest features, and share your experiences via [GitHub Issues](https://github.com/bobcat47/NaviEU/issues).

---

## Future Releases (Planned)

See [ROADMAP.md](ROADMAP.md) for detailed planning on upcoming versions.

| Version | Focus | ETA |
|---------|-------|-----|
| 0.2.0 | Exploration tracking, trail memory foundation | Q3 2025 |
| 0.3.0 | Enhanced POI discovery, route sharing, multi-stop | Q4 2025 |
| 0.4.0 | Local AI recommendations, smart exploration | Q1 2026 |
| 1.0.0 | Stable release with mesh networking preview | Mid 2026 |

---

## Versioning Note

During the 0.x development phase, minor versions (0.1.0 → 0.2.0) may include breaking changes as the API stabilizes. Patch versions (0.1.0 → 0.1.1) are always backward-compatible bug fixes.

Starting with 1.0.0, strict Semantic Versioning will be followed.
