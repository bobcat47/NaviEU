import '../entities/route.dart';

/// Abstract repository for route operations.
///
/// Defines the contract that routing implementations must fulfill.
/// This abstraction allows swapping between Valhalla, GraphHopper,
/// or other routing backends without affecting the domain layer.
abstract class RouteRepository {
  /// Calculate a route between the given waypoints using the specified mode.
  ///
  /// Returns a [Route] with full geometry, instructions, and metadata.
  /// Throws [RouteCalculationException] if routing fails.
  Future<Route> calculateRoute({
    required List<Waypoint> waypoints,
    required TransportMode mode,
    RoutePreferences? preferences,
  });

  /// Save a route to local storage for later retrieval.
  Future<void> saveRoute(Route route);

  /// Retrieve all saved routes.
  Future<List<Route>> getSavedRoutes();

  /// Delete a saved route by ID.
  Future<void> deleteRoute(String routeId);

  /// Export a route as GPX format.
  Future<String> exportAsGpx(Route route);

  /// Import a route from GPX format.
  Future<Route> importFromGpx(String gpxContent);
}

/// User preferences for route calculation.
class RoutePreferences {
  final bool avoidHighways;
  final bool avoidTolls;
  final bool avoidFerries;
  final bool preferScenic;
  final double? maxSlopePercentage;

  const RoutePreferences({
    this.avoidHighways = false,
    this.avoidTolls = false,
    this.avoidFerries = false,
    this.preferScenic = false,
    this.maxSlopePercentage,
  });

  static const RoutePreferences defaultPreferences = RoutePreferences();
}

/// Exception thrown when route calculation fails.
class RouteCalculationException implements Exception {
  final String message;
  final RouteErrorType type;

  const RouteCalculationException(this.message, {this.type = RouteErrorType.unknown});

  @override
  String toString() => 'RouteCalculationException: $message';
}

enum RouteErrorType {
  noRouteFound,
  areaNotDownloaded,
  serverError,
  invalidWaypoints,
  timeout,
  unknown,
}
