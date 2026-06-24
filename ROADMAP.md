# NaviEU Product Roadmap

> **Last Updated:** 2025-06-24  
> **Status:** V1 Released (v0.1.0) — V2 In Planning

This roadmap outlines NaviEU's development trajectory. It is a living document — priorities evolve based on community feedback, contributor availability, and technical discovery.

---

## 🎯 Strategic Pillars

Every feature in NaviEU maps to one of four strategic pillars:

| Pillar | Description | Status |
|--------|-------------|--------|
| **Reliability** | Navigation that never fails, anywhere, under any condition | 🟢 Active |
| **Intelligence** | AI-powered features that enhance exploration without compromising privacy | 🟡 Emerging |
| **Community** | Tools for sharing, collaboration, and decentralized map improvement | 🔵 Future |
| **Freedom** | True independence from infrastructure, subscriptions, and surveillance | 🟢 Active |

---

## ✅ V1 — Foundation (Released: v0.1.0)

*Goal: Establish rock-solid offline navigation that works everywhere in Europe.*

- [x] Offline vector map rendering (MapLibre GL)
- [x] Turn-by-turn navigation with voice guidance
- [x] Multi-modal routing (car, bike, pedestrian)
- [x] Regional map downloads (country & custom)
- [x] OpenStreetMap data integration
- [x] Basic POI search (offline geocoding)
- [x] GPX import/export
- [x] Multiple map themes (default, outdoor, dark)
- [x] Android & iOS platform support
- [x] Privacy-first architecture (zero telemetry)
- [x] Local SQLite storage
- [x] Clean Architecture codebase

### V1.x Maintenance Track

| Version | Focus | Target |
|---------|-------|--------|
| v0.1.1 | Bug fixes, stability improvements | July 2025 |
| v0.1.2 | Additional European language voice packs | August 2025 |

---

## 🚧 V2 — Exploration Intelligence

*Goal: Transform NaviEU from a navigation tool into an exploration companion.*

**Status:** Planning phase — [Help wanted](https://github.com/bobcat47/NaviEU/labels/help%20wanted)

### Trail Memory System (Signature Feature)
- [ ] **Coverage Tracking** — Real-time logging of explored areas with configurable precision
- [ ] **Coverage Heatmaps** — Visual overlay showing exploration density (daily/weekly/all-time)
- [ ] **Explored Region Detection** — Algorithmic identification of "new" vs "already explored" areas
- [ ] **Duplicate Prevention Nudges** — Subtle UI suggestions toward uncharted paths
- [ ] **Journey History** — Searchable, filterable log of all navigation sessions
- [ ] **Trail Statistics** — Distance, time, elevation, coverage percentage per session
- [ ] **GPX Trail Management** — Import, organize, and overlay historical trails

### Enhanced Navigation
- [ ] **Multi-stop Route Planning** — Up to 10 waypoints with optimal ordering
- [ ] **Route Comparison** — Side-by-side comparison of alternative routes
- [ ] **Custom Route Preferences** — User-defined weights for speed, scenery, elevation, surface
- [ ] **Route Sharing** — Share routes via QR code, local network (no internet), or file export
- [ ] **Route Collections** — Save and organize favorite routes into folders

### Exploration Mode
- [ ] **Breadcrumb Navigation** — Drop waypoints and navigate back without a planned route
- [ ] **Wander Mode UI** — Map-centric interface optimized for destination-free exploration
- [ ] **Discovery Auto-Logging** — Automatically record interesting points encountered
- [ ] **Landmark-Based Directions** — "Turn left at the church" instead of "Turn left in 200m"
- [ ] **Scenic Route Discovery** — Community and AI-suggested beautiful paths

### Enhanced POI System
- [ ] **European POI Database** — Curated points of interest across all European countries
- [ ] **Local Scoring Algorithm** — On-device ranking of POIs by relevance and quality
- [ ] **POI Collections** — Themed collections: "Best viewpoints in the Alps", "Roman ruins in France"
- [ ] **User POI Notes** — Add personal notes and photos to any POI (stored locally)

### Platform & Performance
- [ ] **Background Navigation** — Improved background location handling
- [ ] **Battery Optimization v2** — Enhanced sensor fusion and adaptive GPS polling
- [ ] **Map Data Delta Updates** — Incremental map updates instead of full re-downloads
- [ ] **Faster Map Downloads** — Parallel chunk downloading, resumable transfers

**Target Release:** Q4 2025  
**Milestone:** [V2 Tracking Issue](https://github.com/bobcat47/NaviEU/milestone/2)

---

## 🔮 V3 — Local AI Guide

*Goal: On-device intelligence that personalizes navigation without compromising privacy.*

**Status:** Design phase — experimental work in `research/` directory

### On-Device AI Engine
- [ ] **Route Preference Learning** — Local ML model learns routing preferences from user behavior
- [ ] **Smart Exploration Suggestions** — Context-aware recommendations for nearby unvisited places
- [ ] **Predictive Map Pre-fetching** — AI predicts which map regions to cache before you need them
- [ ] **Natural Language Route Queries** — "Show me a scenic 10km loop near here" processed locally
- [ ] **Adaptive ETA Prediction** — Context-aware arrival times based on terrain, weather patterns, personal pace

### Enhanced Exploration Intelligence
- [ ] **Exploration Goals** — "Visit 80% of Paris 4th arrondissement" with progress tracking
- [ ] **Trail Completion System** — Track completion of hiking trails, cycling routes, city walks
- [ ] **Personal Exploration Stats** — Lifetime distance, countries visited, unique trails completed
- [ ] **Seasonal Recommendations** — Local AI suggests activities based on season and location

### European Integration
- [ ] **European Long-Distance Trails** — E-paths (E1, E2, E3...), GR routes, national cycle networks
- [ ] **Country-Specific Features** — Alpine routing, fjord navigation, Mediterranean coastal paths
- [ ] **Regulatory Compliance** — GDPR-native design, accessibility standards (EN 301 549)
- [ ] **European Language Support** — Voice guidance and UI in 20+ European languages

### Advanced Features
- [ ] **Offline Satellite Imagery** — Cached satellite views for key regions
- [ ] **3D Terrain Visualization** — Elevation-aware map rendering
- [ ] **Indoor Navigation** — Transit hub and airport indoor maps where available
- [ ] **Wearable Support** — Companion app for Wear OS and watchOS

**Target Release:** Q2 2026  
**Depends on:** V2 stable release, TensorFlow Lite integration

---

## 🔮 V4 — Mesh Navigation Layer

*Goal: Decentralized navigation infrastructure that works when all else fails.*

**Status:** Vision phase — architectural exploration, RFCs welcome

> V4 represents NaviEU's most ambitious vision: a navigation network that functions entirely through peer-to-peer mesh communication, enabling coordination, safety, and shared intelligence without any central infrastructure.

### Reticulum Protocol Integration
- [ ] **Reticulum Stack** — Integrate [Reticulum](https://github.com/markqvist/Reticulum) for cryptographic mesh networking
- [ ] **Mesh Bootstrap** — Automatic mesh network formation between nearby NaviEU devices
- [ ] **Encrypted Messaging** — Direct and group messaging between users without internet
- [ ] **Identity System** — Cryptographic identities for mesh participants (no phone/email required)

### Peer-to-Peer Navigation
- [ ] **Live Position Sharing** — Share real-time location with trusted contacts over mesh
- [ ] **Shared Waypoints** — Broadcast points of interest to nearby mesh participants
- [ ] **Team Navigation** — Coordinate group movements with shared routes and rendezvous points
- [ ] **Route Propagation** — Share route conditions and updates through the mesh

### Emergency & Safety
- [ ] **Emergency Beacon** — Broadcast distress signals with location to all nearby devices
- [ ] **Check-in System** — Scheduled safety check-ins with automatic alerts
- [ ] **Rescue Coordination** — Mesh-based coordination for search and rescue operations
- [ ] **Offline SOS** — Emergency communication even in complete infrastructure blackout

### Decentralized Intelligence
- [ ] **Community Map Updates** — Share map corrections and POI additions via mesh
- [ ] **Local AI Coordination** — Federated learning of route preferences across mesh nodes
- [ ] **Decentralized POI Ranking** — Community-driven POI quality scoring without central servers
- [ ] **Mesh Map Relay** — Propagate map data through the mesh to newly joined nodes

### Mesh Discovery
- [ ] **Node Discovery** — Automatic detection and connection to nearby mesh participants
- [ ] **Multi-hop Routing** — Messages relay through intermediate nodes for extended range
- [ ] **Store-and-Forward** — Delayed message delivery when recipients are temporarily out of range
- [ ] **Mesh Density Mapping** — Visualize mesh coverage and node density

**Target Release:** 2027  
**Depends on:** Reticulum maturity, hardware availability, V3 stable

---

## 📊 Cross-Cutting Initiatives

These efforts run continuously across all versions:

### Accessibility
- [ ] Screen reader optimization (TalkBack, VoiceOver)
- [ ] High contrast map themes
- [ ] Adjustable font sizes throughout UI
- [ ] Voice-first navigation mode
- [ ] Motor impairment-friendly gesture alternatives

### Internationalization
- [ ] UI translations: German, French, Spanish, Italian, Polish, Dutch, Portuguese, Swedish, Czech, Hungarian, Romanian, Greek, Croatian, Bulgarian, Slovak, Slovenian, Lithuanian, Latvian, Estonian, Finnish, Danish, Irish, Maltese
- [ ] Right-to-left (RTL) layout support
- [ ] Voice guidance in all supported languages
- [ ] Regional terminology adaptation

### Performance
- [ ] Target: 60fps map rendering on mid-range devices
- [ ] Target: <2s cold start to interactive map
- [ ] Target: <5s route calculation for 500km routes
- [ ] Target: <8% battery per hour of active navigation
- [ ] Target: <500MB storage for full country maps

### Testing & Quality
- [ ] 80%+ code coverage
- [ ] Integration tests for all navigation flows
- [ ] Performance benchmarks in CI
- [ ] Device farm testing (100+ device models)
- [ ] Automated accessibility audits

---

## 🗳️ How Priorities Are Set

1. **Community Demand** — Most-requested features via GitHub issues and discussions
2. **Strategic Fit** — Alignment with NaviEU's core mission (privacy, offline, European)
3. **Technical Feasibility** — Available contributors and technical readiness
4. **Resource Availability** — Contributing developer capacity
5. **Milestone Dependencies** — Logical sequencing of features

### Influence the Roadmap

- 👍 **Vote on issues** — GitHub reactions help us gauge demand
- 💬 **Join discussions** — Share your use cases in [GitHub Discussions](https://github.com/bobcat47/NaviEU/discussions)
- 📝 **Submit RFCs** — Propose architectural changes via GitHub Issues
- 🔧 **Contribute** — Implementation is the strongest vote of priority

---

*This roadmap is a commitment to direction, not a guarantee of timeline. We move as fast as our community enables us to move.*
