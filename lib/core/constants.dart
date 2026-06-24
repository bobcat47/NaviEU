/// Core constants used throughout NaviEU.
library;

/// App metadata
class AppConstants {
  AppConstants._();

  static const String appName = 'NaviEU';
  static const String appVersion = '0.1.0';
  static const String tagline = 'Privacy-First Offline Navigation Intelligence';

  /// Default map center (Europe centroid — approximately Germany)
  static const double defaultLat = 51.1657;
  static const double defaultLng = 10.4515;
  static const double defaultZoom = 5.0;

  /// GPS configuration
  static const int gpsMinIntervalMs = 1000;
  static const int gpsAdaptiveFastIntervalMs = 500;
  static const int gpsAdaptiveSlowIntervalMs = 5000;
  static const double gpsAccuracyThresholdMeters = 10.0;

  /// Storage limits
  static const int maxCoveragePrecisionMeters = 10;
  static const int maxSavedRoutes = 1000;
  static const int maxTrailHistoryDays = 365;

  /// Routing
  static const double maxRoutingDistanceKm = 1000.0;
  static const int maxWaypoints = 10;
}

/// Navigation voice guidance languages supported in v0.1.0
enum SupportedLanguage {
  english('en', 'English'),
  german('de', 'Deutsch'),
  french('fr', 'Francais'),
  spanish('es', 'Espanol'),
  italian('it', 'Italiano');

  final String code;
  final String nativeName;

  const SupportedLanguage(this.code, this.nativeName);
}

/// Transportation modes for routing
enum TransportMode {
  car,
  bicycle,
  pedestrian;

  String get costing {
    return switch (this) {
      TransportMode.car => 'auto',
      TransportMode.bicycle => 'bicycle',
      TransportMode.pedestrian => 'pedestrian',
    };
  }
}

/// Map rendering themes
enum MapTheme {
  defaultLight('Default'),
  outdoor('Outdoor'),
  dark('Dark');

  final String displayName;

  const MapTheme(this.displayName);
}
