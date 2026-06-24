<div align="center">

![NaviEU Banner](banner.png)

# 🗺️ NaviEU

### Privacy-First Offline Navigation Intelligence for Europe

**Explore Europe Without Limits. No Signal Required.**

[![License: MIT](https://img.shields.io/badge/License-MIT-2E8B57.svg)](LICENSE)
[![React](https://img.shields.io/badge/React-19-61DAFB.svg)](https://react.dev)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.6-3178C6.svg)](https://www.typescriptlang.org)
[![PWA](https://img.shields.io/badge/PWA-Installable-5A0FC8.svg)]()
[![Offline First](https://img.shields.io/badge/Architecture-Local--First-9B59B6.svg)]()
[![Privacy](https://img.shields.io/badge/Privacy-Zero%20Tracking-E74C3C.svg)]()

**[🚀 Live Demo](https://gxybaghyui6v2.kimi.page)** · [📖 Documentation](#-documentation) · [🗺️ Roadmap](#-roadmap) · [🤝 Contribute](#-contributing)

</div>

---

> *"The best navigation is the one that works when everything else fails."*

NaviEU is a **privacy-first, offline-native navigation PWA** built for European explorers, hikers, travelers, and anyone who refuses to be dependent on internet connectivity or big-tech surveillance to find their way.

No signal bars. No roaming charges. No tracking cookies. No subscription walls. No app store download.

Just reliable, intelligent navigation that respects your privacy and works everywhere — from the streets of Lisbon to the trails of the Dolomites.

---

## 🎯 Mission

Modern navigation has lost its way. The dominant apps demand constant connectivity, harvest location data, drain batteries, and lock essential features behind subscriptions. They optimize for engagement, not utility. For data extraction, not human exploration.

**NaviEU exists to reclaim navigation.**

We believe that:

- 🛡️ **Privacy is non-negotiable** — Your location history belongs to you, period
- 📴 **Offline is a feature, not a limitation** — The best experiences happen far from cell towers
- 🏔️ **Independence matters** — Navigation should work during emergencies, not fail when you need it most
- 🇪🇺 **Europe deserves its own** — Built for European landscapes, regulations, and needs
- 🤖 **AI belongs on your device** — Intelligence without surveillance, recommendations without data extraction
- 🧭 **Exploration is human** — Technology should enhance discovery, not monetize it

---

## ✨ Features

### 🌍 Fully Offline Maps

| Feature | Description |
|---------|-------------|
| **Zero Connectivity Required** | Complete functionality without internet, SIM card, or mobile data |
| **Regional Downloads** | Download maps by country, region, or custom bounding box |
| **CartoDB High-Res Tiles** | Crisp rendering with `@2x` retina support |
| **Automatic Caching** | Tiles cache as you browse — revisit areas offline instantly |
| **Cross-Border Routing** | Seamless navigation across all European borders |
| **OpenStreetMap Data** | Community-driven, constantly updated map data |

### 🧠 Local AI Navigation

- **Multi-Criteria Route Optimization** — Fastest, shortest, most scenic, least elevation
- **Smart Re-routing** — Instant recalculation via Valhalla
- **Turn-by-Turn Voice Guidance** — Web Speech API reads directions aloud
- **4 Transport Modes** — Car, walking, cycling, public transit

### 📍 Trail Memory System — *Signature Innovation*

| Feature | What It Does |
|---------|-------------|
| 🎨 **Persistent Exploration Layer** | Live trail polyline color-coded by visit frequency |
| 🔋 **Battery-Efficient Recording** | Adaptive GPS: 60s stationary → 3s driving |
| 🗜️ **Smart Trail Compression** | Douglas-Peucker — 95%+ storage reduction |
| 🧠 **Exploration Intelligence** | Grid-based coverage with real-time % |
| 🌫️ **Fog of War** | Canvas overlay reveals map as you explore |
| 🔄 **Loop Detection** | "Walking in circles" alerts |
| 💾 **Offline Route Memory** | Named sessions in IndexedDB |
| 🏠 **Smart Return Navigation** | "Return to Start" with guidance |
| 🤖 **AI Recommendations** | Nearby unexplored suggestions |
| 📊 **Exploration Statistics** | Full dashboard with achievements |
| 🏆 **14 Discovery Badges** | Unlock as you explore |

### 🛡️ Privacy Architecture

| What Others Do | What NaviEU Does |
|----------------|------------------|
| Upload location to cloud | 📴 Never leaves your device |
| Sell movement patterns | 🚫 No data collection |
| Profile for advertising | 🚫 No ads, no profiling |
| Require account | 🚫 Completely anonymous |
| Force cloud sync | 🏠 Local-first IndexedDB |

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                     PRESENTATION LAYER                       │
│  Map (Leaflet) │ Routing │ Explorer │ Trail/Fog/Achievements │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                    NAVIGATION ENGINE                         │
│  Route Planner (Valhalla) │ GPS │ Sensor Fusion (Adaptive)  │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                     TRAIL ENGINE                             │
│  Recording │ Compression │ Fog of War │ Loop Detection      │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                      STORAGE LAYER                           │
│  IndexedDB (Dexie.js) │ localStorage │ Service Worker (PWA) │
└─────────────────────────────────────────────────────────────┘
```

---

## 🛠️ Technical Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | React 19 + TypeScript + Vite |
| **Map Engine** | Leaflet (DOM/raster) |
| **Routing** | Valhalla API |
| **Geocoding** | Nominatim (OSM) |
| **Map Tiles** | CartoDB Voyager / Dark Matter |
| **Styling** | Tailwind CSS 3.4 + shadcn/ui |
| **Animations** | GSAP + Framer Motion |
| **Offline DB** | Dexie.js (IndexedDB) |
| **PWA** | Vite PWA + Service Worker |
| **Icons** | Lucide React |
| **Voice** | Web Speech API |

---

## 🚀 Quick Start

### Install on Your Phone (No App Store!)

**NaviEU is a Progressive Web App (PWA)**:

**📱 Android (Chrome):** Open the site → Menu (⋯) → "Add to Home Screen" → "Install"

**🍎 iOS (Safari):** Open the site → Share → "Add to Home Screen" → "Add"

**[🚀 Live Demo](https://gxybaghyui6v2.kimi.page)**

---

## 🗺️ Roadmap

### ✅ V1 — Foundation
- [x] Offline map of Europe + UK
- [x] Turn-by-turn voice navigation
- [x] Multi-modal routing
- [x] PWA — installable on any device
- [x] Zero-telemetry architecture

### 🚧 V2 — Trail Intelligence *(Current)*
- [x] All 14 trail features (see above)
- [x] Fog of War exploration
- [x] 14 discovery badges

### 🔮 V3 — Community & AI
- [ ] User profiles
- [ ] Share trails (QR/link)
- [ ] Enhanced AI routing
- [ ] 3D terrain visualization

### 🔮 V4 — Mesh Network
- [ ] Reticulum Protocol
- [ ] Peer-to-peer sharing
- [ ] Emergency beacon

---

## 📜 License

NaviEU is released under the [MIT License](LICENSE).

Map data © [OpenStreetMap contributors](https://www.openstreetmap.org/copyright), licensed under [ODbL](https://opendatacommons.org/licenses/odbl/).

---

<div align="center">

**⭐ Star this repository** if you believe navigation should be private, offline, and user-owned.

**🍴 Fork it** to build something new on top of local-first navigation.

*Made with ❤️ by explorers, for explorers.*

</div>
