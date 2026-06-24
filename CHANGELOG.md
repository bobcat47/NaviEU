# Changelog

All notable changes to NaviEU are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [0.2.0] — 2025-06-24

### 🗻 3D Terrain Visualization

- **Real-time 3D terrain rendering** — Immersive elevation view powered by MapLibre GL with free Terrarium DEM tiles from AWS Open Data
- **Pitch & rotate controls** — Intuitive drag-to-rotate and scroll-to-pitch for exploring mountains, valleys, and urban landscapes from any angle
- **Adjustable height exaggeration** — 4 levels of terrain exaggeration (1×, 1.5×, 2×, 3×) to emphasize subtle elevation changes or dramatic alpine terrain
- **Hillshading layer** — Dynamic sunlight simulation with realistic shadow casting across terrain surfaces
- **3D building extrusion** — Buildings rendered with accurate height data for city exploration
- **Atmospheric sky rendering** — Realistic atmospheric scattering and sky dome for immersive fly-throughs
- **Live elevation readout** — Real-time elevation display at cursor position in meters
- **Lazy-loaded performance** — 3D engine loaded on-demand via code-splitting to keep initial bundle size minimal

### 🥾 Trail Memory System

- **14-feature trail recording engine** — Comprehensive GPS track recording with adaptive accuracy
- **Fog of war exploration** — Visual coverage map showing exactly where you've been with dynamically revealed areas
- **Loop detection** — Automatic detection of circular routes and completion achievements
- **Adaptive GPS sampling** — Battery-aware location tracking that adjusts frequency based on speed and accuracy
- **Douglas-Peucker compression** — Smart path simplification that preserves route shape while minimizing storage
- **Auto-save sessions** — Never lose a trail with automatic session persistence to IndexedDB
- **Exploration statistics** — Distance, duration, elevation gain/loss, average speed, max speed, area covered
- **Achievement system** — Unlockable badges for exploration milestones (First Trail, Marathon Walker, Summit Seeker, etc.)
- **Trail visualization** — Color-coded speed/elevation heatmaps overlaid on the map
- **Session management** — Browse, rename, delete, and replay past trail sessions
- **Return to start** — One-tap navigation back to trail origin with distance and bearing

### 👤 User Profiles

- **Persistent user profiles** — Create and manage your explorer identity with localStorage persistence
- **Avatar selection** — Choose from themed avatars (Hiker, Cyclist, Explorer, etc.)
- **Explorer stats dashboard** — Lifetime distance, trails recorded, areas explored, achievements earned
- **Privacy-first** — All profile data stored locally on device, never transmitted

### 🗺️ Map & Navigation Improvements

- **Dual map engine** — Leaflet for fast 2D navigation, MapLibre GL for immersive 3D terrain
- **Seamless 2D/3D switching** — Toggle between flat navigation mode and 3D terrain exploration without losing context
- **Search bar redesign** — Fixed overlap issues with offline status badge, cleaner layout
- **CartoDB tile layers** — Beautiful Voyager light theme for 2D navigation, Dark Matter for night mode
- **Improved map interactions** — Smoother pan/zoom, eliminated flashing on tile load with optimized buffering
- **GPS tracking fixes** — Marker stability improvements, auto-disable tracking after manual map interaction
- **Routing enhancements** — Better route line rendering, turn-by-turn via Valhalla open-source routing engine
- **Free geocoding** — Address and place search across Europe via Nominatim (OpenStreetMap)

### 🏠 Web App Experience

- **Progressive Web App (PWA)** — Install NaviEU on any device without app stores
- **Responsive design** — Optimized for mobile, tablet, and desktop screens
- **Offline-first architecture** — Core functionality works without internet connectivity
- **Onboarding flow** — First-time user tutorial for key features
- **Settings menu** — Customizable preferences for map, GPS, units, and privacy
- **NaviBot assistant** — Helpful guidance and tips as you explore
- **POI detail cards** — Rich information about points of interest with photos and reviews

### 🛠️ Technical Improvements

- **React 19 + TypeScript** — Modern, type-safe frontend architecture
- **Vite build system** — Lightning-fast development and optimized production builds
- **Tailwind CSS + shadcn/ui** — Consistent, accessible design system
- **Dexie.js (IndexedDB)** — Robust client-side storage for trails, sessions, and downloads
- **Code splitting** — Lazy-loaded 3D terrain reduces initial bundle by ~1MB
- **Type safety** — Full TypeScript coverage across all components and utilities

### 🐛 Bug Fixes

- Fixed search bar overlapping offline status badge
- Fixed map zoom/pan interactions conflicting with GPS tracking
- Fixed GPS marker flashing and unstable position updates
- Fixed trail polyline not rendering on map
- Fixed FogOfWar overlay canvas initialization issues
- Fixed various TypeScript type mismatches across components

### Known Limitations

- 3D terrain requires WebGL support — falls back gracefully to 2D on unsupported devices
- Terrarium DEM coverage is global but resolution varies (best in Europe and North America)
- Trail recording accuracy depends on device GPS hardware quality
- Offline map downloads require initial internet connection
- 3D buildings visible at zoom 15+, terrain visible at zoom 11+

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

---

## Future Releases (Planned)

See [ROADMAP.md](ROADMAP.md) for detailed planning on upcoming versions.

| Version | Focus | ETA |
|---------|-------|-----|
| 0.3.0 | Enhanced POI discovery, route sharing, multi-stop | Q4 2025 |
| 0.4.0 | Local AI recommendations, smart exploration | Q1 2026 |
| 1.0.0 | Stable release with mesh networking preview | Mid 2026 |

---

## Versioning Note

During the 0.x development phase, minor versions (0.1.0 → 0.2.0) may include breaking changes as the API stabilizes. Patch versions (0.1.0 → 0.1.1) are always backward-compatible bug fixes.

Starting with 1.0.0, strict Semantic Versioning will be followed.
