# NaviEU Architecture

> **Document Version:** 1.0  
> **Last Updated:** 2025-06-24  
> **Status:** Approved — Reflects v0.1.0 architecture

This document describes the high-level architecture of NaviEU. It is intended for contributors, security reviewers, and anyone integrating with or extending the platform.

---

## Design Principles

NaviEU's architecture is guided by five core principles:

1. **Offline-First** — Every feature must work without internet connectivity. Online capabilities are enhancements, never requirements.
2. **Privacy-by-Design** — No user data leaves the device unless explicitly initiated by the user. Zero telemetry by default.
3. **Local-First Intelligence** — All AI and decision-making runs on-device. No cloud AI APIs.
4. **Modular & Replaceable** — Components are loosely coupled with clear interfaces. Routing engines, map renderers, and storage backends can be swapped.
5. **Battery-Conscious** — Every subsystem is optimized for minimal power consumption. Navigation must work all day.

---

## System Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           PRESENTATION LAYER                                │
│                                                                             │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐    │
│  │   Map Screen  │  │  Navigation  │  │ Exploration │  │  Settings    │    │
│  │              │  │   Screen      │  │   Screen    │  │   Screen     │    │
│  └──────┬───────┘  └──────┬───────┘  └──────┬──────┘  └──────┬──────┘    │
│         │                  │                  │                │           │
│  ┌──────▼──────────────────▼──────────────────▼────────────────▼──────┐    │
│  │                         UI State (Riverpod)                        │    │
│  │  ┌──────────────┐  ┌──────────────┐  ┌──────────────────────────┐ │    │
│  │  │  Map State    │  │ Route State  │  │  Exploration State       │ │    │
│  │  │  Controller   │  │  Controller  │  │   Controller             │ │    │
│  │  └──────────────┘  └──────────────┘  └──────────────────────────┘ │    │
│  └───────────────────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────────────────────┘
                                      │
┌─────────────────────────────────────▼───────────────────────────────────────┐
│                            DOMAIN LAYER                                     │
│                                                                             │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐    │
│  │  Navigation   │  │    Map       │  │  Exploration │  │   Settings   │    │
│  │   Use Cases   │  │   Use Cases  │  │   Use Cases  │  │   Use Cases  │    │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘    │
│         │                  │                  │                │           │
│  ┌──────▼──────────────────▼──────────────────▼────────────────▼──────┐    │
│  │                         Entities & Value Objects                    │    │
│  │  Route, Waypoint, LatLng, POI, Trail, CoverageRegion, ...          │    │
│  └────────────────────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────────────────────┘
                                      │
┌─────────────────────────────────────▼───────────────────────────────────────┐
│                            DATA LAYER                                       │
│                                                                             │
│  ┌────────────────────────────────────────────────────────────────────┐    │
│  │                      Repository Abstractions                        │    │
│  │  RouteRepository, MapRepository, TrailRepository, POIRepository     │    │
│  └──────────────┬──────────────┬──────────────┬──────────────────────┘    │
│                 │              │              │                            │
│  ┌──────────────▼──┐  ┌───────▼──────┐  ┌───▼──────────┐  ┌───────────▼─┐│
│  │  SQLite/Drift   │  │  MBTiles     │  │   GPX/       │  │  SharedPref ││
│  │  (Routes, POIs, │  │  (Map Tiles) │  │  GeoJSON     │  │  (Settings) ││
│  │   Settings)     │  │              │  │  (Import/    │  │             ││
│  │                 │  │              │  │   Export)    │  │             ││
│  └─────────────────┘  └──────────────┘  └──────────────┘  └─────────────┘│
└─────────────────────────────────────────────────────────────────────────────┘
                                      │
┌─────────────────────────────────────▼───────────────────────────────────────┐
│                         NAVIGATION ENGINE                                   │
│                                                                             │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐    │
│  │   Valhalla    │  │   Sensor     │  │    GPS       │  │    IMU       │    │
│  │   Router      │  │   Fusion     │  │   Manager    │  │   Provider   │    │
│  │               │  │   Engine     │  │              │  │              │    │
│  │  • route      │  │              │  │  • Polling   │  │  • Accel     │    │
│  │  • optimized  │  │  • Kalman    │  │  • Filtering │  │  • Gyro      │    │
│  │  • isochrone  │  │  • Particle  │  │  • Accuracy  │  │  • Compass   │    │
│  │  • matrix     │  │  • Madgwick  │  │  • Dead reck │  │  • Barometer │    │
│  └──────────────┘  └──────────────┘  └──────────────┘  └──────────────┘    │
│                                                                             │
│  ┌────────────────────────────────────────────────────────────────────┐    │
│  │                    Map Rendering Engine                             │    │
│  │  MapLibre GL / flutter_map — Vector tile parsing & rendering        │    │
│  └────────────────────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Layer Responsibilities

### Presentation Layer (`lib/ui/`)

**Widgets** — Flutter widgets that render UI. They are "dumb" — they display state and delegate user actions to controllers.

**State Controllers** — Riverpod providers that:
- Hold UI state (loading, error, data)
- Orchestrate use cases in response to user actions
- Map domain entities to view models
- Handle UI-specific logic (debouncing, validation)

### Domain Layer (`lib/domain/`)

**Entities** — Core business objects: `Route`, `Waypoint`, `POI`, `TrailSegment`, `CoverageRegion`. These contain business logic and invariants.

**Value Objects** — Immutable objects without identity: `LatLng`, `Distance`, `Duration`, `Bearing`, `ElevationProfile`.

**Use Cases** — Single-responsibility classes that encapsulate business operations: `CalculateRoute`, `DownloadMapRegion`, `RecordTrailPoint`, `SearchNearbyPOIs`. They are pure business logic with no framework dependencies.

**Repository Interfaces** — Abstract contracts (`RouteRepository`, `MapRepository`) that the domain defines and the data layer implements.

### Data Layer (`lib/data/`)

**Repository Implementations** — Concrete implementations of repository interfaces. Handle data mapping between domain entities and DTOs.

**Data Sources** — Low-level data access:
- `LocalDatabase` — SQLite via Drift for structured data
- `MapTileStore` — MBTiles for vector map data
- `GPXParser` — Import/export GPX files
- `SettingsStore` — SharedPreferences for app settings

**DTOs** — Data transfer objects for serialization/deserialization. Separate from domain entities to allow schema evolution without affecting business logic.

---

## Navigation Engine

### Routing

NaviEU uses **Valhalla** as its primary routing engine — an open-source, high-performance routing engine that supports multiple transportation modes and complex costing models.

```
Route Request → Valhalla Router → Route Response
                    │
                    ├── Costing Model (auto, bicycle, pedestrian)
                    ├── Elevation-Aware Costing
                    ├── Avoidance Policies
                    └── Multi-Criteria Optimization
```

Valhalla runs as an embedded native library (not a network service). The map data graph is pre-built and shipped as part of regional map downloads.

**Pluggable Architecture**: The routing interface (`RouterService`) allows alternative implementations. GraphHopper is supported as a secondary option.

### Sensor Fusion

The GPS Manager doesn't rely solely on GPS fixes. It fuses multiple sensor inputs:

```
GPS (GNSS) ──┐
             ├──→ Sensor Fusion Engine ──→ Optimized Position
Accelerometer┤      (Kalman + Madgwick)
Gyroscope ───┤         ↓
Compass ─────┘    Confidence Score
Barometer ────→ Elevation Refinement
```

This fusion allows:
- **Reduced GPS polling frequency** (battery savings of 40-60%)
- **Smoother position estimates** during turns and tunnels
- **Dead reckoning** during brief GPS loss
- **Elevation accuracy** via barometric pressure

---

## Storage Architecture

### SQLite (Drift)

Stores structured application data:

| Table | Purpose |
|-------|---------|
| `routes` | Saved routes with metadata |
| `waypoints` | Route waypoints with sequence |
| `pois` | User-created and cached POIs |
| `trail_segments` | Exploration trail geometry |
| `coverage_cells` | Trail Memory coverage data |
| `settings` | App preferences and state |

### MBTiles

Stores vector map tiles in a standard SQLite-based format:

```
mbtiles_file/
├── metadata (name, bounds, format, zoom levels)
├── tiles (z/x/y → compressed vector tile blob)
└── indexes (spatial query acceleration)
```

### File Storage

- `GPX/` — Imported and exported GPX files
- `Maps/` — Downloaded MBTiles map regions
- `Cache/` — Temporary map tile cache

---

## Data Flow Examples

### Route Calculation (Offline)

```
User enters destination
        │
        ▼
┌───────────────┐
│  Map Screen    │
│  Controller    │
└───────┬───────┘
        │ CalculateRouteUseCase(origin, destination, profile)
        ▼
┌───────────────┐     ┌───────────────┐     ┌───────────────┐
│  RouteRepository│────▶│  MapTileStore │────▶│  Valhalla     │
│  (abstraction)  │     │  (checks map  │     │  Router       │
│                 │     │   availability)│    │  (embedded)   │
└───────┬─────────┘     └───────────────┘     └───────┬───────┘
        │                                              │
        │◀──────────────── Route Entity ───────────────┘
        │
        ▼
┌───────────────┐
│  UI updates   │
│  with route   │
│  polyline,    │
│  directions,  │
│  ETA, profile │
└───────────────┘
```

### Trail Memory Recording

```
GPS Fix (every N seconds, adaptive)
        │
        ▼
┌───────────────┐
│ Sensor Fusion │──→ Optimized Position + Confidence
└───────┬───────┘
        │
        ▼
┌───────────────┐     ┌───────────────┐
│ RecordTrail   │────▶│ TrailMemory   │
│ Point UseCase │     │ Repository    │
└───────┬───────┘     └───────┬───────┘
        │                     │
        │◀────────────────────┘
        │
        ▼
┌───────────────┐     ┌───────────────┐
│ Coverage      │────▶│ SQLite +      │
│ Calculator    │     │ Spatial Index │
└───────────────┘     └───────────────┘
```

---

## Security & Privacy Architecture

### Threat Model

| Threat | Mitigation |
|--------|-----------|
| Location data exfiltration | No network calls during navigation; all data local |
| Map download metadata tracking | Downloads via HTTPS; no identifying headers |
| App usage profiling | Zero telemetry by default; anonymous opt-in only |
| Local data theft | App data sandboxed; no external storage permissions |
| Backup leakage | Local backups encrypted with device key |

### Data Classification

| Data Type | Storage | Encryption | Leaves Device |
|-----------|---------|-----------|---------------|
| Location history | SQLite local | Device key | Never (default) |
| Saved routes | SQLite local | Device key | Only explicit export |
| Map tiles | MBTiles local | None needed | Never |
| Settings | SharedPreferences | Device key | Never |
| App preferences | SharedPreferences | None | Only if opt-in analytics |

---

## Performance Targets

| Metric | Target | Current (v0.1.0) |
|--------|--------|------------------|
| Cold start to interactive map | <2s | ~2.5s |
| Route calculation (100km) | <3s | ~2s |
| Route calculation (500km) | <5s | ~4s |
| Map render (pan/zoom) | 60fps | 55-60fps |
| Battery (active navigation) | <10%/hr | ~12%/hr |
| Battery (exploration tracking) | <8%/hr | ~10%/hr |
| Storage per country map | <500MB | 300-600MB |
| App install size | <50MB | ~45MB |

---

## Technology Decisions

See `docs/adr/` for Architecture Decision Records documenting key technical choices:

| ADR | Topic | Status |
|-----|-------|--------|
| ADR-001 | Flutter as cross-platform framework | Accepted |
| ADR-002 | Valhalla as primary routing engine | Accepted |
| ADR-003 | MBTiles for offline map storage | Accepted |
| ADR-004 | Riverpod for state management | Accepted |
| ADR-005 | SQLite + Drift over Hive for structured data | Accepted |
| ADR-006 | MapLibre GL over flutter_map (primary) | Accepted |

---

## Future Architecture Evolution

### V3: On-Device AI

```
┌─────────────────────────────────────┐
│         TFLite Runtime               │
│  ┌──────────┐  ┌──────────────┐    │
│  │ Route    │  │ POI Scoring  │    │
│  │ Preference│  │ Model        │    │
│  │ Model    │  │ (local)      │    │
│  └──────────┘  └──────────────┘    │
└─────────────────────────────────────┘
```

### V4: Mesh Layer

```
┌─────────────────────────────────────┐
│         Reticulum Stack              │
│  ┌──────────┐  ┌──────────────┐    │
│  │ Mesh     │  │ Emergency    │    │
│  │ Discovery│  │ Beacon       │    │
│  │ Protocol │  │ Protocol     │    │
│  └──────────┘  └──────────────┘    │
└─────────────────────────────────────┘
```

---

*This architecture document is maintained by the NaviEU core team. For questions or proposed changes, open a discussion in GitHub Discussions.*
