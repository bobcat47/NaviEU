# ADR-001: Flutter as Cross-Platform Framework

## Status

**Accepted** — Decided 2024-10-15

## Context

NaviEU needs to support Android, iOS, and Linux with a single codebase to maximize contributor efficiency and maintain consistency across platforms.

## Decision

Use **Flutter 3.x** as the primary UI framework.

## Rationale

| Criterion | Flutter | React Native | Native (Kotlin/Swift) |
|-----------|---------|-------------|----------------------|
| Performance | ✅ 60fps capable | ⚠️ JS bridge overhead | ✅ Best |
| Offline capability | ✅ No runtime downloads | ⚠️ Metro bundler | ✅ Full |
| Map rendering | ✅ flutter_map, MapLibre | ✅ react-native-maps | ✅ Direct GL |
| Native code interop | ✅ FFI + Platform channels | ✅ TurboModules | N/A |
| Single codebase | ✅ Dart | ⚠️ JS + Native | ❌ Separate |
| Linux support | ✅ First-class | ❌ Community | ✅ GTK/Qt |
| Battery efficiency | ⚠️ Good (Skia) | ⚠️ JS engine | ✅ Best |
| Team familiarity | ✅ Strong Dart ecosystem | ✅ Large JS pool | ⚠️ Specialized |

## Consequences

**Positive:**
- Single Dart codebase for all platforms
- Excellent map rendering performance via custom renderers
- Direct native interop for Valhalla routing engine
- Strong testing framework built-in
- Hot reload for rapid development

**Negative:**
- App size larger than native (~15-20MB overhead)
- Platform-specific behaviors need bridging
- iOS performance requires optimization effort
