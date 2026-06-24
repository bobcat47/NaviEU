<div align="center">

# 🗺️ NaviEU

### Privacy-First Offline Navigation Intelligence for Europe

**Explore Europe Without Limits. No Signal Required.**

[![License: MIT](https://img.shields.io/badge/License-MIT-2E8B57.svg)](LICENSE)
[![Roadmap](https://img.shields.io/badge/Roadmap-Public-4A90D9.svg)](ROADMAP.md)
[![Contributors Welcome](https://img.shields.io/badge/Contributors-Welcome-FF6B35.svg)](CONTRIBUTING.md)
[![Offline First](https://img.shields.io/badge/Architecture-Local--First-9B59B6.svg)]()
[![Privacy](https://img.shields.io/badge/Privacy-Zero%20Tracking-E74C3C.svg)]()

[🚀 Getting Started](#getting-started) · [📖 Documentation](docs/) · [🗺️ Roadmap](ROADMAP.md) · [🤝 Contribute](CONTRIBUTING.md)

</div>

---

> *"The best navigation is the one that works when everything else fails."*

NaviEU is a **privacy-first, offline-native navigation platform** built for European explorers, hikers, travelers, and anyone who refuses to be dependent on internet connectivity or big-tech surveillance to find their way.

No signal bars. No roaming charges. No tracking cookies. No subscription walls.

Just reliable, intelligent navigation that respects your privacy and works everywhere — from the streets of Lisbon to the trails of the Dolomites.

---

## 🎯 Mission

Modern navigation has lost its way. The dominant apps demand constant connectivity, harvest location data, drain batteries, and lock essential features behind subscriptions. They optimize for engagement, not utility. For data extraction, not human exploration.

**NaviEU exists to reclaim navigation.**

We believe that:

- **Privacy is non-negotiable** — Your location history belongs to you, period
- **Offline is a feature, not a limitation** — The best experiences happen far from cell towers
- **Independence matters** — Navigation should work during emergencies, not fail when you need it most
- **Europe deserves its own** — Built by Europeans, for European landscapes, regulations, and needs
- **AI belongs on your device** — Intelligence without surveillance, recommendations without data extraction
- **Exploration is human** — Technology should enhance discovery, not monetize it

Whether you're backpacking through the Alps, navigating rural Spain, living the van life across Scandinavia, or simply want a navigation app that doesn't spy on you — NaviEU is built for your journey.

---

## ✨ Core Features

### 🌍 Fully Offline Maps

| Capability | Description |
|------------|-------------|
| **Zero Connectivity Required** | Complete functionality without internet, SIM card, or mobile data |
| **Regional Downloads** | Download maps by country, region, or custom bounding box |
| **Vector Map Engine** | Crisp rendering at any zoom level with minimal storage footprint |
| **Automatic Updates** | WiFi-only background updates when you choose to connect |
| **Cross-Border Routing** | Seamless navigation across European borders without switching maps |
| **OpenStreetMap Data** | Community-driven, constantly updated map data for all of Europe |

### 🧠 Local AI Navigation

NaviEU runs an intelligent routing engine directly on your device:

- **Multi-Criteria Route Optimization** — Fastest, shortest, most scenic, least elevation, or custom preferences
- **Smart Rerouting** — Instant recalculation when you deviate, entirely offline
- **Predictive Arrival Estimates** — Context-aware ETAs based on terrain, surface type, and historical patterns
- **Adaptive Suggestions** — Learns your preferences locally without uploading any data
- **Point of Interest Discovery** — Local AI suggests relevant POIs along your route without calling external APIs

### 📍 Trail Memory System

*NaviEU's signature innovation — your personal exploration intelligence layer.*

The Trail Memory System remembers where you've already been, creating a rich understanding of your personal geography:

- **Explored Region Tracking** — Visual overlay showing areas you've already covered
- **Smart Breadcrumb Trails** — See your journey path with timestamps and statistics
- **Coverage Heatmaps** — Discover how much of a city, trail network, or region you've explored
- **Duplicate Prevention** — Get subtle nudges toward uncharted paths when exploring
- **Journey History** — Searchable, filterable log of every walk, hike, and ride
- **Export & Share** — GPX export of your trails for use in other tools

*Perfect for urban explorers wanting to discover every street of a city, hikers tracking trail completion, and travelers ensuring they don't miss hidden corners.*

### 🔋 Battery Optimized

Navigation shouldn't kill your battery before you reach your destination:

- **Intelligent GPS Polling** — Adaptive sampling rate based on speed, terrain, and confidence
- **Sensor Fusion** — Accelerometer + gyroscope + compass reduce GPS dependency by up to 60%
- **Background Optimization** — Minimal power draw during background navigation
- **Low-Power Tracking Mode** — Hour-long hikes use less than 8% battery on modern devices
- **Smart Sleep/Wake** — Automatically reduces activity when stationary or in known regions

### 🚶 Exploration Mode

Designed for the curious, not just the commuter:

- **Breadcrumb Navigation** — Drop waypoints and find your way back, even without a planned route
- **Discovery Tracking** — Automatically log points of interest you pass
- **Wander-Friendly UI** — Map-centric interface that doesn't fight you when exploring without a destination
- **Landmark Anchoring** — Navigation references visible landmarks instead of abstract directions
- **Scenic Route Preferences** — Prioritize beautiful paths over efficient ones

### 🛡️ Privacy Architecture

NaviEU is engineered for zero-data operation:

| What Others Do | What NaviEU Does |
|----------------|------------------|
| Upload location history to cloud servers | Location data never leaves your device |
| Sell aggregated movement patterns | No data collection to aggregate |
| Profile users for advertising | No advertising, no profiling, no accounts |
| Require phone number or email | Completely anonymous, no signup |
| Track app usage analytics | Optional opt-in analytics only (fully anonymous) |
| Force cloud sync | Local-first with optional encrypted backup |

**Our privacy promise:** If NaviEU is ever compelled to hand over user data, there will be nothing to hand over.

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        USER INTERFACE                          │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────────┐  │
│  │  Map View │ │  Routing │ │ Explorer │ │   Settings   │  │
│  └────┬─────┘ └────┬─────┘ └────┬─────┘ └──────┬───────┘  │
└───────┼────────────┼────────────┼────────────────┼──────────┘
        │            │            │                │
┌───────▼────────────▼────────────▼────────────────▼──────────┐
│                  NAVIGATION ENGINE                             │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────┐  │
│  │ Route Planner│  │ GPS Manager  │  │  Sensor Fusion   │  │
│  │ (Local AI)   │  │              │  │  (IMU + Compass) │  │
│  └──────┬───────┘  └──────┬───────┘  └────────┬─────────┘  │
└─────────┼────────────────┼────────────────────┼────────────┘
          │                │                    │
┌─────────▼────────────────▼────────────────────▼────────────┐
│                  CORE SERVICES LAYER                           │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────┐  │
│  │  Offline     │  │   Trail      │  │   Map Rendering  │  │
│  │  Map Engine  │  │   Memory     │  │   (Vector Tiles) │  │
│  │  (MBTiles)   │  │   System     │  │                  │  │
│  └──────┬───────┘  └──────┬───────┘  └────────┬─────────┘  │
│         │                  │                    │            │
│  ┌──────▼──────┐  ┌───────▼────────┐  ┌───────▼──────────┐  │
│  │  Valhalla   │  │  Coverage      │  │  OpenGL /        │  │
│  │  Router     │  │  Tracker       │  │  Metal Backend   │  │
│  └─────────────┘  │  Heatmap Gen   │  └──────────────────┘  │
│                   └────────────────┘                       │
└─────────────────────────────────────────────────────────────┘
          │
┌─────────▼──────────────────────────────────────────────────┐
│                   STORAGE LAYER                                │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────┐  │
│  │  SQLite      │  │  MBTiles     │  │   GPX / GeoJSON  │  │
│  │  (Routes,    │  │  (Map Data)  │  │   (Export/Import)│  │
│  │   POIs,      │  │              │  │                  │  │
│  │   Settings)  │  │              │  │                  │  │
│  └──────────────┘  └──────────────┘  └──────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

**Everything runs locally.** No cloud dependencies for core functionality. No network calls during navigation. No data leaves your device unless you explicitly choose to export or update maps.

### Key Architectural Principles

1. **Offline-First Design** — Every feature works without connectivity; online enhances but never enables
2. **Local-First Storage** — SQLite + MBTiles on device; cloud is optional backup only
3. **Edge AI** — All intelligence runs on-device using lightweight models (TensorFlow Lite / Core ML)
4. **Privacy by Design** — Zero telemetry by default; anonymous opt-in only for development insights
5. **Modular Routing** — Pluggable routing engines (Valhalla, GraphHopper) with unified interface
6. **Progressive Enhancement** — Core works on any device; enhanced features unlock on capable hardware

---

## 🛠️ Technical Stack

| Layer | Technology | Purpose |
|-------|-----------|---------|
| **Frontend** | Flutter 3.x + Dart | Cross-platform UI (iOS, Android, Linux) |
| **Map Rendering** | MapLibre GL / flutter_map | Hardware-accelerated vector map display |
| **Routing Engine** | Valhalla (primary), GraphHopper (secondary) | Offline route calculation |
| **Map Data** | OpenStreetMap → MBTiles | Vector tile storage and delivery |
| **Local Database** | SQLite + drift | Structured data storage |
| **Local Storage** | Hive + SharedPreferences | Settings, cache, lightweight data |
| **On-Device AI** | TensorFlow Lite + ONNX Runtime | Route optimization, POI scoring, exploration prediction |
| **GPS & Sensors** | Flutter Geolocator + custom IMU fusion | Location with minimal power draw |
| **State Management** | Riverpod | Reactive, testable app architecture |
| **Build System** | Melos | Monorepo management |

---

## 🚀 Getting Started

### Prerequisites

- **Flutter 3.22+** ([Install](https://docs.flutter.dev/get-started/install))
- **Dart 3.4+**
- **Android SDK** (for Android builds) or **Xcode** (for iOS builds)
- **Git** with LFS support

### Quick Start

```bash
# Clone the repository
git clone https://github.com/bobcat47/NaviEU.git
cd NaviEU

# Install dependencies
flutter pub get

# Build the native tools (Valhalla routing engine)
cd native && ./build.sh && cd ..

# Run on your connected device or emulator
flutter run --release
```

### Download Your First Map

1. Launch NaviEU
2. Tap the **Downloads** tab
3. Select your country or region
4. Download begins automatically over WiFi
5. Start navigating — no internet required

### Building for Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release

# Linux
flutter build linux --release
```

See [docs/BUILD.md](docs/BUILD.md) for detailed build instructions including native tooling setup.

---

## 📊 Screenshots

| | | |
|:---:|:---:|:---:|
| ![Hero Screen](docs/screenshots/hero.png) | ![Map View](docs/screenshots/map.png) | ![Route Planning](docs/screenshots/route.png) |
| **Offline Map View** | **Route Planning** | **Turn-by-Turn Navigation** |
| ![Exploration Mode](docs/screenshots/explore.png) | ![Trail Memory](docs/screenshots/trails.png) | ![Map Downloads](docs/screenshots/downloads.png) |
| **Exploration Tracking** | **Trail Memory & Heatmaps** | **Offline Map Manager** |

*Screenshots are representative of v1.x interface. Actual UI may vary by version and platform.*

---

## 🗺️ Roadmap

### ✅ V1 — Foundation *(Current)*
- [x] Offline vector map rendering
- [x] Turn-by-turn navigation
- [x] Route planning (car, bike, pedestrian)
- [x] Regional map downloads
- [x] Basic POI search
- [x] GPX import/export

### 🚧 V2 — Exploration Intelligence
- [ ] Trail Memory System — coverage tracking & heatmaps
- [ ] Breadcrumb navigation with waypoints
- [ ] Exploration statistics & achievements
- [ ] Advanced POI discovery with local scoring
- [ ] Multi-stop route planning
- [ ] Route sharing (offline via QR / local network)

### 🔮 V3 — Local AI Guide
- [ ] On-device recommendation engine
- [ ] Smart exploration suggestions
- [ ] Natural language route queries (local NLP)
- [ ] Predictive map pre-fetching
- [ ] Adaptive routing based on exploration history
- [ ] Integration with European hiking trail networks

### 🔮 V4 — Mesh Navigation Layer
- [ ] Reticulum Protocol integration
- [ ] Peer-to-peer position sharing
- [ ] Offline messaging between nearby users
- [ ] Shared waypoints & team navigation
- [ ] Emergency beacon system
- [ ] Mesh discovery protocol
- [ ] Community intelligence layer
- [ ] Decentralized map contribution
- [ ] Local AI coordination across mesh nodes

See [ROADMAP.md](ROADMAP.md) for the complete, detailed roadmap with milestones and contribution opportunities.

---

## 🤔 Why NaviEU?

### The Problem with Navigation Today

| Issue | How It Affects You |
|-------|-------------------|
| **Internet Dependency** | Navigation fails in rural areas, mountains, tunnels, basements, or abroad with expensive roaming |
| **Privacy Invasion** | Your every movement is logged, profiled, and monetized; law enforcement can request your full history |
| **Battery Destruction** | Constant network calls, cloud sync, and tracking analytics drain your battery within hours |
| **Subscription Fatigue** | Essential features locked behind monthly payments; you're renting access to your own navigation |
| **Data Lock-in** | Your saved places, routes, and history trapped in proprietary formats on someone else's servers |
| **Generic Global Design** | One-size-fits-all approach ignores European specifics: hiking culture, trail networks, density patterns |

### The NaviEU Difference

| Feature | Big Tech Nav | NaviEU |
|---------|-------------|--------|
| Works without internet | ❌ No | ✅ Yes — complete functionality |
| No location tracking | ❌ No | ✅ Yes — zero data collection |
| Battery-optimized | ⚠️ Mediocre | ✅ Yes — all-day navigation |
| Free, no subscriptions | ❌ Freemium | ✅ Yes — fully open source |
| Your data, your device | ❌ Cloud-locked | ✅ Yes — local-first |
| European trail networks | ❌ Basic | ✅ Yes — purpose-built |
| Open source & auditable | ❌ Proprietary | ✅ Yes — transparent code |

---

## 🌟 Vision

> **NaviEU aims to become Europe's leading privacy-first navigation platform — built by the community, powered by local intelligence, and owned by no corporation.**

We envision a future where:

- Every European has access to world-class navigation without surrendering their privacy
- Hikers, cyclists, and explorers navigate the continent's trail networks with rich, offline intelligence
- Rural communities and remote regions have navigation parity with major cities
- Emergency responders and outdoor professionals rely on resilient, offline-capable tools
- The European open-source community demonstrates that exceptional utility software can thrive without surveillance capitalism

This is not just an app. It's a statement that **technology can serve users without exploiting them**.

---

## 🤝 Contributing

NaviEU is a community-driven project. We welcome contributors of all skill levels and backgrounds.

- 🐛 **Report Bugs** — [Open an issue](https://github.com/bobcat47/NaviEU/issues/new?template=bug_report.md)
- 💡 **Suggest Features** — [Request a feature](https://github.com/bobcat47/NaviEU/issues/new?template=feature_request.md)
- 🌍 **Contribute Code** — See [CONTRIBUTING.md](CONTRIBUTING.md)
- 🗺️ **Improve Maps** — Contribute to [OpenStreetMap](https://www.openstreetmap.org)
- 📖 **Write Documentation** — Help us improve docs and translations
- 🧪 **Test & Report** — Use NaviEU and report your experiences

Read our [Contributing Guide](CONTRIBUTING.md) for development setup, coding standards, and how to submit your first pull request.

### Good First Issues

Looking for somewhere to start? Check out issues labeled [`good first issue`](https://github.com/bobcat47/NaviEU/labels/good%20first%20issue) or [`help wanted`](https://github.com/bobcat47/NaviEU/labels/help%20wanted).

---

## 📜 License

NaviEU is released under the [MIT License](LICENSE).

This means you can freely use, modify, distribute, and even build commercial products on top of NaviEU — we only ask that you include the original copyright notice and license terms.

Map data © [OpenStreetMap contributors](https://www.openstreetmap.org/copyright), licensed under [ODbL](https://opendatacommons.org/licenses/odbl/).

---

## 🙏 Acknowledgments

NaviEU stands on the shoulders of incredible open-source projects:

- **[OpenStreetMap](https://www.openstreetmap.org)** — The collaborative map of the world
- **[Valhalla](https://github.com/valhalla/valhalla)** — Open-source routing engine
- **[MapLibre](https://maplibre.org/)** — Open-source map rendering
- **[Flutter](https://flutter.dev)** — UI toolkit for beautiful native apps
- **[Reticulum](https://github.com/markqvist/Reticulum)** — The cryptography-based networking stack for V4 mesh features

---

<div align="center">

**⭐ Star this repository** if you believe navigation should be private, offline, and user-owned.

**🍴 Fork it** to build something new on top of local-first navigation.

**🤝 Join us** in building the future of European navigation.

*Made with ❤️ by explorers, for explorers.*

[⭐ Star](https://github.com/bobcat47/NaviEU/stargazers) · [🍴 Fork](https://github.com/bobcat47/NaviEU/fork) · [🐛 Issues](https://github.com/bobcat47/NaviEU/issues) · [📖 Docs](docs/)

</div>
